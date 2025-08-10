Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299A82E3712
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Aug 2025 06:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754807339; cv=none; b=MbM57FffMN6xz9zC8H0aPuVouVffta/Nc0xqZGKcijmTJZyhKy8XX4DfkJlu/fWuf7rFC9iQg8fAc2cZ4Zj0fGwdQKuj6xbwCtLw4AEqc9ytHoswX3rJ21UwgtI3rCJnkT0ZqmrHX2wpOCmzW9l4tzW33wR8fmASor0mfFsWK9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754807339; c=relaxed/simple;
	bh=V+qTVbmuSEfxaU0rgT7m7aztoxm02ipckpoTE8M1Ucg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PTL5rM/IVBqPMhre4LJXm7qCvQUL5EkuXMGTjkzDcApcXfSZfg5Ei+R7mLwfQhKauZ4pO18YoHhetWLT/c1lB68KFtMXEyZHkZAJ9R/T7R1DSezMUIe5+Rw9vLNzXkVkdGM8PvvYlyJx8yUVolFGuhTmr52eCrweFplvLlS3x80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PG91AoDZ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PG91AoDZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754807336; x=1786343336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V+qTVbmuSEfxaU0rgT7m7aztoxm02ipckpoTE8M1Ucg=;
  b=PG91AoDZYGt4aR29WCfbU5ugbZyyy0G8qbbZ2ZVR8atX5/zYR6S7PP/+
   EIFbyLlHqiT96sKAboHQKDQKg0fcI0ptD4XQ9DXMVk9h7eRx6ZekJdNqi
   jxI4zN+JlVjVlDv6qFvpql5j1WxLAxOcMsPFC8jzCxFB9G1L2DrGmdcnR
   zva5nrGSjbYTgNuuSQ8u9uYEOm7m7NnPZ7VBuUwR78l+2/LlGCKZh6B/9
   MokJNnPFDhlMG9p1i8NCHKCkrdau1s8Ln25FXqj9yE+bPNDfqJ7CSyl1e
   lIz82xwjNxrHZAPXq9ErP+tCXgMcsxRPGRH05VEpn0oglK1BQodgU+HxG
   g==;
X-CSE-ConnectionGUID: rpd4QT0rRXCmE98RUDxiZQ==
X-CSE-MsgGUID: Ro8j8N4QSlO8HvCUJ531hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11516"; a="74543977"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="74543977"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 23:28:56 -0700
X-CSE-ConnectionGUID: LFxkuGEdQ9GKBHPKhbY8bg==
X-CSE-MsgGUID: 1pO7lNsRTs2uDiN8UQKzTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="166003252"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 09 Aug 2025 23:28:54 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukzXY-0005Bo-2E;
	Sun, 10 Aug 2025 06:28:35 +0000
Date: Sun, 10 Aug 2025 14:27:46 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/xfer_to_guest_mode 1/1]
 arch/loongarch/kvm/vcpu.c:254:15: error: too many arguments to function
 'xfer_to_guest_mode_handle_work'; expected 0, have 1
Message-ID: <202508101415.lRaS4YNm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/xfer_to_guest_mode
head:   7b4624b4ef6957706b9925831c9d5968c1cd9173
commit: 7b4624b4ef6957706b9925831c9d5968c1cd9173 [1/1] entry/kvm: KVM: Move KVM details related to signal/-EINTR into KVM proper
config: loongarch-randconfig-r064-20250810 (https://download.01.org/0day-ci/archive/20250810/202508101415.lRaS4YNm-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250810/202508101415.lRaS4YNm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508101415.lRaS4YNm-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/loongarch/kvm/vcpu.c: In function 'kvm_enter_guest_check':
>> arch/loongarch/kvm/vcpu.c:254:15: error: too many arguments to function 'xfer_to_guest_mode_handle_work'; expected 0, have 1
     254 |         ret = xfer_to_guest_mode_handle_work(vcpu);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ~~~~
   In file included from include/linux/kvm_host.h:5,
                    from arch/loongarch/kvm/vcpu.c:6:
   include/linux/entry-kvm.h:50:5: note: declared here
      50 | int xfer_to_guest_mode_handle_work(void);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/xfer_to_guest_mode_handle_work +254 arch/loongarch/kvm/vcpu.c

b5d4e2325db29e Bibo Mao     2024-07-09  237  
2fc3bd86db4b6f Tianrui Zhao 2023-10-02  238  /*
2fc3bd86db4b6f Tianrui Zhao 2023-10-02  239   * Check and handle pending signal and vCPU requests etc
2fc3bd86db4b6f Tianrui Zhao 2023-10-02  240   * Run with irq enabled and preempt enabled
2fc3bd86db4b6f Tianrui Zhao 2023-10-02  241   *
2fc3bd86db4b6f Tianrui Zhao 2023-10-02  242   * Return: RESUME_GUEST if we should enter the guest
2fc3bd86db4b6f Tianrui Zhao 2023-10-02  243   *         RESUME_HOST  if we should exit to userspace
2fc3bd86db4b6f Tianrui Zhao 2023-10-02  244   *         < 0 if we should exit to userspace, where the return value
2fc3bd86db4b6f Tianrui Zhao 2023-10-02  245   *         indicates an error
2fc3bd86db4b6f Tianrui Zhao 2023-10-02  246   */
2fc3bd86db4b6f Tianrui Zhao 2023-10-02  247  static int kvm_enter_guest_check(struct kvm_vcpu *vcpu)
2fc3bd86db4b6f Tianrui Zhao 2023-10-02  248  {
589e6cc7597655 Huacai Chen  2024-12-02  249  	int idx, ret;
2fc3bd86db4b6f Tianrui Zhao 2023-10-02  250  
2fc3bd86db4b6f Tianrui Zhao 2023-10-02  251  	/*
2fc3bd86db4b6f Tianrui Zhao 2023-10-02  252  	 * Check conditions before entering the guest
2fc3bd86db4b6f Tianrui Zhao 2023-10-02  253  	 */
2fc3bd86db4b6f Tianrui Zhao 2023-10-02 @254  	ret = xfer_to_guest_mode_handle_work(vcpu);
2fc3bd86db4b6f Tianrui Zhao 2023-10-02  255  	if (ret < 0)
2fc3bd86db4b6f Tianrui Zhao 2023-10-02  256  		return ret;
2fc3bd86db4b6f Tianrui Zhao 2023-10-02  257  
589e6cc7597655 Huacai Chen  2024-12-02  258  	idx = srcu_read_lock(&vcpu->kvm->srcu);
2fc3bd86db4b6f Tianrui Zhao 2023-10-02  259  	ret = kvm_check_requests(vcpu);
589e6cc7597655 Huacai Chen  2024-12-02  260  	srcu_read_unlock(&vcpu->kvm->srcu, idx);
2fc3bd86db4b6f Tianrui Zhao 2023-10-02  261  
2fc3bd86db4b6f Tianrui Zhao 2023-10-02  262  	return ret;
2fc3bd86db4b6f Tianrui Zhao 2023-10-02  263  }
2fc3bd86db4b6f Tianrui Zhao 2023-10-02  264  

:::::: The code at line 254 was first introduced by commit
:::::: 2fc3bd86db4b6f6992d4b459879a17b2ae6b2b3d LoongArch: KVM: Implement basic vcpu interfaces

:::::: TO: Tianrui Zhao <zhaotianrui@loongson.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
