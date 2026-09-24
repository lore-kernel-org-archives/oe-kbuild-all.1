Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA4C3CBE89
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Sep 2026 14:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790260227; cv=none; b=Nyrlnv92g5IAKy8YH1m5MQ7orkdGI2ru2+zTde+BR67qsda8qT5slUs9ux7hQLC9edwYvtJK4CXE05SZeHm8zRJVsNpF3+xesy0Bzc0peyp62ytSlnGFLRJ6qGaYCzs9rIgwa47Mnhwj+Sho3ha+aOi9662z/ODAEqLisQhzHAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790260227; c=relaxed/simple;
	bh=0pUe3Xd6rCk2mQG6Ewe1CtK0oMmo45Z2/RmYYxm1e9E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WzPbt+RrbZMDGx8k8k5wh69eEaek4yjWvh28VT4ZsIPOb4QO13mjB5yLXuJ/Vz3a4wAUBYBjiQwy5Y+ZyfsDTTLN5fMwXjZQn2GWCpneV5kVT/m4x2V0ooGsLA7qhYc3qJQ7RSnRHgzq/leEqFxw7dBntSI8fd2EokQA5YWgCqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dbe4asaY; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dbe4asaY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790260225; x=1821796225;
  h=date:from:to:cc:subject:message-id;
  bh=0pUe3Xd6rCk2mQG6Ewe1CtK0oMmo45Z2/RmYYxm1e9E=;
  b=dbe4asaY+eF9rAYVZyvUYAEhxKuR8v3vizibMJyJQk5S7cOKh9l/88WS
   2T5E5kmJGrZxRnGgrv5NTBvrVIpz9E43N+EKA2SUtHMi5fOfc73EbKyvz
   J73AU3Bg5zM2HOgkiqlNp3ErFiKBaDM54hJH+bk4QYCdy17+i3eE9Kc8o
   2VqpYDOLpxKVFLq0KX3TXqTKseGXqz2/QxeySj/n+yYpzD/1dskVfGypl
   OJsPA+GT8wJeTMMBe74zZLbJkUudQdqg3pytxY1IDWajSLTe4BseveBIa
   XrqOUct/d/uHydfIA6ec7S1XrZpsNIGS7Q3tFJBOyEul+UqxsvUMb6OGr
   Q==;
X-CSE-ConnectionGUID: Bsg8eyrRTui/xqo7dDDsbA==
X-CSE-MsgGUID: YQcTeEK7RUq/HRO28W+q9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="101611870"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="101611870"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 07:30:25 -0700
X-CSE-ConnectionGUID: WXJZ2YoBTFGeUJ38SQ6OzA==
X-CSE-MsgGUID: rPGBVcbfSoWs1ExPLNahdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="311961112"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 24 Sep 2026 07:30:23 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9kSr-000000000LS-2WWF;
	Thu, 24 Sep 2026 14:30:21 +0000
Date: Thu, 24 Sep 2026 16:29:34 +0200
From: kernel test robot <lkp@intel.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: include/linux/pgtable.h:493:21: error: conflicting types for
 'ptep_get'; have 'pte_t(pte_t *)'
Message-ID: <202609241639.Lqps1A4Q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Anshuman-Khandual/s390-mm-Drop-all-pxdp_get/20260923-100220
head:   b212352b7f2fdd6516ee447704e5e31fde0c2a8d
commit: 85ab0e85fd6ebe9757f9ba20e039988b46c03efb s390/mm: Drop all pxdp_get()
date:   34 hours ago
config: s390-randconfig-2000-20260924 (https://download.01.org/0day-ci/archive/20260924/202609241639.Lqps1A4Q-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609241639.Lqps1A4Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609241639.Lqps1A4Q-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/s390/kernel/asm-offsets.c:12:
>> include/linux/pgtable.h:493:21: error: conflicting types for 'ptep_get'; have 'pte_t(pte_t *)'
     493 | static inline pte_t ptep_get(pte_t *ptep)
         |                     ^~~~~~~~
   In file included from include/linux/pgtable.h:6:
   arch/s390/include/asm/pgtable.h:28:21: note: previous declaration of 'ptep_get' with type 'pte_t(const pte_t *)'
      28 | static inline pte_t ptep_get(const pte_t *ptep);
         |                     ^~~~~~~~
>> include/linux/pgtable.h:507:21: error: conflicting types for 'pudp_get'; have 'pud_t(pud_t *)'
     507 | static inline pud_t pudp_get(pud_t *pudp)
         |                     ^~~~~~~~
   arch/s390/include/asm/pgtable.h:29:21: note: previous declaration of 'pudp_get' with type 'pud_t(const pud_t *)'
      29 | static inline pud_t pudp_get(const pud_t *pudp);
         |                     ^~~~~~~~
>> include/linux/pgtable.h:514:21: error: conflicting types for 'p4dp_get'; have 'p4d_t(p4d_t *)'
     514 | static inline p4d_t p4dp_get(p4d_t *p4dp)
         |                     ^~~~~~~~
   arch/s390/include/asm/pgtable.h:30:21: note: previous declaration of 'p4dp_get' with type 'p4d_t(const p4d_t *)'
      30 | static inline p4d_t p4dp_get(const p4d_t *p4dp);
         |                     ^~~~~~~~
>> include/linux/pgtable.h:521:21: error: conflicting types for 'pgdp_get'; have 'pgd_t(pgd_t *)'
     521 | static inline pgd_t pgdp_get(pgd_t *pgdp)
         |                     ^~~~~~~~
   arch/s390/include/asm/pgtable.h:31:21: note: previous declaration of 'pgdp_get' with type 'pgd_t(const pgd_t *)'
      31 | static inline pgd_t pgdp_get(const pgd_t *pgdp);
         |                     ^~~~~~~~
>> arch/s390/include/asm/pgtable.h:28:21: warning: 'ptep_get' used but never defined
      28 | static inline pte_t ptep_get(const pte_t *ptep);
         |                     ^~~~~~~~
>> arch/s390/include/asm/pgtable.h:29:21: warning: 'pudp_get' used but never defined
      29 | static inline pud_t pudp_get(const pud_t *pudp);
         |                     ^~~~~~~~
>> arch/s390/include/asm/pgtable.h:30:21: warning: 'p4dp_get' used but never defined
      30 | static inline p4d_t p4dp_get(const p4d_t *p4dp);
         |                     ^~~~~~~~
>> arch/s390/include/asm/pgtable.h:31:21: warning: 'pgdp_get' used but never defined
      31 | static inline pgd_t pgdp_get(const pgd_t *pgdp);
         |                     ^~~~~~~~
   make[3]: *** [scripts/Makefile.build:185: arch/s390/kernel/asm-offsets.s] Error 1 shuffle=1039089513
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1425: prepare0] Error 2 shuffle=1039089513
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=1039089513
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=1039089513
   make: Target 'prepare' not remade because of errors.


