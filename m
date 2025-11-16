Received: from mail-m15592.qiye.163.com (mail-m15592.qiye.163.com [101.71.155.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8D1EAF9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Nov 2025 09:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763284667; cv=none; b=N69OYylG3tMyMJCq7fvHh8tg3ebbnl/FLhc+a8Ei6Isgd2BIklC4YaQDk41APIeQcdRIp6KP2UdjkJJRD9o5koLFw13NA1gfWrKtnFvBAzmzIS9PkYWMF8n+TvVXS9TFmLuUahstjhPR2aCdU5Uh2BnGBisUtsqYvTEGQodvDP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763284667; c=relaxed/simple;
	bh=KFOOqqonmQshkmSToomFHPisuar2VI2j8xAV9tpr9ho=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gVPfTvo9dfxD10GzWf1WfMJXjII7SYtv+g+MyCuVb/GqoV+lfh76bgg7M1LEoJtK9BFrJCSUe26xZ6Q0/wG0TTtEyHuBjmegk+D91JVYAYpwcR60fvGuI/j+NVIMiGO4eu9u++CsAYfI3VWCewshtx+gaVoFezXFVTkTKW9vJX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=iKmH86oV; arc=none smtp.client-ip=101.71.155.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="iKmH86oV"
Received: from localhost.localdomain (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 29ba56936;
	Sun, 16 Nov 2025 17:17:39 +0800 (GMT+08:00)
From: ke zijie <kezijie@leap-io-kernel.com>
To: lkp@intel.com
Cc: alexs@kernel.org,
	doubled@leap-io-kernel.com,
	linux-doc@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	ke zijie <kezijie@leap-io-kernel.com>
Subject: [PATCH] docs: zh_CN: scsi: fix broken references in scsi-parameters.rst
Date: Sun, 16 Nov 2025 17:16:56 +0800
Message-Id: <20251116091656.1788887-1-kezijie@leap-io-kernel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <202511130315.WOiKJQTu-lkp@intel.com>
References: <202511130315.WOiKJQTu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a8bf4abf709d8kunm0fae0246329af04
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDQ0JNVkgYGklMTEkdHh9KHlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=iKmH86oVxhdarER8UNeroYh2+GusAGEsHUqN6ok/+XCfnUvkFlXpbohZTIu5wm3LDbtDld3IeXzeIDflcFDxVR7IyqDor7azdpyOEGe6jOf/nzTYkQG4tmexi2YawTY8SAa5JJkoJL/h3t42ZVQ50IXqJFTFz+Dqc8sG867lihJWsZlR9qpIdCNt7QdoGVlFJYxp1UtDIapd7rtZSXNNTOToN5ltMu4gyuG0TslVkCsNf8UJw1NVqXJpJJBIsysWG9SYPRzlHaiigo37sdVyE2S/OloH1oMxpI7FgUiFRvMTz9j0TMSZ2l48ERz08ZLz1EtwJJ3JZAly5C9ywb3O+Q==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=Kk6pZ2Auo5LbAzp2gZb/w4HYA9Nswbh9mg5IA/Vd2KI=;
	h=date:mime-version:subject:message-id:from;

0day CI reported several broken references under
Documentation/translations/zh_CN/scsi/scsi-parameters.rst.
These files do not exist under the translations directory.
The correct references are the original English documents under
Documentation/scsi/.

This patch updates all broken paths accordingly.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202511130315.WOiKJQTu-lkp@intel.com/
Signed-off-by: ke zijie <kezijie@leap-io-kernel.com>
---
 .../translations/zh_CN/scsi/scsi-parameters.rst  | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/translations/zh_CN/scsi/scsi-parameters.rst b/Documentation/translations/zh_CN/scsi/scsi-parameters.rst
index 53cdc3094a9a..ace777e070ea 100644
--- a/Documentation/translations/zh_CN/scsi/scsi-parameters.rst
+++ b/Documentation/translations/zh_CN/scsi/scsi-parameters.rst
@@ -31,16 +31,16 @@ SCSI内核参数
 			请查阅 drivers/scsi/advansys.c 文件头部。

 	aha152x=	[HW,SCSI]
-			请查阅 Documentation/translations/zh_CN/scsi/aha152x.rst。
+			请查阅 Documentation/scsi/aha152x.rst。

 	aha1542=	[HW,SCSI]
 			格式：<portbase>[,<buson>,<busoff>[,<dmaspeed>]]

 	aic7xxx=	[HW,SCSI]
-			请查阅 Documentation/translations/zh_CN/scsi/aic7xxx.rst。
+			请查阅 Documentation/scsi/aic7xxx.rst。

 	aic79xx=	[HW,SCSI]
-			请查阅 Documentation/translations/zh_CN/scsi/aic79xx.rst。
+			请查阅 Documentation/scsi/aic79xx.rst。

 	atascsi=	[HW,SCSI]
 			请查阅 drivers/scsi/atari_scsi.c。
@@ -69,19 +69,19 @@ SCSI内核参数
 			请查阅 drivers/scsi/NCR_D700.c 文件头部。

 	ncr5380=	[HW,SCSI]
-			请查阅 Documentation/translations/zh_CN/scsi/g_NCR5380.rst。
+			请查阅 Documentation/scsi/g_NCR5380.rst。

 	ncr53c400=	[HW,SCSI]
-			请查阅 Documentation/translations/zh_CN/scsi/g_NCR5380.rst。
+			请查阅 Documentation/scsi/g_NCR5380.rst。

 	ncr53c400a=	[HW,SCSI]
-			请查阅 Documentation/translations/zh_CN/scsi/g_NCR5380.rst。
+			请查阅 Documentation/scsi/g_NCR5380.rst。

 	ncr53c8xx=	[HW,SCSI]

 	osst=		[HW,SCSI] SCSI磁带驱动
 			格式：<buffer_size>,<write_threshold>
-			另请查阅 Documentation/translations/zh_CN/scsi/st.rst。
+			另请查阅 Documentation/scsi/st.rst。

 	scsi_debug_*=	[SCSI]
 			请查阅 drivers/scsi/scsi_debug.c。
@@ -112,7 +112,7 @@ SCSI内核参数
 			请查阅 drivers/scsi/sim710.c 文件头部。

 	st=		[HW,SCSI] SCSI磁带参数（缓冲区大小等）
-			请查阅 Documentation/translations/zh_CN/scsi/st.rst。
+			请查阅 Documentation/scsi/st.rst。

 	wd33c93=	[HW,SCSI]
 			请查阅 drivers/scsi/wd33c93.c 文件头部。
--
2.25.1

