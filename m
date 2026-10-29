Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793296828;
	b=DQCkWZ2L2lOWiO90EGmbGgYDCr6DXRfadnr+nrwXRXZmJu83Oevz4Ft4fapfzZIp19/m
	 SwNeASwqQI9Nstxn3VVrxz8s8SJnL/zFZEYfVSBKeM0bwdDndNyyiyZiQ5mmeCF781wOC
	 UjpmKLkpMwIORWaNYEEmQ2bg/25sCw7pijUvh8Qb8SkhP5ZEmyzto1C+Afh9gQ5oPlOJL
	 vLPyRplhNXli9LdIYJE1pa/ObY1tsH3yHbCcfy3PmWuZOZhTRR5gpVa9DcGvd8GyODM7L
	 Yx3WO6DG8gT4IrAheIibsHAyB27iqM/bykbo4fZdQd5UHfPW8vSgyWo/0QsdqejuQUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793296828;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=t52gy3vHSFBr6QXQ9gk57MWrgRnN/J0jANRozkmoV/o=;
	b=HDQya+wbwVTzuBGCLojoWgwJhX2Ad4A/Z239wHLVCWW9TMKKdoeXDtqnvRhi4d6POdvr
	 z6PuxeNdeuYL/CmGRGxrtfwUTrnL6WqSYcfoTEwpXGiueOLGsC9DzLkQvb0JSTt9RTXOc
	 utacz95Cpi9o1ttvNgINueo6CxYOuru8nvZyei0Rk1VeVImJzVEsZCqn42QVdl6sbaTMD
	 cUBdGrgJzUyW6yVHpjeqVe5bIfX05ganNSANnG2evLycZeoco2U2vdgPaHg0PbGtC1/BH
	 HwT2+Q3/p0sUssGuJRD6YgbXw0/kp6EHB+OQKJQfI/fvORbPNsp6qX664Mcsza99fRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hRBeK1ih;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8476606A31C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 18:00:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8476606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hRBeK1ih
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793296827; x=1824832827;
  h=date:from:to:cc:subject:message-id;
  bh=+6JuF6HElgY2dv3JPjkrbIwJRYOaiKVSa20fEtloBeE=;
  b=hRBeK1ihwQFUTyFytRRzn8oxge5e7f5PxMzEVdt9GaUj1iNadTtIvN5q
   rqol/i4qRbxRucWotvrRDkLQIiiJZ6a85qgEVKVXY0rJll5slvccVpM09
   uTyhfChVcsaOFHVEMYMnw3oVOxdv+283AGIffA0CbkeBqQx7tOwrdNhDW
   Y1xUGdeJBBlg54iNXK37vszVSXZR79zbYkDfz2VYO1HtjjhbyDEs5dcpE
   /mI6mVXFdkGaAYMiyCqdIjEWfnW2S0hXgBGmmb7Jl4Q98g1ELDvJYRRU5
   46Q00ildqcSIc3oE3ZxOOwmdSWm4SMeH7l93sJI1z5XTfFTXvOzi23/mt
   w==;
X-CSE-ConnectionGUID: iWeEp/qhRJ6yLCRfNnFBNg==
X-CSE-MsgGUID: xPG0eATLTF60avSLy5P6Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2048804"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2048804"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 11:00:26 -0700
X-CSE-ConnectionGUID: 67yvzi/IQOikkKN1krz8bw==
X-CSE-MsgGUID: JmDhtpAjRvqW4NOLjb557Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5580867"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 29 Oct 2026 11:00:15 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMUQ9-00000000agn-1Zv4;
	Thu, 29 Oct 2026 18:00:13 +0000
Date: Fri, 30 Oct 2026 02:00:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-p3s 2/2]
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:77:23: warning: no previous prototype
 for '__get_vcpu'
Message-ID: <202610300107.Sd4m7uGy-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Mostafa,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-p3s
head:   606d03f6372c0cd085fc0d154cbfc17c298058f2
commit: 41148bbeb73900a1fe8c5d7c64bbec5207d84c06 [2/2] ANDROID: KVM: arm64: iommu: Make allocation guest aware
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20261030/202610300107.Sd4m7uGy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261030/202610300107.Sd4m7uGy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610300107.Sd4m7uGy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:77:23: warning: no previous prototype for '__get_vcpu' [-Wmissing-prototypes]
      77 | struct pkvm_hyp_vcpu *__get_vcpu(void)
         |                       ^~~~~~~~~~


vim +/__get_vcpu +77 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c

    75	
    76	/* Return current vcpu or NULL for host. */
  > 77	struct pkvm_hyp_vcpu *__get_vcpu(void)
    78	{
    79		struct kvm_vcpu *vcpu = this_cpu_ptr(&kvm_host_data)->host_ctxt.__hyp_running_vcpu;
    80	
    81		if (vcpu)
    82			return container_of(vcpu, struct pkvm_hyp_vcpu, vcpu);
    83		return NULL;
    84	}
    85	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
