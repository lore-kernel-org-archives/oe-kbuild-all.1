Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8323624B3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Feb 2026 07:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772177337; cv=none; b=DqW2QnikrjR6/IMuEVd6q6S3DuPMh6ypFfccYb9hbz8mulmdf72QwlBaWDQ1a1Qdq0sq0KEweoD1Y26EogZHs3I/2t7+p6g2mdUauUfmS7vATNR9bb5CqIztjU8nJCMO258jCKnLViZlZXPhvw9MS5ddFNuYAALn6/MGVkpbDHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772177337; c=relaxed/simple;
	bh=d8wGQfXyjLUS+c9lTdhX3W1UsX/w/wbGaKLj0hEPTHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YiGNsP5D2dT/kO0dodxljSAisncUjJD+x1LYs+6qusGEEaUS9NAQN3qmLQxsRgyaR+H69+luiAzUOk3ZKZP/4sCVs18wVXRp38+h4CRqFW1hHY4j5vmJLZ/0GxoZeofFKt73O11yDu0gN9yU7lAtB1OjZgCQEE8rASg8MT8Fm2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SRucAIPb; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SRucAIPb"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-358e3cc5e7eso768428a91.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Feb 2026 23:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772177335; x=1772782135; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MiLwYlPuIiCWyjV0+TmHr2nfeKChD/cBXxOdPTgH9yA=;
        b=SRucAIPbX/fsAn40ipjpMreGGPdaPn3HF0wTh8Y1YSzMnRBGiMiC5I9BX/BWggWMtT
         NmuOqLauBNRK0cQAMx0qOxh14WoeYEa7oVeWezZZRLkKu9KZ7XQMowcEJ7JvGVQeHLRf
         NtmbnUmHADOC/vdgbGT2gyzO+lESvYQZhqiURKTka4Da7vrJY9iKnMDdrdnX5PJ9N1Ru
         0b7+7w8dTY4IDqwBHsVgJicw/2mp5bAwMcGvP8PG7s0SyuT+HXgJItnuH3rB1U+5hDWe
         IqfQpMHEUKJYZmrbNgJ1HaczhVfHSvEaZLDJisAYN9+NBZV4Num8n3mWiPFdl2wrPoSv
         jtOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772177335; x=1772782135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MiLwYlPuIiCWyjV0+TmHr2nfeKChD/cBXxOdPTgH9yA=;
        b=emvRDIBrLbhkluAzp1OIVsMs9q5L/kTQSlYBvwrafksWxUGdHqGHpnQB3G18GpOjxL
         sf7d37m4wq3Cq+Vr4lplUjACtKvnKBHu7RyniStU0Z3hU+s1fI085cR/GEjHhbUJE1G3
         zbhsUYSwsuUaeUv5H5d4lUA56Mi9xJM/5nOkme8JN2YVGWFdUfWdklZfuYjDXhnPg0iN
         /sd1uF5Vs87OzQWVzlBBSLvjfgbuHeMO1kIbcbIO1eJdZJIiGej0WUP8bBqOh/2HMQct
         hvQMVSbWuajuiv1x4OAscBFAAD7M6MyRTUOWXhCztIEZuGaxccyust2l1MwUZhiUz5SD
         qdXQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7syvrgWspCvvo/2TYqJcGq5TCVE/KuDA7aPoVqnTXy29/Q7nVoW9xX71i9R2CGWyj+eSI+n0kUJFCfQzv@lists.linux.dev
X-Gm-Message-State: AOJu0YxwtWQSwTNeN6w4pKEm7BvIGStXI1RZKhWpnMRGzfreKv/vGEmi
	OkN9Tf9rhKOGjGiX/CaugDuzqGsOTpfpKM8JLRh7aFyO5SrS0659p4ZG
