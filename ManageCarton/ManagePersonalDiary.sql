USE [ManagePersonalDiary]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/25/2022 1:16:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 6/25/2022 1:16:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountId] [int] IDENTITY(1,1) NOT NULL,
	[PhoneNumber] [varchar](10) NOT NULL,
	[Password] [nchar](20) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Sex] [nvarchar](10) NULL,
	[DateOfBirth] [nvarchar](20) NULL,
	[Address] [nvarchar](200) NULL,
	[AccountCreationDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[IsEnabled] [bit] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostDiary]    Script Date: 6/25/2022 1:16:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostDiary](
	[DiaryId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[DContent] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[PostDate] [datetime] NULL,
	[AccountId] [int] NOT NULL,
 CONSTRAINT [PK_PostDiary] PRIMARY KEY CLUSTERED 
(
	[DiaryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220403034302_createDBDiary', N'5.0.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220417095645_CreateIsEnabled', N'5.0.15')
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([AccountId], [PhoneNumber], [Password], [FullName], [Sex], [DateOfBirth], [Address], [AccountCreationDate], [UpdateDate], [IsEnabled]) VALUES (1, N'0967969321', N'Tu123!@#            ', N'Bùi Anh Tú', N'Nam', N'04/08/1998', N'634/4/5 Đường Hà Huy Giáp, Phượng Thạnh Xuân, Quận 12', CAST(N'2022-04-17T12:53:02.557' AS DateTime), CAST(N'2022-06-25T10:18:00.260' AS DateTime), 1)
INSERT [dbo].[Account] ([AccountId], [PhoneNumber], [Password], [FullName], [Sex], [DateOfBirth], [Address], [AccountCreationDate], [UpdateDate], [IsEnabled]) VALUES (2, N'324523', N'Kiet124&^*          ', N'Trần Huy Kiệt', N'nam', N'06/07/2000', N'343/5/4 Đường Nguyễn Văn Lượng, Quận Gò Vấp, TP HCM', CAST(N'2022-04-17T14:21:03.973' AS DateTime), CAST(N'2022-06-25T10:25:14.053' AS DateTime), 0)
INSERT [dbo].[Account] ([AccountId], [PhoneNumber], [Password], [FullName], [Sex], [DateOfBirth], [Address], [AccountCreationDate], [UpdateDate], [IsEnabled]) VALUES (3, N'0785643422', N'trunGTN4343!        ', N'Nguyễn Anh Trung', N'Nam', N'05/03/1989', N'223/6/7 Đường Lý Thường Kiệt, Quận 10, TP HCM', CAST(N'2022-04-17T14:30:04.693' AS DateTime), CAST(N'2022-06-25T10:27:51.893' AS DateTime), 0)
INSERT [dbo].[Account] ([AccountId], [PhoneNumber], [Password], [FullName], [Sex], [DateOfBirth], [Address], [AccountCreationDate], [UpdateDate], [IsEnabled]) VALUES (4, N'096343555', N'Nhi004082000        ', N'Trần Nguyễn Ý Nhi', N'Nữ', N'04/08/2000', N'345 Đường Lý Thường Kiệt, Phường 14, Quận 10, TPHCM', CAST(N'2022-04-17T14:30:11.240' AS DateTime), CAST(N'2022-06-25T10:30:08.333' AS DateTime), 0)
INSERT [dbo].[Account] ([AccountId], [PhoneNumber], [Password], [FullName], [Sex], [DateOfBirth], [Address], [AccountCreationDate], [UpdateDate], [IsEnabled]) VALUES (5, N'0765456763', N'Trang03071996       ', N'Nguyễn ThịTrang', N'Nữ', N'03/07/1996', N'236 Đường Võ Thị Sáu, TP Dĩ An Bình Dương', CAST(N'2022-04-17T14:30:17.737' AS DateTime), CAST(N'2022-06-25T10:35:14.710' AS DateTime), 0)
INSERT [dbo].[Account] ([AccountId], [PhoneNumber], [Password], [FullName], [Sex], [DateOfBirth], [Address], [AccountCreationDate], [UpdateDate], [IsEnabled]) VALUES (6, N'096565134', N'mytratonnu31122000  ', N'Tôn Nữ Trà My', N'Nữ', N'31/12/2000', N'435 Đường Hà Huy Tập, Quận 7, TP HCM', CAST(N'2022-04-17T14:30:22.073' AS DateTime), CAST(N'2022-06-25T10:38:31.390' AS DateTime), 0)
INSERT [dbo].[Account] ([AccountId], [PhoneNumber], [Password], [FullName], [Sex], [DateOfBirth], [Address], [AccountCreationDate], [UpdateDate], [IsEnabled]) VALUES (7, N'0943567222', N'nhannhan@#$         ', N'Vũ Thành Nhân', N'Nam', N'14/07/1999', N'103, Đường Hà Huy Tập, Quận 7, TP HCM', CAST(N'2022-04-17T14:30:26.660' AS DateTime), CAST(N'2022-06-25T10:40:20.860' AS DateTime), 0)
INSERT [dbo].[Account] ([AccountId], [PhoneNumber], [Password], [FullName], [Sex], [DateOfBirth], [Address], [AccountCreationDate], [UpdateDate], [IsEnabled]) VALUES (8, N'078357645', N'linh67843           ', N'Lưu Tấn Lĩnh', N'Nam', N'06/07/1998', N'342, Đường Nguyễn Văn Linh, TP HCM', CAST(N'2022-04-17T14:30:31.097' AS DateTime), CAST(N'2022-06-25T10:42:27.157' AS DateTime), 0)
INSERT [dbo].[Account] ([AccountId], [PhoneNumber], [Password], [FullName], [Sex], [DateOfBirth], [Address], [AccountCreationDate], [UpdateDate], [IsEnabled]) VALUES (9, N'098768453?', N'lanmongmanh392000   ', N'Nguyễn Thị Lan', N'Nữ', N'03/09/2000', N'214, Đường Lý Thường Kiệt, Quận 10, TP HCM', CAST(N'2022-04-17T14:30:37.607' AS DateTime), CAST(N'2022-06-25T10:45:12.603' AS DateTime), 0)
INSERT [dbo].[Account] ([AccountId], [PhoneNumber], [Password], [FullName], [Sex], [DateOfBirth], [Address], [AccountCreationDate], [UpdateDate], [IsEnabled]) VALUES (10, N'0965634578', N'tran29121997        ', N'Quang Đại Trần', N'Nam', N'29/12/2000', N'43 Đường Phan Tôn, Quận Đa Cao, Quận 1 , TP HCM', CAST(N'2022-04-17T14:30:40.777' AS DateTime), CAST(N'2022-06-25T10:48:47.250' AS DateTime), 0)
INSERT [dbo].[Account] ([AccountId], [PhoneNumber], [Password], [FullName], [Sex], [DateOfBirth], [Address], [AccountCreationDate], [UpdateDate], [IsEnabled]) VALUES (11, N'0976636243', N'huyHuy3232          ', N'Phạm Nguyễn Gia Huy', N'Nam', N'30/2/2000', N'435, Đường Lê Quốc Hưng, Phường 3, Quận 4', CAST(N'2022-04-17T14:30:44.097' AS DateTime), CAST(N'2022-06-25T10:51:24.337' AS DateTime), 0)
INSERT [dbo].[Account] ([AccountId], [PhoneNumber], [Password], [FullName], [Sex], [DateOfBirth], [Address], [AccountCreationDate], [UpdateDate], [IsEnabled]) VALUES (12, N'0967969343', N'tu4444!@#           ', N'Trần Công Tú', N'Nam', N'14/02/2000', N'235, Đường Lý Thái Tổ, Phường 3, TP HCM', CAST(N'2022-04-26T17:11:02.997' AS DateTime), CAST(N'2022-06-25T10:53:23.823' AS DateTime), 0)
INSERT [dbo].[Account] ([AccountId], [PhoneNumber], [Password], [FullName], [Sex], [DateOfBirth], [Address], [AccountCreationDate], [UpdateDate], [IsEnabled]) VALUES (13, N'0985555321', N'PPhu!@#             ', N'Lê Hoài Tân Phú', N'Nam', N'14/03/2000', N'354, Đường Quốc lộ 1A, Huyện Hoài Nhơn, Tĩnh Bình Định', CAST(N'2022-06-25T11:03:43.233' AS DateTime), NULL, 1)
INSERT [dbo].[Account] ([AccountId], [PhoneNumber], [Password], [FullName], [Sex], [DateOfBirth], [Address], [AccountCreationDate], [UpdateDate], [IsEnabled]) VALUES (14, N'097674324', N'DPhat3232           ', N'Dương Thành Phát', N'Nam', N'04/01/2000', N'365/2/3, Đường Trường Sơn, Quận Tân Bình, TPHCM', CAST(N'2022-06-25T11:05:17.797' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[PostDiary] ON 

INSERT [dbo].[PostDiary] ([DiaryId], [Title], [DContent], [Image], [CreateDate], [UpdateDate], [PostDate], [AccountId]) VALUES (1, N'Tình yêu ngắn gọn', N'Sai lầm lớn nhất của một cô gái là nghĩ chàng trai sẽ vì mình mà thay đổi. Lầm tưởng lớn nhất của một chàng trai là nghĩ cô ấy sẽ vì mình mà không bao giờ bỏ đi', N'string', CAST(N'2022-04-17T12:53:30.583' AS DateTime), CAST(N'2022-06-25T11:08:03.820' AS DateTime), CAST(N'2022-04-17T12:53:30.583' AS DateTime), 1)
INSERT [dbo].[PostDiary] ([DiaryId], [Title], [DContent], [Image], [CreateDate], [UpdateDate], [PostDate], [AccountId]) VALUES (2, N'Hay đăng ảnh FB', N'Cho dù bạn có tốt đẹp đến mức nào thì sau lưng sẽ luôn có người nói này nói nọ. Không thanh minh, không so đo, mỉm cười mặc kệ với đúng là sự khinh thường tốt nhất.', N'string', CAST(N'2022-06-25T11:08:48.373' AS DateTime), NULL, CAST(N'2022-06-25T11:08:48.373' AS DateTime), 2)
INSERT [dbo].[PostDiary] ([DiaryId], [Title], [DContent], [Image], [CreateDate], [UpdateDate], [PostDate], [AccountId]) VALUES (3, N'Cuộc Sống Vui vẻ', N'Tôi không bao giờ cố gắng trốn chạy cuộc đời vì người ta đã chứng minh rằng không ai trốn khỏi nó mà còn sống cả.', N'string', CAST(N'2022-06-25T11:09:36.513' AS DateTime), NULL, CAST(N'2022-06-25T11:09:36.513' AS DateTime), 3)
INSERT [dbo].[PostDiary] ([DiaryId], [Title], [DContent], [Image], [CreateDate], [UpdateDate], [PostDate], [AccountId]) VALUES (4, N'Cuộc Sống như siêu thị', N'Cuộc sống giống như một siêu thị, bạn có thể tìm thấy mọi thứ bạn cần nhưng bạn phải trả tiền để có những thứ đó', N'string', CAST(N'2022-06-25T11:10:21.783' AS DateTime), NULL, CAST(N'2022-06-25T11:10:21.783' AS DateTime), 4)
INSERT [dbo].[PostDiary] ([DiaryId], [Title], [DContent], [Image], [CreateDate], [UpdateDate], [PostDate], [AccountId]) VALUES (5, N'Tình bạn hay', N'Nếu cậu là một viên kẹo sô cô la, cậu sẽ ngọt ngào nhất. Nếu cậu là một chú gấu Teddy, cậu sẽ ôm thích nhất. Nếu cậu là ngôi sao, cậu sẽ là ngôi sáng nhất. Và vì cậu là BẠN tớ nên cậu là người bạn TỐT nhất', N'string', CAST(N'2022-06-25T11:11:16.497' AS DateTime), NULL, CAST(N'2022-06-25T11:11:16.497' AS DateTime), 5)
INSERT [dbo].[PostDiary] ([DiaryId], [Title], [DContent], [Image], [CreateDate], [UpdateDate], [PostDate], [AccountId]) VALUES (6, N'Người Bạn Chân Chính', N'Một người bạn chân chính là người hiểu rõ quá khứ của bạn, tin tưởng vào tương lai của bạn và chấp nhận con người bạn của hiện tại.', N'string', CAST(N'2022-06-25T11:11:47.947' AS DateTime), NULL, CAST(N'2022-06-25T11:11:47.947' AS DateTime), 6)
INSERT [dbo].[PostDiary] ([DiaryId], [Title], [DContent], [Image], [CreateDate], [UpdateDate], [PostDate], [AccountId]) VALUES (7, N'Bạn Thật Cá Tính', N'Bạn đểu sẽ vây quanh bạn khi họ cho rằng bạn thật cá tính. Người bạn chân thành sẽ ở bên cạnh bạn ngay cả khi họ nghĩ bạn là đồ ngốc.', N'string', CAST(N'2022-06-25T11:12:53.410' AS DateTime), NULL, CAST(N'2022-06-25T11:12:53.410' AS DateTime), 7)
INSERT [dbo].[PostDiary] ([DiaryId], [Title], [DContent], [Image], [CreateDate], [UpdateDate], [PostDate], [AccountId]) VALUES (8, N'Sinh nhật vui vẽ', N'Cô gái ơi, hãy vui tươi như mặt trời buổi sáng, hãy đẹp rực rỡ như một đóa hoa hồng và hãy xinh đẹp như bầu trời xanh trong. Bởi vì không có ai mang lại niềm vui cho ta ngoài chính chúng ta đâu', N'string', CAST(N'2022-06-25T11:13:46.870' AS DateTime), NULL, CAST(N'2022-06-25T11:13:46.870' AS DateTime), 8)
INSERT [dbo].[PostDiary] ([DiaryId], [Title], [DContent], [Image], [CreateDate], [UpdateDate], [PostDate], [AccountId]) VALUES (9, N'Chia tay nhau:(', N' Sau vài tháng yêu nhau thì 1 người lơ 1 người chán. Thôi thế thì chúng ta cùng giải tán.', N'string', CAST(N'2022-06-25T11:15:08.870' AS DateTime), NULL, CAST(N'2022-06-25T11:15:08.870' AS DateTime), 9)
INSERT [dbo].[PostDiary] ([DiaryId], [Title], [DContent], [Image], [CreateDate], [UpdateDate], [PostDate], [AccountId]) VALUES (10, N'Kẻ si tình', N'Đừng cãi lý với kẻ say. Đừng bắt tay với kẻ xấu. Đừng chiến đấu với kẻ liều. Đừng nói nhiều với kẻ ngu', N'string', CAST(N'2022-06-25T11:16:06.280' AS DateTime), NULL, CAST(N'2022-06-25T11:16:06.280' AS DateTime), 10)
INSERT [dbo].[PostDiary] ([DiaryId], [Title], [DContent], [Image], [CreateDate], [UpdateDate], [PostDate], [AccountId]) VALUES (11, N'Thêm vụ hack trong crypto (100 triệu USD bay màu). Cùng mình tìm hiểu tại sao.', N'Để mình thông tin rõ cho anh em biết, những vụ hack này đều liên quan tới cái gọi là ‘smart contract’ hay hợp đồng thông minh, chứ không phải cái blockchain. Cái blockchain rất khó hack nếu không muốn nói là không thể. Cho nên, anh em nghe ai nào bảo có thể hack được blockchain của BTC hay ETH hay ADA là mấy đứa nổ đó nha. Ai nói hack được BTC hay ETH thì nó hack, rồi tự tạo BTC hay ETH cho bản thân rồi.', N'637917527862652163', CAST(N'2022-06-25T11:19:26.333' AS DateTime), CAST(N'2022-06-25T11:21:18.743' AS DateTime), CAST(N'2022-06-25T11:19:26.333' AS DateTime), 11)
SET IDENTITY_INSERT [dbo].[PostDiary] OFF
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsEnabled]
GO
ALTER TABLE [dbo].[PostDiary]  WITH CHECK ADD  CONSTRAINT [FK_PostDiary_Account] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([AccountId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PostDiary] CHECK CONSTRAINT [FK_PostDiary_Account]
GO
