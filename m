Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4AA15F3EF
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Sep 2024 19:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725738935; cv=none; b=Rt0iRCwNvELexTw/pFEpi6d9zH4RBR3bsiR3qM/Q1++hTvQ9yxs3GywDEg9Jtu39sS1L9oLfRfO8fQKDjtPdv69Ke3dCkX5Pmoz/f3dUlKOUIa4UFNVywouQopq7IYlYL7yy6ThHfMXU5i9QgP2lPKVh+7HoHK5Bsb1CTWD6Bqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725738935; c=relaxed/simple;
	bh=twp/pUhMbTo4wZ7ZIYwfYnUEM90DFSvVqxXK5mQSBMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cb2gRQJ2tFZLeuhu8PxrITumjdF++dI53Cdm/IgaT8arXfTfuc37f+XhbHKqzFOCF8Hq7Bf3wJQtozRJehzhw6bARmZ7R/9iVdXKr0L7rKeRH+LsSrOcLx7aA/tepH2iOUFqPQkuFc87NtKzP7MLmv73VkqJboVsdhvutmdk7hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ioIxWxie; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ioIxWxie"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725738934; x=1757274934;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=twp/pUhMbTo4wZ7ZIYwfYnUEM90DFSvVqxXK5mQSBMk=;
  b=ioIxWxieh1mrF6+HmUX/11Tdqoy2MiYIbSjV8mD5Bd/U4sWXDFEOemDg
   ZyZ549ZQ1AkmXdT+EFJaFLRLsdLNG8UrMG6+AbVc1kuFpiWjLXAYjmT1+
   PMj2hMTDWoF/abO+22uG5HoQp2wDRrTA0mxRtbG8IXtl5G1e25+lqHZ+4
   8t+zGBu4WRnTx9+P60KA7KY66hlF2V08Ev927BOIBjQX8p29fTc8sRoE+
   powkFcrQswmepcSN0fAS878tCBvjl7ucv4vGkaKhjg+rj7+k85SNkZw+m
   IJXVtlf7QB3+8ObNJl9DGkcABvOBdsGbRAb7i+w5NcesbUWmQBsr4egOZ
   g==;
X-CSE-ConnectionGUID: U1KpXlnBQuCumTP/COSUbQ==
X-CSE-MsgGUID: 55gNfG67SjWNYPVZvCLC8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="27395232"
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="27395232"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 12:55:33 -0700
X-CSE-ConnectionGUID: p5jsQgcmSMCMAlgmc/meEg==
X-CSE-MsgGUID: 5g5WcrjDTJioDkv/fC7JOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="66996416"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 Sep 2024 12:55:30 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sn1Wp-000Cvj-0z;
	Sat, 07 Sep 2024 19:55:27 +0000
Date: Sun, 8 Sep 2024 03:55:02 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Lameter via B4 Relay <devnull+cl.gentwo.org@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>, Pekka Enberg <penberg@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Joonsoo Kim <iamjoonsoo.kim@lge.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>, Yang Shi <shy828301@gmail.com>,
	Christoph Lameter <cl@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Huang Shijie <shijie@os.amperecomputing.com>,
	"Christoph Lameter (Ampere)" <cl@gentwo.org>
Subject: Re: [PATCH v2] SLUB: Add support for per object memory policies
Message-ID: <202409080304.haF25cFZ-lkp@intel.com>
References: <20240906-strict_numa-v2-1-f104e6de6d1e@gentwo.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906-strict_numa-v2-1-f104e6de6d1e@gentwo.org>

Hi Christoph,

kernel test robot noticed the following build warnings:

[auto build test WARNING on b831f83e40a24f07c8dcba5be408d93beedc820f]

url:    https://github.com/intel-lab-lkp/linux/commits/Christoph-Lameter-via-B4-Relay/SLUB-Add-support-for-per-object-memory-policies/20240907-000537
base:   b831f83e40a24f07c8dcba5be408d93beedc820f
patch link:    https://lore.kernel.org/r/20240906-strict_numa-v2-1-f104e6de6d1e%40gentwo.org
patch subject: [PATCH v2] SLUB: Add support for per object memory policies
config: sparc64-randconfig-r121-20240907 (https://download.01.org/0day-ci/archive/20240908/202409080304.haF25cFZ-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240908/202409080304.haF25cFZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409080304.haF25cFZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/slub.c:222:1: sparse: sparse: symbol 'strict_numa' was not declared. Should it be static?
   mm/slub.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   mm/slub.c:3036:55: sparse: sparse: context imbalance in '__put_partials' - unexpected unlock
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   mm/slub.c:4327:47: sparse: sparse: context imbalance in '__slab_free' - unexpected unlock
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +/strict_numa +222 mm/slub.c

   220	
   221	#ifdef CONFIG_NUMA
 > 222	DEFINE_STATIC_KEY_FALSE(strict_numa);
   223	#endif
   224	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
