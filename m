Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17135662
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Mar 2023 13:07:55 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id fb38so1199983pfb.7
        for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Mar 2023 06:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679663275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ML7VBv7XlyCu7FAut6rRzjQeV7yr72fXHIIMk8RclWk=;
        b=mfWseLTSCbOBB+sSAr5vN/irU+vs2TOjW9ljyOFopToQR18sDQigO4UZdXn97oJ8go
         ISTlF4ZuIFAel06Z0s5OfTSRpczkqKdIKyM8gV8MSLOH0PZm28F3dnpv2uMM94BknmUM
         FkcIfDkztBDpDruWEpdjixZle3KoeViAXyAet+Ges4nwUPXYKECPr6tUj8L9e4xr2Krq
         x8GyItMO8NafsYSSrerh1tVtoPrVhsg5x9yuqT9KOpB0OpzUDvnIcxpru/qZfSZq7C7p
         yhMaXfeXYGYMKU7M5w9qPPkGBUrh8RtP/PLwYkXMIWfj+aXyLAY7Ut3Nb8hbLkapVigR
         QlcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679663275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ML7VBv7XlyCu7FAut6rRzjQeV7yr72fXHIIMk8RclWk=;
        b=JtE8QkpwjYCOSJAe0zS335gnfrVCsnTRjT4C2durowf7RwEqeACBQccFen3IwfIx1w
         j/QgyIJfhIYMJhmdnQVLbGynCgMh6CXBJMtj39JGTdZ14v5y2pNHBN8xBlxigCNe9zdE
         ZBxt6mLcpl3wYKFUiK119bg7eKV+3uRkn/lthQlIkSK5uJlT248p55INCyH+ctOr80F4
         DHw6bczC0YfVdrnopUzvBIuvJ248RgSV/AZTKdmz2lW68CL7OpFgytwQQGnQGtBSvXOe
         A6MJoObbRAT62HLzRC1W5Z7SstN5rVVjsPveCeIxOB8S6bAsKp3hUlhz/jGYx2g3hpFc
         x1wQ==
X-Gm-Message-State: AAQBX9ceagEFx/7rMzByse6big7kv1WevDoFRugN4wEERVV0EOI03hzm
	QwtOzDuxcgAqUIzNr62vcMo=
X-Google-Smtp-Source: AKy350awoE/Mfx31AyNqUQ0MW8ZHQLZjcZ9TVqVIFJQa3De1zZ/eJqj8JlErfsgbbcmpb23ogieGNA==
X-Received: by 2002:aa7:9908:0:b0:5a8:a0df:a624 with SMTP id z8-20020aa79908000000b005a8a0dfa624mr2604869pff.22.1679663275065;
        Fri, 24 Mar 2023 06:07:55 -0700 (PDT)
Received: from DESKTOP-B5TBVBT.localdomain ([175.117.51.71])
        by smtp.gmail.com with ESMTPSA id p18-20020a62ab12000000b005809d382016sm4141966pff.74.2023.03.24.06.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 06:07:54 -0700 (PDT)
From: Yohan Joung <jyh429@gmail.com>
To: jaegeuk@kernel.org
Cc: jyh429@gmail.com,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	lkp@intel.com,
	oe-kbuild-all@lists.linux.dev,
	Yohan Joung <yohan.joung@sk.com>
Subject: [PATCH] f2fs: fix align check for npo2
Date: Fri, 24 Mar 2023 22:07:47 +0900
Message-Id: <20230324130747.523-1-jyh429@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ZBzlJ36kO5KvxODB@google.com>
References: <ZBzlJ36kO5KvxODB@google.com>
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
 fs/f2fs/segment.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 055e70e77aa2..f4a22a065277 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1842,6 +1842,7 @@ static int __f2fs_issue_discard_zone(struct f2fs_sb_info *sbi,
 	sector_t sector, nr_sects;
 	block_t lblkstart = blkstart;
 	int devi = 0;
+	u32 remainder = 0;
 
 	if (f2fs_is_multi_device(sbi)) {
 		devi = f2fs_target_device_index(sbi, blkstart);
@@ -1857,9 +1858,9 @@ static int __f2fs_issue_discard_zone(struct f2fs_sb_info *sbi,
 	if (f2fs_blkz_is_seq(sbi, devi, blkstart)) {
 		sector = SECTOR_FROM_BLOCK(blkstart);
 		nr_sects = SECTOR_FROM_BLOCK(blklen);
+		div_u64_rem(sector, bdev_zone_sectors(bdev), &remainder);
 
-		if (sector & (bdev_zone_sectors(bdev) - 1) ||
-				nr_sects != bdev_zone_sectors(bdev)) {
+		if (remainder || nr_sects != bdev_zone_sectors(bdev)) {
 			f2fs_err(sbi, "(%d) %s: Unaligned zone reset attempted (block %x + %x)",
 				 devi, sbi->s_ndevs ? FDEV(devi).path : "",
 				 blkstart, blklen);
-- 
2.25.1

