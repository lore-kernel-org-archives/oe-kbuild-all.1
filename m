Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDE636AB5B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Mar 2026 18:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774205368; cv=none; b=lkZDVI40FfB1/uANuUB17PW6fMXgXCpTBJKsVt7W6fkGoJ9Es1vW7vdRMisJ9sNaXTmSQqMy2YtfZSZhLiKdBz8xtt9qC3gyMjoIr0zBsVO+Wiqq09V8wGXpA3n5ka4px/Om02kHANipyiDyM01iH/xqzB2TCvW1SkfJM7Ve4Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774205368; c=relaxed/simple;
	bh=1vckE067rrooH+dwUsH8wTlpDCxIWT6EjQbX/qQgntI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MwiIQ1MD5/ZID1APPI0Yv0b465Gfb9nsCL2ZBs5kSX4ZvgSJ14c+IFKfxYg1ZUy+fi7ksNQgKwx7xd4cLAr37r5KWanTyqm+Vf5ipkawtjPKH/4g3qOv+/pTzbZugsHPdYrxEiXhPWVom1YtRphgGIu8KGbZdr34TUOhdcKBA44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hH9DFwRz; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hH9DFwRz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774205366; x=1805741366;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1vckE067rrooH+dwUsH8wTlpDCxIWT6EjQbX/qQgntI=;
  b=hH9DFwRz2s7f7EGfJT4PlpBTkCYp2HjfyouFXBFGorqjFWV/OV6qzDB0
   VJavmCvwoFxYU+2KA6ki8BO5bb1YhYV8akrjlmCXVTORZPNidkFcMxhf1
   tEJnW9wmk2PQM+pFcbtQVXeJ98eYKuZ4ztt7IttyYqN9pyQgHaJIyH/DW
   n4BeBbtfvC4EaOurUerKW46CbkBJZP44fTrzBSq5Iembg9podICx8PgU9
   WwJE57ieBm97x2ZxR3SMPqTqGbFJvi2aiJ17f+p8C6SsedbHeCmWoj2IJ
   vJzahqDXC9OZLYqZHVC0/Q7tA8sQPdy3XWYx9iJyv1Gzj2ArHtfNGuneT
   A==;
X-CSE-ConnectionGUID: 94kiemTUSxCI/D/OkAbxng==
X-CSE-MsgGUID: z+K02sF+TfyAsagvw+YYFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="85842616"
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="85842616"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 11:49:26 -0700
X-CSE-ConnectionGUID: 1KjNonLkR2OwZ4XYNc3Ybw==
X-CSE-MsgGUID: JTTbNXwhSmuxe0ix00J94Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="219504237"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 22 Mar 2026 11:49:21 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4NqT-000000002Wn-00v9;
	Sun, 22 Mar 2026 18:48:27 +0000
Date: Mon, 23 Mar 2026 02:47:23 +0800
From: kernel test robot <lkp@intel.com>
To: Brendan Jackman <jackmanb@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Michal Hocko <mhocko@suse.com>,
	David Rientjes <rientjes@google.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
	Harry Yoo <harry.yoo@oracle.com>, Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@linux-foundation.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Uladzislau Rezki <urezki@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] mm: Change gfp_t to unsigned long
Message-ID: <202603230210.EgOkfYR4-lkp@intel.com>
References: <20260319-gfp64-v1-5-2c73b8d42b7f@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319-gfp64-v1-5-2c73b8d42b7f@google.com>

Hi Brendan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8a30aeb0d1b4e4aaf7f7bae72f20f2ae75385ccb]

url:    https://github.com/intel-lab-lkp/linux/commits/Brendan-Jackman/drm-managed-Use-special-gfp_t-format-specifier/20260322-145930
base:   8a30aeb0d1b4e4aaf7f7bae72f20f2ae75385ccb
patch link:    https://lore.kernel.org/r/20260319-gfp64-v1-5-2c73b8d42b7f%40google.com
patch subject: [PATCH 5/5] mm: Change gfp_t to unsigned long
config: arm-randconfig-r131-20260322 (https://download.01.org/0day-ci/archive/20260323/202603230210.EgOkfYR4-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260323/202603230210.EgOkfYR4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603230210.EgOkfYR4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:31,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/instrumented.h:10,
                    from include/linux/atomic/atomic-instrumented.h:17,
                    from include/linux/atomic.h:82,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/arm/include/asm/bitops.h:245,
                    from include/linux/bitops.h:67,
                    from include/linux/kernel.h:23,
                    from include/linux/clk.h:13,
                    from drivers/usb/gadget/udc/atmel_usba_udc.c:7:
   drivers/usb/gadget/udc/atmel_usba_udc.c: In function 'usba_ep_alloc_request':
>> include/linux/kern_levels.h:5:25: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'gfp_t' {aka 'long unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:134:25: note: in definition of macro 'no_printk'
     134 |                 _printk(fmt, ##__VA_ARGS__);            \
         |                         ^~~
   include/linux/kern_levels.h:15:25: note: in expansion of macro 'KERN_SOH'
      15 | #define KERN_DEBUG      KERN_SOH "7"    /* debug-level messages */
         |                         ^~~~~~~~
   include/linux/printk.h:641:19: note: in expansion of macro 'KERN_DEBUG'
     641 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |                   ^~~~~~~~~~
   drivers/usb/gadget/udc/atmel_usba_udc.h:233:25: note: in expansion of macro 'pr_debug'
     233 |                         pr_debug("udc: " fmt, ## __VA_ARGS__);  \
         |                         ^~~~~~~~
   drivers/usb/gadget/udc/atmel_usba_udc.c:703:9: note: in expansion of macro 'DBG'
     703 |         DBG(DBG_GADGET, "ep_alloc_request: %p, 0x%x\n", _ep, gfp_flags);
         |         ^~~
--
   In file included from include/asm-generic/bug.h:31,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/instrumented.h:10,
                    from include/linux/atomic/atomic-instrumented.h:17,
                    from include/linux/atomic.h:82,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/arm/include/asm/bitops.h:245,
                    from include/linux/bitops.h:67,
                    from include/linux/kernel.h:23,
                    from include/linux/clk.h:13,
                    from atmel_usba_udc.c:7:
   atmel_usba_udc.c: In function 'usba_ep_alloc_request':
>> include/linux/kern_levels.h:5:25: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'gfp_t' {aka 'long unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:134:25: note: in definition of macro 'no_printk'
     134 |                 _printk(fmt, ##__VA_ARGS__);            \
         |                         ^~~
   include/linux/kern_levels.h:15:25: note: in expansion of macro 'KERN_SOH'
      15 | #define KERN_DEBUG      KERN_SOH "7"    /* debug-level messages */
         |                         ^~~~~~~~
   include/linux/printk.h:641:19: note: in expansion of macro 'KERN_DEBUG'
     641 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |                   ^~~~~~~~~~
   atmel_usba_udc.h:233:25: note: in expansion of macro 'pr_debug'
     233 |                         pr_debug("udc: " fmt, ## __VA_ARGS__);  \
         |                         ^~~~~~~~
   atmel_usba_udc.c:703:9: note: in expansion of macro 'DBG'
     703 |         DBG(DBG_GADGET, "ep_alloc_request: %p, 0x%x\n", _ep, gfp_flags);
         |         ^~~


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
