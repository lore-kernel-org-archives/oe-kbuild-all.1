Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C2919AD8C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 08:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727770505; cv=none; b=Jhn4t/GOx/GyiZEHpBy3HuiZwRO31Snrx7oRk4rb3P3lNCIBHC5lPSed2eLDhuH/BTD4Illt7Xfy+q2hn89GkoeuuiUThLqEjGtup0BbrhgIUZCGB4WIeVyadsGFN0u37f+QlD68dkVvJWpaQUYXMkFh9Z2G3BqFhjmHD5n02zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727770505; c=relaxed/simple;
	bh=VrRXPtfvuhDlYE1zIhZ61MGU8R9ZBFBEyVOEiUAOpa8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oz4zlwfQXKZy8sOJJCoufvgILa1NZ4lT66F+Mk5RdWoxcCJm08Evb7DgK0WAosZGxuIlQe9Rx1vc7Wv4VhqqACl2pctUBlC3FrZZyqaRGGkxxClusvV/tDgU4w4xAIO37lmVTcc6aEyJnAAdTQNO0MDCKwdiodtppo/M0zh/ZQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VmDoxvz4; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VmDoxvz4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727770503; x=1759306503;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VrRXPtfvuhDlYE1zIhZ61MGU8R9ZBFBEyVOEiUAOpa8=;
  b=VmDoxvz4Yocu2BXsDZCx2tJKM+AvclQ1zS2yNFzVTPG4KHwo3JbQdzgH
   yoz0MDbs/ahgXr+7EZAK7T2wGkY6xvmYevk5y3Jg3oJHNnjrKmGnc1HV/
   opJ6hYnPvUkN3tJay6dHLb65hrjR0j/kVnydsggrZADjvOQkJEVPtba/k
   2ynjbgKU/BuDKX9Gnu8D6q2YPeda3WEoNSiqpbFLpo/cLfD39kD1ITIe+
   eajQhBuBVeF/NT7xvKw/ZSBePRyxGoeW2aJW5F7ln0jC7dhlHL51WsS4I
   XyzgWef4V20NccZRoQQXW2EmiGRxC/C098cu5nAgdKDZLC/pH7m+LsKMU
   w==;
X-CSE-ConnectionGUID: BejkUt+tSSqS8BNMe4OXPA==
X-CSE-MsgGUID: BM4RTGMVTHG5nnbDhA4PbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="37448304"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="37448304"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 01:15:03 -0700
X-CSE-ConnectionGUID: VMBn3PfSTHqsJR9kresUMA==
X-CSE-MsgGUID: OZ3Q+ooKTg6Da5K+L2HjiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="73907533"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 01 Oct 2024 01:15:01 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svY27-000QQ1-0P;
	Tue, 01 Oct 2024 08:14:59 +0000
Date: Tue, 1 Oct 2024 16:14:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:execmem/x86-rox/v4 7/8] mm/execmem.c:53:23: error: implicit
 declaration of function 'set_direct_map_valid_noflush'; did you mean
 'set_direct_map_invalid_noflush'?
Message-ID: <202410011619.OrLO2aeW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git execmem/x86-rox/v4
head:   c90f89d40fd21ce040b5cf1485ec6913d1b4ea5d
commit: 21ce3be90ca4d26a895b08de0d68fab4143f97d7 [7/8] execmem: add support for cache of large ROX pages
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20241001/202410011619.OrLO2aeW-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241001/202410011619.OrLO2aeW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410011619.OrLO2aeW-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/execmem.c: In function 'execmem_set_direct_map_valid':
   mm/execmem.c:48:36: error: 'struct vm_struct' has no member named 'page_order'
      48 |         unsigned int nr = (1U << vm->page_order);
         |                                    ^~
>> mm/execmem.c:53:23: error: implicit declaration of function 'set_direct_map_valid_noflush'; did you mean 'set_direct_map_invalid_noflush'? [-Wimplicit-function-declaration]
      53 |                 err = set_direct_map_valid_noflush(vm->pages[i], nr, valid);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                       set_direct_map_invalid_noflush
   mm/execmem.c: In function 'execmem_cache_add':
   mm/execmem.c:145:30: warning: variable 'upper_size' set but not used [-Wunused-but-set-variable]
     145 |         unsigned long upper, upper_size = 0;
         |                              ^~~~~~~~~~
   mm/execmem.c:144:30: warning: variable 'lower_size' set but not used [-Wunused-but-set-variable]
     144 |         unsigned long lower, lower_size = 0;
         |                              ^~~~~~~~~~


vim +53 mm/execmem.c

    44	
    45	static int execmem_set_direct_map_valid(struct vm_struct *vm, bool valid)
    46	{
    47		/* FIXME: build for !CONFIG_HAVE_ARCH_HUGE_VMALLOC */
  > 48		unsigned int nr = (1U << vm->page_order);
    49		unsigned int updated = 0;
    50		int err = 0;
    51	
    52		for (int i = 0; i < vm->nr_pages; i += nr) {
  > 53			err = set_direct_map_valid_noflush(vm->pages[i], nr, valid);
    54			if (err)
    55				goto err_restore;
    56			updated += nr;
    57		}
    58	
    59		return 0;
    60	
    61	err_restore:
    62		for (int i = 0; i < updated; i += nr)
    63			set_direct_map_valid_noflush(vm->pages[i], nr, !valid);
    64	
    65		return err;
    66	}
    67	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
