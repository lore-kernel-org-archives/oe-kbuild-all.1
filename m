Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5976923C3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Mar 2023 07:23:58 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id h12-20020a17090aea8c00b0023d1311fab3so1162006pjz.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Mar 2023 00:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679556237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=buAA0gQONMWjkOKf6MOi67XvxnQyV7zOZpCFmaXgVLI=;
        b=BwyezKzNUfJO24XJVuCeWKjJ6IRxjZ5OOcKf8Yd902IfLfzLsna/DcHVVSTAbNhKrc
         pfvcZdbY4N0rWsUWviK4dJtIzMnBKTJR+gdbIyTsg9RxsNxzQM+mond4mqGZBbPx0jN4
         /2vdACU86PD3yHB4FUwCJj5Chni2Qtp9LvQQUF/zhCTJnvxsAUeDAr+MHnuwGFT6cx3v
         OqO8tJs3nd1/05RDD2+FOWJBaJYBVshaWdA7b85efOn9i38Ef6dqbvCSAY0KgWoA1nVh
         lyS/V+wK+dk4twEqJECyiDr3XgGzcngjcSHOYSI6Xz41a31PgE9+NQboqvUMzQBEZQSw
         Pk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679556237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=buAA0gQONMWjkOKf6MOi67XvxnQyV7zOZpCFmaXgVLI=;
        b=uQuFWrCDhNyYrvsaKm16ICXBw4jGFcYyohSGkTZOx34g8MxdnbUY73lSxuIoK1bkd4
         4Dp7361ld86GVcPsDZn1MMyIsXA+2UZ0Zc8nRpjkoMx706d0KH5zYlDCb24ImrBA0s48
         7dMI0y0jsNxT22J25xGJTXYvOTgaNhs4Cr+ALl1/hl+kxfm8AjNy3aU94ZmUKDbGtpiM
         guKs9bR9TlfcF1ZWVhC3QSwSiFwyhxhSmlUlRbZ3rDhSrYUw0r7jcDb5T+CDmV831cMW
         oszo3PZ+edhd5ODWRRMB2lyzDi3Pgv7Q5AKZY42xBq+lBps6yGG1ch4oZf775bGhTftV
         BwCQ==
X-Gm-Message-State: AO0yUKURNj4kiYdpWiI/K0RPlR6o6zlaLDea+OMBVf/SFP+NVJKKEQb2
	298GfbQsjIH4LnPa/Nmcpjk=
X-Google-Smtp-Source: AK7set9SOXtJImuAOa1KTCi+7H6Igv15mIZLquTlrWTwPzp4jAwGniT1wHdZ3xUmfpJkH70sHH0irw==
X-Received: by 2002:a17:903:42c3:b0:19e:dc0e:1269 with SMTP id jy3-20020a17090342c300b0019edc0e1269mr4723439plb.7.1679556237546;
        Thu, 23 Mar 2023 00:23:57 -0700 (PDT)
Received: from DESKTOP-B5TBVBT.localdomain ([175.117.51.71])
        by smtp.gmail.com with ESMTPSA id je1-20020a170903264100b001a1ddd224desm5235691plb.89.2023.03.23.00.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 00:23:56 -0700 (PDT)
From: Yohan Joung <jyh429@gmail.com>
To: lkp@intel.com
Cc: chao@kernel.org,
	jaegeuk@kernel.org,
	jyh429@gmail.com,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	Yohan Joung <yohan.joung@sk.com>
Subject: [PATCH] f2fs: fix align check for npo2
Date: Thu, 23 Mar 2023 16:23:38 +0900
Message-Id: <20230323072338.175-1-jyh429@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <202303231039.GKLRE8O5-lkp@intel.com>
References: <202303231039.GKLRE8O5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix alignment check to be correct in npo2 as well

Signed-off-by: Yohan Joung <yohan.joung@sk.com>
---
 fs/f2fs/segment.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 055e70e77aa2..46458085a8d0 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1858,7 +1858,7 @@ static int __f2fs_issue_discard_zone(struct f2fs_sb_info *sbi,
 		sector = SECTOR_FROM_BLOCK(blkstart);
 		nr_sects = SECTOR_FROM_BLOCK(blklen);
 
-		if (sector & (bdev_zone_sectors(bdev) - 1) ||
+		if (sector % bdev_zone_sectors(bdev) ||
 				nr_sects != bdev_zone_sectors(bdev)) {
 			f2fs_err(sbi, "(%d) %s: Unaligned zone reset attempted (block %x + %x)",
 				 devi, sbi->s_ndevs ? FDEV(devi).path : "",

base-commit: d15180a8d1d72c7bddcb700d2c9ffdab7d2b9481
-- 
2.25.1

