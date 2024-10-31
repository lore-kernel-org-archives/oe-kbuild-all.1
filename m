Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01EF12C460
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 02:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730341191; cv=none; b=FOjRMFcnVLCWIA632r6z/Y7zBRWmfuI18FVlhjzOFaK/ndbebB4t64FdJn6vv5VdK5V54C6OccMTy6rE7jDQwRaUyZ5IxsGpQNVWr+Z7S5i7cfDR9rMZQwKnK6PR0vC+1emggGoZQYtgONdzLOMPKMgiUahddpTpDy7emNZmOF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730341191; c=relaxed/simple;
	bh=hKIN8iYcyPLjEKoBPxbekSqMY6AZJ+ni3N+7Srz8pHw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b4YxC07MecPeGC2WsOLOyzQg+asveHUhamSnqixhxtnHACNTGs++y0EcfYxmP4XORlWICDjZjq658dBpZXksugU3ajR3xKQO5Q8jtFhvjvPg6PUWIVii4v4rofZKtMzPLMjFzACm+SOmYpfnIY3t/bn28eLwyDVueSsT/cat9+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h39qAUYB; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h39qAUYB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730341189; x=1761877189;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hKIN8iYcyPLjEKoBPxbekSqMY6AZJ+ni3N+7Srz8pHw=;
  b=h39qAUYBPIzoGxUcHbph2vLX2mND7yt5dIwzDYZv5wOsLR1nhl3zwQQh
   a9+diL/+U2NmpNZdnkM1ONTUHFfsF6mteck2J7CzrA4TGhgQ8OtZ8zWy5
   Ajv3bn5YWQQofun6mMW6Ejz463tyMpiu2mPKaTDET289vIknsUCFGjxSV
   gh/KoaFB/Y2l+qPcaKsb8kelFf31xlbAQbXTMzCYbZkgjzcyjuNobMay2
   Ei5CLDYzYuRup2vj4dPNS6OAIt6KH67NSqbjNRpOogcWmhGu1COaGlKC8
   2phv9nPY5Vsl6CUCfbh2gwpKwJyBdP4wZPVFvh2SIasoF2/UW8zJNifXG
   w==;
X-CSE-ConnectionGUID: mEDiObijQD2gYbv4fw7DdA==
X-CSE-MsgGUID: iVjkaqN4Q/C7wMbLMnhUvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47528330"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="47528330"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 19:19:48 -0700
X-CSE-ConnectionGUID: ZOM0OukGS/qCzHW/4T4O4g==
X-CSE-MsgGUID: Bj01fGsOTfSrNlMiracvow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; 
   d="scan'208";a="82039775"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 30 Oct 2024 19:19:47 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6Kmm-000fYA-1n;
	Thu, 31 Oct 2024 02:19:44 +0000
Date: Thu, 31 Oct 2024 10:19:42 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xianglai Li <lixianglai@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 7137/15906] arch/loongarch/kvm/exit.c:764:63:
 error: 'struct sched_info' has no member named 'run_delay'
Message-ID: <202410311034.Boz3bHHh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bibo,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ab348dfdf1ec26d67e53449056f417e399807edc
commit: faa35b0fcdefb1e5f2d05b0eeac12be32e69e566 [7137/15906] LoongArch: KVM: Add steal time support in kvm side
config: loongarch-randconfig-001-20241031 (https://download.01.org/0day-ci/archive/20241031/202410311034.Boz3bHHh-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410311034.Boz3bHHh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410311034.Boz3bHHh-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/loongarch/kvm/exit.c: In function 'kvm_save_notify':
>> arch/loongarch/kvm/exit.c:764:63: error: 'struct sched_info' has no member named 'run_delay'
     764 |                 vcpu->arch.st.last_steal = current->sched_info.run_delay;
         |                                                               ^
--
   arch/loongarch/kvm/vcpu.c: In function 'kvm_update_stolen_time':
>> arch/loongarch/kvm/vcpu.c:68:37: error: 'struct sched_info' has no member named 'run_delay'
      68 |         steal += current->sched_info.run_delay -
         |                                     ^
   arch/loongarch/kvm/vcpu.c:70:55: error: 'struct sched_info' has no member named 'run_delay'
      70 |         vcpu->arch.st.last_steal = current->sched_info.run_delay;
         |                                                       ^


vim +764 arch/loongarch/kvm/exit.c

   754	
   755	static int kvm_save_notify(struct kvm_vcpu *vcpu)
   756	{
   757		unsigned long id, data;
   758	
   759		id = vcpu->arch.gprs[LOONGARCH_GPR_A1];
   760		data = vcpu->arch.gprs[LOONGARCH_GPR_A2];
   761		switch (id) {
   762		case KVM_FEATURE_STEAL_TIME:
   763			vcpu->arch.st.guest_addr = data;
 > 764			vcpu->arch.st.last_steal = current->sched_info.run_delay;
   765			kvm_make_request(KVM_REQ_RECORD_STEAL, vcpu);
   766			break;
   767		default:
   768			break;
   769		};
   770	
   771		return 0;
   772	};
   773	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
