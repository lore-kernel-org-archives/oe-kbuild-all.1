Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A33238331E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 03:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779332580; cv=none; b=gXVVLKd38Hb5IZrpmdAb3DFoTbcEStsuob+f5Kfmlv+sW5GRKDUo8BINMoJoEIPAJsZ2VzIHdReR480C1VZWDAqDQR2XnuFpOt2kIt0jKHMZhdlkNfqee6VtKJIScI3mkKFXpefEAM28aH/nXqAdHKo387iDrn0TdA21Erj8P9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779332580; c=relaxed/simple;
	bh=AJ1eDyA6KlRDL00ELJ2BjGUp2WhMdvVIeVDerNZeMqQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oVusUZmah4ITJsMpLYJKnqeVqzlz10mX5pfLpwVAWyCN6f3MDBHm75nAjGa20RLQ3R4tgpCcnuRN7o6I+gq2fQImOTE/Nl5BC2iR/FYrFqWDDspoZ2cBgtsXc/wtmUIDNTj8RP1t4l1hhilv+HXvSGt3mnhfDDQNcvKTz4MIf6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZVKgZn+a; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZVKgZn+a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779332579; x=1810868579;
  h=date:from:to:cc:subject:message-id;
  bh=AJ1eDyA6KlRDL00ELJ2BjGUp2WhMdvVIeVDerNZeMqQ=;
  b=ZVKgZn+a6uLD1DKi2KTxDOXIRtOyPVrUVNlVv77J5w8OvRdMAm4kipBv
   du72MzrpVbqwHaeZEF5UQ+9fLL/IBHxDU1v/ealDdYvbLFPr9QX8grB+2
   v9mbSEnNC0n154Oplhajh0v4u11O/zPNiiHqU3H45orn5XsFE7/fFbr9Z
   xuLcJBKnR92hDC+kGAmxCZuDUIuHwhqXDeSZxySF53+Tq5iNwYfaaUe6U
   J+Cl8j1UcYjVFDs2dnboUM4OT/IdNn0MnnurkfrvEU+Hurabnz8hqf/Fs
   XQyYW4FRjFdtq9QlrozpUduP45uGmstXM5BlCukul5/RGzES8aHhPnM6V
   Q==;
X-CSE-ConnectionGUID: C9opTa2NRqmSqbxKPCIweg==
X-CSE-MsgGUID: Erzr2AakSQumbPXPvDIglw==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="91718368"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="91718368"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 20:02:59 -0700
X-CSE-ConnectionGUID: X6KJ4zDJRMSsI4/WnEQx9g==
X-CSE-MsgGUID: D4dV9Dz/RqqQBqMxITSuCQ==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 20 May 2026 20:02:56 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPtfr-000000004H7-1FDB;
	Thu, 21 May 2026 03:02:25 +0000
Date: Thu, 21 May 2026 11:01:12 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Ehrhardt <christian.ehrhardt@codasip.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 540/1130]
 mm/mmap.c:650:22: error: implicit declaration of function 'PROT_MAX_EXTRACT'
Message-ID: <202605211047.uUrFQZPd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: e675dc2eb5a9a8477d4c5b22eb677c77690f7540 [540/1130] [CHERRY-PICK] mm/mmap: Add capability permission constraints for PCuABI
config: xtensa-allnoconfig (https://download.01.org/0day-ci/archive/20260521/202605211047.uUrFQZPd-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605211047.uUrFQZPd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605211047.uUrFQZPd-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/mmap.c: In function 'ksys_mmap_pgoff':
>> mm/mmap.c:650:22: error: implicit declaration of function 'PROT_MAX_EXTRACT' [-Wimplicit-function-declaration]
     650 |                 if ((PROT_MAX_EXTRACT(prot) != 0) &&
         |                      ^~~~~~~~~~~~~~~~
>> mm/mmap.c:651:23: error: implicit declaration of function 'PROT_EXTRACT'; did you mean 'PROT_EXEC'? [-Wimplicit-function-declaration]
     651 |                     ((PROT_EXTRACT(prot) & PROT_MAX_EXTRACT(prot)) != PROT_EXTRACT(prot)))
         |                       ^~~~~~~~~~~~
         |                       PROT_EXEC


vim +/PROT_MAX_EXTRACT +650 mm/mmap.c

   603	
   604	user_uintptr_t ksys_mmap_pgoff(user_uintptr_t user_ptr, unsigned long len,
   605				      unsigned long prot, unsigned long flags,
   606				      unsigned long fd, unsigned long pgoff)
   607	{
   608		struct file *file = NULL;
   609		user_uintptr_t retval = -EINVAL;
   610		ptraddr_t addr = (ptraddr_t)user_ptr;
   611	
   612		if (!(flags & MAP_ANONYMOUS)) {
   613			audit_mmap_fd(fd, flags);
   614			file = fget(fd);
   615			if (!file)
   616				return -EBADF;
   617			if (is_file_hugepages(file)) {
   618				len = ALIGN(len, huge_page_size(hstate_file(file)));
   619			} else if (unlikely(flags & MAP_HUGETLB)) {
   620				retval = -EINVAL;
   621				goto out_fput;
   622			}
   623		} else if (flags & MAP_HUGETLB) {
   624			struct hstate *hs;
   625	
   626			hs = hstate_sizelog((flags >> MAP_HUGE_SHIFT) & MAP_HUGE_MASK);
   627			if (!hs)
   628				return -EINVAL;
   629	
   630			len = ALIGN(len, huge_page_size(hs));
   631			/*
   632			 * VM_NORESERVE is used because the reservations will be
   633			 * taken when vm_ops->mmap() is called
   634			 */
   635			file = hugetlb_file_setup(HUGETLB_ANON_FILE, len,
   636					VM_NORESERVE,
   637					HUGETLB_ANONHUGE_INODE,
   638					(flags >> MAP_HUGE_SHIFT) & MAP_HUGE_MASK);
   639			if (IS_ERR(file))
   640				return PTR_ERR(file);
   641		}
   642	
   643		/*
   644		 * Introduce additional checks for PCuABI:
   645		 * - The PCuABI reservation model introduces the concept of maximum
   646		 *   protection mappings can have. Add a check to make sure the
   647		 *   requested protection does not exceed the maximum protection.
   648		 */
   649		if (reserv_is_supported(current->mm)) {
 > 650			if ((PROT_MAX_EXTRACT(prot) != 0) &&
 > 651			    ((PROT_EXTRACT(prot) & PROT_MAX_EXTRACT(prot)) != PROT_EXTRACT(prot)))
   652				goto out_fput;
   653		}
   654		retval = check_pcuabi_map_ptr_arg(user_ptr, len, flags & MAP_FIXED, false);
   655		if (retval)
   656			goto out_fput;
   657	
   658		retval = vm_mmap_pgoff(file, addr, len, prot, flags, pgoff);
   659		if (!IS_ERR_VALUE(retval) && reserv_is_supported(current->mm)) {
   660			if (user_ptr_is_valid((const void __user *)user_ptr))
   661				retval = user_ptr;
   662			else
   663				retval = reserv_make_user_ptr_owning((ptraddr_t)retval,
   664								     false);
   665		}
   666	out_fput:
   667		if (file)
   668			fput(file);
   669		return retval;
   670	}
   671	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
