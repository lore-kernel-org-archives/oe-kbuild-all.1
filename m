Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9632B10E5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Feb 2025 05:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739856975; cv=none; b=K6yOLvZpmdUbD+hO/wiSie+57mhHEeOQ8ceSVHyaT68BplDgWRmd2OsaF3Mgaw+WBtB6Kwb4o7RNOZCgZM2/dg6ObOPcAtnr3JqDSJkBI6zVCkm7qLeMT2iFIVQi8XOea2IloUwECQOX7vug27uZmBY8GOe5oV9v4Mrf9Dii5Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739856975; c=relaxed/simple;
	bh=dTYeD0wVg8BPijl8PLb7FQl2FDKToBuxC8KoJT5E/nY=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cJH9GdjAb73HL7a+HTftdCBucybdq0Ya6rS6M3xKYlnFZqZr4Vur8RoaysP+QuetGPLC2S2Cumq0PrZq8KyEy3OwTvoXadDZtqybrP0O1WuArnsGz0m7v7BuN2A/wyC/mU88S1lDOz9H2B8VkqzuR/y/1TUTNQOpvYWRTDsbA/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wj6F2qrK; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wj6F2qrK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739856973; x=1771392973;
  h=date:from:cc:subject:message-id:mime-version;
  bh=dTYeD0wVg8BPijl8PLb7FQl2FDKToBuxC8KoJT5E/nY=;
  b=Wj6F2qrKKml1pHjRGFx/k1ymubgdLJrIvnYf5eiTCA0KIhcddz+Loba2
   +U82AUe7Iv4VU4UKCooeZG0nVzhaYi/t5wtCU9ldeklJPBBbWJ5FHJLqx
   VBj1FZ1TYS/Ks/ePHD7gTVqP0f2TTUfGE/h14306rwxiLkT53lBP8hunD
   Eet4SacexYU9BSZuphskfpsE4hAxGxzPByqjLsECILIAW1DjCuQ3Em/02
   9ZrJlTnLxidVJMjd1CQmoVkPAFYGX52WDN/KCrJufDpMdHTc0nywhJRdV
   +XrlzaNnHp4nDbjTpJg/SFdfVvZqbwBBZQrq4t+bBRbUINOwsmzX73Ta8
   A==;
X-CSE-ConnectionGUID: 81DwAx/ETsGJSNXfq8LaDw==
X-CSE-MsgGUID: xg7yDa9CRfiZzfUiU+Gk4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40675551"
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; 
   d="scan'208";a="40675551"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 21:36:13 -0800
X-CSE-ConnectionGUID: HafUAOr+RMGGYcb78M7Frg==
X-CSE-MsgGUID: uEUneNsTR6eeotbWRTXqZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114163763"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 17 Feb 2025 21:36:12 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkGHC-0000CZ-0J
	for oe-kbuild-all@lists.linux.dev;
	Tue, 18 Feb 2025 05:36:10 +0000
Date: Tue, 18 Feb 2025 13:35:23 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/57 1/1] fs/select.c:783: Error: unrecognized opcode
 `csrs sstatus,t1', extension `zicsr' required
Message-ID: <202502181316.9aozGMYc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git pr/57
head:   6fe7458ff80d33a5dba8b386c88d33ffd2ccb47d
commit: 00bf25d693e7f69497cb7f61d46ef99fe295a8a5 [1/1] y2038: use time32 syscall names on 32-bit
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20250218/202502181316.9aozGMYc-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250218/202502181316.9aozGMYc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502181316.9aozGMYc-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/select.c: Assembler messages:
   fs/select.c:1014: Error: unrecognized opcode `csrs sstatus,a1', extension `zicsr' required
   fs/select.c:1014: Error: unrecognized opcode `csrc sstatus,a1', extension `zicsr' required
>> fs/select.c:783: Error: unrecognized opcode `csrs sstatus,t1', extension `zicsr' required
>> fs/select.c:783: Error: unrecognized opcode `csrc sstatus,t1', extension `zicsr' required
   fs/select.c:784: Error: unrecognized opcode `csrs sstatus,t1', extension `zicsr' required
   fs/select.c:784: Error: unrecognized opcode `csrc sstatus,t1', extension `zicsr' required
   fs/select.c:803: Error: unrecognized opcode `csrs sstatus,t1', extension `zicsr' required
   fs/select.c:803: Error: unrecognized opcode `csrc sstatus,t1', extension `zicsr' required
   fs/select.c:804: Error: unrecognized opcode `csrs sstatus,t1', extension `zicsr' required
   fs/select.c:804: Error: unrecognized opcode `csrc sstatus,t1', extension `zicsr' required


vim +783 fs/select.c

9f72949f679df0 David Woodhouse 2006-01-18  767  
9f72949f679df0 David Woodhouse 2006-01-18  768  /*
9f72949f679df0 David Woodhouse 2006-01-18  769   * Most architectures can't handle 7-argument syscalls. So we provide a
9f72949f679df0 David Woodhouse 2006-01-18  770   * 6-argument version where the sixth argument is a pointer to a structure
9f72949f679df0 David Woodhouse 2006-01-18  771   * which has a pointer to the sigset_t itself followed by a size_t containing
9f72949f679df0 David Woodhouse 2006-01-18  772   * the sigset size.
9f72949f679df0 David Woodhouse 2006-01-18  773   */
d4e82042c4cfa8 Heiko Carstens  2009-01-14  774  SYSCALL_DEFINE6(pselect6, int, n, fd_set __user *, inp, fd_set __user *, outp,
e024707bccae15 Deepa Dinamani  2018-09-19  775  		fd_set __user *, exp, struct __kernel_timespec __user *, tsp,
d4e82042c4cfa8 Heiko Carstens  2009-01-14  776  		void __user *, sig)
9f72949f679df0 David Woodhouse 2006-01-18  777  {
9f72949f679df0 David Woodhouse 2006-01-18  778  	size_t sigsetsize = 0;
9f72949f679df0 David Woodhouse 2006-01-18  779  	sigset_t __user *up = NULL;
9f72949f679df0 David Woodhouse 2006-01-18  780  
9f72949f679df0 David Woodhouse 2006-01-18  781  	if (sig) {
96d4f267e40f95 Linus Torvalds  2019-01-03  782  		if (!access_ok(sig, sizeof(void *)+sizeof(size_t))
e110ab94ebc714 Al Viro         2006-02-01 @783  		    || __get_user(up, (sigset_t __user * __user *)sig)
9f72949f679df0 David Woodhouse 2006-01-18  784  		    || __get_user(sigsetsize,
e110ab94ebc714 Al Viro         2006-02-01  785  				(size_t __user *)(sig+sizeof(void *))))
9f72949f679df0 David Woodhouse 2006-01-18  786  			return -EFAULT;
9f72949f679df0 David Woodhouse 2006-01-18  787  	}
9f72949f679df0 David Woodhouse 2006-01-18  788  
e024707bccae15 Deepa Dinamani  2018-09-19  789  	return do_pselect(n, inp, outp, exp, tsp, up, sigsetsize, PT_TIMESPEC);
9f72949f679df0 David Woodhouse 2006-01-18  790  }
9f72949f679df0 David Woodhouse 2006-01-18  791  

:::::: The code at line 783 was first introduced by commit
:::::: e110ab94ebc714de57f75f0c7c576dde8cf80944 [PATCH] fix __user annotations in fs/select.c

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
