Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA9A1A7AE4
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Oct 2024 18:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727978808; cv=none; b=E4RLssbQk+QXpCsG1S882Cl9n/HxmMinJT3+ZnT1CzCXpw0CO6rRSW5m8xXrWa5QBD2FnoKumPNLDjpmYDPXGmpW739W4ncNxum60w+GQ3F1X6Z1o+LIdlE/dlPq+rnHiLDXO+OnRG9E8TG51si01ueJwQo9jNYM98jZ3hCiJZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727978808; c=relaxed/simple;
	bh=gEFnlkV4G9zI6+qHgUr392ncgBk3ll07jEFLxRP996E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mWy+EbcCMP9pgikpqV3OJ1wgIKxgVU7L8EgvO+VMlB7Z7sif8vjXXfZtOCErNN9EHyraanmWIZ50bDj7ODuWU5nIiw0NuNMkgs7MIXOrCcGgoIP0sgjDP0hPDKl799ChqaZLpd3mB6UXuhFaQkDnXKZMiqIEmQAkeSXD/gJJlCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QZpGJXE1; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QZpGJXE1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727978807; x=1759514807;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gEFnlkV4G9zI6+qHgUr392ncgBk3ll07jEFLxRP996E=;
  b=QZpGJXE1xT5SPGUbDpMnfNCtRpywwk3o1sWOJ32hdsfTviQp/HDg7zyM
   R0pf0zqZUMjHMutncCldDojeSRr8Lelv/QNEVVqIPm9YFs72RvtgflLfM
   M0ZrgiJNr6iu/6BdLJwtZw2Z+93eCZ2/V6W+h11oXhhGaHwoQsaTsQOtD
   +rMHZAHFlk3eZtDSAEGwzl+7pEWj1eiDZobINxzXDxNMsXAJIiy8U5cHn
   ayzAGdJhm87Z3vmw1NQh28pMFcZ8xG1PswKZXO9+4QTgTRWdnD5JKzwci
   ZqlQRCYfkP6W4e9OtNipzAyMQIvDiJ5nLUCqtFrpQQdZ1W+CF78xMYHbP
   A==;
X-CSE-ConnectionGUID: lNMo3jGYTNKJJjzjLXSllg==
X-CSE-MsgGUID: 7oCBGzhsQninZ4iz0wta+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="44656760"
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="44656760"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 11:06:46 -0700
X-CSE-ConnectionGUID: GuP/UlFTST6oiaVIVOF01Q==
X-CSE-MsgGUID: /e0ArIymRTqXz/Jfro4Zgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="75245834"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 03 Oct 2024 11:06:45 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swQDr-0000l4-0T;
	Thu, 03 Oct 2024 18:06:43 +0000
Date: Fri, 4 Oct 2024 02:06:13 +0800
From: kernel test robot <lkp@intel.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [weiny2:dcd-v4-2024-10-01 2/29] lib/test_printf.c:390:26: warning:
 conversion from 'long long unsigned int' to 'unsigned int' changes value
 from '13907095861237561873' to '3126770193'
Message-ID: <202410040216.W3gHROnN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git dcd-v4-2024-10-01
head:   c240cf80afe13145f312562d144a7a60314806b0
commit: 5d614408909e73b80ae1de8b55d61fd5eae74f84 [2/29] test printk: Add very basic struct resource tests
config: arc-randconfig-001-20241004 (https://download.01.org/0day-ci/archive/20241004/202410040216.W3gHROnN-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410040216.W3gHROnN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410040216.W3gHROnN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/test_printf.c: In function 'struct_resource':
>> lib/test_printf.c:390:26: warning: conversion from 'long long unsigned int' to 'unsigned int' changes value from '13907095861237561873' to '3126770193' [-Woverflow]
     390 |                 .start = 0xc0ffee00ba5eba11,
         |                          ^~~~~~~~~~~~~~~~~~
   lib/test_printf.c:391:24: warning: conversion from 'long long unsigned int' to 'unsigned int' changes value from '13907095861237561873' to '3126770193' [-Woverflow]
     391 |                 .end = 0xc0ffee00ba5eba11,
         |                        ^~~~~~~~~~~~~~~~~~
>> lib/test_printf.c:415:26: warning: unsigned conversion from 'long long int' to 'unsigned int' changes value from '936728934410533393' to '3126770193' [-Woverflow]
     415 |                 .start = 0x0cffee00ba5eba11,
         |                          ^~~~~~~~~~~~~~~~~~
   lib/test_printf.c:416:24: warning: unsigned conversion from 'long long int' to 'unsigned int' changes value from '936728934410537489' to '3126774289' [-Woverflow]
     416 |                 .end = 0x0cffee00ba5eca11,
         |                        ^~~~~~~~~~~~~~~~~~


vim +390 lib/test_printf.c

   385	
   386	static void __init
   387	struct_resource(void)
   388	{
   389		struct resource test_resource = {
 > 390			.start = 0xc0ffee00ba5eba11,
   391			.end = 0xc0ffee00ba5eba11,
   392			.flags = IORESOURCE_MEM,
   393		};
   394	
   395		test("[mem 0xc0ffee00ba5eba11 flags 0x200]",
   396		     "%pr", &test_resource);
   397	
   398		test_resource = (struct resource) {
   399			.start = 0xc0ffee,
   400			.end = 0xba5eba11,
   401			.flags = IORESOURCE_MEM,
   402		};
   403		test("[mem 0x00c0ffee-0xba5eba11 flags 0x200]",
   404		     "%pr", &test_resource);
   405	
   406		test_resource = (struct resource) {
   407			.start = 0xba5eba11,
   408			.end = 0xc0ffee,
   409			.flags = IORESOURCE_MEM,
   410		};
   411		test("[mem 0xba5eba11-0x00c0ffee flags 0x200]",
   412		     "%pr", &test_resource);
   413	
   414		test_resource = (struct resource) {
 > 415			.start = 0x0cffee00ba5eba11,
   416			.end = 0x0cffee00ba5eca11,
   417			.flags = IORESOURCE_MEM,
   418		};
   419	
   420		test("[mem 0xcffee00ba5eba11-0xcffee00ba5eca11 flags 0x200]",
   421		     "%pr", &test_resource);
   422	
   423		test_resource = (struct resource) {
   424			.start = 0xba11,
   425			.end = 0xca10,
   426			.flags = IORESOURCE_IO |
   427				 IORESOURCE_DISABLED |
   428				 IORESOURCE_UNSET,
   429		};
   430	
   431		test("[io  size 0x1000 disabled]",
   432		     "%pR", &test_resource);
   433	}
   434	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
