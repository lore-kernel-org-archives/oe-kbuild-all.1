Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9BE221F00
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 15:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755184669; cv=none; b=fYLgGzzl57TmNBJEnU6IRikNc5wA02v+Md5C0LFORmSYW2Jc6cc3GrYrHhJf3JIvfciwLQbbWmncIjSmHa8ZpSN7xr9ZTb4LlL8DugdEQION/ExAEhXG0d7vhLmfTfeWK8lVsUQHqBVpyyYcBBP2XOqY2ugr8qpDunCtXwaEgvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755184669; c=relaxed/simple;
	bh=jmjUcuY+mZ5MExxgEgpT+Yk5vgoS1xqCCSNBJRJzhKo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KMg7Lh6LzaA4MDpXvFWQPp4ro8Y8xl+cDgJkGyyViziJDsAlrnhTka3PVpqNCgHIVdAzlD9z7s6UmrGd+r+JjTlhlEJBIVAKoU1HxLNZMVInhrl4mBQnBboQLIIBalHBPmWfWQ4VeJuIV8zcpxJcgRTlcJFp6l9vrooHH4QPQoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C2EN8HGS; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C2EN8HGS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755184668; x=1786720668;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jmjUcuY+mZ5MExxgEgpT+Yk5vgoS1xqCCSNBJRJzhKo=;
  b=C2EN8HGStvuSOBoXSLkwr5l8bl1FR8wE5iEF5q4Cf07v8CM1F4BT82bb
   xg18A0OOB8KCKIctTwMBxDO66HsitGzCG6uO1/7mo0rnsHlQRkfdwXvSb
   66PYBgjhDjW2bk4iIDZg0/z/3vWr34Q1z89sIjw0SBgu4tW9FxUUdpiPV
   j43boImDbtUjLt1hQjCWSo5ykX5ffXf6NL8A0t6qxPw2QvWh1bt4ds8x9
   djh281SmOjgieVnbLLi7HfD/Ng+qyYcdskpYh69KlF0SQKaT7znLVVzuU
   1QPdWZMqtKEFowSGJjloag9BCHy8eXGlyvwBtD3mZIIUcTj2hs2Iu0fcC
   Q==;
X-CSE-ConnectionGUID: C5QtROSOT12mFzIMm8zKrA==
X-CSE-MsgGUID: lAvRDSvcQQiaPaVGtgQadQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="68585523"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="68585523"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 08:17:47 -0700
X-CSE-ConnectionGUID: ljIQP7hgTDmfifWRX1QqeA==
X-CSE-MsgGUID: c/bGBEUVRWeS9yCGPoHI/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="167141086"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa009.fm.intel.com with ESMTP; 14 Aug 2025 08:17:46 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umZi3-0000IJ-2z;
	Thu, 14 Aug 2025 15:17:43 +0000
Date: Thu, 14 Aug 2025 17:17:36 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 4/4] arch/arm64/kvm/at.c:177:22:
 warning: variable 'mmu' set but not used
Message-ID: <202508141720.tIKjYk9o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   125206b4d7d6898a8a5d0c088a5ba75114266b81
commit: e794049b9acbd6500b77b9ce92a95101091b52d3 [4/4] KVM: arm64: nv: Add basic emulation of AT S1E2{R,W}
config: arm64-randconfig-2001-20250814 (https://download.01.org/0day-ci/archive/20250814/202508141720.tIKjYk9o-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508141720.tIKjYk9o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508141720.tIKjYk9o-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/at.c: In function '__kvm_at_s1e2':
>> arch/arm64/kvm/at.c:177:22: warning: variable 'mmu' set but not used [-Wunused-but-set-variable]
      struct kvm_s2_mmu *mmu;
                         ^~~


vim +/mmu +177 arch/arm64/kvm/at.c

   167	
   168	void __kvm_at_s1e2(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
   169	{
   170		u64 par;
   171	
   172		/*
   173		 * We've trapped, so everything is live on the CPU. As we will be
   174		 * switching context behind everybody's back, disable interrupts...
   175		 */
   176		scoped_guard(write_lock_irqsave, &vcpu->kvm->mmu_lock) {
 > 177			struct kvm_s2_mmu *mmu;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
