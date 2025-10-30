Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0C5266EFC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Oct 2025 14:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761836269; cv=none; b=NXY8dXpn7L7HoNZEyZaUqXFCOQHox/Q+PtkaJFAifuoviJDoLiQTqSfiAPq1DvzwZh77hhpW8hzYMp8aR4/fNgbNwQpRFn6f5yABiRthMwLX63mBkaMKYN90msUshLbzyvKtoecYt7/cwujKStKzm+89ULCGmvjUkoJEQUTkOKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761836269; c=relaxed/simple;
	bh=BpG8t4r9qHHh5K8QfOvvDSFvZyylKpB/g+Cwob9uIKc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vE6PI5fjlqVGZ0gxsS2kmrrve0+yGLYrgB1Gi+iNp3Tkvy5+LGs7xtUWmqwKbUOLBIeceo2uv1Jrq0g4W10lR/uIZEkZQM6mmfaRs2AknsJp4aYw7RQlK7f4K97vHzwO5WzJs6FXKyt6esRR4x4GGvh6qNrANpqN95sYDbcwKa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IvbTMO22; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IvbTMO22"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761836267; x=1793372267;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BpG8t4r9qHHh5K8QfOvvDSFvZyylKpB/g+Cwob9uIKc=;
  b=IvbTMO22fg3BK8lHVvx3v84n9Pum8h4aVfAxhGj6Yf3uQPR+T7qAgz6w
   fF9/16cU50XSeZvNC9Nzi4nafO16Re5NYgQmqiXw5r8v+Dwg+6mO8IALy
   Mj8hA4RZ798lpZY7u7Q/4z7RsYws0TZmJFT4/5c2izzVSlwIElndmmaeo
   en6X3IUvfbhA7fjcE68hlq+OtlUk77RGfjbONjs9DggXSsLqLZ7lCkNk6
   WkR/5TvuEqm7Sy4cGY9MtYALEcDTCvK9fj7XSMpbRbUt3W8dqZXaPqJpf
   OaEUY1PGRT6zxSx2MxQef9r6Vl6uTnaF8f70N4GcT2MOn8pnqTyPL4rji
   g==;
X-CSE-ConnectionGUID: 4e6tpbltSO6Kgb/GIqXnjg==
X-CSE-MsgGUID: ARB9SyNoTamX514xA8bXyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="74657370"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="74657370"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 07:57:47 -0700
X-CSE-ConnectionGUID: 6OmobruJSFC5IDHe3o7hJg==
X-CSE-MsgGUID: y31iRuXNRA213BmJ3/JWSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="190313011"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 30 Oct 2025 07:57:46 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEU5v-000M7m-20;
	Thu, 30 Oct 2025 14:57:43 +0000
Date: Thu, 30 Oct 2025 22:57:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:must-be-lval 38/57] lib/test_lvalue.c:13:2: error: expression
 is not assignable
Message-ID: <202510302210.9xULoAgF-lkp@intel.com>
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
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20251030/202510302210.9xULoAgF-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d1c086e82af239b245fe8d7832f2753436634990)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510302210.9xULoAgF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510302210.9xULoAgF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/test_lvalue.c:13:2: error: expression is not assignable
      13 |         swap(1, 2);
         |         ^~~~~~~~~~
   include/linux/minmax.h:308:34: note: expanded from macro 'swap'
     308 |         do { typeof(a) __tmp = (a); (a) = (b); (b) = __tmp; } while (0)
         |                                     ~~~ ^
>> lib/test_lvalue.c:13:2: error: expression is not assignable
      13 |         swap(1, 2);
         |         ^~~~~~~~~~
   include/linux/minmax.h:308:45: note: expanded from macro 'swap'
     308 |         do { typeof(a) __tmp = (a); (a) = (b); (b) = __tmp; } while (0)
         |                                                ~~~ ^
   lib/test_lvalue.c:14:2: error: expression is not assignable
      14 |         SET_UID(1, 1);
         |         ^~~~~~~~~~~~~
   include/linux/highuid.h:70:38: note: expanded from macro 'SET_UID'
      70 | #define SET_UID(var, uid) do { (var) = __convert_uid(sizeof(var), (uid)); } while (0)
         |                                ~~~~~ ^
   lib/test_lvalue.c:15:2: error: expression is not assignable
      15 |         ACPI_ACQUIRE_GLOBAL_LOCK(NULL, 1);
         |         ^                              ~
   include/acpi/platform/acenv.h:248:60: note: expanded from macro 'ACPI_ACQUIRE_GLOBAL_LOCK'
     248 | #define ACPI_ACQUIRE_GLOBAL_LOCK(Glptr, acquired) acquired = 1
         |                                                   ~~~~~~~~ ^
>> lib/test_lvalue.c:16:19: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct pci_dev *' [-Wint-conversion]
      16 |         for_each_pci_dev(1);
         |                          ^
   include/linux/pci.h:2041:27: note: passing argument to parameter 'from' here
    2041 |                                              struct pci_dev *from)
         |                                                              ^
   lib/test_lvalue.c:16:2: error: expression is not assignable
      16 |         for_each_pci_dev(1);
         |         ^                ~
   include/linux/pci.h:576:39: note: expanded from macro 'for_each_pci_dev'
     576 | #define for_each_pci_dev(d) while ((d = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, d)) != NULL)
         |                                     ~ ^
   6 errors generated.


vim +13 lib/test_lvalue.c

     9	
    10	static void __used __init test_lvalue_macros(void)
    11	{
    12		/* These should all fail to compile */
  > 13		swap(1, 2);
    14		SET_UID(1, 1);
  > 15		ACPI_ACQUIRE_GLOBAL_LOCK(NULL, 1);
  > 16		for_each_pci_dev(1);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
