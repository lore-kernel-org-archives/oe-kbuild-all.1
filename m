Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044E910EF
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Sep 2023 01:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694135329; x=1725671329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gRM8w9I7ZOOG+GXXVALmolfzuB5pxY4DHhFh0UCk6V4=;
  b=RMBVgTA6e8ldAFz9ZUw2dhUmkAnBrtwNCU2n7a2SUXfStJVUewQhfYmJ
   cT4IMGbeTFb3jS0VPSvEc/uwbXTxtXpCLPL7Ecn1qHzhUjL1nqdNBn5yL
   vwyaK7iGVQ3Obs/TbR5hcZNNcVqR2eWujMcdiTxE6hi394d0kSuqbUISy
   y6hryEIPNQDbVQceLd0h8l4TpJrYCr7mNw7NSavcXaWxDBPo2pn7538g7
   UlmtnYXP3joVesBzDakxXUFG3d5ZVoRDUtZ+7RIJEJPa/zkPA9ruYlqO6
   S+QIzMFMKriY0CancFTWDHOMbWbzvAV0xV+BaKd+hg9MHwQl9PG7X9pRl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="381331174"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="381331174"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 18:08:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="812369236"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="812369236"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 07 Sep 2023 18:08:42 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qePzD-0001lf-2L;
	Fri, 08 Sep 2023 01:08:39 +0000
Date: Fri, 8 Sep 2023 09:08:24 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alobakin:pfcp 8/8] lib/test_bitmap.c:1399:17: sparse: sparse:
 incorrect type in argument 3 (different base types)
Message-ID: <202309080924.6LcKWa3y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux pfcp
head:   5a4ebd0c267c9d96e68bda4de8be059b26ae170d
commit: 6f8d41d95df8ebab344c5c6ec0e364a30860068f [8/8] lib/bitmap: add tests for IP tunnel flags conversion helpers
config: x86_64-randconfig-122-20230907 (https://download.01.org/0day-ci/archive/20230908/202309080924.6LcKWa3y-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230908/202309080924.6LcKWa3y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309080924.6LcKWa3y-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/test_bitmap.c:1399:17: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int const exp_uint @@     got restricted __be16 const [usertype] exp_val @@
   lib/test_bitmap.c:1399:17: sparse:     expected unsigned int const exp_uint
   lib/test_bitmap.c:1399:17: sparse:     got restricted __be16 const [usertype] exp_val
>> lib/test_bitmap.c:1399:17: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected unsigned int x @@     got restricted __be16 @@
   lib/test_bitmap.c:1399:17: sparse:     expected unsigned int x
   lib/test_bitmap.c:1399:17: sparse:     got restricted __be16

vim +1399 lib/test_bitmap.c

  1381	
  1382	static void __init test_ip_tunnel_flags(void)
  1383	{
  1384		for (u32 i = 0; i < ARRAY_SIZE(ip_tunnel_flags_test); i++) {
  1385			const struct ip_tunnel_flags_test *test = &ip_tunnel_flags_test[i];
  1386			IP_TUNNEL_DECLARE_FLAGS(src) = { };
  1387			IP_TUNNEL_DECLARE_FLAGS(exp) = { };
  1388			IP_TUNNEL_DECLARE_FLAGS(out);
  1389	
  1390			for (u32 j = 0; j < test->src_num; j++)
  1391				__set_bit(test->src_bits[j], src);
  1392	
  1393			for (u32 j = 0; j < test->exp_num; j++)
  1394				__set_bit(test->exp_bits[j], exp);
  1395	
  1396			ip_tunnel_flags_from_be16(out, test->exp_val);
  1397	
  1398			expect_eq_uint(test->exp_comp, ip_tunnel_flags_is_be16_compat(src));
> 1399			expect_eq_uint(test->exp_val, ip_tunnel_flags_to_be16(src));
  1400			expect_eq_bitmap(exp, out, __IP_TUNNEL_FLAG_NUM);
  1401		}
  1402	}
  1403	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