X-Gm-Gg: ATEYQzynuZge9+ZJYTpukocIVSxeRIxRWua1W9kLi/l9k4MRq0tbyqrD3iXGBGDovbU
	4F6DUwsligBfunC87OTnMz8lb0TZcuBgH7A75c7/4xmoRQOteo9U21pvjf0kLwpQOjVV8jKgBw1
	0KGmtOorEyv3pbrb+OWlEuMhAHMfWdzMyYp+RZevskB3tofClN1Km6NibvEMMPe1oCXYfkOICyI
	azvc6pVeT68V853u5/rCDgpsCrW0hgUGQk0eo83loJHlvPIY29XTc/K7RuH5GKe+VoOmG7eOyOF
	aUh3MtzKEhTtwza8DIcYGE0syucRo+gTvAMQTiMyvq5MDg6Vd2wSPjvaJckHZc6jVDB3rfY/cH+
	k7Tc9iH/DJ6jOchaGX/SkoVah61Py/gLojggTTg13TBcnE9krGCfPhFtEStmbRypRYOoteWFqGR
	icjP64hRNYHUn0KO7ps5BPXqaj95qbn87E2g==
X-Received: by 2002:a17:90b:2651:b0:34a:9d9a:3f67 with SMTP id 98e67ed59e1d1-35965cf18cbmr2266164a91.33.1772177335594;
        Thu, 26 Feb 2026 23:28:55 -0800 (PST)
Received: from Modern-15.. ([2401:4900:854b:40d:f564:fa7d:49b1:5b44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3593dcc95a7sm4058374a91.6.2026.02.26.23.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 23:28:55 -0800 (PST)
From: Mathura_Kumar <academic1mathura@gmail.com>
To: lkp@intel.com
Cc: academic1mathura@gmail.com,
	brauner@kernel.org,
	linux-ipc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: [PATCH 2/2] [PATCH-V2] mqueue: introduce new do_mq_timedreceive2() [ mq_peek syscall] for non-destructive       receive and inspection
Date: Fri, 27 Feb 2026 12:58:21 +0530
Message-ID: <20260227072822.204946-2-academic1mathura@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260227072822.204946-1-academic1mathura@gmail.com>
References: <202602270443.k6N6t2u4-lkp@intel.com>
 <20260227072822.204946-1-academic1mathura@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following Two warning issue by build and test on V1: Ignore Patch V2 that has small typo
               in line 18 (corrected is warning due to it not has explicit handler)

1) include/linux/syscalls.h:750:42: warning: declaration of 'struct mq_timedreceive2_args'
   will not be visible outside of this function [-Wvisibility]
fix-included the missing header for global visibility

2)  warning: syscall mq_timedreceive2_time64 not implemented [-W#warnings]

fix- This seem false postive warning, script not able to correctly map syscall table
 with handler
in file - ~/linux/arch/x86/entry/syscalls/syscall_32.tbl
473 causing warning due to it not has explicit handler for name "mq_timedrecive2_time64",because
it also handle by same normal SYS_DEFINE for  64 bit arch  because logically both are
same if 32bit machine call 64 bit, if we add named defined then it create unnessary
 redudancy and duplicacy, so even at this time i am not changing this, if required kindlly
once test in runtime and guide me.

472	i386	mq_timedreceive2	sys_mq_timedreceive2_time32
473	i386	mq_timedreceive2_time64	sys_mq_timedreceive2

Reported-by: kernel test robot <lkp@intel.com>
 Closes: https://lore.kernel.org/oe-kbuild-all/202602270443.k6N6t2u4-lkp@intel.com

Signed-off-by: Mathura_Kumar <academic1mathura@gmail.com>
---
 include/linux/syscalls.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
index 4db405159a8b..307cfd6f154c 100644
--- a/include/linux/syscalls.h
+++ b/include/linux/syscalls.h
@@ -93,6 +93,7 @@ struct file_attr;
 #include <linux/key.h>
 #include <linux/personality.h>
 #include <trace/syscall.h>
+#include <linux/mqueue.h>
 
 #ifdef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
 /*
-- 
2.43.0

