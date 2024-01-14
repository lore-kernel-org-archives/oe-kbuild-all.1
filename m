Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF711851
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jan 2024 07:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RsbKVHcQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705218119; x=1736754119;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m5gdE0vVe2EN/8bUajXWFji3u30RWXo4wm2LoiNdcGQ=;
  b=RsbKVHcQ4Z5t9BhpGLugKHuY3Qt5fRQoq4OnzKbY2zovHDSOFG6Z46+t
   J9VircOFUweceAbHRXN/tnec029QDzU3OAJMhbfUvMb7/tZ5ymOvovCXn
   MGP7RitEtLEcgzBqtaxoNCE4CCaKYYw4Nmta8TxphEKVgtz7Q6wbBFuA8
   4pLVyh1hM2Hf3c0/+HDXRdJ8+NXaPHclqdlSaE9G+FEpvum9rUMAhr+X5
   SYP4D1oBC9dmebMf6u4mZLTPyxuC0B+0/0WWhKyeUuRd5tK7yZtGrXABV
   N/17iqEcS/qt+D4oYRXYDZCncwP0rBofX9P0eqisr/tCoYbpHEXEHO5Rk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="398305142"
X-IronPort-AV: E=Sophos;i="6.04,193,1695711600"; 
   d="scan'208";a="398305142"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 23:41:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="817515352"
X-IronPort-AV: E=Sophos;i="6.04,193,1695711600"; 
   d="scan'208";a="817515352"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 13 Jan 2024 23:41:57 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOv7x-000BJD-2x;
	Sun, 14 Jan 2024 07:41:54 +0000
Date: Sun, 14 Jan 2024 15:40:53 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 16693/21544]
 arch/x86/kernel/unwind_orc.c:199:12: warning: 'orc_sort_cmp' defined but not
 used
Message-ID: <202401141520.xOsYiDEk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   1f0983450549eeea71fb9333517330947a779262
commit: badd79c400ed404df871e1d035bed971d20ead4c [16693/21544] x86/unwind/orc: Remove boot-time ORC unwind tables sorting
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240114/202401141520.xOsYiDEk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240114/202401141520.xOsYiDEk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401141520.xOsYiDEk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/unwind_orc.c:199:12: warning: 'orc_sort_cmp' defined but not used [-Wunused-function]
     199 | static int orc_sort_cmp(const void *_a, const void *_b)
         |            ^~~~~~~~~~~~
>> arch/x86/kernel/unwind_orc.c:179:13: warning: 'orc_sort_swap' defined but not used [-Wunused-function]
     179 | static void orc_sort_swap(void *_a, void *_b, int size)
         |             ^~~~~~~~~~~~~
   arch/x86/kernel/unwind_orc.o: warning: objtool: missing symbol for section .init.text


vim +/orc_sort_cmp +199 arch/x86/kernel/unwind_orc.c

