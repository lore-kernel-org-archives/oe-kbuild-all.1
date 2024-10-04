Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24F42E83F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Oct 2024 03:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728014165; cv=none; b=gG9IMxy0avNFElzDd/BbYZf0nbtXIPQMmIYCKWDC/8eucs0CO3FLgyOlWv8Zvdr/HTzRILJ1wF0W9DOIlDdXBTR347849t6A6Bp9wfD7X10b/Rq7E+Am5KHtyEjOk5Rvi79n6qBrKzvyCj6UU7sIFmo1m1PZxXamUbfiI/5u0yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728014165; c=relaxed/simple;
	bh=3a/eVndCvpe/kh4kcCv9Y0SzwFw5dQ8yol8CYUFy5q4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I2RJvS6/FgJbp4V/FiAhzr6y1lU0hUPjH8p5H/RDgfz3kYQeI33/dTvW1Fe0baYnRKp7bVqj4TOQFOrgOCQEoCGjWmvonMvvwYkgcKxQLHvXs0zz3AEb5e4VsEVKrZqg24XARpLBol4xvY6KrVkrDZ5fQH4oDMQsSbWJY+advYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fHQoKLcD; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fHQoKLcD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728014164; x=1759550164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3a/eVndCvpe/kh4kcCv9Y0SzwFw5dQ8yol8CYUFy5q4=;
  b=fHQoKLcDB2VPHdrdf45bHZ9lvywh2ZkBKt0Qxe5dTjygnoBvDfmTIUgs
   /IGECbad2pJJr4ktGYmJIA/Ip9kKaZKdPG1sRpOxWjc9TsyhpzC02OItt
   fMfjAKcsiLoz7xIKAlYuhvQpHM6h2DhGmdI7iSOyuPMtIfJYAv6QfHyNk
   d7VWp1hbECXg1j53Ojos7oYEDzfnnmlsERC07CJQFobzrWFoV5mg+pERc
   hGG72Pt1KAjuQFXqYwsGvFdwxY/MkUOETrZJPqCUSp1Wxq934sEP72Qhn
   44CExAJQUBQ+xWx+nSstPbTLimGKEh1Cyhes3GyVE8qcvU96ZoQwEAh1i
   w==;
X-CSE-ConnectionGUID: 4FJ+JqHyTbiabpsmDaXLCA==
X-CSE-MsgGUID: /0hDNcnUSDWucutqNJ641A==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27364820"
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="27364820"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 20:56:03 -0700
X-CSE-ConnectionGUID: rQ5jcvjUS+6at5NaFGQ+ZA==
X-CSE-MsgGUID: a3hHov1rQX+2nkIYVTYbQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="79137770"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Oct 2024 20:56:02 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swZQ7-0001Bt-2w;
	Fri, 04 Oct 2024 03:55:59 +0000
Date: Fri, 4 Oct 2024 11:55:00 +0800
From: kernel test robot <lkp@intel.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [weiny2:dcd-v4-2024-10-01 2/29] lib/test_printf.c:390:26: sparse:
 sparse: cast truncates bits from constant value (c0ffee00ba5eba11 becomes
 ba5eba11)
Message-ID: <202410041140.lgdXk40j-lkp@intel.com>
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
config: i386-randconfig-r121-20241004 (https://download.01.org/0day-ci/archive/20241004/202410041140.lgdXk40j-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410041140.lgdXk40j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410041140.lgdXk40j-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/test_printf.c:725:49: sparse: sparse: cast from restricted gfp_t
   lib/test_printf.c:729:58: sparse: sparse: cast from restricted gfp_t
>> lib/test_printf.c:390:26: sparse: sparse: cast truncates bits from constant value (c0ffee00ba5eba11 becomes ba5eba11)
   lib/test_printf.c:391:24: sparse: sparse: cast truncates bits from constant value (c0ffee00ba5eba11 becomes ba5eba11)
>> lib/test_printf.c:415:26: sparse: sparse: cast truncates bits from constant value (cffee00ba5eba11 becomes ba5eba11)
>> lib/test_printf.c:416:24: sparse: sparse: cast truncates bits from constant value (cffee00ba5eca11 becomes ba5eca11)

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
 > 416			.end = 0x0cffee00ba5eca11,
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
