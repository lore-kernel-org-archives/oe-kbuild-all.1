Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6B513A25F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Mar 2024 21:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709847391; cv=none; b=GhkGb8Rv5xnhD3yQkjfwUZJS1knEjyONz8+QlIx0zi4ro8BjiVlzayVHGjXGVvtkRfAQJh7ng6lwCHXwrxbDWrFudukbyHymgQOHm5OIdBXIgdNP0ER0h4JY9VxQhzLaGLHUeEFWsFO18WymCbp78O4T1d2SJYi5zrTrIpb8tBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709847391; c=relaxed/simple;
	bh=A4/GGSyUY9SpjRFei/PyvjLsdP7OKn+BMdfD07rFGu4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WaTdBq99NUtxE0S5Wo4HeIlqTemHgXc4AGy30GpmA87BcQKmRnIF3LKow4QwtIadGJVvKDcld3zrXOAKZH7XRMTmjFmB04Q6xd2kfFLCus8UjtZCNkmNUE12C8T5pzTNmQJSqSvtf5gYozgeqskp6GLDqdBmzj329Cuj28XCwdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hgoN+MYu; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hgoN+MYu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709847390; x=1741383390;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A4/GGSyUY9SpjRFei/PyvjLsdP7OKn+BMdfD07rFGu4=;
  b=hgoN+MYu39goiYaMJQSSN7XhZVG6cpvei5L8tWvCJG+wHbhuAHuMB5Uw
   TwKn/LEKP4CzNR1Yr3idqKRe5MYn9QUCKmHrf/Kyv0xQnQDed5aJUSWzV
   1I1MGbNz4QiZ3ul6l+LpxAHNc+xvIFW8ELMAhIwdTnUJlC/rkbHg/D+8M
   6d6z2pkZlTPUYCaeahMDAWSEQ4i5dLJnAXJOtisaIPxfH4WVhLUjDPHZ8
   AgZfALAxWIVJB1bUVHCTOWUuFWWQCgg9n9G45JJFQNXxnnm3xAvWPJOnL
   cJc9Btr8ygGYLtimzl7/u1smzYIrPC1wPoDB/+otagb4fbdnPQFQb3shL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4717309"
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="4717309"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 13:36:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="14912588"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 Mar 2024 13:36:22 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riLPX-0005ir-1w;
	Thu, 07 Mar 2024 21:36:19 +0000
Date: Fri, 8 Mar 2024 05:36:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 154/176]
 arch/arm64/kvm/hyp/nvhe/trace.c:37:1: sparse: sparse: symbol
 '__pcpu_scope_trace_rb' was not declared. Should it be static?
Message-ID: <202403080527.2jI19Oz9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   27f800fdf64c7ba7bee08f851bbc504088206888
commit: 794f874404060e7e14863872950b53e6a7aa9b68 [154/176] ANDROID: KVM: arm64: Add tracing support for the nVHE hyp
config: arm64-randconfig-r122-20240307 (https://download.01.org/0day-ci/archive/20240308/202403080527.2jI19Oz9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240308/202403080527.2jI19Oz9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403080527.2jI19Oz9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hyp/nvhe/trace.c:37:1: sparse: sparse: symbol '__pcpu_scope_trace_rb' was not declared. Should it be static?
   arch/arm64/kvm/hyp/nvhe/trace.c:38:1: sparse: sparse: symbol 'trace_rb_lock' was not declared. Should it be static?
   arch/arm64/kvm/hyp/nvhe/trace.c:174:15: sparse: sparse: symbol 'rb_event_size' was not declared. Should it be static?
>> arch/arm64/kvm/hyp/nvhe/trace.c:333:30: sparse: sparse: Using plain integer as NULL pointer

vim +/__pcpu_scope_trace_rb +37 arch/arm64/kvm/hyp/nvhe/trace.c

    35	
    36	static struct hyp_buffer_pages_backing hyp_buffer_pages_backing;
  > 37	DEFINE_PER_CPU(struct hyp_rb_per_cpu, trace_rb);
    38	DEFINE_HYP_SPINLOCK(trace_rb_lock);
    39	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
