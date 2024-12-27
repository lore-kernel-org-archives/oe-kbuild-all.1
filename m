Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F681F8675
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 17:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735319951; cv=none; b=UZPwhQcHCwa7jdIQqfEEYBQHQ8k7qBK0weXgQhN4yatNHG5eVyEC+hyzDwA+4xt78K0pSeWT9Q7oO2hHBSJAXx/uWPB0PvtybFqvj66nDLN5G64nTT7JlyBRTllEx1JvI9URK9bK4/6++xdHFG+mQ3LNQe7eP2l8UdoP82Nzj5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735319951; c=relaxed/simple;
	bh=4o07wpEkzjAjQXd/YXdEY2j71lMWwvrmkMHrPfoZ3r4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q2WxeeyaTdTSv6JZaKi/MKFrfmWlvFDCVoapqiapgpY2mcjEUjYHBMFXJlExyOtWUabuBWuyrMxKcsjNv1pjfLfmfLqpQSk2xWMxkcOoGrPfftAcRxEQBvEQhKYcp7IcxcIqi4cgYZ1GV2jpFWJVTNNjOfWCndYV1hukSch56Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=klGlI+oA; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="klGlI+oA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735319949; x=1766855949;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4o07wpEkzjAjQXd/YXdEY2j71lMWwvrmkMHrPfoZ3r4=;
  b=klGlI+oAdKa0/YTju2CqpvwbWKuMfi+CHHJWZeKcpGXdCFYD10eDHERf
   1M76/UMTPZa+84tKkc3JcsiR4LtLfNlP2RXDCevb/vgT7QlcwO/7Wm//K
   96kef1KVyVWi/AXZn6aRpjklmk4AZ/VxhXiROlVggAdrtWmBvu2jkqub3
   s+z9gZy5Zf62gua6YljpzcAIYrBT0XpYeTJjTFg8UlONAN1P1ef7GejCZ
   TTdorUYzwwJ8uIW2wtgQRaC9gceABaWXN6jdDZ/gruTvDCW+otyODAd34
   ksbGUmrWluS094EiaWs2VNzToVJdBKHh5a64hQCgbWCQnOPVbNXQ99jUp
   g==;
X-CSE-ConnectionGUID: 9Gny8CnfRhqZlxbXeVI5mQ==
X-CSE-MsgGUID: gpb0CclmTjedi+qBamC8YQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35029835"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="35029835"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 09:19:08 -0800
X-CSE-ConnectionGUID: V9ZFKrX+TjSBk8EvJ66Vbw==
X-CSE-MsgGUID: 70DC3pILS9+7DyM6E43zKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104823750"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Dec 2024 09:19:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRDzN-0003ND-0j;
	Fri, 27 Dec 2024 17:19:05 +0000
Date: Sat, 28 Dec 2024 01:18:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yuchen Tang <tangyuchen5@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1667/1667] fs/proc/etmem_scan.c:737:16: sparse:
 sparse: cast removes address space '__rcu' of expression
Message-ID: <202412280138.9neQNRRd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   e53a23ef21aa9859c864e7c4bb6ecde5269f54b6
commit: 5d3b64fd78b80ec49285f2186e7b5ac5850f76e4 [1667/1667] etmem: add etmem scan feature
config: arm64-randconfig-r111-20241227 (https://download.01.org/0day-ci/archive/20241228/202412280138.9neQNRRd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241228/202412280138.9neQNRRd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412280138.9neQNRRd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/proc/etmem_scan.c:269:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __user *buf @@     got void *buf @@
   fs/proc/etmem_scan.c:269:18: sparse:     expected void [noderef] __user *buf
   fs/proc/etmem_scan.c:269:18: sparse:     got void *buf
>> fs/proc/etmem_scan.c:737:16: sparse: sparse: cast removes address space '__rcu' of expression
   fs/proc/etmem_scan.c:1361:40: sparse: sparse: incorrect type in assignment (incompatible argument 2 (different address spaces)) @@     expected long ( *extern [addressable] [assigned] [toplevel] read )( ... ) @@     got long ( * )( ... ) @@
   fs/proc/etmem_scan.c:1361:40: sparse:     expected long ( *extern [addressable] [assigned] [toplevel] read )( ... )
   fs/proc/etmem_scan.c:1361:40: sparse:     got long ( * )( ... )
   fs/proc/etmem_scan.c:697:46: sparse: sparse: self-comparison always evaluates to false
   fs/proc/etmem_scan.c:720:46: sparse: sparse: self-comparison always evaluates to false

vim +/__rcu +737 fs/proc/etmem_scan.c

   724	
   725	static int arm_page_range(struct page_idle_ctrl *pic,
   726							   unsigned long addr,
   727							   unsigned long end)
   728	{
   729		pgd_t *pgd;
   730		unsigned long next;
   731		struct kvm *kvm = pic->kvm;
   732		int err = 0;
   733	
   734		WARN_ON(addr >= end);
   735	
   736		read_lock(&pic->kvm->mmu_lock);
 > 737		pgd = (pgd_t *)kvm->arch.mmu.pgt->pgd + pgd_index(addr) * PTRS_PER_PTE;
   738		read_unlock(&pic->kvm->mmu_lock);
   739	
   740		local_irq_disable();
   741		do {
   742			next = pgd_addr_end(addr, end);
   743			if (!pgd_present(*pgd)) {
   744				set_restart_gpa(next, "PGD_HOLE");
   745				continue;
   746			}
   747	
   748			err = arm_p4d_range(pic, pgd, addr, next);
   749			if (err)
   750				break;
   751		} while (pgd++, addr = next, addr != end);
   752	
   753		local_irq_enable();
   754		return err;
   755	}
   756	#endif
   757	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
