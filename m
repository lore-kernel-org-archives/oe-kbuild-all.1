Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF119329C4F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Oct 2025 15:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761837130; cv=none; b=IYYzuHl2VgYnXp3VDYdMrDuLL8/ASHJ1ZyorbUNeBdOPUAnizoABYsgGFEZq611ZLkOkpnIxCMkEVdUTvqEUr8CBfBlKEE8uKVaOLjRYvgog49STNQ+IvvhuOUd9ZuBfodNaEkHymr52ZzBxYx/V6cqi0DvoqBy3JVjmnoYFaL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761837130; c=relaxed/simple;
	bh=TIS1MiElP5OM6fcYidZ6m8m2EFXdoPQbCHZ5pQawVEs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l/jDbRdv/QFG8ALq4mzSae2SizrfbSNbbTOUcincu43FDBCww2L1tZT9Qy8brkoSsTTG6mlQ40dIzrXhTpL/nQjS+eN7aJCqSQ6NjIKrjig0YNIhwDaE9SLIhLLcWAfCZK801vAFWx42G6jtItC3XN/RnB2XTA+BfqO8oUHF2pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GsOHUrW6; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GsOHUrW6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761837129; x=1793373129;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TIS1MiElP5OM6fcYidZ6m8m2EFXdoPQbCHZ5pQawVEs=;
  b=GsOHUrW6d03okoDyHhBKAIY+AC/YiBRBEg9KMoDr900GPKjWjlD2QVwN
   GyPwnDMvc5Q5VQH4WjM3GtQyO3i+pkAIfWyBbgSiXxzmaflVumIk/Ut3M
   /cCuJCLE1wTlWgkHTDUugPtuCqdfDlcMb68mDJTVFYnmGmoUJydO08dSN
   bz0jBCM9uWKNJpDDQVXTB0ebLuOXdF0FoW4XoU/fsIJO4Cbo2KGvS0Ug/
   gBs/61H09WZKcUGnd5rpZZBxSSS1X7cf67JHSDrmUbkpFe4H0GtO9vQcC
   OOuJrmvVCh89TLdl4xLd0dwquSq6wAXuib4LCTVdeKCkMyvHFNgM4WW2U
   A==;
X-CSE-ConnectionGUID: 3/caTxwQSgameCLfc7z3kA==
X-CSE-MsgGUID: ueEdwPMfRcm6RuPBojK7lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63910500"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63910500"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 08:12:09 -0700
X-CSE-ConnectionGUID: rNp8E5bdQcyX8U4hhDl+2Q==
X-CSE-MsgGUID: wZl7ybsuR9yHR9oY10ztOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="186072696"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 30 Oct 2025 08:12:07 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEUJ9-000M8O-1B;
	Thu, 30 Oct 2025 15:11:42 +0000
Date: Thu, 30 Oct 2025 23:09:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:must-be-lval 38/57] include/linux/minmax.h:308:41: error:
 lvalue required as left operand of assignment
Message-ID: <202510302312.SCa44Ybk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git must-be-lval
head:   ddd6ff4d1945e2040067848741c3e94855fd43c7
commit: 6d0e01538bf8aa880118f706ea96e92d3df34fab [38/57] lib/test_lvalues.c: test __lvalue() atal
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20251030/202510302312.SCa44Ybk-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510302312.SCa44Ybk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510302312.SCa44Ybk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/ioport.h:15,
                    from include/linux/acpi.h:12,
                    from lib/test_lvalue.c:5:
   lib/test_lvalue.c: In function 'test_lvalue_macros':
>> include/linux/minmax.h:308:41: error: lvalue required as left operand of assignment
     308 |         do { typeof(a) __tmp = (a); (a) = (b); (b) = __tmp; } while (0)
         |                                         ^
   lib/test_lvalue.c:13:9: note: in expansion of macro 'swap'
      13 |         swap(1, 2);
         |         ^~~~
   include/linux/minmax.h:308:52: error: lvalue required as left operand of assignment
     308 |         do { typeof(a) __tmp = (a); (a) = (b); (b) = __tmp; } while (0)
         |                                                    ^
   lib/test_lvalue.c:13:9: note: in expansion of macro 'swap'
      13 |         swap(1, 2);
         |         ^~~~
   In file included from include/linux/uidgid.h:16,
                    from include/linux/kernfs.h:18,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/energy_model.h:7,
                    from include/linux/device.h:16,
                    from include/linux/acpi.h:14:
>> include/linux/highuid.h:70:38: error: lvalue required as left operand of assignment
      70 | #define SET_UID(var, uid) do { (var) = __convert_uid(sizeof(var), (uid)); } while (0)
         |                                      ^
   lib/test_lvalue.c:14:9: note: in expansion of macro 'SET_UID'
      14 |         SET_UID(1, 1);
         |         ^~~~~~~
   In file included from include/acpi/acpi.h:22,
                    from include/linux/acpi.h:26:
   include/acpi/platform/acenv.h:248:60: error: lvalue required as left operand of assignment
     248 | #define ACPI_ACQUIRE_GLOBAL_LOCK(Glptr, acquired) acquired = 1
         |                                                            ^
   lib/test_lvalue.c:15:9: note: in expansion of macro 'ACPI_ACQUIRE_GLOBAL_LOCK'
      15 |         ACPI_ACQUIRE_GLOBAL_LOCK(NULL, 1);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from lib/test_lvalue.c:8:
>> lib/test_lvalue.c:16:26: error: passing argument 3 of 'pci_get_device' makes pointer from integer without a cast [-Wint-conversion]
      16 |         for_each_pci_dev(1);
         |                          ^
         |                          |
         |                          int
   include/linux/pci.h:576:80: note: in definition of macro 'for_each_pci_dev'
     576 | #define for_each_pci_dev(d) while ((d = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, d)) != NULL)
         |                                                                                ^
   include/linux/pci.h:1236:48: note: expected 'struct pci_dev *' but argument is of type 'int'
    1236 |                                struct pci_dev *from);
         |                                ~~~~~~~~~~~~~~~~^~~~
>> include/linux/pci.h:576:39: error: lvalue required as left operand of assignment
     576 | #define for_each_pci_dev(d) while ((d = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, d)) != NULL)
         |                                       ^
   lib/test_lvalue.c:16:9: note: in expansion of macro 'for_each_pci_dev'
      16 |         for_each_pci_dev(1);
         |         ^~~~~~~~~~~~~~~~


vim +308 include/linux/minmax.h

f9bff0e31881d0 Matthew Wilcox (Oracle  2023-08-02  285) 
f9bff0e31881d0 Matthew Wilcox (Oracle  2023-08-02  286) /**
f9bff0e31881d0 Matthew Wilcox (Oracle  2023-08-02  287)  * in_range - Determine if a value lies within a range.
f9bff0e31881d0 Matthew Wilcox (Oracle  2023-08-02  288)  * @val: Value to test.
f9bff0e31881d0 Matthew Wilcox (Oracle  2023-08-02  289)  * @start: First value in range.
f9bff0e31881d0 Matthew Wilcox (Oracle  2023-08-02  290)  * @len: Number of values in range.
f9bff0e31881d0 Matthew Wilcox (Oracle  2023-08-02  291)  *
f9bff0e31881d0 Matthew Wilcox (Oracle  2023-08-02  292)  * This is more efficient than "if (start <= val && val < (start + len))".
f9bff0e31881d0 Matthew Wilcox (Oracle  2023-08-02  293)  * It also gives a different answer if @start + @len overflows the size of
f9bff0e31881d0 Matthew Wilcox (Oracle  2023-08-02  294)  * the type by a sufficient amount to encompass @val.  Decide for yourself
f9bff0e31881d0 Matthew Wilcox (Oracle  2023-08-02  295)  * which behaviour you want, or prove that start + len never overflow.
f9bff0e31881d0 Matthew Wilcox (Oracle  2023-08-02  296)  * Do not blindly replace one form with the other.
f9bff0e31881d0 Matthew Wilcox (Oracle  2023-08-02  297)  */
f9bff0e31881d0 Matthew Wilcox (Oracle  2023-08-02  298) #define in_range(val, start, len)					\
f9bff0e31881d0 Matthew Wilcox (Oracle  2023-08-02  299) 	((sizeof(start) | sizeof(len) | sizeof(val)) <= sizeof(u32) ?	\
f9bff0e31881d0 Matthew Wilcox (Oracle  2023-08-02  300) 		in_range32(val, start, len) : in_range64(val, start, len))
f9bff0e31881d0 Matthew Wilcox (Oracle  2023-08-02  301) 
b296a6d53339a7 Andy Shevchenko         2020-10-15  302  /**
b296a6d53339a7 Andy Shevchenko         2020-10-15  303   * swap - swap values of @a and @b
b296a6d53339a7 Andy Shevchenko         2020-10-15  304   * @a: first value
b296a6d53339a7 Andy Shevchenko         2020-10-15  305   * @b: second value
b296a6d53339a7 Andy Shevchenko         2020-10-15  306   */
b296a6d53339a7 Andy Shevchenko         2020-10-15  307  #define swap(a, b) \
b296a6d53339a7 Andy Shevchenko         2020-10-15 @308  	do { typeof(a) __tmp = (a); (a) = (b); (b) = __tmp; } while (0)
b296a6d53339a7 Andy Shevchenko         2020-10-15  309  

:::::: The code at line 308 was first introduced by commit
:::::: b296a6d53339a79082c1d2c1761e948e8b3def69 kernel.h: split out min()/max() et al. helpers

:::::: TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
