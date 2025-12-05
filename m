Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C093559D5
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Dec 2025 17:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764955510; cv=none; b=tw77EDqv9gPg8E99VWvTzCfLi/WXa7/ReH/BbOZl8/J349881/lI8QUFQKgiAWlMxNemHc4gMXAH48YoPLZ+MPW5bvtO98ir8C7wgbYgPfE8616QbZRzOFxCiyqzksQfYtk+BqEOWW7YYOIeGZUbJfOQ4hr5ihNXdRK/wGYLWDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764955510; c=relaxed/simple;
	bh=M7E1KR+C18N7Z11ZXXSVBInGwCHW6WtbBQU4ejWtKyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pC8bzjyN2pg6iCbo20ie0rAN9syL1l2rMnhg7+6kiZr5GAGxgoI37k0Y34NDz+IJTq0p7+LDUpUlVNyhlwGsj4ul7Y3tiCc3HZLYxSZc/0v2tE0ejUBEJ8Vd0Fr45y0hZOG2DQUWpOCXvbRYtHWQ8kaNbICj96bJ6UamkPb0JUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WgJOylZJ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WgJOylZJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764955508; x=1796491508;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M7E1KR+C18N7Z11ZXXSVBInGwCHW6WtbBQU4ejWtKyQ=;
  b=WgJOylZJ91tjyEqEbRIFL0KjfIBoSKezJBsThyg2D96y33xbsMNb+P05
   kdON5tCFmzDLBxWxSwt9IVSu4wKkvxW1NYxPcwXtqKajKlAndFrswilyO
   1y1gEa5gPbs17bgmTL7BM0MSXQseX76M0ME/yOBf57E1ZWKv1OGp2XC/x
   t1G5wog/NwUkDv5H+x565IZxFl7vWmyUA1r1TZXiQyxaOkNwRd/YdowBD
   psvYWPRcrlNHDrjPeXMP3ou5ZMu5+NHjiQs8wNU2A2/glZhve+KAB4pvj
   hyB3+DVlluSnwiIId7UL2Tok9iBXeI6B8onEWzWNs+wRq9dnOz3UQys0d
   g==;
X-CSE-ConnectionGUID: 6g+dBhOtRfisznErJHz0pw==
X-CSE-MsgGUID: AycacvHlQIuezlGVhYy97g==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="66928619"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="66928619"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 09:25:05 -0800
X-CSE-ConnectionGUID: Ct6/ARE3Sz+wr+/cVJEgww==
X-CSE-MsgGUID: m41F9DBtQGarcunPY8YNLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="225995106"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Dec 2025 09:25:04 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRZYC-00000000FHB-3MUB;
	Fri, 05 Dec 2025 17:25:00 +0000
Date: Sat, 6 Dec 2025 01:24:54 +0800
From: kernel test robot <lkp@intel.com>
To: Takahiro Itazuri <itazur@amazon.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] KVM: pfncache: Use vmap() for guest_memfd pages
 without direct map
Message-ID: <202512060148.9cl5Q6oy-lkp@intel.com>
References: <20251203144159.6131-3-itazur@amazon.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203144159.6131-3-itazur@amazon.com>

Hi Takahiro,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on kvm/queue]
[also build test WARNING on kvm/next mst-vhost/linux-next linus/master v6.18 next-20251205]
[cannot apply to kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Takahiro-Itazuri/KVM-pfncache-Use-kvm_gmem_get_pfn-for-guest_memfd-backed-memslots/20251203-224344
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20251203144159.6131-3-itazur%40amazon.com
patch subject: [RFC PATCH 2/2] KVM: pfncache: Use vmap() for guest_memfd pages without direct map
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251206/202512060148.9cl5Q6oy-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512060148.9cl5Q6oy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512060148.9cl5Q6oy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kvm/../../../virt/kvm/pfncache.c:14:
   include/linux/kvm_host.h: In function 'kvm_slot_no_direct_map':
   include/linux/kvm_host.h:634:16: error: implicit declaration of function 'mapping_no_direct_map' [-Wimplicit-function-declaration]
     634 |                mapping_no_direct_map(slot->gmem.file->f_mapping);
         |                ^~~~~~~~~~~~~~~~~~~~~
   include/linux/kvm_host.h:634:42: error: 'const struct kvm_memory_slot' has no member named 'gmem'
     634 |                mapping_no_direct_map(slot->gmem.file->f_mapping);
         |                                          ^~
>> include/linux/kvm_host.h:635:1: warning: control reaches end of non-void function [-Wreturn-type]
     635 | }
         | ^


vim +635 include/linux/kvm_host.h

   630	
   631	static inline bool kvm_slot_no_direct_map(const struct kvm_memory_slot *slot)
   632	{
   633		return slot && kvm_slot_has_gmem(slot) &&
   634		       mapping_no_direct_map(slot->gmem.file->f_mapping);
 > 635	}
   636	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
