Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC4B306495
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Oct 2025 11:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760615368; cv=none; b=aVx/pxf4ZF2TUAtOsaHZkyqKveCxU15oWQyOhXtUxQ21uDOi3LxMio1HjcZvOK3PI82RppYoH4sp13HCCDmgjO75/qd7P4HizwzAX0Ymi6aWwg6rQzqfgVHrBJ8kCVLFq8MQLjRMi53CneEfY/Rz8LR8ZAccnUB2GTg1j42ln8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760615368; c=relaxed/simple;
	bh=t8t1G8vXch7WJzz7wWHJBwCvAsR4r5mn2ZuhThPJHWY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kITKDfyzROmE72OFqmhZNn+OJBNAzDaSKM149PNiuamHX4M36y+mF7LvyPepcdZqjUx1So/KQyOxIKKbr+afIT00xdavVhu0G890BhOPMy/y0pH7wgNd0a+cG4AkgTFKQZ4c4kymmtB7QMHMAt4jyMDPcginuSmmE2tpmVpJJHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CCAJgU5e; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CCAJgU5e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760615366; x=1792151366;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t8t1G8vXch7WJzz7wWHJBwCvAsR4r5mn2ZuhThPJHWY=;
  b=CCAJgU5epEv5TCCb958pNTCis88BJyQqcKyo4Yu3NQKfysrJV3C2xSY1
   Rr+o4ZaDgpd2uviIKskCoXFAMJ2UMe8gm41PRXJbA2SL/87x9poxx0iKr
   dLCOXb4FMInZfn7Phrh8x3rUKdTQgxyA8cXr998kok/LsnxewGmku7L+S
   o/JpH5RNRI33X+beTqaj/wvcSw4hOmupm9GbzQsSpQNEfMmgYWef/m7lN
   ryhmUA4XH0TMZAjovIRz6//G5eFd5VhRrCgUSRwz4q84HDUDbS8rmgzOX
   SKiDajQwF1hpv1xUHSDN6gyljtawChreQT4iDPhfKvfmbGw904MZXq2gv
   w==;
X-CSE-ConnectionGUID: cBwvDMw4SJiueEn22gsQFw==
X-CSE-MsgGUID: Ix4bnePiS/WE15cQVXzIDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62953268"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="62953268"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 04:49:26 -0700
X-CSE-ConnectionGUID: MP6LGdKVTPijYoCxVnMSXA==
X-CSE-MsgGUID: ngjh0YLhTVmjsl8g765Tew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="183227078"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 16 Oct 2025 04:49:25 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9MTj-0004lh-2L;
	Thu, 16 Oct 2025 11:49:16 +0000
Date: Thu, 16 Oct 2025 19:48:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3233/3233] arch/x86/kvm/x86.c:8661:5: warning:
 no previous prototype for '__kvm_vcpu_halt'
Message-ID: <202510161956.PnDe2iFY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   55f16e7a2a3e273da30ccadd01b074c054ceb6fe
commit: c499a3120204c834ff963c43d90a5ff33194b34c [3233/3233] KVM: SVM: Add support for booting APs in an SEV-ES guest
config: x86_64-randconfig-161-20251016 (https://download.01.org/0day-ci/archive/20251016/202510161956.PnDe2iFY-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510161956.PnDe2iFY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510161956.PnDe2iFY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kvm/x86.c:809:5: warning: no previous prototype for 'kvm_read_guest_page_mmu' [-Wmissing-prototypes]
     809 | int kvm_read_guest_page_mmu(struct kvm_vcpu *vcpu, struct kvm_mmu *mmu,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/kvm/x86.c:8661:5: warning: no previous prototype for '__kvm_vcpu_halt' [-Wmissing-prototypes]
    8661 | int __kvm_vcpu_halt(struct kvm_vcpu *vcpu, int state, int reason)
         |     ^~~~~~~~~~~~~~~


vim +/__kvm_vcpu_halt +8661 arch/x86/kvm/x86.c

  8660	
> 8661	int __kvm_vcpu_halt(struct kvm_vcpu *vcpu, int state, int reason)
  8662	{
  8663		++vcpu->stat.halt_exits;
  8664		if (lapic_in_kernel(vcpu)) {
  8665			vcpu->arch.mp_state = state;
  8666			return 1;
  8667		} else {
  8668			vcpu->run->exit_reason = reason;
  8669			return 0;
  8670		}
  8671	}
  8672	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
