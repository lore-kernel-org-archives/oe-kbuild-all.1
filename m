Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEE233858B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 05:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775798949; cv=none; b=fkqalIPKjXOTAmtqxgPowURsgaDmnTYScK7v9mfI+GoBHrsZb+1FYWwyzepxx5Do4ezHL4toE5BFc/jDMUWFhY79pGgriMpOZuL9Y2iYjianSJzLBrOebar7jEEowUFFvKG35eIcqGY1JlaPj3dzh9wTAX3jnFsduCVThuyLIPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775798949; c=relaxed/simple;
	bh=5t3o1laplMxoGxpFqUGNNOIw88eBHCAi4meSqvjd9uY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gZZt4tv4+DLXoasc07sWS6aeGwQ45ezTnvMOTK7sKKvLm1qtKwQhIK9tXEn/pqX6E+568lIshPXeeu2OkRsANywJVEiZY2DJqDgba7Jx7XOXsWPCjJ1GbkIhzW9CvNSv3KTNA1DDdlq47Y1OUVsJfNhbBBpjV9LXNXDieBU6y9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CiJBrADz; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CiJBrADz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775798948; x=1807334948;
  h=date:from:to:cc:subject:message-id;
  bh=5t3o1laplMxoGxpFqUGNNOIw88eBHCAi4meSqvjd9uY=;
  b=CiJBrADzcC9mU2BX6ry/Kd2ej89O03hxF7wDAosTP6wxWnNYY0mIT5kr
   WWV0RSP2jf0enxX2xnfrFw1we4hqsUVdqVVLzSZxiqgyPMRSQUsbd8PXA
   7U83B+BssHp7oPKoJC5znAsQof+GOJfjtfKflxXubo6Q2MgRplbX/NtW9
   Co1GR5XpADaysxWZHlq32YJgZoDjbiNLYB5wJxkP81CTBGZ8mZytyHXHk
   T0bxy2SWbp+HNfpTiWnN05soZbGiEvY8sQXz3m/BxJJ3YdU4gCPr/9cxt
   HhpLrCCMi3TQZIHjniazbcifYaK38+wBnErbouxEKJD0kVM19Mi06nMYN
   w==;
X-CSE-ConnectionGUID: NDyxLl2uQRe2tP5IrLXe5A==
X-CSE-MsgGUID: /FdUFrsqRwqeRt2YOBIU/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76833431"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="76833431"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 22:29:07 -0700
X-CSE-ConnectionGUID: J6n1nZdbTTGzqiuaSffvIA==
X-CSE-MsgGUID: NMEJDGY8TwqqQi0E56kEFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="266960655"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 09 Apr 2026 22:29:05 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wB4QQ-000000003HR-2bga;
	Fri, 10 Apr 2026 05:29:02 +0000
Date: Fri, 10 Apr 2026 13:28:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1]
 arch/arm64/kvm/hyp/nvhe/trace.c:38:1: sparse: sparse: symbol 'trace_rb_lock'
 was not declared. Should it be static?
Message-ID: <202604101317.AS5CyQoQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   f1cd8aed7c18f5ccb44ad6750d632a0f651752f5
commit: 9fca73b21dda02bad2a97f8911768923f03ce302 [1/1] FROMLIST: KVM: arm64: Add tracing support for the pKVM hyp
config: arm64-randconfig-r133-20260408 (https://download.01.org/0day-ci/archive/20260410/202604101317.AS5CyQoQ-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c80443cd37b2e2788cba67ffa180a6331e5f0791)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604101317.AS5CyQoQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604101317.AS5CyQoQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hyp/nvhe/trace.c:38:1: sparse: sparse: symbol 'trace_rb_lock' was not declared. Should it be static?
   arch/arm64/kvm/hyp/nvhe/trace.c:336:30: sparse: sparse: Using plain integer as NULL pointer

vim +/trace_rb_lock +38 arch/arm64/kvm/hyp/nvhe/trace.c

    35	
    36	static struct hyp_buffer_pages_backing hyp_buffer_pages_backing;
  > 37	DEFINE_PER_CPU(struct hyp_rb_per_cpu, trace_rb);
  > 38	DEFINE_HYP_SPINLOCK(trace_rb_lock);
    39	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
