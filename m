Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9323633E1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Dec 2024 21:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735248441; cv=none; b=N/e/dkms8U2z2Ae5Tr056UylIw6oCAhRdHvE5JNWE9ieOflnaXK6qM+I3N7YO7Fx4iqSPqQepwIA2DCnUAPL49VIO1D6BzsrKbc96VqH9fai/b1sxxGOC09Wa3FvEJscEoASz885P1WKca5+HGR5xL+c/KbVaJ8gVHs4AOewZag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735248441; c=relaxed/simple;
	bh=LZGJZboRq5YtYt1zuRlU5Xy0Jytev8U8MbWr12cIXvw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GcuyjmQRvA1SSDXF5511ReT7V7HlJx3AnS3Tn/tkGV6kY9gR8FtG3YWXugBi7b7SWsNVJgPhA/FW/mGwuldm1aSnLxzl9QbsnQh1DlEWpql+MmtGvsADS2P4AbI3jqxgKytvJzkkk5pZYdFcUBoUDrd7Vg5LNLlFAQyTiZ4CzFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yjk9TRea; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yjk9TRea"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735248439; x=1766784439;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LZGJZboRq5YtYt1zuRlU5Xy0Jytev8U8MbWr12cIXvw=;
  b=Yjk9TRea71uejfafMyWQbmYMVHlI4tmmW4xnhVcxfy1QZlI9DH47aTbM
   N9t8DwykhBOYgk+V/f2O0pxf5MbtACA4u3MV4SHCTcaUnCvrpiRoKsnuq
   aifigL3RsAFsKpAEUJ83oyk1yXxOPqymDiOwaZhATmE42rWIfiRVWq2Fk
   BrGkFGgVsyZ22ueR4ZELOzRvluIcPdYAmnAo9S0ZhOLpaRndvfYXtlrvW
   wdi5PoyQ7m/9zqzMScMmQDp1HzXoOU4B/47yd1+1GrgbZgsZJWz8MemKu
   taz8FCSCcyXOXrWMPjA0YxAGtWQBdBbo1GTPjAPExBb6Iusjt7o2axj0g
   A==;
X-CSE-ConnectionGUID: ewvzvu3oRg6XuG3smQKYIg==
X-CSE-MsgGUID: aeH9Vp+vQKmDxSfHRnfU/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11297"; a="53069515"
X-IronPort-AV: E=Sophos;i="6.12,267,1728975600"; 
   d="scan'208";a="53069515"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2024 13:27:18 -0800
X-CSE-ConnectionGUID: BG+YGArrS6CmSpRYRl2hiA==
X-CSE-MsgGUID: feZ4lfzGTZqmXE9WN4BRag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="99859234"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 26 Dec 2024 13:27:17 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQvNy-0002ne-26;
	Thu, 26 Dec 2024 21:27:14 +0000
Date: Fri, 27 Dec 2024 05:26:27 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yuchen Tang <tangyuchen5@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1667/1667] fs/proc/etmem_scan.c:737:16: sparse:
 sparse: cast removes address space '__rcu' of expression
Message-ID: <202412270547.i7G0fcKP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   16a0cbac6609f8ba10a91a9d52b15bf28243c3ee
commit: 5d3b64fd78b80ec49285f2186e7b5ac5850f76e4 [1667/1667] etmem: add etmem scan feature
config: arm64-randconfig-r111-20241227 (https://download.01.org/0day-ci/archive/20241227/202412270547.i7G0fcKP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241227/202412270547.i7G0fcKP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412270547.i7G0fcKP-lkp@intel.com/

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
