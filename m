Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C034A1A6817
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Aug 2026 17:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786815293; cv=none; b=ONFkfQl2Zxj1hAj0eYpPKHS6OcKLsHcwYQ68Kn+gDHSMMFbmbF29DxOvW593SKUoqj6FHIuo72PuuHxqkx0HSaHg90KbslS+ix9KqPv143w4IO21W4A7T1EaSUpg/306GWDOdRcEcD6205exb3/hE9x+k/9v6hUjdRjIEsti434=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786815293; c=relaxed/simple;
	bh=IQh9WRaZnaX2piL4uAkhykPdKblHHMdzCJ3ZJSrpK1Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lDBibdxPlipkIAwMcGX0g/msHu+wlUA20QCnyxVThpCkCcYF/72uiIt11E4RcK9ymcBWuAXdZ9Krk32t79ywdzfw7GFP4y/dXnMOSA0dWzP3NMN7K7sOUyWFhTDpthk/YsNlTmef/ILWGeYw+DtfC1uNJcJscazJTKChe9VbJXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cjv+g5IU; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cjv+g5IU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786815291; x=1818351291;
  h=date:from:to:cc:subject:message-id;
  bh=IQh9WRaZnaX2piL4uAkhykPdKblHHMdzCJ3ZJSrpK1Q=;
  b=Cjv+g5IUIPhwmAJ4W6itbs6EY5PpFkwHH0vhCK76+b0uNQa9rWySqSDq
   OMcSsplDEeJNI/SwnOHd3Zogy6RMlTA21wvS/5Au2jK28QCg8BI/2qD6d
   cbT78wDZ00qLnuhgK+RTGChxpBWVCkT86cKFriqR8xnpZpM9mgxQNsG81
   yOOMyQa04r0Li1udbbdJYt7uM9HrB0MXuR0a8MdJp2kSjfNBo+8aXilKX
   u1yizFCM62CNSU89+c0U24nmYbS+woTAJxtZFQD2ZIce3iBMVAPwfy5ke
   7FAvUBEfjdPU8tFIph8WHpYFxV3nEVhkiZv/APkh0BuxoCWZ2q7jfe8Hz
   w==;
X-CSE-ConnectionGUID: j7GRIfwWScaBfcrzgc8QlA==
X-CSE-MsgGUID: m9soXrcETnWvvRPhxOsTxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="86477169"
X-IronPort-AV: E=Sophos;i="6.25,225,1779174000"; 
   d="scan'208";a="86477169"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 10:34:50 -0700
X-CSE-ConnectionGUID: tri+4oa8TdyipWe8LuVGOQ==
X-CSE-MsgGUID: N+e3fRn7RQKIZOOqEeG0uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,225,1779174000"; 
   d="scan'208";a="260279594"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 15 Aug 2026 10:34:48 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvIHO-00000000cOY-1kqX;
	Sat, 15 Aug 2026 17:34:46 +0000
Date: Sun, 16 Aug 2026 01:29:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2026-06 3/3]
 arch/arm64/kvm/hyp/nvhe/trace.c:37:1: sparse: sparse: symbol
 '__pcpu_scope_trace_rb' was not declared. Should it be static?
Message-ID: <202608160021.IJ6JMOek-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-2026-06
head:   5f02ea3e9448e9545ae85eb4f11b4ea8f58b94bf
commit: 1e1a0f8ef58c0f6c4b6a091a786db123cf5c4610 [3/3] FROMLIST: KVM: arm64: Add tracing support for the pKVM hyp
config: arm64-randconfig-r134-20260815 (https://download.01.org/0day-ci/archive/20260816/202608160021.IJ6JMOek-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608160021.IJ6JMOek-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608160021.IJ6JMOek-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hyp/nvhe/trace.c:37:1: sparse: sparse: symbol '__pcpu_scope_trace_rb' was not declared. Should it be static?
>> arch/arm64/kvm/hyp/nvhe/trace.c:38:1: sparse: sparse: symbol 'trace_rb_lock' was not declared. Should it be static?
   arch/arm64/kvm/hyp/nvhe/trace.c:336:30: sparse: sparse: Using plain integer as NULL pointer

vim +/__pcpu_scope_trace_rb +37 arch/arm64/kvm/hyp/nvhe/trace.c

    35	
    36	static struct hyp_buffer_pages_backing hyp_buffer_pages_backing;
  > 37	DEFINE_PER_CPU(struct hyp_rb_per_cpu, trace_rb);
  > 38	DEFINE_HYP_SPINLOCK(trace_rb_lock);
    39	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
