Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE3F1E8826
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Dec 2024 19:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734118209; cv=none; b=D+t7+2TtnWBUUS1f1BsZc0nmcNP+oVtq+0QHfxABFHL7uThKF1SOROkHBrlsSfMRe8fk0ufWN6idvqwP2hfdszkZxz4gB4NsuYKhglZ3FOxaQlU9hJ3Sd8VN7A6MLcaMKY1SSv02l+16hojDFDBF/ypacgn+/3merkwkayspsZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734118209; c=relaxed/simple;
	bh=JRAFgNb8be2rRXqfOd/vVcR+tHrGIz1qt1LnCKCrm4o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eVR24G/v1t9mIhk2RcEamhW/S98zZl7u8E4j1ZgTpZdsfN5XZbh8hGN9nWVWxYF+9IRggO2QrLyQhGvUs0s1tUv6wRmbDB78PRlhLjd9Vn4H+fRNzq56dyU7qORlEcQ/EJt9SUfOocvDmx0BKMkftPre3ikkE0OT0jQrd/XwGH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hbm8sF0K; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hbm8sF0K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734118207; x=1765654207;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JRAFgNb8be2rRXqfOd/vVcR+tHrGIz1qt1LnCKCrm4o=;
  b=hbm8sF0Ksbwuqpc596/fTkN4Ghb42qxRgvLQArQfcFU0qUdVKusGu/Ww
   HFrWV3JRQNVGdD9iOZMz4a307QKlsRRYqpwSj31TT/jgqMiAka7Nudgqw
   zyFYf+wJ6SHgkZ5dEBpffa1GGFv3p8sV3NZLyBN6dQQhJkMCbE23+W4a+
   ThonNCb5lYgQtaYdZfyI8kq4iCDCQgCTZMp46DaWnw9aqq+cJZomynYy0
   I8gBFAXyxZG/kNnUVcV7HfBwmRDHbP/w28gxQEnVKA2nhWT1cJZCxbyKp
   SdVvQtVHj+fiW/n8AqI8HPb3gm/ozzMXpmuCoSKDqLCd+c4EsRwdv+yDB
   w==;
X-CSE-ConnectionGUID: DR8d5AhmQS6iKgBCeFVCaQ==
X-CSE-MsgGUID: rEXiomuBTfu9wA+qksezmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="38262029"
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; 
   d="scan'208";a="38262029"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 11:30:06 -0800
X-CSE-ConnectionGUID: gQ0Ht1odR+yXCFg1GjIqmg==
X-CSE-MsgGUID: ktKuTCNrTFCD6SIaMN1grg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; 
   d="scan'208";a="96501148"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Dec 2024 11:30:04 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMBMQ-000CMT-1a;
	Fri, 13 Dec 2024 19:30:02 +0000
Date: Sat, 14 Dec 2024 03:29:42 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xianglai Li <lixianglai@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1636/1636]
 arch/loongarch/kernel/paravirt.c:85:24: error: 'KVM_HCALL_FUNC_PV_IPI'
 undeclared; did you mean 'KVM_HCALL_FUNC_IPI'?
Message-ID: <202412140300.AvxBVNVW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   d68dc6ee371ec5466be9b2d76bdca0b360940adc
commit: dba6c8bad729e1971c31053550e9686127ce3844 [1636/1636] LoongArch: KVM: Add PV IPI support on host side
config: loongarch-randconfig-002-20241213 (https://download.01.org/0day-ci/archive/20241214/202412140300.AvxBVNVW-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241214/202412140300.AvxBVNVW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412140300.AvxBVNVW-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/loongarch/kernel/paravirt.c: In function 'pv_send_ipi_single':
>> arch/loongarch/kernel/paravirt.c:85:24: error: 'KVM_HCALL_FUNC_PV_IPI' undeclared (first use in this function); did you mean 'KVM_HCALL_FUNC_IPI'?
      85 |         kvm_hypercall3(KVM_HCALL_FUNC_PV_IPI, 1, 0, min);
         |                        ^~~~~~~~~~~~~~~~~~~~~
         |                        KVM_HCALL_FUNC_IPI
   arch/loongarch/kernel/paravirt.c:85:24: note: each undeclared identifier is reported only once for each function it appears in
   arch/loongarch/kernel/paravirt.c: In function 'pv_send_ipi_mask':
   arch/loongarch/kernel/paravirt.c:119:40: error: 'KVM_HCALL_FUNC_PV_IPI' undeclared (first use in this function); did you mean 'KVM_HCALL_FUNC_IPI'?
     119 |                         kvm_hypercall3(KVM_HCALL_FUNC_PV_IPI,
         |                                        ^~~~~~~~~~~~~~~~~~~~~
         |                                        KVM_HCALL_FUNC_IPI


vim +85 arch/loongarch/kernel/paravirt.c

f860ab821dd12f5 Bibo Mao 2024-03-22  73  
462dd429f52a765 Bibo Mao 2024-03-01  74  #ifdef CONFIG_SMP
462dd429f52a765 Bibo Mao 2024-03-01  75  static void pv_send_ipi_single(int cpu, unsigned int action)
462dd429f52a765 Bibo Mao 2024-03-01  76  {
462dd429f52a765 Bibo Mao 2024-03-01  77  	unsigned int min, old;
462dd429f52a765 Bibo Mao 2024-03-01  78  	irq_cpustat_t *info = &per_cpu(irq_stat, cpu);
462dd429f52a765 Bibo Mao 2024-03-01  79  
462dd429f52a765 Bibo Mao 2024-03-01  80  	old = atomic_fetch_or(BIT(action), &info->message);
462dd429f52a765 Bibo Mao 2024-03-01  81  	if (old)
462dd429f52a765 Bibo Mao 2024-03-01  82  		return;
462dd429f52a765 Bibo Mao 2024-03-01  83  
462dd429f52a765 Bibo Mao 2024-03-01  84  	min = cpu_logical_map(cpu);
462dd429f52a765 Bibo Mao 2024-03-01 @85  	kvm_hypercall3(KVM_HCALL_FUNC_PV_IPI, 1, 0, min);
462dd429f52a765 Bibo Mao 2024-03-01  86  }
462dd429f52a765 Bibo Mao 2024-03-01  87  

:::::: The code at line 85 was first introduced by commit
:::::: 462dd429f52a7659ea1c74f02f7134a43fccccc8 LoongArch: Add pv ipi support on guest kernel side

:::::: TO: Bibo Mao <maobibo@loongson.cn>
:::::: CC: Xianglai Li <lixianglai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
