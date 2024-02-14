Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5577199A1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Feb 2024 11:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707910821; cv=none; b=OmvSVU/OyIB5DZfUVbxZQVh/7f3epakpqfNfT4uKE/UuNXzpHhuR8UzpYm7ojz14gBG8HBQ8tupDBUCD4BrHYiE0PlaiUthayRFIa15TBY238bHGLqobj19vntbIw1nWvmmP6q5tvXok5+BPZBHTYPsGNr9rImU6+B1yoWTmKkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707910821; c=relaxed/simple;
	bh=jl4X2nLs/EGY7MkFbQnr2YKdAJST/jbucKSgzovRLww=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xf5kvSN8yNRvRkW0faqBcdV54dCT5vwCHff8rS7I7LzvGvqbX2RSt3eUkQMA+yWl1wcuwHx8ZmIpVZWoiyhCUKQKpzGhNz+A6VqDHUSZt+vMWGv6VPpxJU7J5dGw5SXwOeP84eZkbbyRoNZN9oB3OWNXw9cMxnvdAkxNgNCYerc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn; spf=pass smtp.mailfrom=shingroup.cn; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shingroup.cn
X-QQ-mid: bizesmtp69t1707910725t3jqpubl
X-QQ-Originating-IP: fDEDb8Byls7cymFQN/Cx3S4iUt4gnKrfZ1Si9YIXh+o=
Received: from localhost ( [112.22.30.30])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 14 Feb 2024 19:38:44 +0800 (CST)
X-QQ-SSF: 01400000002000504000B00A0000000
X-QQ-FEAT: uWtt+4oZiA/qS7T2ZI6hwxc3Siw4b/9Zv2iNiIVjBOb8bkerl33Bqy8OZLhaw
	4G3zIxmMqqLcjxh5jd6LceKODJBczcv+wHcf6kCXBXHrtlzQNY9+UwClyu8CRNi38i+MrEM
	1qW63T66HF7yzcHm0FWTnEI1pnliSA2c/vcfnTnRlZVPfUL8VRlVeMlFhwOYgNMU1cMM5hN
	YXtQUgLsFLk6v8rRIXLqSCDy5WlgLzXXvoMoOTtD6vm6uMU2V8N2vVH4IQ8NrpqmzNHUT2D
	SvSz0SqUELNknSeMm5UG9KwkVdhSBW/D/iAmX1s7MNXe2YZc3dSg8oTzax4oHHjOf0z0gd6
	Q3iFWqDpSQc5uWnHcXgGgGy5K2e5XYG9l12v/lw+SoGt8piQmsZjpLioVjPBfqU6FmFlQXV
	dFcXxD69jGU=
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 11672996985482081614
From: Dawei Li <dawei.li@shingroup.cn>
To: mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hdegoede@redhat.com,
	oe-kbuild-all@lists.linux.dev,
	set_pte_at@outlook.com,
	Dawei Li <dawei.li@shingroup.cn>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] media: Add dependency of ov7670/mcam/cafe on CONFIG_V4L2_ASYNC explicitly
Date: Wed, 14 Feb 2024 19:38:30 +0800
Message-Id: <20240214113830.3656367-1-dawei.li@shingroup.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <202402130955.f6uxzdCA-lkp@intel.com>
References: <202402130955.f6uxzdCA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz5a-1

Kernel test robot reports:
   ld: drivers/media/i2c/ov7670.o: in function `ov7670_remove':
   drivers/media/i2c/ov7670.c:2011: undefined reference to
   `v4l2_async_unregister_subdev'
   ld: drivers/media/i2c/ov7670.o: in function `ov7670_parse_dt':
   drivers/media/i2c/ov7670.c:1836: undefined reference to
   `v4l2_fwnode_endpoint_parse'
   ld: drivers/media/i2c/ov7670.o: in function `ov7670_probe':
   drivers/media/i2c/ov7670.c:1990: undefined reference to
   `v4l2_async_register_subdev'
   ld: drivers/media/platform/marvell/cafe-driver.o: in function
   `cafe_pci_probe':
>> drivers/media/platform/marvell/cafe-driver.c:543: undefined reference
   to `v4l2_async_nf_init'
>> ld: drivers/media/platform/marvell/cafe-driver.c:545: undefined
   reference to `__v4l2_async_nf_add_i2c'
   ld: drivers/media/platform/marvell/mcam-core.o: in function
   `mccic_shutdown':
>> drivers/media/platform/marvell/mcam-core.c:1931: undefined reference to
   `v4l2_async_nf_unregister'
>> ld: drivers/media/platform/marvell/mcam-core.c:1932: undefined reference
   to `v4l2_async_nf_cleanup'
   ld: drivers/media/platform/marvell/mcam-core.o: in function
   `mccic_register':
   drivers/media/platform/marvell/mcam-core.c:1910: undefined reference to
   `v4l2_async_nf_unregister'
   ld: drivers/media/platform/marvell/mcam-core.c:1911: undefined reference
   to `v4l2_async_nf_cleanup'
>> ld: drivers/media/platform/marvell/mcam-core.c:1873: undefined reference
   to `v4l2_async_nf_register'

Add explicit dependency on CONFIG_V4L2_ASYNC to mute ld errors.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202402130955.f6uxzdCA-lkp@intel.com/
Signed-off-by: Dawei Li <dawei.li@shingroup.cn>
---
 drivers/media/i2c/Kconfig              | 1 +
 drivers/media/platform/marvell/Kconfig | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 4c3435921f19..453cb4b81d6f 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -523,6 +523,7 @@ config VIDEO_OV7640
 	  module will be called ov7640.
 
 config VIDEO_OV7670
+	select V4L2_ASYNC
 	tristate "OmniVision OV7670 sensor support"
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
diff --git a/drivers/media/platform/marvell/Kconfig b/drivers/media/platform/marvell/Kconfig
index d6499ffe30e8..48f5484478a0 100644
--- a/drivers/media/platform/marvell/Kconfig
+++ b/drivers/media/platform/marvell/Kconfig
@@ -11,6 +11,7 @@ config VIDEO_CAFE_CCIC
 	select VIDEOBUF2_VMALLOC
 	select VIDEOBUF2_DMA_CONTIG
 	select VIDEOBUF2_DMA_SG
+	select V4L2_ASYNC
 	help
 	  This is a video4linux2 driver for the Marvell 88ALP01 integrated
 	  CMOS camera controller.  This is the controller found on first-
@@ -27,6 +28,7 @@ config VIDEO_MMP_CAMERA
 	select VIDEOBUF2_VMALLOC
 	select VIDEOBUF2_DMA_CONTIG
 	select VIDEOBUF2_DMA_SG
+	select V4L2_ASYNC
 	help
 	  This is a Video4Linux2 driver for the integrated camera
 	  controller found on Marvell Armada 610 application
-- 
2.27.0

