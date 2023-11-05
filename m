Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3F8A50
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Nov 2023 06:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MIoAth6Q"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-41eb4210383so4006491cf.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 04 Nov 2023 23:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699165370; x=1699770170; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=05LHD2svU7RVutSA6R3k1PwtdBSTugRDACEJuPt/PNw=;
        b=MIoAth6Q3zrpVvISeCtZ2ombFT6PdNiUGoAm62/LzAHBULFIm3lZIWjWOlSyaw4OQY
         CzEQ1OYhw5mt3F3iBukMsueYKdUdWrhPrX1H4qzHaxTbnzdSylpkTuW46/baV+tGDJ03
         x6gYgQNvBPUf776nmVRErfcHP0yJZBkLMf9RplMw580K36915FKADK7igwQgdaGyblOL
         RadiI4ApvV0EpH9iM9W8SLFSzeHKhgyrrrBK8nGN42GoTC3hM8ZJJN3ZsORNU5cee0f2
         Xz4tyzC20lvuZOwKtomAI4u67SgT7+ZYxCMzo4YFC8qBHyYDOG7Vt4grN13h4/AC2YdM
         OqHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699165370; x=1699770170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=05LHD2svU7RVutSA6R3k1PwtdBSTugRDACEJuPt/PNw=;
        b=nEinK/CC+4m/r6axf3d7u9dPYvifdpklq/881wpvq4899RyuIYkIjYGI84F56XqFEE
         tRkNWnYLkWVqK/aXuFx5trE9YMfqLRhoMkW3NaLPrhyNzrsfHt8gtibAIk0V/cNs4C8W
         B7d1C0df3lccLBKN/lw6XptX4ZKqQQ8obNxW24aaitd/vGTPlRdM76NGyMB+GPe1nQyF
         S0Lgb9QiiWgTxBk07O72mlgSiJlVPTP133GIhPM7Z+U+IteH7psBfCUBd3gOVk5iTQZH
         78hFJgAdBEz1Rjs+jchXsLbj/a+zaEsi+aIP8bHdXoTKzGXsbb5CtNNFJGzkJ/rpSY9H
         Sq+A==
X-Gm-Message-State: AOJu0YycrrWEeBZTtEIYhGoHoILWgjyonjGLO4cb4IAs1vaOwykyHurx
	d7ASJegTUEW9K2cpjn8hjLY=
X-Google-Smtp-Source: AGHT+IEb+mQl9K4ytOXTBeeQ7FXm4+5TRkMuigqPP/f0AkFp2GoT1+qCLAvzVR4FSeqcu8X+V/X9uA==
X-Received: by 2002:ac8:5bc6:0:b0:40f:f9c8:1b98 with SMTP id b6-20020ac85bc6000000b0040ff9c81b98mr30677451qtb.10.1699165370430;
        Sat, 04 Nov 2023 23:22:50 -0700 (PDT)
Received: from vultr.guest ([2001:19f0:ac00:4737:5400:4ff:fea2:f4b4])
        by smtp.gmail.com with ESMTPSA id g20-20020ac84694000000b00419ab6ffedasm2248098qto.29.2023.11.04.23.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Nov 2023 23:22:50 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: lkp@intel.com
Cc: andrii@kernel.org,
	ast@kernel.org,
	bpf@vger.kernel.org,
	cgroups@vger.kernel.org,
	daniel@iogearbox.net,
	hannes@cmpxchg.org,
	haoluo@google.com,
	john.fastabend@gmail.com,
	jolsa@kernel.org,
	kpsingh@kernel.org,
	laoar.shao@gmail.com,
	lizefan.x@bytedance.com,
	longman@redhat.com,
	martin.lau@linux.dev,
	mkoutny@suse.com,
	oe-kbuild-all@lists.linux.dev,
	oliver.sang@intel.com,
	sdf@google.com,
	sinquersw@gmail.com,
	song@kernel.org,
	tj@kernel.org,
	yonghong.song@linux.dev,
	yosryahmed@google.com,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH bpf-next] compiler-gcc: Ignore -Wmissing-prototypes warning for older GCC
Date: Sun,  5 Nov 2023 06:22:27 +0000
Message-Id: <20231105062227.4190-1-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <202311031651.A7crZEur-lkp@intel.com>
References: <202311031651.A7crZEur-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel supports a minimum GCC version of 5.1.0 for building. However,
the "__diag_ignore_all" directive only suppresses the
"-Wmissing-prototypes" warning for GCC versions >= 8.0.0. As a result, when
building the kernel with older GCC versions, warnings may be triggered. The
example below illustrates the warnings reported by the kernel test robot
using GCC 7.5.0:

  compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
  All warnings (new ones prefixed by >>):

   kernel/bpf/helpers.c:1893:19: warning: no previous prototype for 'bpf_obj_new_impl' [-Wmissing-prototypes]
    __bpf_kfunc void *bpf_obj_new_impl(u64 local_type_id__k, void *meta__ign)
                      ^~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:1907:19: warning: no previous prototype for 'bpf_percpu_obj_new_impl' [-Wmissing-prototypes]
    __bpf_kfunc void *bpf_percpu_obj_new_impl(u64 local_type_id__k, void *meta__ign)
   [...]

To address this, we should also suppress the "-Wmissing-prototypes" warning
for older GCC versions. Since "#pragma GCC diagnostic push" is supported as
of GCC 4.6, it is acceptable to ignore these warnings for GCC >= 5.1.0.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202311031651.A7crZEur-lkp@intel.com/
Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Cc: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/compiler-gcc.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/compiler-gcc.h b/include/linux/compiler-gcc.h
index 7af9e34..a5cfcad 100644
--- a/include/linux/compiler-gcc.h
+++ b/include/linux/compiler-gcc.h
@@ -131,14 +131,14 @@
 #define __diag_str(s)		__diag_str1(s)
 #define __diag(s)		_Pragma(__diag_str(GCC diagnostic s))
 
-#if GCC_VERSION >= 80000
-#define __diag_GCC_8(s)		__diag(s)
+#if GCC_VERSION >= 50100
+#define __diag_GCC_5(s)		__diag(s)
 #else
-#define __diag_GCC_8(s)
+#define __diag_GCC_5(s)
 #endif
 
 #define __diag_ignore_all(option, comment) \
-	__diag_GCC(8, ignore, option)
+	__diag_GCC(5, ignore, option)
 
 /*
  * Prior to 9.1, -Wno-alloc-size-larger-than (and therefore the "alloc_size"
-- 
1.8.3.1

