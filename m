Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AD44CB53
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jan 2024 15:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gxYjjmIZ"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2cd8bd6ce1bso6926221fa.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jan 2024 07:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704987362; x=1705592162; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DgwBKAwjRtW9QDojZQwHgd4ZYU+mdZgvbdqMw2nMYco=;
        b=gxYjjmIZJzFXig2TQclK8JSv7/7/Iwf9ZdzISAf1o+/iELmiXTNxgs8Y6602wR0jTM
         jnNt6IvA60pc51ldhHwP2SY9tk9Ol1FMKxNIMy5F3wRXRMzoslzniu2g4jQfNSnC04rM
         VbHmGxY+qCS4RogblPM08XI0lzFsKTKkYrdoFn9wx1vrL3yqMnuEnxEnQEs5mUl1adqh
         k8opjhFDKPnfYSUT6H7jKpBrKRZ9TFyRXDv7vRmIvKQ1HmspBInKtRWtA4RDTt84odJJ
         oqT2V68YDHDRkkbKMugJks4vjq9NGszjaLtWRRdpsBR/EDUjs3PGLCbSYAAKy+1HVBdm
         VHAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704987362; x=1705592162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DgwBKAwjRtW9QDojZQwHgd4ZYU+mdZgvbdqMw2nMYco=;
        b=hrf/QX5fNQgFeL04WnTTfYiCrp0FJCn4ty0smmQw1WZZfgLeW/mbccxp6GMQF0ncvi
         rh7gpEM3YHbIgwXRtjam+o6bgkvv7+lAnWTju+++TSGf0vsva7YW8KIVOdBtEVQS994S
         fGMMh71L3htygyfvoRTUjmiHqfVdkxFCnXfycBY6uq+K10r+vzbfxtZzLO/WifVN+NDB
         aoMthqUpfSRbSnrjz0diB+1xiclKhBwguCrkQuE8VhweaPjMh+vkQ7GZLlvXL8+aAVak
         QdalCC5lNm7uCK2V3iA1K37Cx0sBZi84vCZWPNx2RxnZVTKWFabMLXAVDIvyiEbyRh+u
         LAyg==
X-Gm-Message-State: AOJu0YzVu72/BuQ48pUyWV7NAoZk1WolFc4mJnFyGtDkpbsf03NOt+DL
	8TKmH2Z0d3pbBi+UQvtzyjc=
X-Google-Smtp-Source: AGHT+IEg9jgtKUybswVJoGOabd1DlgtGOYUzbMmzhM01LMIQ0WGgQH/eexXJPlbQPE0X71prjAXa6Q==
X-Received: by 2002:a05:651c:10b7:b0:2cd:8b6d:43b8 with SMTP id k23-20020a05651c10b700b002cd8b6d43b8mr325690ljn.97.1704987361373;
        Thu, 11 Jan 2024 07:36:01 -0800 (PST)
Received: from pc638.lan (host-185-121-47-193.sydskane.nu. [185.121.47.193])
        by smtp.gmail.com with ESMTPSA id r14-20020a2e80ce000000b002ccc0555548sm163150ljg.110.2024.01.11.07.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 07:36:01 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc638.lan>
Date: Thu, 11 Jan 2024 16:35:59 +0100
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Uladzislau Rezki (Sony)" <urezki@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>
Subject: Re: [linux-next:master 12996/13245] WARNING: modpost: vmlinux:
 section mismatch in reference: vmap_init_free_space+0x2 (section:
 .text.unlikely) -> vmlist (section: .init.data)
Message-ID: <ZaAK3yydCi4RxExz@pc638.lan>
References: <202401112056.I41bELL4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202401112056.I41bELL4-lkp@intel.com>

On Thu, Jan 11, 2024 at 08:29:04PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   9e21984d62c56a0f6d1fc6f76b646212cfd7fe88
> commit: 86817057732a9ce9cefdb6f513b6554a55ebbbbb [12996/13245] mm: vmalloc: remove global vmap_area_root rb-tree
> config: um-defconfig (https://download.01.org/0day-ci/archive/20240111/202401112056.I41bELL4-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240111/202401112056.I41bELL4-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202401112056.I41bELL4-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> 
> WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
> >> WARNING: modpost: vmlinux: section mismatch in reference: vmap_init_free_space+0x2 (section: .text.unlikely) -> vmlist (section: .init.data)
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/binfmt_misc.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/isofs/isofs.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/autofs/autofs4.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/block/loop.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/ppp/ppp_generic.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/slip/slip.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/slip/slhc.o
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

I have sent out the patch, but just in case please see it below:

<snip>
From 998f605679409acdfe625c03b36917db70b6773b Mon Sep 17 00:00:00 2001
From: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
Date: Thu, 11 Jan 2024 14:03:53 +0100
Subject: [PATCH 2/2] mm: vmalloc: Mark vmap_init_free_space() with __init tag

The vmap_init_free_space() function is called only once
therefore tag it with __init. Apart of that it access the
"vmlist" variable that is located in ".init.data" section.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202401112056.I41bELL4-lkp@intel.com/
Fixes: 86817057732 ("mm: vmalloc: remove global vmap_area_root rb-tree")
Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
---
 mm/vmalloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 43a6608e1397..257981e37936 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -4834,7 +4834,7 @@ module_init(proc_vmalloc_init);
 
 #endif
 
-static void vmap_init_free_space(void)
+static void __init vmap_init_free_space(void)
 {
 	unsigned long vmap_start = 1;
 	const unsigned long vmap_end = ULONG_MAX;
-- 
2.39.2
<snip>

it can be folded into the: 86817057732 ("mm: vmalloc: remove global vmap_area_root rb-tree")
or applied as a separate patch.

--
Uladzislau Rezki