ee9f8fce996408 Josh Poimboeuf 2017-07-24  178  
ee9f8fce996408 Josh Poimboeuf 2017-07-24 @179  static void orc_sort_swap(void *_a, void *_b, int size)
ee9f8fce996408 Josh Poimboeuf 2017-07-24  180  {
ee9f8fce996408 Josh Poimboeuf 2017-07-24  181  	struct orc_entry *orc_a, *orc_b;
ee9f8fce996408 Josh Poimboeuf 2017-07-24  182  	struct orc_entry orc_tmp;
ee9f8fce996408 Josh Poimboeuf 2017-07-24  183  	int *a = _a, *b = _b, tmp;
ee9f8fce996408 Josh Poimboeuf 2017-07-24  184  	int delta = _b - _a;
ee9f8fce996408 Josh Poimboeuf 2017-07-24  185  
ee9f8fce996408 Josh Poimboeuf 2017-07-24  186  	/* Swap the .orc_unwind_ip entries: */
ee9f8fce996408 Josh Poimboeuf 2017-07-24  187  	tmp = *a;
ee9f8fce996408 Josh Poimboeuf 2017-07-24  188  	*a = *b + delta;
ee9f8fce996408 Josh Poimboeuf 2017-07-24  189  	*b = tmp - delta;
ee9f8fce996408 Josh Poimboeuf 2017-07-24  190  
ee9f8fce996408 Josh Poimboeuf 2017-07-24  191  	/* Swap the corresponding .orc_unwind entries: */
ee9f8fce996408 Josh Poimboeuf 2017-07-24  192  	orc_a = cur_orc_table + (a - cur_orc_ip_table);
ee9f8fce996408 Josh Poimboeuf 2017-07-24  193  	orc_b = cur_orc_table + (b - cur_orc_ip_table);
ee9f8fce996408 Josh Poimboeuf 2017-07-24  194  	orc_tmp = *orc_a;
ee9f8fce996408 Josh Poimboeuf 2017-07-24  195  	*orc_a = *orc_b;
ee9f8fce996408 Josh Poimboeuf 2017-07-24  196  	*orc_b = orc_tmp;
ee9f8fce996408 Josh Poimboeuf 2017-07-24  197  }
ee9f8fce996408 Josh Poimboeuf 2017-07-24  198  
ee9f8fce996408 Josh Poimboeuf 2017-07-24 @199  static int orc_sort_cmp(const void *_a, const void *_b)
ee9f8fce996408 Josh Poimboeuf 2017-07-24  200  {
ee9f8fce996408 Josh Poimboeuf 2017-07-24  201  	struct orc_entry *orc_a;
ee9f8fce996408 Josh Poimboeuf 2017-07-24  202  	const int *a = _a, *b = _b;
ee9f8fce996408 Josh Poimboeuf 2017-07-24  203  	unsigned long a_val = orc_ip(a);
ee9f8fce996408 Josh Poimboeuf 2017-07-24  204  	unsigned long b_val = orc_ip(b);
ee9f8fce996408 Josh Poimboeuf 2017-07-24  205  
ee9f8fce996408 Josh Poimboeuf 2017-07-24  206  	if (a_val > b_val)
ee9f8fce996408 Josh Poimboeuf 2017-07-24  207  		return 1;
ee9f8fce996408 Josh Poimboeuf 2017-07-24  208  	if (a_val < b_val)
ee9f8fce996408 Josh Poimboeuf 2017-07-24  209  		return -1;
ee9f8fce996408 Josh Poimboeuf 2017-07-24  210  
ee9f8fce996408 Josh Poimboeuf 2017-07-24  211  	/*
ee9f8fce996408 Josh Poimboeuf 2017-07-24  212  	 * The "weak" section terminator entries need to always be on the left
ee9f8fce996408 Josh Poimboeuf 2017-07-24  213  	 * to ensure the lookup code skips them in favor of real entries.
ee9f8fce996408 Josh Poimboeuf 2017-07-24  214  	 * These terminator entries exist to handle any gaps created by
ee9f8fce996408 Josh Poimboeuf 2017-07-24  215  	 * whitelisted .o files which didn't get objtool generation.
ee9f8fce996408 Josh Poimboeuf 2017-07-24  216  	 */
ee9f8fce996408 Josh Poimboeuf 2017-07-24  217  	orc_a = cur_orc_table + (a - cur_orc_ip_table);
d31a580266eeb1 Josh Poimboeuf 2018-05-18  218  	return orc_a->sp_reg == ORC_REG_UNDEFINED && !orc_a->end ? -1 : 1;
ee9f8fce996408 Josh Poimboeuf 2017-07-24  219  }
ee9f8fce996408 Josh Poimboeuf 2017-07-24  220  

:::::: The code at line 199 was first introduced by commit
:::::: ee9f8fce99640811b2b8e79d0d1dbe8bab69ba67 x86/unwind: Add the ORC unwinder

:::::: TO: Josh Poimboeuf <jpoimboe@redhat.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
