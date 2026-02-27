Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7338536215F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Feb 2026 07:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772176169; cv=none; b=lttd1LRoZ3kmHZYebittiKDK9RvDJ9K8iM0lrVGAx9FzoGUjmVNg8p24YKmivXknp6F5E/mvrKiRY10qznbSZZTYrTnGtQGOEc1VdLDUy8f8bFXB6utS9TFDCI7K0EmAYbiRtSpeg146FjCi7UHRBiBi2mFn1olUET7Sy5y7Q5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772176169; c=relaxed/simple;
	bh=Qd0rnZBE1xws3W96Pw5Blesuqote85Z9+msEuuIV0jA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YKm+1A9xiEiJbEMJzzgL1fPa8fx0XQEa2Z6MND/NBd9QmLRL/4lIysMrMMSG1lcL1hsEwYSzyBQf1QLWxeapGO2IelqjwslLCFbzxfVGB8OAFIIq/ez+mbnoMiXPSC7QBd40uzkU5pFFEYDmfoguwBgrwIFyQc9sEsKARCnmbE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cg+oRMnz; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cg+oRMnz"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ad617d5b80so11021885ad.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Feb 2026 23:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772176168; x=1772780968; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D2OLS1A4Uw6yTtRylm2HkzI1Tav6toxZGMwlbuYQ/RI=;
        b=Cg+oRMnz7565sNyVr+7eMsDLm5HmnrpMtbGm++GFjOKWy6jsI4gwBxRtIom1ojpK9+
         DOmq3HMBl6tpu/5Qn/ptObLqQoDtzE8oz5gRL37ZJJsjM2MyKLmJV0JDSIch4FkZ3h8V
         NXIQ9nu/D/IspnPJhqLNNcGz3viasG3jnIbKG0uBc7/3gbe/L5GpdPfO7ftyGaTkCUVD
         +Q/bWtU6nqvZJrlb6d+iBnWAk+gDwl6LEEDsaE0ToaqosO1TvGUkwKrjmGRB6EITOByD
         purgY8+vNhR4wsJFfL3RhjKD6d8JPIe1GuqJx8/73d7PWTO2/ivG3csCsb1dQvMw2bOj
         WdSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772176168; x=1772780968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D2OLS1A4Uw6yTtRylm2HkzI1Tav6toxZGMwlbuYQ/RI=;
        b=XXk/gB3UhGLoZzQPB2LO59Kvy0rwPRSmF1I9TuU5DBAebo0uGkuezxYjPlI2z5Eok3
         w4rmdRXEtOAyar7Sk+g56fXrFuQv2jrthJc9e/M9y1ljtGitcPWCOE+FVLHBObCYNSLw
         wW8DVy87UMRytH8lhCsLuD5a8YafGK+TAluezyzLq+P149q8Jnd6DWNVwPXKIrtbOAvI
         25pQKnDW8GdykgapWiI92eFmDW9sSQAWQ3NdKtyGCJi3wcs3vfs16OSCkeXiwRFx/ZE5
         VEaBCOoBIsXtXsLfriFK0OwKxBYzyKaF8dZ848xJ2yYJbt2HZNL+ZI7lJRwEXUiTC+ES
         cKcQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6dyRJa5JfLxlpvOKPyFDdYUdJKb1yBFvfcOXRGKu3/FRfJLL961e7jzP7Ajcro9vQvZ6nkB9bmW5/aSd3@lists.linux.dev
X-Gm-Message-State: AOJu0YzFS7TX6p7KQuLr1gAgLAC53VOpYOd96qNBAhc+UoAum1yLZCqf
	T5axlRPGNYOvUXE0nhEpmiozxc5WCgr3QaQNAZ4JKoydsDY2mB0IMcZO
X-Gm-Gg: ATEYQzx6ohiLzbujkSQ9A81DxL/dXKHrPlShEj2KklXgtbsc0DF4oOdDdUx4I7L2nDt
	Su9DMT8D+Zh+d+oCd4JxftjbXBBP22AeT/2nscNnLPi+d4b93NPgjqK6VbpqlSlqe0AG4uUk16c
	liSnI5YVzXlu+fUYPXsllLPO03kmhVpTQGv4bJdn+OntcGPfQYx+5L3A827UFBV4EOV5YhhXaXT
	uq/cImF1JsYCkcpOQpiUjeTypfNUuPtM/LY/z8B4ncepLITh+jnHzZLl2Yu3PVAxCgtmd+FCEm0
	aMMep/mq78GeyBefXT4MjJVXKvmdl48PfYv8UVimursv9jCJDB3I9c61oaFr0kGy9f5V+1sH+PR
	HWuiBSD1V+slbsynhiHu6pLR+PuRzUcetB7+TTE9wYAExZrMZux0mTjG7TByl9jB5bCbswNkYOs
	pCczKk+95rEKDk+oV1mDhOM2xjvqnzxDp5VzopU6BgBEx9
X-Received: by 2002:a17:902:f689:b0:2ad:ba80:df62 with SMTP id d9443c01a7336-2ae2e480d5cmr19907925ad.37.1772176167724;
        Thu, 26 Feb 2026 23:09:27 -0800 (PST)
Received: from Modern-15.. ([2401:4900:854b:40d:f564:fa7d:49b1:5b44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5c1976sm46390785ad.22.2026.02.26.23.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 23:09:27 -0800 (PST)
From: Mathura_Kumar <academic1mathura@gmail.com>
To: lkp@intel.com
Cc: academic1mathura@gmail.com,
	brauner@kernel.org,
	linux-ipc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: [PATCH 2/2] [PATCH-V2] mqueue: introduce new do_mq_timedreceive2() [ mq_peek syscall] for non-destructive       receive and inspection
Date: Fri, 27 Feb 2026 12:38:37 +0530
Message-ID: <20260227070838.201032-2-academic1mathura@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260227070838.201032-1-academic1mathura@gmail.com>
References: <202602270443.k6N6t2u4-lkp@intel.com>
 <20260227070838.201032-1-academic1mathura@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following Two warning issue by build and test on V1:

1) include/linux/syscalls.h:750:42: warning: declaration of 'struct mq_timedreceive2_args'
   will not be visible outside of this function [-Wvisibility]
fix-included the missing header for global visibility

2)  warning: syscall mq_timedreceive2_time64 not implemented [-W#warnings]

fix- This seem false postive warning, script not able to correctly map syscall table
 with handler
in file - ~/linux/arch/x86/entry/syscalls/syscall_32.tbl
473 causing warning due to now explicit handler for name "mq_timedrecive2_time64",because
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

