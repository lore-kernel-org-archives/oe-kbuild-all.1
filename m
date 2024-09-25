Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4F31487F6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Sep 2024 02:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727231217; cv=none; b=SMxCUQGCLdnoOl1/MbVFPH0gosBdsRc5NsrPvwB7dfHQzTbng+ilYVReixDzKjevBBX4VM0ik6OGEqwoMkdIO/iOfhIZ6boI4mGoJPkfHI/1f5lXCmni6QzkoE33gRZlJVmEQmr7w3nhMU1tm3+7IWxApttQaRBJ6FAWCd0G+bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727231217; c=relaxed/simple;
	bh=pEWOrktOGnCbbhf6OBJ1o1HnR3IqH6UPbtw8+H4xnG4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mXp1zQnbjMmbt4NhoTQQGoSaFgf7XRxVkXho25NJlViJu84tfGgyuTdxFhUipHOrZ0fKm5h3fOFxMw4qLnQrcXN6F8WN8Snwl9raHx1sIiKhYz7WPGOuoX2IXw16hVx/9sOzt4nL8rRhjTEsLkUwcbTtWyMTVc1yhirnyPrVpR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ghKqG7kz; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ghKqG7kz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727231215; x=1758767215;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pEWOrktOGnCbbhf6OBJ1o1HnR3IqH6UPbtw8+H4xnG4=;
  b=ghKqG7kzPx7g7L38ptiMTSvxfTnS5jDEw2cvScEz9bsMWXW1NAoktgmN
   cZcYOn/RIDlPC38UKUdExoBTL33hHp0SYqBY3P5eC8+XJT+TDwAHgkT6b
   BzBwy51nHqrGSRbplPoTRXUcjYhinoiuXJhaU3b1s5MYnaiR3F/V6zEFx
   lMoDlrjBvwJA7gNmm3to9sGiAcuSVf5XBPTQRDD6ahhJZ2cH/feG5easv
   uRcvhqN4o0gG+2PzYYWxTOgaaHGnPuNzomcT6QqZIfAcFUdKa0v7AXwG3
   nS2YLpJNYHSLTneUbAYS47SYQJFplbuaLoCXyFeL22uGB6wp0dqE227z8
   A==;
X-CSE-ConnectionGUID: 5EHpWWNMTuyK5aa8bn2y0g==
X-CSE-MsgGUID: KYbAsKqqRWme7w6i15W0QQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="26352973"
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="26352973"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 19:26:52 -0700
X-CSE-ConnectionGUID: MAm77GodT7SBxwYiVWxNVg==
X-CSE-MsgGUID: /NFH4r5rQXmMdyf1aIPzlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="102437841"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 24 Sep 2024 19:26:51 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stHjs-000J37-2k;
	Wed, 25 Sep 2024 02:26:48 +0000
Date: Wed, 25 Sep 2024 10:26:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jordan Niethe <jniethe5@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Gautam Menghani <gautam@linux.ibm.com>
Subject: arch/powerpc/kvm/powerpc.c:1061:9: error: implicit declaration of
 function 'kvmppc_get_vsx_vr'; did you mean 'kvmppc_get_sr'?
Message-ID: <202409251011.k4Av657k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jordan,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   684a64bf32b6e488004e0ad7f0d7e922798f65b6
commit: 52425a3b3c11cec58cf66e4c897fc1504f3911a9 KVM: PPC: Introduce FPR/VR accessor functions
date:   1 year ago
config: powerpc64-randconfig-003-20240925 (https://download.01.org/0day-ci/archive/20240925/202409251011.k4Av657k-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240925/202409251011.k4Av657k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409251011.k4Av657k-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/kvm/powerpc.c: In function 'kvmppc_set_vmx_dword':
>> arch/powerpc/kvm/powerpc.c:1061:9: error: implicit declaration of function 'kvmppc_get_vsx_vr'; did you mean 'kvmppc_get_sr'? [-Wimplicit-function-declaration]
    1061 |         kvmppc_get_vsx_vr(vcpu, index, &val.vval);
         |         ^~~~~~~~~~~~~~~~~
         |         kvmppc_get_sr
>> arch/powerpc/kvm/powerpc.c:1063:9: error: implicit declaration of function 'kvmppc_set_vsx_vr'; did you mean 'kvmppc_set_sr'? [-Wimplicit-function-declaration]
    1063 |         kvmppc_set_vsx_vr(vcpu, index, &val.vval);
         |         ^~~~~~~~~~~~~~~~~
         |         kvmppc_set_sr
   In file included from arch/powerpc/kvm/powerpc.c:25:
   arch/powerpc/kvm/powerpc.c: In function 'kvm_vcpu_ioctl_get_one_reg':
>> arch/powerpc/kvm/powerpc.c:1729:52: error: implicit declaration of function 'kvmppc_get_vscr'; did you mean 'kvmppc_get_sr'? [-Wimplicit-function-declaration]
    1729 |                         val = get_reg_val(reg->id, kvmppc_get_vscr(vcpu));
         |                                                    ^~~~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h:412:29: note: in definition of macro 'get_reg_val'
     412 |         case 4: __u.wval = (reg); break;        \
         |                             ^~~
   arch/powerpc/kvm/powerpc.c: In function 'kvm_vcpu_ioctl_set_one_reg':
>> arch/powerpc/kvm/powerpc.c:1780:25: error: implicit declaration of function 'kvmppc_set_vscr'; did you mean 'kvmppc_set_sr'? [-Wimplicit-function-declaration]
    1780 |                         kvmppc_set_vscr(vcpu, set_reg_val(reg->id, val));
         |                         ^~~~~~~~~~~~~~~
         |                         kvmppc_set_sr


vim +1061 arch/powerpc/kvm/powerpc.c

  1048	
  1049	
  1050	static inline void kvmppc_set_vmx_dword(struct kvm_vcpu *vcpu,
  1051		u64 gpr)
  1052	{
  1053		union kvmppc_one_reg val;
  1054		int offset = kvmppc_get_vmx_dword_offset(vcpu,
  1055				vcpu->arch.mmio_vmx_offset);
  1056		int index = vcpu->arch.io_gpr & KVM_MMIO_REG_MASK;
  1057	
  1058		if (offset == -1)
  1059			return;
  1060	
> 1061		kvmppc_get_vsx_vr(vcpu, index, &val.vval);
  1062		val.vsxval[offset] = gpr;
> 1063		kvmppc_set_vsx_vr(vcpu, index, &val.vval);
  1064	}
  1065	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
