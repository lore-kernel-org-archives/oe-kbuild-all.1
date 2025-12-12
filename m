Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F981EB5E1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 18:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765562778; cv=none; b=iJQFtsGlnBKzjN/cg0DjVZMxLETQRZI68A5jZLAQZOiVxFIeBRfMA/mqZmy/o99QZIC+OOkq6dZ7bKqbf35HAsl5s0NWtJJkiSq7XWFjyhP+HJ79P3rBTHuSjMxtB+fmujObUlFtMTy1udJ6VsLgSZ/R6uPZ6/bkKEGgiHnDWz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765562778; c=relaxed/simple;
	bh=TED21Kw4r9m/a3pgvqvCb0JDr9A9aCre0voL98rK824=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mc3L0+3Wtx0NoB5xndu0K/00MNc8l4NLuuKsW8+dzoz1TvvMTZ+QKhhEUQuP4ZHNltzpzOG/Rm9nytzc9EIxbCSgl54gZy5dRPZ2fcf+fsXV1/ujpDzsJMyPwB/acyVEV35jMaooJt8ms1iUePMzN9ehjHAPGp/NRFyXvsDTEHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MlgQz6Cx; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MlgQz6Cx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765562777; x=1797098777;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TED21Kw4r9m/a3pgvqvCb0JDr9A9aCre0voL98rK824=;
  b=MlgQz6CxVVqOTdmc0uhDYtNSpY1I24kewWJQj2mI1wFb1DI377qb9lel
   qiGpCI43MEvbU6kX/YrCfgBoNOq4SoUQDU1iD3VcVIdeVmSUuxIYI6ZmN
   o0Itp0FvZbi4WSIjtDlkKO4V9WBv/NNb3QC2X6qADToH0PeVkP2POe5eW
   nLGr8tXm+E0fQ8bnqpot1qVWhPqRaBPb3azfWGAj+mMqfhd/+Qg7mzdZs
   IrKQtBvI1x4bBzP9DPWm0/nihtV9r72qg0fJsnlT1xr0XEbadWdV8pgyL
   mPA2WnYpLaEg6WA2HVQsLEPfyaA6jEYYP9bAbBUREUhnaOCXAgaHGiuIT
   Q==;
X-CSE-ConnectionGUID: LnVzUUD9TiSH/1nMNBeMyw==
X-CSE-MsgGUID: whDTOwS8Q1KVens3NBIcvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="79027757"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="79027757"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 10:06:16 -0800
X-CSE-ConnectionGUID: 6RRwFypRQuOjvDma9C2qZA==
X-CSE-MsgGUID: T8LvKIB1SM2qKn4Gbf4iMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="196224281"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Dec 2025 10:06:16 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU7Wu-000000006PN-49Bc;
	Fri, 12 Dec 2025 18:06:12 +0000
Date: Sat, 13 Dec 2025 02:05:33 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3408/3408]
 drivers/crypto/ccp/hygon/tdm-dev.c:95:13: warning: variable 'ret' set but
 not used
Message-ID: <202512130255.3H21JVbQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   da8948fdddb84e5496272bab85973165594dd469
commit: 8011fdfd4cf33e84a51bab09ea76df4be3453037 [3408/3408] crypto: tdm: Add Hygon TDM driver
config: x86_64-randconfig-074-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130255.3H21JVbQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130255.3H21JVbQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130255.3H21JVbQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/crypto/ccp/hygon/tdm-dev.c: In function 'list_enqueue':
>> drivers/crypto/ccp/hygon/tdm-dev.c:95:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
      95 |         int ret = 0;
         |             ^~~
   drivers/crypto/ccp/hygon/tdm-dev.c: In function 'psp_create_measure_task':
>> drivers/crypto/ccp/hygon/tdm-dev.c:610:27: warning: variable 'head' set but not used [-Wunused-but-set-variable]
     610 |         struct list_head *head = NULL;
         |                           ^~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PTP_1588_CLOCK
   Depends on [n]: NET [=y] && POSIX_TIMERS [=n]
   Selected by [m]:
   - SXE [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]
   - SXE_VF [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]


vim +/ret +95 drivers/crypto/ccp/hygon/tdm-dev.c

    92	
    93	static int list_enqueue(void *entry)
    94	{
  > 95		int ret = 0;
    96		struct list_head *head, *entry_list = NULL;
    97		rwlock_t *lock = NULL;
    98	
    99		if (!entry) {
   100			ret = -DYN_NULL_POINTER;
   101			pr_err("Null pointer\n");
   102			goto end;
   103		}
   104	
   105		head = &dyn_head.head;
   106		lock = &dyn_head.lock;
   107		entry_list = &(((struct tdm_task_ctx *)entry)->list);
   108	
   109		write_lock(lock);
   110		if (entry_list)
   111			list_add_tail(entry_list, head);
   112		write_unlock(lock);
   113	
   114	end:
   115		return 0;
   116	}
   117	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
