Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681C2A34
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Apr 2024 00:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712451167; cv=none; b=Xk0BA+Qbta0wqx6Ff0d9ooyFz0eEWwkV9mWdd65H877l07hLWC/sYJnJI04WG7fn/Mt816ITvIsDwjq5qbFvgb6KPSbo1y3ghkgGNYydyGNAc2KrR6ZwlUdRdMgGXWgP2oRKetKFUrJXG2Dpww58LzE3iBNI0yY3bOsII4EiJag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712451167; c=relaxed/simple;
	bh=umBNddhbDBKgkZ50YrWv5x0Bx4tCEvao2oIdRV0OeO4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IUo05oiXBxoiikahTTt04ZRMQa+MM8UnPLovtyxH+V4hY1WxYL2NsL7xK5oxzj35MU/sGrBVEMLY7oTDkG1ojeedPeaM89A34ZsxmVZ3kGFIcuRxyRojIBxlCm5rmhFfZ3TvH8M0DcmC/iKmXeujzzyJ2TcvQ199IbSaVCkKBbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=juHvgYnM; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="juHvgYnM"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6ecf406551aso2357453b3a.2
        for <oe-kbuild-all@lists.linux.dev>; Sat, 06 Apr 2024 17:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712451165; x=1713055965; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0EJ/0uocE3NjJlEUwaV88zvEZDGX2H4plltlBSFIU1E=;
        b=juHvgYnM1gmoXfNhhhYLV32r7TfUOZoi0/K42jycNUpIlNKVZH2FpwQC6KTYF57t2W
         pgAI4dmC2FFCLc+4OFl5jI7ytZykkBMl/QeEhUM/MGUSEcsBUcqvjXyvyQvzoSctMFEW
         wyfHI9leZJEovYupJmkY+w+jy5FeMjRid1yAmaHmzZMgi/r3tlNliTAXm4R1e2wP+LBC
         JX7fr6DA8/vt2v/wE/U0dm7phEAeKbmAXxjmUIY4xFl+yyLccP/wVWWz6C37b8mKUJmb
         7uAWEWrJ97p+38sGrKhfRsd4Qi6GsHkk+WQ21JJf7uOD279euh6X0zOYXLvwoDOV39Zh
         g7bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712451165; x=1713055965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0EJ/0uocE3NjJlEUwaV88zvEZDGX2H4plltlBSFIU1E=;
        b=hit2s0lk7qxXoLGoLXNJx2J3QwXH0uEdAzo7vrpu1z/stezh8V098JE9Aw3YDgbDGE
         cL9lKqXB2wIr+Nl36QrzlJcztTUgJ5qKfJxqXzjGB2AY8eCM+uI9iz7Eb36uB6Q18OlG
         yRA4ymw+5C80AUHgoHLl13mr73EkEX1muhWClTPeVgQbAiD5pblecXHY9wBDX9aX3563
         3m6FqQQj4Ju8uVQuvjKaYYWUPLDwfhsC63l2GdDuOVN5SlsxBFMzesds3n90evC96+CE
         hAHESqz47yF/DVfZZ4obyxfr+gUBsRt9FrJRg8uKqYT5o/XtrBNSJZuxGjOqeaGBNtqq
         UARQ==
X-Forwarded-Encrypted: i=1; AJvYcCVk7tngq/IhmpoY4+BpYYLgkJAxKtnB0K4NXCn9KzmjfKqkKiQi5n9dKhmeEQoCb1U4H+FNuB8X7IxGUOFZgK47H18Yc6z+YUGXwJy47A==
X-Gm-Message-State: AOJu0YzNIDObD37LSKhUq3Je+mJH+jjeLL8Wmf3e4CiqjabJW+KtOAk5
	q1vrpEOv8GD38LYEZ8O4AElSx1yjfW49RDYfL95MY5n2Q58vhyvC
X-Google-Smtp-Source: AGHT+IEpZR5Nut9YDUAeNvAv8rbRkOsBkbnSWPVlNGZbQQ+xp4/ItDOMMSENgbN3RBp/ISa40JS3tQ==
X-Received: by 2002:a05:6a21:3d94:b0:1a7:3095:b3b9 with SMTP id bj20-20020a056a213d9400b001a73095b3b9mr5493293pzc.22.1712451165546;
        Sat, 06 Apr 2024 17:52:45 -0700 (PDT)
Received: from localhost.localdomain ([2407:7000:8942:5500:aaa1:59ff:fe57:eb97])
        by smtp.gmail.com with ESMTPSA id on15-20020a17090b1d0f00b0029ffcf1df72sm5483118pjb.38.2024.04.06.17.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Apr 2024 17:52:45 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: lkp@intel.com
Cc: akpm@linux-foundation.org,
	linux-mm@kvack.org,
	oe-kbuild-all@lists.linux.dev,
	v-songbaohua@oppo.com
