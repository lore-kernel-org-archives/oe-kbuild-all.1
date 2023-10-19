Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7FE39853
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 19:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BAwN98Zr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697743650; x=1729279650;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7XprC7XmJl/59bmG+J1zPFIoP4DSk0T/QLvDSbRTjb0=;
  b=BAwN98Zr1ITw8soj4R7TvIySozI1W/xTfSa/ZKgYSLZzpeVDlq+1ViIo
   hI0coL78zViSZIvti8Xu8IaVyl2fhsRtf14uE1YDzbmJFFqrK3vilDTKZ
   n++OFdlMIvu/mD8Fi8RP8qWQJnOHhDRDwu9alVXzvoCg37Z/Hxj9p39mA
   Au6gWyiP9U74SapaRSiJ2/TMg5gdnm00EqJHLSj/oZCDZa+hbE0uGt53y
   3ey/1AJHAc/TneKUBVzqAn/yfQHes8cBG8hW9Tsru2FLUwf+MSFj5c9te
   f90n6VoGl+QducUjFbAl3xug9qkyp7ygIN0rOgtWdlKl+/8HYqfqF+jyS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="417467651"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="417467651"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 12:27:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="873616368"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="873616368"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 19 Oct 2023 12:27:26 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtYg0-0002Vi-1C;
	Thu, 19 Oct 2023 19:27:24 +0000
Date: Fri, 20 Oct 2023 03:26:39 +0800
From: kernel test robot <lkp@intel.com>
To: Willem de Bruijn <willemb@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Florian Westphal <fw@strlen.de>
Subject: [linux-next:master 10512/13518] net/core/gso_test.c:52:34: error:
 initializer element is not constant
Message-ID: <202310200345.b3Y2A2k0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4230ea146b1e64628f11e44290bb4008e391bc24
commit: 1b4fa28a8b07eb331aeb7fbfc806c0d2e3dc3627 [10512/13518] net: parametrize skb_segment unit test to expand coverage
config: x86_64-randconfig-071-20231020 (https://download.01.org/0day-ci/archive/20231020/202310200345.b3Y2A2k0-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310200345.b3Y2A2k0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310200345.b3Y2A2k0-lkp@intel.com/

Note: the linux-next/master HEAD 4230ea146b1e64628f11e44290bb4008e391bc24 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> net/core/gso_test.c:52:34: error: initializer element is not constant
      52 |   .segs = (const unsigned int[]) { gso_size },
         |                                  ^
   net/core/gso_test.c:52:34: note: (near initialization for 'cases[0]')
   net/core/gso_test.c:59:34: error: initializer element is not constant
      59 |   .segs = (const unsigned int[]) { gso_size, gso_size, 1 },
         |                                  ^
   net/core/gso_test.c:59:34: note: (near initialization for 'cases[1]')
   net/core/gso_test.c:66:35: error: initializer element is not constant
      66 |   .frags = (const unsigned int[]) { gso_size, 1 },
         |                                   ^
   net/core/gso_test.c:66:35: note: (near initialization for 'cases[2]')
   net/core/gso_test.c:68:34: error: initializer element is not constant
      68 |   .segs = (const unsigned int[]) { gso_size, gso_size, 1 },
         |                                  ^
   net/core/gso_test.c:68:34: note: (near initialization for 'cases[2]')
   net/core/gso_test.c:74:35: error: initializer element is not constant
      74 |   .frags = (const unsigned int[]) { gso_size, gso_size, 2 },
         |                                   ^
   net/core/gso_test.c:74:35: note: (near initialization for 'cases[3]')
   net/core/gso_test.c:76:34: error: initializer element is not constant
      76 |   .segs = (const unsigned int[]) { gso_size, gso_size, 2 },
         |                                  ^
   net/core/gso_test.c:76:34: note: (near initialization for 'cases[3]')
   net/core/gso_test.c:83:35: error: initializer element is not constant
      83 |   .frags = (const unsigned int[]) { gso_size, 3 },
         |                                   ^
   net/core/gso_test.c:83:35: note: (near initialization for 'cases[4]')
   net/core/gso_test.c:85:34: error: initializer element is not constant
      85 |   .segs = (const unsigned int[]) { 2 * gso_size, 3 },
         |                                  ^
   net/core/gso_test.c:85:34: note: (near initialization for 'cases[4]')


vim +52 net/core/gso_test.c

    45	
    46	static struct gso_test_case cases[] = {
    47		{
    48			.id = GSO_TEST_NO_GSO,
    49			.name = "no_gso",
    50			.linear_len = gso_size,
    51			.nr_segs = 1,
  > 52			.segs = (const unsigned int[]) { gso_size },
    53		},
    54		{
    55			.id = GSO_TEST_LINEAR,
    56			.name = "linear",
    57			.linear_len = gso_size + gso_size + 1,
    58			.nr_segs = 3,
    59			.segs = (const unsigned int[]) { gso_size, gso_size, 1 },
    60		},
    61		{
    62			.id = GSO_TEST_FRAGS,
    63			.name = "frags",
    64			.linear_len = gso_size,
    65			.nr_frags = 2,
    66			.frags = (const unsigned int[]) { gso_size, 1 },
    67			.nr_segs = 3,
    68			.segs = (const unsigned int[]) { gso_size, gso_size, 1 },
    69		},
    70		{
    71			.id = GSO_TEST_FRAGS_PURE,
    72			.name = "frags_pure",
    73			.nr_frags = 3,
    74			.frags = (const unsigned int[]) { gso_size, gso_size, 2 },
    75			.nr_segs = 3,
    76			.segs = (const unsigned int[]) { gso_size, gso_size, 2 },
    77		},
    78		{
    79			.id = GSO_TEST_GSO_PARTIAL,
    80			.name = "gso_partial",
    81			.linear_len = gso_size,
    82			.nr_frags = 2,
    83			.frags = (const unsigned int[]) { gso_size, 3 },
    84			.nr_segs = 2,
    85			.segs = (const unsigned int[]) { 2 * gso_size, 3 },
    86		},
    87	};
    88	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
