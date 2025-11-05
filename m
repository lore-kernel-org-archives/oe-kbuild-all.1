Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5951D8E1A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Nov 2025 04:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762316455; cv=none; b=kZ2rRbnubYTFrGcahBIfhQuJg0fxR+i9L/BkvaRm0Ie3OwdJvL47h5g8z1Tg56buKet92Ymu0G7eGqluGSniMh/ejOMF0jlVNVyFBmc+9R8lojRjwHnn0m5dQZEgeTxRArVMCPPxSsXnBXMh+tZI/kRVWLUFvBgQRz/ASJOQzF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762316455; c=relaxed/simple;
	bh=TZ/iCpQhqI2k8DgkkaFJpNQayv4Ws2h8B/Abzdxr+K8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d7EBD2R3wd7V38AICl8pwI3O5noQZbxpiGwMcuYDQCvT+QvDyvH72JWFptQyhLGXUMLj8Fd+rvlI2cqTolbe10ED87Hrqd7z3GBrpFrnqJJu9cLMrJDpYcRX8rjusqAyUM0Wpk0NgYhyoJt00CFhD8Gwxr4Lb9uF7U+FoYAbMIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C/CKDBPT; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C/CKDBPT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762316453; x=1793852453;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TZ/iCpQhqI2k8DgkkaFJpNQayv4Ws2h8B/Abzdxr+K8=;
  b=C/CKDBPTH/M/CAaF2PyhdMdobAuc3PaI0yPBQ+nhsmBwcR7082gfm2n1
   kTaS2mzjk4A4BKdo5iTnQGAPt+9I8eSWl+FQhAaJOL3V8pAySfydX4bhK
   Mwk8JhD5fJHBnRsIHBfl3VNk2lqdLYfu8rxfxUg0wicRNR0Z3qUNYq9Rj
   RMn1M4iDTNefh1KbahwjfB0ZwtrsgcuALT4eNNjAflWxq3n4OY578O+Jz
   pHcgqinRbFBFwZO1p9lcq2Qr3BhJE20Hv3dCVPzQyKhYTyag7fP/0NaJW
   9PoH1toSUvTnbLqfZ/rH/B3+de9ON73DCnE33fAwnKJuRxId4zi3F97a2
   g==;
X-CSE-ConnectionGUID: 0Fo5JxXWT3yOMvYe1f2GBQ==
X-CSE-MsgGUID: 1XXDGGEMTUi5zPiwcLPKTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64454806"
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; 
   d="scan'208";a="64454806"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 20:20:52 -0800
X-CSE-ConnectionGUID: QYLtRUMnQEeRSfVzBGxQ5A==
X-CSE-MsgGUID: FzSmdCbGRSq8R4gHd8Yy8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; 
   d="scan'208";a="191698524"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 04 Nov 2025 20:20:48 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGV0e-000S9y-33;
	Wed, 05 Nov 2025 04:20:38 +0000
Date: Wed, 5 Nov 2025 12:20:07 +0800
From: kernel test robot <lkp@intel.com>
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>, Marco Elver <elver@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	m.wieczorretman@pm.me, stable@vger.kernel.org,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Baoquan He <bhe@redhat.com>, kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] kasan: Unpoison pcpu chunks with base address tag
Message-ID: <202511051219.fmeaqcaq-lkp@intel.com>
References: <821677dd824d003cc5b7a77891db4723e23518ea.1762267022.git.m.wieczorretman@pm.me>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <821677dd824d003cc5b7a77891db4723e23518ea.1762267022.git.m.wieczorretman@pm.me>

Hi Maciej,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.18-rc4 next-20251104]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maciej-Wieczor-Retman/kasan-Unpoison-pcpu-chunks-with-base-address-tag/20251104-225204
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/821677dd824d003cc5b7a77891db4723e23518ea.1762267022.git.m.wieczorretman%40pm.me
patch subject: [PATCH v1 1/2] kasan: Unpoison pcpu chunks with base address tag
config: x86_64-buildonly-randconfig-003-20251105 (https://download.01.org/0day-ci/archive/20251105/202511051219.fmeaqcaq-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511051219.fmeaqcaq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511051219.fmeaqcaq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/kasan/common.c:584:6: warning: no previous prototype for '__kasan_unpoison_vmap_areas' [-Wmissing-prototypes]
     584 | void __kasan_unpoison_vmap_areas(struct vm_struct **vms, int nr_vms)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/__kasan_unpoison_vmap_areas +584 mm/kasan/common.c

   583	
 > 584	void __kasan_unpoison_vmap_areas(struct vm_struct **vms, int nr_vms)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
