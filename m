Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823E21427B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 May 2024 06:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715150472; cv=none; b=osFoNl7GJ5hnMurBtSgL8/d5eaDo0j4yyAIl9Ym+EpGqFjC59z9VUhjEDKqT4TFyyDH9xYbq2OUc8+uumFZ5NdhYJNlvnlEfy+ifcNlb4Noz919B6o8CXzg1FtFByhwfftn6j2x30iABl0avtFoCrdnOUaiOwKGPH/fhY218WeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715150472; c=relaxed/simple;
	bh=eg3rvQ40JQn4qBk3Bp/u8qGPyRRxo6H8IEGp0OZKKDM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SAsWIMysU2ueMCYsDIwEOSWfBDy3YX7E/fAdGNLsiniL10HNRFCyghdv9gG7pwvjD537r6OK6H6MajlQfLPKvyLbV4qWJYP7LVEC5EJ0TpVeMA9fht2H/A/iAxFyeAatK9ppBGCQ6w+M1dzbRUOVmZICoQyl1aHAT/+JiAfBBAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MTMx1tCz; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MTMx1tCz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715150471; x=1746686471;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eg3rvQ40JQn4qBk3Bp/u8qGPyRRxo6H8IEGp0OZKKDM=;
  b=MTMx1tCzUmbrESYksUz2QgeLAR1FTzXpm+2ZY8FMKHhw6sqezSso8ka2
   j4WxSxmUX9jwLU/F8KB0F5MvaJFOkiJcmXQH/ouCeBwlHhhYtH2PaN2z4
   Wk16yfPjHTPk+ZitwTX2L1D214iSbp9F8v+zcQEtxtgr4sYNvjsQZzNYp
   r3gnWTGMIt8OuXpYRBtW6cYNm01n6LjpdW6Fb8io4/eeVtbWgmSlaKCT5
   zNw0IkoJH43KDApZU2WxywqRIdMIiznmB8mRBKIVaF0azE67Nmas3HgID
   RoAWyVka3i+xmY6Jp1Oh9+Ri7H2oZZNJ9MB4No6AXuHDx6cWDAROwNuqv
   Q==;
X-CSE-ConnectionGUID: +U/uowGATyaLeJeTyIqffg==
X-CSE-MsgGUID: o0z5EjzwRfScNCxPlhG5LQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="14807245"
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; 
   d="scan'208";a="14807245"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 23:41:11 -0700
X-CSE-ConnectionGUID: qsBPrhPOSZupqsUZEc3cqA==
X-CSE-MsgGUID: Z5+M5F0LRQy90tU97emaiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; 
   d="scan'208";a="33469117"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 May 2024 23:41:09 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4azD-00035W-0C;
	Wed, 08 May 2024 06:41:07 +0000
Date: Wed, 8 May 2024 14:40:24 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:tmppppp 10/10] lib/test_bitops.c:56:9: error: cleanup
 argument not a function
Message-ID: <202405081432.E243Tcag-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux tmppppp
head:   f1c702508a99b036a5ca80b1755558f95e177b4e
commit: f1c702508a99b036a5ca80b1755558f95e177b4e [10/10] bitops: use dynamically allocated array in test_fns()
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240508/202405081432.E243Tcag-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240508/202405081432.E243Tcag-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405081432.E243Tcag-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/test_bitops.c: In function 'test_fns':
>> lib/test_bitops.c:56:9: error: cleanup argument not a function
      56 |         unsigned long *buf __free(kfree) = NULL;
         |         ^~~~~~~~
>> lib/test_bitops.c:60:15: error: implicit declaration of function 'kmalloc_array' [-Werror=implicit-function-declaration]
      60 |         buf = kmalloc_array(10000, sizeof(unsigned long), GFP_KERNEL);
         |               ^~~~~~~~~~~~~
>> lib/test_bitops.c:60:13: error: assignment to 'long unsigned int *' from 'int' makes pointer from integer without a cast [-Werror=int-conversion]
      60 |         buf = kmalloc_array(10000, sizeof(unsigned long), GFP_KERNEL);
         |             ^
   cc1: all warnings being treated as errors


vim +56 lib/test_bitops.c

    52	
    53	static int __init test_fns(void)
    54	{
    55		static volatile __always_used unsigned long tmp __initdata;
  > 56		unsigned long *buf __free(kfree) = NULL;
    57		unsigned int i, n;
    58		ktime_t time;
    59	
  > 60		buf = kmalloc_array(10000, sizeof(unsigned long), GFP_KERNEL);
    61		if (!buf)
    62			return -ENOMEM;
    63	
    64		get_random_bytes(buf, 10000 * sizeof(unsigned long));
    65		time = ktime_get();
    66	
    67		for (n = 0; n < BITS_PER_LONG; n++)
    68			for (i = 0; i < 10000; i++)
    69				tmp = fns(buf[i], n);
    70	
    71		time = ktime_get() - time;
    72		pr_err("fns:  %18llu ns\n", time);
    73	
    74		return 0;
    75	}
    76	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
