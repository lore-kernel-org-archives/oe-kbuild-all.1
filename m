Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FCF313520
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 08:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765875400; cv=none; b=GStt9RaSh0pVjE0KyVRV4Fe+DN6M+lrgDtIJptQQyKOSOeRBBWZ14QypH1yJuW7FmWjBKGF43uanHc3hNtMnZpozo34daFS5YHKSRVzyrNZB7scXq3Jm9QNY7yHyDQZoiCmzBkn0W2UWquABv8rnYIvifmE7sH7LDTvoDI9yzNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765875400; c=relaxed/simple;
	bh=8mnpeNIXgxYU85yE+XQ/cl6YHXPcxSwzs4cjuAcRAIY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tVEfaX5plRThyZ2D5I7pD9EtSRkC4iFheJkmfNyy+HPsdyaLRzwvHIHiBCDrekSKcNK9bKxHGtt8VF60cWCMdE5Hz4aw1GTG3xgnCWd+GxSVbId/bHPq7JoRhL45TxZdHWXmLKHWp0Ol/bwgr9B78Ylrs1hhCBGC7A89LEOstzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W0hBN/0O; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W0hBN/0O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765875399; x=1797411399;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8mnpeNIXgxYU85yE+XQ/cl6YHXPcxSwzs4cjuAcRAIY=;
  b=W0hBN/0O/7Gbz5hEnCYm4/YGzBBQSFNhiFv6xrjQ4hHpRbbE9E99IOM/
   IqH3YLf1Gdkf5pU4J5CoGWO1VQtjY0Z/DV/jfh+8YcEySDccKYJEGYHiK
   f3JFBmgKcjMck3wvBcY1uPHRtMGXg4Ox8ssmFGvU0jcBQaingZg1Sl4aa
   IrIfBAD/NSlBB7WVIpey7GB7wYEDXY4E2k4Q3IaOStbpameXvsMtfHKRV
   iYpRxgCTjpCJGCPJAi1ql/YGvpYhZM7hHABknmvhSez8CjuJldFVFti/V
   Xl4Inuz9Q0hHyUz4EJt9w+9KCcvf4mv9NPXt9ktQdLzDNTMQ6FZ2n0b4m
   g==;
X-CSE-ConnectionGUID: VkPGMhAcQgapTX6fs2vPsw==
X-CSE-MsgGUID: BPbM6+N+TCO7zvql+n+mGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="78425108"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="78425108"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 00:56:39 -0800
X-CSE-ConnectionGUID: 7JAAXfP1SiiLEHUAzDQWZg==
X-CSE-MsgGUID: QDZ1+XstSA6UvohhRtrAiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="202374169"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 16 Dec 2025 00:56:38 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVQr6-000000001P8-1svt;
	Tue, 16 Dec 2025 08:56:29 +0000
Date: Tue, 16 Dec 2025 16:56:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-09 0/1]
 arch/arm64/kvm/at.c:177:36: warning: variable 'mmu' set but not used
Message-ID: <202512161654.mccBPPjn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-09
head:   664cf6f08da637d184ba4d36b299b1fdc5ae7dc0
commit: e794049b9acbd6500b77b9ce92a95101091b52d3 [0/1] KVM: arm64: nv: Add basic emulation of AT S1E2{R,W}
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20251216/202512161654.mccBPPjn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512161654.mccBPPjn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512161654.mccBPPjn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/at.c: In function '__kvm_at_s1e2':
>> arch/arm64/kvm/at.c:177:36: warning: variable 'mmu' set but not used [-Wunused-but-set-variable]
     177 |                 struct kvm_s2_mmu *mmu;
         |                                    ^~~


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
