# Create Users
users = User.create!([
                       { email: 'nguyenvo@example.com', password: 'todolist123', number: '09637684642' },
                       { email: 'khuyenguyen@example.com', password: 'todolist123', number: '0121321122' },
                       { email: 'hungha@example.com', password: 'todolist123', number: '0948484103' }
                     ])

# Create Workspaces
workspaces = Workspace.create!([
                                 { name: 'Development Team', admin: users[0].id, deleted_at: nil },
                                 { name: 'Test Team', admin: users[1].id, deleted_at: nil }
                               ])

# Create Workspace Members
WorkspaceMember.create!([
                          { workspace: workspaces[0], user: users[0], deleted_at: nil },
                          { workspace: workspaces[0], user: users[1], deleted_at: nil },
                          { workspace: workspaces[1], user: users[1], deleted_at: nil },
                          { workspace: workspaces[1], user: users[2], deleted_at: nil }
                        ])

# Create Tasks
tasks = Task.create!([
                       {
                         workspace: workspaces[0],
                         assigner_id: users[0].id,
                         user_id: users[1].id,
                         multipriority: 'High',
                         title: 'Task 1',
                         description: 'Description for Task 1',
                         multitag: %w[urgent review],
                         time_start: Time.now,
                         time_end: Time.now + 1.day,
                         status: 0,
                         deleted_at: nil
                       },
                       {
                         workspace: workspaces[1],
                         assigner_id: users[1].id,
                         user_id: users[2].id,
                         multipriority: 'Medium',
                         title: 'Task 2',
                         description: 'Description for Task 2',
                         multitag: %w[important follow-up],
                         time_start: Time.now,
                         time_end: Time.now + 2.days,
                         status: 1,
                         deleted_at: nil
                       },
                       {
                         workspace: workspaces[0],
                         assigner_id: users[2].id,
                         user_id: users[0].id,
                         multipriority: 'Low',
                         title: 'Task 3',
                         description: 'Description for Task 3',
                         multitag: ['review'],
                         time_start: Time.now,
                         time_end: Time.now + 3.days,
                         status: 2,
                         deleted_at: nil
                       }
                     ])

# Create Sections
sections = Section.create!([
                             { workspace: workspaces[0], name: 'Backlog', slack_channel: 'backlog-channel',
                               is_private: 0, deleted_at: nil },
                             { workspace: workspaces[1], name: 'In Progress', slack_channel: 'in-progress-channel', is_private: 0,
                               deleted_at: nil }
                           ])

# Create Section Storages
SectionStorage.create!([
                         { section: sections[0], title: 'Feature 1', description: 'Description for Feature 1', image: 'feature1.jpg',
                           deleted_at: nil },
                         { section: sections[1], title: 'Feature 2', description: 'Description for Feature 2', image: 'feature2.jpg',
                           deleted_at: nil }
                       ])

# Create Notifications
Notification.create!([
                       { section: sections[0], slack_message_id: 1, title: 'Notification 1', content: 'Content for Notification 1',
                         status: 0, deleted_at: nil },
                       { section: sections[1], slack_message_id: 2, title: 'Notification 2', content: 'Content for Notification 2',
                         status: 1, deleted_at: nil }
                     ])

# Create Block Channels
BlockChannel.create!([
                       { slack_channel_id: 'C1234567890', slack_team_id: 'T1234567890', user: users[0],
                         message_text: 'Block message for channel', deleted_at: nil },
                       { slack_channel_id: 'C0987654321', slack_team_id: 'T0987654321', user: users[1],
                         message_text: 'Another block message', deleted_at: nil }
                     ])

# Create Block Users
BlockUser.create!([
                    { slack_user_id: 'U1234567890', slack_team_id: 'T1234567890', user: users[0], message_text: 'Block message for user',
                      deleted_at: nil },
                    { slack_user_id: 'U0987654321', slack_team_id: 'T0987654321', user: users[1],
                      message_text: 'Another block message for user', deleted_at: nil }
                  ])

# Create Block Events
BlockEvent.create!([
                     { slack_id: 'E1234567890', event_type: 'message', user: users[0], team_id: 'T1234567890' },
                     { slack_id: 'E0987654321', event_type: 'reaction', user: users[1], team_id: 'T0987654321' }
                   ])

# Create User Assigns
UserAssign.create!([
                     { task: tasks[0], slack_id: 'U123', slack_user_id: 'U1234567890', assigner_id: users[0].id,
                       deadline_at: Time.now + 1.week, deleted_at: nil },
                     { task: tasks[1], slack_id: 'U456', slack_user_id: 'U0987654321', assigner_id: users[1].id,
                       deadline_at: Time.now + 2.weeks, deleted_at: nil }
                   ])

# Seed acts_as_taggable_on data
# Tags
tags = ActsAsTaggableOn::Tag.create!([
                                       { name: 'urgent' },
                                       { name: 'important' },
                                       { name: 'review' },
                                       { name: 'follow-up' }
                                     ])

# Taggings
ActsAsTaggableOn::Tagging.create!([
                                    { tag: tags[0], taggable: tasks[0], context: 'tasks' },
                                    { tag: tags[1], taggable: tasks[1], context: 'tasks' },
                                    { tag: tags[2], taggable: tasks[2], context: 'tasks' }
                                  ])
