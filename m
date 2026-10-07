Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8F072602
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Oct 2026 01:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791338182; cv=none; b=GbXcj5VelsyecXycglZ0BBSA66gMuECfh1Hwm3id4VUoPjMbW87ZZWm9KNZ5EBzOxSEh/2NgwZLuoh1iPQz444ggKchXbxc5CnTcbLnPaO/PdEboMsMECEd/4ix4RD6J1nuxPVfklZBiKgZJ1+84aTnr/i/wCl+UUTgSP3kyf7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791338182; c=relaxed/simple;
	bh=1vEjXeQHX5MRCYVwccV9XlLHh52/YriK1f4K9Fl6ADw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ci4U3M6igzFtpCFjWICFJTrW83sW4WcteGbjURCy2H/dEJd8MMOWJydzj6eSDP9fPFT2RKj0GlpPIWJ3Sl4IfSJ7Ch1gjQZIUkYfiEGnUVXu35jaOoG9sESf9CGiGGEYlciQNC0Ge+n+JVzaz7E5rDTrb9ZBJ3s7/yISf0I21A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dbipaJ/M; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dbipaJ/M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791338180; x=1822874180;
  h=date:from:to:cc:subject:message-id;
  bh=1vEjXeQHX5MRCYVwccV9XlLHh52/YriK1f4K9Fl6ADw=;
  b=dbipaJ/MidtnqXkCWeBD0bJNP5ofgjHhu/9jYNHJS+ER80r7rKlgp7K9
   swtyiZVSH5EavoS0B8uAGPiOhOJ3+pttBkwLFqDF0d2oVM3aSsyV/HZJG
   JHRRxWuJLR/Y6giRPWb2HFVWgHLB80FQ4oiWy87m9PRGXtRtAxzwFLnoc
   7+th7O07Gmj2XW+E3WppwKDWTMkp8KJC0S24H5c7XOOZ7ANb1tbjMiCGV
   uhP1BxKXdT1fArDlQGH8zeDy/86W0z0un8icQb3SiyUGHy02qUY9LkUR+
   3vFnQMbTmTqx+L6MTqHSjrm9hHreYJMZwFwUqnSPKceJrUSD191BH9GB5
   Q==;
X-CSE-ConnectionGUID: 3FVHq5RETAOsQyG7JSbPHg==
X-CSE-MsgGUID: GEchZytfTyaekr7l0s9tvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="102620129"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="102620129"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 18:56:14 -0700
X-CSE-ConnectionGUID: rSpuvyWqQhudtdqjYavS/w==
X-CSE-MsgGUID: N5k+a49eTkC0WlvgHdMgDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="315336232"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 06 Oct 2026 18:56:12 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEGt7-000000002HH-3BsE;
	Wed, 07 Oct 2026 01:56:09 +0000
Date: Wed, 07 Oct 2026 03:55:12 +0200
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:work.mount.gp_on_demand.proposal 22/29]
 fs/nullfs.c:57:17: error: call to undeclared function 'iov_iter_count'; ISO
 C99 and later do not support implicit function declarations
Message-ID: <202610070352.WxyULQzi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/brauner/linux.git work.mount.gp_on_demand.proposal
head:   e59665003f3099d261a6dea7420c5b2a7d0ce4c1
commit: 1a5353e584154c66d8d8c520f0ae4cea9fd18195 [22/29] fixup! nullfs: add an empty immutable regular file
config: um-randconfig-r2309-20261006 (https://download.01.org/0day-ci/archive/20261007/202610070352.WxyULQzi-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610070352.WxyULQzi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610070352.WxyULQzi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/nullfs.c:4:
   In file included from include/linux/fs_context.h:14:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:33:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> fs/nullfs.c:57:17: error: call to undeclared function 'iov_iter_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      57 |         size_t count = iov_iter_count(from);
         |                        ^
>> fs/nullfs.c:59:2: error: call to undeclared function 'iov_iter_advance'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      59 |         iov_iter_advance(from, count);
         |         ^
   fs/nullfs.c:59:2: note: did you mean 'bvec_iter_advance'?
   include/linux/bvec.h:195:20: note: 'bvec_iter_advance' declared here
     195 | static inline bool bvec_iter_advance(const struct bio_vec *bv,
         |                    ^
   1 warning and 2 errors generated.


vim +/iov_iter_count +57 fs/nullfs.c

    54	
    55	static ssize_t nullfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
    56	{
  > 57		size_t count = iov_iter_count(from);
    58	
  > 59		iov_iter_advance(from, count);
    60		return count;
    61	}
    62	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
