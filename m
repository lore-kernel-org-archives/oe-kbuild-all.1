Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF242E0B55
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Jul 2025 16:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753115093; cv=none; b=DrSTddsCgQyhQ0OPFmL4k+nls4i05JEl8PTQTRng6kQjpG0xPCH30MkNaHfXWLFZCLxBeMI1IJnudnaZCN9hw0XSpicLJ3fk10HcTj5F/Lqk8QUAkg/VcyjEf17sT1gkwomN/gQd6OWJsSMHq7HIs4LFHmwAnmyzWoUtIPPoRzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753115093; c=relaxed/simple;
	bh=ulPiMzfRsIhp+MUZEcWDc1Iayqk5CVMBCvD2uAl0vKo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CRLJjVN/XEgxR1DvF4rURxg7HCTNOteLbgIy9iljwWr2Oqh7gjy88CfKwBx/GNwRYXU2K/LjwxabpgacOIL1nb8ZLcdc0uuWTX/6+O8bsejBnb0IaJzIdB5b0fP4hcFgwdDCpljcbDMNHvZbi+ku+6njBObfFxo80/yk6C5FUoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=misgt/FW; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="misgt/FW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753115091; x=1784651091;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ulPiMzfRsIhp+MUZEcWDc1Iayqk5CVMBCvD2uAl0vKo=;
  b=misgt/FWKTlOcexwDL7wgFkQAnFL3IoBSrl2Pi8jEGMir8fi1+NbI/UR
   8Ir9CP82owsLjTMfm4xxbSr7ue8mNtqXAnFkGywSCLG45Djb6DR5Jukly
   VMhR49QpW23UDpPX21OApaCUsMAGuksSAJt0miPGGpNFPd/X13+nHCb1j
   f0oI0k3CR9bCecSmTYJr6u8rOSeDjokg8uu9f0714oJPGg0XIJFcOMGvF
   mcIFhn7qE1zIa0BHl7fo/8GNubb/4JGqrbuAPxmGjLwC7GOZ0/T/cwUN1
   EIRTiRvx50SQ1IgifrEmZ2wM6GwgJ80qcn7weoVwDRH+rHcq+9M91+Iki
   g==;
X-CSE-ConnectionGUID: L/3iU7wMRoyPsHhi6rtR9w==
X-CSE-MsgGUID: y+Z3azs7TSSrR4XnY9toaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="72791476"
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="72791476"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 09:24:51 -0700
X-CSE-ConnectionGUID: 71veCsrJTKei/h4UK7VLLw==
X-CSE-MsgGUID: tejib78PRv6LwuBrwDemHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="158184601"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 21 Jul 2025 09:24:49 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udtJn-000GyR-0l;
	Mon, 21 Jul 2025 16:24:47 +0000
Date: Tue, 22 Jul 2025 00:24:41 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Peng Zhang <zhangpeng362@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2562/2562] include/linux/userfaultfd_k.h:66:45:
 sparse: sparse: restricted uffd_flags_t degrades to integer
Message-ID: <202507220023.Kuq6r4En-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   7fdbd961485c204422c001cf39400983c5ee9265
commit: 0214feb8f616acf62f9a6a2a131f0a1479b2b8af [2562/2562] mm/userswap: introduce UFFDIO_COPY_MODE_DIRECT_MAP
config: x86_64-randconfig-123-20250721 (https://download.01.org/0day-ci/archive/20250722/202507220023.Kuq6r4En-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250722/202507220023.Kuq6r4En-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507220023.Kuq6r4En-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/userfaultfd.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in 'mfill_atomic_install_pte' - unexpected unlock
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in 'mfill_atomic_pte_zeropage' - unexpected unlock
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in 'mfill_atomic_pte_poison' - unexpected unlock
   mm/userfaultfd.c: note: in included file:
>> include/linux/userfaultfd_k.h:66:45: sparse: sparse: restricted uffd_flags_t degrades to integer
>> include/linux/userfaultfd_k.h:67:32: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted uffd_flags_t [usertype] flags @@     got unsigned int enum mfill_atomic_mode mode @@
   include/linux/userfaultfd_k.h:67:32: sparse:     expected restricted uffd_flags_t [usertype] flags
   include/linux/userfaultfd_k.h:67:32: sparse:     got unsigned int enum mfill_atomic_mode mode
>> include/linux/userfaultfd_k.h:66:45: sparse: sparse: restricted uffd_flags_t degrades to integer
>> include/linux/userfaultfd_k.h:67:32: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted uffd_flags_t [usertype] flags @@     got unsigned int enum mfill_atomic_mode mode @@
   include/linux/userfaultfd_k.h:67:32: sparse:     expected restricted uffd_flags_t [usertype] flags
   include/linux/userfaultfd_k.h:67:32: sparse:     got unsigned int enum mfill_atomic_mode mode
>> include/linux/userfaultfd_k.h:66:45: sparse: sparse: restricted uffd_flags_t degrades to integer
>> include/linux/userfaultfd_k.h:67:32: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted uffd_flags_t [usertype] flags @@     got unsigned int enum mfill_atomic_mode mode @@
   include/linux/userfaultfd_k.h:67:32: sparse:     expected restricted uffd_flags_t [usertype] flags
   include/linux/userfaultfd_k.h:67:32: sparse:     got unsigned int enum mfill_atomic_mode mode
>> include/linux/userfaultfd_k.h:66:45: sparse: sparse: restricted uffd_flags_t degrades to integer
>> include/linux/userfaultfd_k.h:67:32: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted uffd_flags_t [usertype] flags @@     got unsigned int enum mfill_atomic_mode mode @@
   include/linux/userfaultfd_k.h:67:32: sparse:     expected restricted uffd_flags_t [usertype] flags
   include/linux/userfaultfd_k.h:67:32: sparse:     got unsigned int enum mfill_atomic_mode mode

vim +66 include/linux/userfaultfd_k.h

    63	
    64	static inline uffd_flags_t uffd_flags_set_mode(uffd_flags_t flags, enum mfill_atomic_mode mode)
    65	{
  > 66		if (IS_ENABLED(CONFIG_USERSWAP) && (flags & MFILL_ATOMIC_DIRECT_MAP) &&
  > 67		    uffd_flags_mode_is(mode, MFILL_ATOMIC_COPY))
    68			mode = MFILL_ATOMIC_DIRECT_MAP;
    69	
    70		flags &= ~MFILL_ATOMIC_MODE_MASK;
    71		return flags | ((__force uffd_flags_t) mode);
    72	}
    73	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