Subject: Re: [akpm-mm:mm-unstable 313/322] include/linux/huge_mm.h:274:23: error: variably modified 'stats' at file scope
Date: Sun,  7 Apr 2024 12:52:29 +1200
Message-Id: <20240407005229.103923-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <202404061627.ungVloow-lkp@intel.com>
References: <202404061627.ungVloow-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> 
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   f43b3aae94511d62174c3b29239da0dd22d0eeb3
> commit: d4358ee0a075e232114dfec0cd162860cfa2771b [313/322] mm: add per-order mTHP anon_alloc and anon_alloc_fallback counters
> config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240406/202404061627.ungVloow-lkp@intel.com/config)
> compiler: powerpc64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240406/202404061627.ungVloow-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202404061627.ungVloow-lkp@intel.com/

> All errors (new ones prefixed by >>):
> 
>    In file included from include/linux/mm.h:1115,
>                     from include/linux/mman.h:5,
>                     from arch/powerpc/kernel/asm-offsets.c:19:
>>> include/linux/huge_mm.h:274:23: error: variably modified 'stats' at file scope
>      274 |         unsigned long stats[PMD_ORDER + 1][__MTHP_STAT_COUNT];
>          |                       ^~~~~
>    make[3]: *** [scripts/Makefile.build:117: arch/powerpc/kernel/asm-offsets.s] Error 1

Should have been fixed by:

From 573aa50dbebcd4b2650d477374b28aa53c21b968 Mon Sep 17 00:00:00 2001
From: Barry Song <v-songbaohua@oppo.com>
Date: Sun, 7 Apr 2024 12:23:35 +1200
Subject: [PATCH] mm: fix powerpc build issue

Signed-off-by: Barry Song <v-songbaohua@oppo.com>
---
 include/linux/huge_mm.h |  9 ++++-----
 mm/huge_memory.c        | 13 +++++++++++--
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index c5d33017a4dd..0717063dc5e7 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -271,16 +271,15 @@ enum mthp_stat_item {
 };
 
 struct mthp_stat {
-	unsigned long stats[PMD_ORDER + 1][__MTHP_STAT_COUNT];
+	unsigned long stats[0][__MTHP_STAT_COUNT];
 };
 
-DECLARE_PER_CPU(struct mthp_stat, mthp_stats);
+extern struct mthp_stat __percpu *mthp_stats;
 
 static inline void count_mthp_stat(int order, enum mthp_stat_item item)
 {
-	if (unlikely(order > PMD_ORDER))
-		return;
-	this_cpu_inc(mthp_stats.stats[order][item]);
+	if (likely(order <= PMD_ORDER))
+		raw_cpu_ptr(mthp_stats)->stats[order][item]++;
 }
 
 #define transparent_hugepage_use_zero_page()				\
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 5b875f0fc923..10bc3f54cb81 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -526,7 +526,7 @@ static const struct kobj_type thpsize_ktype = {
 	.sysfs_ops = &kobj_sysfs_ops,
 };
 
-DEFINE_PER_CPU(struct mthp_stat, mthp_stats) = {{{0}}};
+struct mthp_stat __percpu *mthp_stats;
 
 static unsigned long sum_mthp_stat(int order, enum mthp_stat_item item)
 {
@@ -534,7 +534,7 @@ static unsigned long sum_mthp_stat(int order, enum mthp_stat_item item)
 	int cpu;
 
 	for_each_online_cpu(cpu) {
-		struct mthp_stat *this = &per_cpu(mthp_stats, cpu);
+		struct mthp_stat *this = per_cpu_ptr(mthp_stats, cpu);
 
 		sum += this->stats[order][item];
 	}
@@ -602,6 +602,7 @@ static struct thpsize *thpsize_create(int order, struct kobject *parent)
 static void thpsize_release(struct kobject *kobj)
 {
 	kfree(to_thpsize(kobj));
+	free_percpu(mthp_stats);
 }
 
 static int __init hugepage_init_sysfs(struct kobject **hugepage_kobj)
@@ -636,6 +637,13 @@ static int __init hugepage_init_sysfs(struct kobject **hugepage_kobj)
 		goto remove_hp_group;
 	}
 
+	mthp_stats = (struct mthp_stat __percpu *)alloc_percpu((PMD_ORDER + 1) *
+					sizeof(sizeof(mthp_stats->stats[0])));
+	if (!mthp_stats) {
+		err = -ENOMEM;
+		goto remove_hp_group;
+	}
+
 	orders = THP_ORDERS_ALL_ANON;
 	order = highest_order(orders);
 	while (orders) {
@@ -673,6 +681,7 @@ static void __init hugepage_exit_sysfs(struct kobject *hugepage_kobj)
 	sysfs_remove_group(hugepage_kobj, &khugepaged_attr_group);
 	sysfs_remove_group(hugepage_kobj, &hugepage_attr_group);
 	kobject_put(hugepage_kobj);
+	free_percpu(mthp_stats);
 }
 #else
 static inline int hugepage_init_sysfs(struct kobject **hugepage_kobj)
-- 
2.34.1

