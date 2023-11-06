Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87523A55
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Nov 2023 03:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f4084Ipa"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-5bd0631f630so2925488a12.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 05 Nov 2023 19:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699240690; x=1699845490; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rrlgew2gk8PDDg6nKa3/Skvn3+IsqivqOV1shk2EdlI=;
        b=f4084IpaCsQ2XsMjvWkhJbienDTtFVwepEWhfV/UN0nLjoKBu7eSJI/wbCKn1iNpH8
         TfUmqsKRHhoS5JSxvYfOBYTIbdoSgTCmgihlJadN8HytOpPKDRXEsDQV7/S90VX6KxDx
         gYK1aZAxyLlxoKWM2G6wfGGy9c1hQ+T9kVW+r8ppxIOeZj6PmKzYE3zunGTJqpPev30D
         XtF17ueTcHz4xn9cicY3Txa49TCW1Aab9lKA2FCRjN13G/DUaFt0/FmPxKYjMGMLJVQO
         SnCrsdSsWYz6wpbfBP3uMCNa+D2mKX1EO2DDSVo5sJNJjzTKPvr5CmG50y1KHxmkdlZK
         2lPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699240690; x=1699845490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rrlgew2gk8PDDg6nKa3/Skvn3+IsqivqOV1shk2EdlI=;
        b=WFXwBX58wdB4d5IWvChhVN8QxM4bi1Li57mPchis+13OvNlDJ6OhDIoR+hPFVZmTvp
         zGif2g7+SOb4Ryp+j2Mf4/260B/ElfYpISCy4gEWQJKD+JT2GN9yDmqaoM72Fmsi3yOS
         +t88WNOc+ttM1WawDnnYbPuWxoiVFffjs/s8pkBGNdog2ags9UwKSw7YYZW1SBCSUIFM
         DgMicme2mjLzxsRdHrRjikZQ3hfx2d9kz8EAuWhE0dEio5zNWNIVEAKLrMO+XUf8iuCd
         Sczn2BVCG7sf+D0xsS88a6qZuJpuWneBnRw3E2ZLM1iFcGzGSHxi+9Y4cb6Q6FU4nSh2
         k4Qw==
X-Gm-Message-State: AOJu0Yy4+mef4lRovdu5tTDxOnO1vtyl/nJzCCs92C/n/YAz07ed41MB
	RFBZ84BmGiFmViuzmkWK7gY=
X-Google-Smtp-Source: AGHT+IE05Xu249woaU1bL4qVqak8SD6uvJifofA4I503pNRx8WM4s8Wg4W12izbH6kRNArk83b4WLQ==
X-Received: by 2002:a05:6a20:6a20:b0:17a:eff5:fbbe with SMTP id p32-20020a056a206a2000b0017aeff5fbbemr12943122pzk.8.1699240689600;
        Sun, 05 Nov 2023 19:18:09 -0800 (PST)
Received: from vultr.guest ([2001:19f0:ac00:4238:5400:4ff:fea3:2cd4])
        by smtp.gmail.com with ESMTPSA id ei4-20020a056a0080c400b006c31b4d5e57sm4625624pfb.184.2023.11.05.19.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Nov 2023 19:18:09 -0800 (PST)
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
	Arnd Bergmann <arnd@arndb.de>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>
Subject: [PATCH v2 bpf-next] compiler-gcc: Suppress -Wmissing-prototypes warning for all supported GCC
Date: Mon,  6 Nov 2023 03:18:02 +0000
Message-Id: <20231106031802.4188-1-laoar.shao@gmail.com>
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
for older GCC versions. "#pragma GCC diagnostic push" is supported as
of GCC 4.6, and both "-Wmissing-prototypes" and "-Wmissing-declarations"
are supported for all the GCC versions that we currently support.
Therefore, it is reasonable to suppress these warnings for all supported
GCC versions.

With this adjustment, it's important to note that after implementing
"__diag_ignore_all", it will effectively suppress warnings for all the
supported GCC versions.

In the future, if you wish to suppress warnings that are only supported on
higher GCC versions, it is advisable to explicitly use "__diag_ignore" to
specify the GCC version you are targeting.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202311031651.A7crZEur-lkp@intel.com/
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Cc: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/compiler-gcc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/compiler-gcc.h b/include/linux/compiler-gcc.h
index 7af9e34..80918bd 100644
--- a/include/linux/compiler-gcc.h
+++ b/include/linux/compiler-gcc.h
@@ -138,7 +138,7 @@
 #endif
 
 #define __diag_ignore_all(option, comment) \
-	__diag_GCC(8, ignore, option)
+	__diag(__diag_GCC_ignore option)
 
 /*
  * Prior to 9.1, -Wno-alloc-size-larger-than (and therefore the "alloc_size"
-- 
1.8.3.1

