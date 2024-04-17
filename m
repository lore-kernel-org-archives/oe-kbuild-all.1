Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABE11B94D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Apr 2024 22:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713392101; cv=none; b=jS+ZE1PteKMeuWMpGwws85QStBL2ktxE3fhNo+KV/JVReeWmEPVk1VozHeI/TVnzM2FZh6817C0BgbZsPgsqlwQSSmHD6XzP961eppGa1f8QAPkdR38334FgRbOTamvftgZJFACRGEGygIsSUndYpdC+w3U4OZrEjwhKxBYViNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713392101; c=relaxed/simple;
	bh=5ZYlsaAJjrjfAClkL7fbr1wkvAMpBiPa2B3XuzGtUAc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MGaMaJpbo/JACAjXq4n4iIHwFryUw2a5ZeB8VTP3W6VshhWyM05Hjg8yt97yTzRvsRk7OzNBhvqcGaC2Ugxc0ROJefgYOX2olpwUpRWT6JWmVE8otdvwzvw8hOn72VMI7yR7K4I1EKh/HAvYVMJcC7S2XKo2yFHhTQVBZzj2piM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UcJOS09Q; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UcJOS09Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713392099; x=1744928099;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5ZYlsaAJjrjfAClkL7fbr1wkvAMpBiPa2B3XuzGtUAc=;
  b=UcJOS09QjmPKxhLUj+R7plBr/Qgyuzd6HglKZpBLeozrOE/al6CdJTBf
   JtmNj250xlghq0dJj+qEW9d6EDmMqBBu+1yn3egcDr5twgUXUPHUfK12I
   CcUj+mUGkXtJBM6YgVzSF/1CKABCzCUcqwiQXRguGf0ENlVILD0I0iIQT
   tmpqhwV3DuXpYVzFE+/zrOc9A2VOmoX2PSNXEGNlBW7x9jiUeuzpjqnwo
   m4F1RjY5pmcMpaON9HUR8Wn8sX6uRIFTgSr7DpP6J4Nk3VqHHMJ2tOlkD
   DhDLb1HNOChJMLk6rzMVi/GSCE7HLKEkiuXhtRXVTk7g94rH5OYrPQ41+
   w==;
X-CSE-ConnectionGUID: lKPXBGcSS1i1Xwjc73AWfw==
X-CSE-MsgGUID: jzqCHTngSJOqjOHuQTVtUg==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9459517"
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; 
   d="scan'208";a="9459517"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 15:14:58 -0700
X-CSE-ConnectionGUID: kkZIlB0mRyCldIFOD2eJPg==
X-CSE-MsgGUID: VXieCOuTQy2jRo94VvClZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; 
   d="scan'208";a="22806267"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 17 Apr 2024 15:14:57 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxDYM-00071w-2U;
	Wed, 17 Apr 2024 22:14:54 +0000
Date: Thu, 18 Apr 2024 06:14:34 +0800
From: kernel test robot <lkp@intel.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Palmer Dabbelt <palmer@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [palmer:for-next 27/30] arch/riscv/mm/cacheflush.c:168:37: error:
 'mm_context_t' has no member named 'icache_stale_mask'
Message-ID: <202404180621.qG7A9Tk0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git for-next
head:   a76716f0ec75b9e7ac62d30854d690044c857684
commit: 383289e4b071ca4c8c42e34567f3f267766f093c [27/30] riscv: Include riscv_set_icache_flush_ctx prctl
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20240418/202404180621.qG7A9Tk0-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240418/202404180621.qG7A9Tk0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404180621.qG7A9Tk0-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/riscv/mm/cacheflush.c: In function 'set_icache_stale_mask':
>> arch/riscv/mm/cacheflush.c:168:37: error: 'mm_context_t' has no member named 'icache_stale_mask'
     168 |         mask = &current->mm->context.icache_stale_mask;
         |                                     ^
   arch/riscv/mm/cacheflush.c: At top level:
>> arch/riscv/mm/cacheflush.c:157:13: warning: 'set_icache_stale_mask' defined but not used [-Wunused-function]
     157 | static void set_icache_stale_mask(void)
         |             ^~~~~~~~~~~~~~~~~~~~~


vim +168 arch/riscv/mm/cacheflush.c

   156	
 > 157	static void set_icache_stale_mask(void)
   158	{
   159		cpumask_t *mask;
   160		bool stale_cpu;
   161	
   162		/*
   163		 * Mark every other hart's icache as needing a flush for
   164		 * this MM. Maintain the previous value of the current
   165		 * cpu to handle the case when this function is called
   166		 * concurrently on different harts.
   167		 */
 > 168		mask = &current->mm->context.icache_stale_mask;
   169		stale_cpu = cpumask_test_cpu(smp_processor_id(), mask);
   170	
   171		cpumask_setall(mask);
   172		assign_bit(cpumask_check(smp_processor_id()), cpumask_bits(mask), stale_cpu);
   173	}
   174	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
