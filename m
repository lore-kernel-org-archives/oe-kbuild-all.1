Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7CB83A10
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Apr 2024 02:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713926699; cv=none; b=QbDbiR8MXmOixRb6pRrKZF4ZN2RKAaQOnyrJifVR1WWGZyT8kOx39/wi3qB+Maqs1lurCbkC84oxVvqmyRVQ2oxQYY6mOHKxLcp+islf4j3ssS0F3KnISwvWo/TRpgI2svM33RRAoi7VTvxq+4edgQuldLig3ykm+TwyevMsarQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713926699; c=relaxed/simple;
	bh=3m0lFz/StfeyX0XKbTZ0N5cOJ08+RiBpCnwIH6PvYwY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=irY+Z1iKm+icppW1b/kXpokphZ54OJ/OTWBYaRNCXbQ5Y+FKF2dRMGWNVhh88uRpviJlmGJjiKppBpOLSG+rA4MsqD7yUemj1dsiTzXBmK0QxMAwK8J7KkQeUjKHJQAc/tJiSEUDoEu3vEy1wdJ3fsUax2xMnUshR92MXuGAzrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D1BDnl/F; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D1BDnl/F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713926698; x=1745462698;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3m0lFz/StfeyX0XKbTZ0N5cOJ08+RiBpCnwIH6PvYwY=;
  b=D1BDnl/FcmfxQjrzHZasdFNAJmhvO7bL7G4apfC+BkjHe49qG0vOg9r7
   pdeRhSZSsbAY9l5ethecsRxr6I6ZmZgvJILnq47MDpDaD3efoEp0YPcXk
   x8UUTK/RhH1u8WQBS7o1Kwje0Ks0MbDeZNfSnqtxW3L0pgGyfvhLIYdLg
   q5iEaZioMkUMjxoEi9JblITn0jeQA/ASW2o1SyzgLVJ+f2R0brzkc8mcC
   agoit1OTkkeRzrmzVQICkGjutM6a9Q9xBqOAF3IPMbQQKPAHXGDnXxrq5
   DJgkubGgllbuqD9D5BDSuZRCQce+Pnc041CYHIDX1JzpGdOidEHbQW6tx
   w==;
X-CSE-ConnectionGUID: bWU/FYe9QR2xDVUwAQKCDQ==
X-CSE-MsgGUID: hFqMkXNAR8OvwPXlMpvaYA==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9367632"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="9367632"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 19:44:55 -0700
X-CSE-ConnectionGUID: 5zDz+r9dTC6AHHflbiaRSA==
X-CSE-MsgGUID: 2i+BVRR1Qpq7+giw8rBPcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="24609175"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 Apr 2024 19:44:54 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzSct-0000mS-2Z;
	Wed, 24 Apr 2024 02:44:51 +0000
Date: Wed, 24 Apr 2024 10:44:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yuchen Tang <tangyuchen5@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2528/7513] fs/proc/etmem_scan.c:737:16: sparse:
 sparse: cast removes address space '__rcu' of expression
Message-ID: <202404241001.LouXWxwt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   1bab7be76541fb1208df75a4e4e00beb09be471f
commit: 5d3b64fd78b80ec49285f2186e7b5ac5850f76e4 [2528/7513] etmem: add etmem scan feature
config: arm64-randconfig-r131-20240424 (https://download.01.org/0day-ci/archive/20240424/202404241001.LouXWxwt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240424/202404241001.LouXWxwt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404241001.LouXWxwt-lkp@intel.com/

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
