Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAF7374D6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Oct 2023 15:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DfQxdFNH"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5a7fb84f6ceso44914237b3.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Oct 2023 08:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698162993; x=1698767793; darn=lists.linux.dev;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rjxp8+OshJaX6HTmER4qwOWebSL28uCYwZrUG7M1dI0=;
        b=DfQxdFNHcFW8N6bV+xxPSgaND8BRe2u75F58hGlZPCbP49GfoGmox3o/qw6tKCwIVH
         2+H43OEENqc5tB+BeGCQHpTNfWv1jQSflIFzLrHCCU3T3wf8+rfz+JE44X1Tlc6lOzkq
         ZgPdofSabSAApQJ2gs2Wbp95t1kuShP11MSnncMObYypAAp6f0nQ2jXDPsicst3wTX9c
         d1IvzxsJPFNtzITOeq59Xc25vxpk3UtPaHdMrFwgllSHKq0oMj0/db+CHqpmLWZUMJkG
         FgOn9KL1DvuRFt5jy8QZBlnfnbKOlX8VjCDqJX9yhqLA+ZvEbyOCIBYw55sophdqYNaR
         hprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698162993; x=1698767793;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rjxp8+OshJaX6HTmER4qwOWebSL28uCYwZrUG7M1dI0=;
        b=vB9oHmWY9y7vzkuuPuQItPECWPYofQZ2syQVze8DEFH6j4fCryZ/KPCbw5PEGPxN7x
         kzOqcItCQw6v8G2gjkrhdOSuJfwTSuk8yVZn+JyP7mCxFGUemnPsGFE4hTNrrJlqK3ki
         yEfLj8N8rXLeHGajDCOtRTLLPoyVj+zia2/FoojVXPWy5VLXVxoD956oPdoVzGpf8pY0
         TAQSI7zAsMTKci+UOemCvabuwgUN0/OkOhOjmrtsxJrthB4r+ebiI49pccATfXt+Y+Ua
         B87V+jYaYh2xHSURZNm1oL9C4SzSpsqTfdmUmay++pquQmStGqHrlKTBMPKWrLicWK4V
         PATg==
X-Gm-Message-State: AOJu0YwHHYkPJqPFgDrNR8JyTwNdNO6sF1Mpi0Dx9s6ABC60mjk/VYPT
	7XwpXtmpqZj1Mj2Jk0f6XUtM8g==
X-Google-Smtp-Source: AGHT+IGIID9UC2iGLP/x4qScEs2HOJYndJ88tB5gJ7g8+EATt+2WBgfMeGi7aFr2+0fEWl2TZbouVw==
X-Received: by 2002:a0d:fd06:0:b0:5a2:15bc:b32c with SMTP id n6-20020a0dfd06000000b005a215bcb32cmr11823780ywf.42.1698162992889;
        Tue, 24 Oct 2023 08:56:32 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id n192-20020a0dcbc9000000b0059f8120ee4dsm4176106ywd.30.2023.10.24.08.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 08:56:32 -0700 (PDT)
Date: Tue, 24 Oct 2023 08:56:20 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: kernel test robot <lkp@intel.com>
cc: Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
    oe-kbuild-all@lists.linux.dev, 
    Linux Memory Management List <linux-mm@kvack.org>, 
    Johannes Weiner <hannes@cmpxchg.org>, 
    domenico cerasuolo <mimmocerasuolo@gmail.com>, 
    Andi Kleen <ak@linux.intel.com>, 
    Christoph Lameter <cl@linux-foundation.org>, 
    Matthew Wilcox <willy@infradead.org>, 
    Mike Kravetz <mike.kravetz@oracle.com>, 
    David Hildenbrand <david@redhat.com>, 
    Suren Baghdasaryan <surenb@google.com>, Yang Shi <shy828301@gmail.com>, 
    Sidhartha Kumar <sidhartha.kumar@oracle.com>, 
    Vishal Moola <vishal.moola@gmamil.com>, 
    Kefeng Wang <wangkefeng.wang@huawei.com>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tejun Heo <tj@kernel.org>, 
    Mel Gorman <mgorman@suse.de>, Michal Hocko <mhocko@suse.com>, 
    "Huang, Ying" <ying.huang@intel.com>, Nhat Pham <nphamcs@gmail.com>, 
    Yosry Ahmed <yosryahmed@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mempolicy: alloc_pages_mpol() for NUMA policy without
 vma: fix
In-Reply-To: <202310241551.uY40myKo-lkp@intel.com>
Message-ID: <38fa4314-3fc7-4e16-fc9d-2773d36a31b1@google.com>
References: <00dc4f56-e623-7c85-29ea-4211e93063f6@google.com> <202310241551.uY40myKo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 24 Oct 2023, kernel test robot wrote:

> Hi Hugh,
> 
> kernel test robot noticed the following build warnings:
> 
> 
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/UPDATE-20231024-144517/Hugh-Dickins/hugetlbfs-drop-shared-NUMA-mempolicy-pretence/20231003-173301
> base:   the 10th patch of https://lore.kernel.org/r/74e34633-6060-f5e3-aee-7040d43f2e93%40google.com
> patch link:    https://lore.kernel.org/r/00dc4f56-e623-7c85-29ea-4211e93063f6%40google.com
> patch subject: [PATCH] mempolicy: alloc_pages_mpol() for NUMA policy without vma: fix
> config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231024/202310241551.uY40myKo-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231024/202310241551.uY40myKo-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310241551.uY40myKo-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from mm/zswap.c:41:
>    mm/internal.h: In function 'shrinker_debugfs_name_alloc':
>    mm/internal.h:1232:9: warning: function 'shrinker_debugfs_name_alloc' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
>     1232 |         shrinker->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
>          |         ^~~~~~~~
>    mm/zswap.c: In function 'zswap_writeback_entry':
>    mm/zswap.c:1322:16: error: implicit declaration of function 'get_task_policy'; did you mean 'get_vma_policy'? [-Werror=implicit-function-declaration]
>     1322 |         mpol = get_task_policy(current);
>          |                ^~~~~~~~~~~~~~~
>          |                get_vma_policy
> >> mm/zswap.c:1322:14: warning: assignment to 'struct mempolicy *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>     1322 |         mpol = get_task_policy(current);
>          |              ^
>    cc1: some warnings being treated as errors

Gaah, thanks for that, I never built it without CONFIG_NUMA=y:
v2 patch with a get_task_policy() without CONFIG_NUMA coming up,
built this time.

Hugh
