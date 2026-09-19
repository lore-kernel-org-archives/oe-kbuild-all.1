Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEE41925BC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Sep 2026 06:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789798149; cv=none; b=j2Czz8Gy5bg7mQfAsgey4X8YcLOziDw1aUy4xzLSoxSxKSJPRxH241nCEX7lwIdPya405aaBcfUEWY06dthIiOHLIbg89Wo/K9iIzeWuLkSjOgmoNr6rL/Z4KnPaLGgd65t/hV2Xr3+2uAMgctCGm4Hl/qe1FUMudqjON35HDj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789798149; c=relaxed/simple;
	bh=4MW0/xubJH+eJGIwqkiB4GCvvr0qN3GeIUgqUZvDzus=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FicmY9ZKbBEVDVCtlnM0qWdldW7xBwJGhje+y2Gz2x2khu3Sq905zY4+kcqiix9yFsT/Gd/SxriOMiLqKNFu2ApTXt4Ugp6ZMWKmao9B8eeFQW0O6GZP1/96jJPR1qgFHxd61415drYGj2ybZrTFsVFnngE6M0HdgVGFqkmyMH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U3sd+Idw; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U3sd+Idw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789798147; x=1821334147;
  h=date:from:to:cc:subject:message-id;
  bh=4MW0/xubJH+eJGIwqkiB4GCvvr0qN3GeIUgqUZvDzus=;
  b=U3sd+IdwlHTM6NhJEP82cfcSAY8tW5cY9NPvEkCx15zWb3tlxD6BBx5p
   FyWcsPNdT9W4hXS5yTNLswIy7cvQSiC1vpq/syFjDOOnCjJUkIIcotaTR
   Bt9Rjy8sVBDnYdw2LX3+VFgdlWU+YxfA2UOWqzrQmupRYloa5Lvd9RMRG
   8iw6/1dYjL6iwujkgT7xKM1bONC2CDeAsIMfzJlvDJa31BK063fO5tov1
   dU1yl9DUVObiNm+gv503X7OQloFOw9TfmF28SNTrHkNKNxcqzNzi9be3k
   idGTyCbrqRwL3RcKfiGC/53NVe34NCSa+niZwnDaqegJm8ewVOnsQ2RNs
   A==;
X-CSE-ConnectionGUID: JQ0BfN3WTZObSGJqYfumhg==
X-CSE-MsgGUID: tUfv4DvvSHyP+nwlIDqVtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="90462532"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="90462532"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 23:09:07 -0700
X-CSE-ConnectionGUID: /v1YYtPnTD+hOpqh3Ywnjg==
X-CSE-MsgGUID: /vXLCdrzQzufidLniB59Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="272054569"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 18 Sep 2026 23:09:05 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7oFy-00000000AhJ-3oZW;
	Sat, 19 Sep 2026 06:09:02 +0000
Date: Sat, 19 Sep 2026 14:08:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 arch/arm64/kvm/hyp/nvhe/trace.c:336:30: sparse: sparse: Using plain integer
 as NULL pointer
Message-ID: <202609191413.SrVW6UPi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   fb15c16e04b24c94825fe17e483d325c4ac239a8
commit: 1e1a0f8ef58c0f6c4b6a091a786db123cf5c4610 [1/1] FROMLIST: KVM: arm64: Add tracing support for the pKVM hyp
config: arm64-randconfig-r1301-20260919 (https://download.01.org/0day-ci/archive/20260919/202609191413.SrVW6UPi-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260919/202609191413.SrVW6UPi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609191413.SrVW6UPi-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm64/kvm/hyp/nvhe/trace.c:37:1: sparse: sparse: symbol '__pcpu_scope_trace_rb' was not declared. Should it be static?
   arch/arm64/kvm/hyp/nvhe/trace.c:38:1: sparse: sparse: symbol 'trace_rb_lock' was not declared. Should it be static?
>> arch/arm64/kvm/hyp/nvhe/trace.c:336:30: sparse: sparse: Using plain integer as NULL pointer

vim +336 arch/arm64/kvm/hyp/nvhe/trace.c

   313	
   314	static void rb_cpu_teardown(struct hyp_rb_per_cpu *cpu_buffer)
   315	{
   316		int i;
   317	
   318		if (!rb_cpu_loaded(cpu_buffer))
   319			return;
   320	
   321		rb_cpu_disable_writing(cpu_buffer);
   322	
   323		hyp_unpin_shared_mem((void *)cpu_buffer->meta,
   324				     (void *)(cpu_buffer->meta) + PAGE_SIZE);
   325	
   326		for (i = 0; i < cpu_buffer->nr_pages; i++) {
   327			struct hyp_buffer_page *bpage = &cpu_buffer->bpages[i];
   328	
   329			if (!bpage->page)
   330				continue;
   331	
   332			hyp_unpin_shared_mem((void *)bpage->page,
   333					     (void *)bpage->page + PAGE_SIZE);
   334		}
   335	
 > 336		cpu_buffer->bpages = 0;
   337	}
   338	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