vim +493 include/linux/pgtable.h

^1da177e4c3f41 include/asm-generic/pgtable.h Linus Torvalds  2005-04-16  491  
6c1d2a073a1d85 include/linux/pgtable.h       Ryan Roberts    2023-06-12  492  #ifndef ptep_get
6c1d2a073a1d85 include/linux/pgtable.h       Ryan Roberts    2023-06-12 @493  static inline pte_t ptep_get(pte_t *ptep)
6c1d2a073a1d85 include/linux/pgtable.h       Ryan Roberts    2023-06-12  494  {
6c1d2a073a1d85 include/linux/pgtable.h       Ryan Roberts    2023-06-12  495  	return READ_ONCE(*ptep);
6c1d2a073a1d85 include/linux/pgtable.h       Ryan Roberts    2023-06-12  496  }
6c1d2a073a1d85 include/linux/pgtable.h       Ryan Roberts    2023-06-12  497  #endif
6c1d2a073a1d85 include/linux/pgtable.h       Ryan Roberts    2023-06-12  498  
6c1d2a073a1d85 include/linux/pgtable.h       Ryan Roberts    2023-06-12  499  #ifndef pmdp_get
6c1d2a073a1d85 include/linux/pgtable.h       Ryan Roberts    2023-06-12  500  static inline pmd_t pmdp_get(pmd_t *pmdp)
6c1d2a073a1d85 include/linux/pgtable.h       Ryan Roberts    2023-06-12  501  {
6c1d2a073a1d85 include/linux/pgtable.h       Ryan Roberts    2023-06-12  502  	return READ_ONCE(*pmdp);
6c1d2a073a1d85 include/linux/pgtable.h       Ryan Roberts    2023-06-12  503  }
6c1d2a073a1d85 include/linux/pgtable.h       Ryan Roberts    2023-06-12  504  #endif
6c1d2a073a1d85 include/linux/pgtable.h       Ryan Roberts    2023-06-12  505  
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti 2023-12-13  506  #ifndef pudp_get
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti 2023-12-13 @507  static inline pud_t pudp_get(pud_t *pudp)
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti 2023-12-13  508  {
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti 2023-12-13  509  	return READ_ONCE(*pudp);
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti 2023-12-13  510  }
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti 2023-12-13  511  #endif
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti 2023-12-13  512  
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti 2023-12-13  513  #ifndef p4dp_get
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti 2023-12-13 @514  static inline p4d_t p4dp_get(p4d_t *p4dp)
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti 2023-12-13  515  {
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti 2023-12-13  516  	return READ_ONCE(*p4dp);
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti 2023-12-13  517  }
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti 2023-12-13  518  #endif
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti 2023-12-13  519  
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti 2023-12-13  520  #ifndef pgdp_get
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti 2023-12-13 @521  static inline pgd_t pgdp_get(pgd_t *pgdp)
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti 2023-12-13  522  {
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti 2023-12-13  523  	return READ_ONCE(*pgdp);
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti 2023-12-13  524  }
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti 2023-12-13  525  #endif
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti 2023-12-13  526  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
