Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D14149C6F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 07:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774855717; cv=none; b=Yu41mlCG7JwcrWRHtjavAjO05m84Hi2wTrh8ImhUknkpwHgOitRcjuOogToEbnemTMpUGGSiBug0K6ZfiEwPxvYgZ7UJDhZ8DeNNfsjuamVZi8jnW/U8pwxaXKUZiG6VzAOcGYsn9/qm6/gML82RfTsUDIW7qcNPEV9m79FfbG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774855717; c=relaxed/simple;
	bh=g4v3oN/SXxN6ilSD5p437lxnlLVRbAdq7u8tib05dTY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jy+2ne9TX8tnHXJfLzNCgf8S45aMT99jvG9Mqx7JMmwKruF32JSiGyUUKUHeHz5hg0FyJ0gQySfWKV3e7NnMSFpj4cZ3kbDeKAAe/b7o+nkuu3t+h4nhKD/n61eBnuASeKkio1fu7Dry3ieZmd3kWenrOf0802i1sjdsWF7b7gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wt3r5K41; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wt3r5K41"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774855716; x=1806391716;
  h=date:from:to:cc:subject:message-id;
  bh=g4v3oN/SXxN6ilSD5p437lxnlLVRbAdq7u8tib05dTY=;
  b=Wt3r5K41Zay5DxrhTMaarWDZmCyoccX8QHa8TZIFPtRziGzDNjNPTLXx
   /KCVAC8LcBNq5DcXmKajIZBOm2cYl4r7peV001i1B912g07kqacLC0wue
   /8Fd60152yDxxGNBX88YDLcmO4afhVEvglSEPdfw7bvqbfiK+gfotvnee
   VmbLBxPkHjS5fbStgQpYyp0QqKDRpwpVCGWX/pRchwzjmYwaZ58Zaf0w1
   6PPLUlayvGkv4qWPMu8GxMIQp9OQI0DR0ntY/4tsexcZsof/0cFamxfly
   NPDOTQQmh+X2BchcObIvIbKMJpExUp2tT2cRjUdm4GBUDBh9grOFrZHjW
   g==;
X-CSE-ConnectionGUID: YCh9YoQGRciQQbfybx+ZKA==
X-CSE-MsgGUID: A2Ny1xDARaCJ7gZHMZafUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="79442582"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="79442582"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 00:28:36 -0700
X-CSE-ConnectionGUID: gLlDXzbSRfGLpSOfFb45Lg==
X-CSE-MsgGUID: OXTk90ovRTeCrxtdmqtUAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="249166397"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 Mar 2026 00:28:34 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7732-000000000ox-0qfg;
	Mon, 30 Mar 2026 07:28:32 +0000
Date: Mon, 30 Mar 2026 15:28:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-poly-aosp-pixel-malibu-staging 4/4]
 arch/arm64/kvm/at.c:177:36: warning: variable 'mmu' set but not used
Message-ID: <202603301556.6Uq9YWGS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Marc,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-poly-aosp-pixel-malibu-staging
head:   5de4567efb4a2a85c5768504b0f45f278e9b13a2
commit: e794049b9acbd6500b77b9ce92a95101091b52d3 [4/4] KVM: arm64: nv: Add basic emulation of AT S1E2{R,W}
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260330/202603301556.6Uq9YWGS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603301556.6Uq9YWGS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603301556.6Uq9YWGS-lkp@intel.com/

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
