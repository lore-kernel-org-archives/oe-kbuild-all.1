Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19432FE28
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Nov 2023 15:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UdoKOX8F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700840549; x=1732376549;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i1r7KU1FfMgRubsCKBop1XSoVWnqEYad1dSdEQLCZgY=;
  b=UdoKOX8FgkhQViO+s2k/O02ycRzU9u9ucYMPXwL++IS3OE9RNFmuurf9
   Z4r/Qq/fK1RG3MqLWFTcilWXxOwk1FZUXbtPlG7l7IVGlJi+0Dg3XsRQE
   bc7DpSBfASjn18OCggRJ6ndK02Ci1PCGX6NOUEicpNH/qahuykL2owO7J
   HfmLmrCWeZ9DS9CTBEa52t6KxqBg9xqYEfBezk7zmfa65hJ9XEmpG3v1m
   opoaL2ZRgm6Z9jUybCEAaB2vsmB3cYt9i5xrKgM1Fjvosxor5QTUcUkWh
   EMDLMoGaiwFAsGRWVjcYFhPpVdDkwHwYEXdfa02HpunujVEwkNQd2d0uk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="395257443"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="395257443"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 07:42:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="767510985"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="767510985"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 24 Nov 2023 07:42:24 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6YJy-0002yl-19;
	Fri, 24 Nov 2023 15:42:22 +0000
Date: Fri, 24 Nov 2023 23:42:03 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Muellner <christoph.muellner@vrull.eu>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 3/5] uapi: prctl: Add new prctl call to set/get the
 memory consistency model
Message-ID: <202311241915.1PboZbFO-lkp@intel.com>
References: <20231124072142.2786653-4-christoph.muellner@vrull.eu>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231124072142.2786653-4-christoph.muellner@vrull.eu>

Hi Christoph,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on shuah-kselftest/next]
[also build test ERROR on shuah-kselftest/fixes linus/master v6.7-rc2 next-20231124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christoph-Muellner/RISC-V-Add-basic-Ssdtso-support/20231124-153009
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next
patch link:    https://lore.kernel.org/r/20231124072142.2786653-4-christoph.muellner%40vrull.eu
patch subject: [RFC PATCH 3/5] uapi: prctl: Add new prctl call to set/get the memory consistency model
config: x86_64-randconfig-001-20231124 (https://download.01.org/0day-ci/archive/20231124/202311241915.1PboZbFO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231124/202311241915.1PboZbFO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311241915.1PboZbFO-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sys.c: In function '__do_sys_prctl':
>> kernel/sys.c:150:41: error: called object is not a function or function pointer
     150 | # define SET_MEMORY_CONSISTENCY_MODEL   (-EINVAL)
         |                                         ^
   kernel/sys.c:2749:25: note: in expansion of macro 'SET_MEMORY_CONSISTENCY_MODEL'
    2749 |                 error = SET_MEMORY_CONSISTENCY_MODEL(arg2);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sys.c:153:41: error: called object is not a function or function pointer
     153 | # define GET_MEMORY_CONSISTENCY_MODEL   (-EINVAL)
         |                                         ^
   kernel/sys.c:2752:25: note: in expansion of macro 'GET_MEMORY_CONSISTENCY_MODEL'
    2752 |                 error = GET_MEMORY_CONSISTENCY_MODEL();
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +150 kernel/sys.c

    79	
    80	#ifndef SET_UNALIGN_CTL
    81	# define SET_UNALIGN_CTL(a, b)	(-EINVAL)
    82	#endif
    83	#ifndef GET_UNALIGN_CTL
    84	# define GET_UNALIGN_CTL(a, b)	(-EINVAL)
    85	#endif
    86	#ifndef SET_FPEMU_CTL
    87	# define SET_FPEMU_CTL(a, b)	(-EINVAL)
    88	#endif
    89	#ifndef GET_FPEMU_CTL
    90	# define GET_FPEMU_CTL(a, b)	(-EINVAL)
    91	#endif
    92	#ifndef SET_FPEXC_CTL
    93	# define SET_FPEXC_CTL(a, b)	(-EINVAL)
    94	#endif
    95	#ifndef GET_FPEXC_CTL
    96	# define GET_FPEXC_CTL(a, b)	(-EINVAL)
    97	#endif
    98	#ifndef GET_ENDIAN
    99	# define GET_ENDIAN(a, b)	(-EINVAL)
   100	#endif
   101	#ifndef SET_ENDIAN
   102	# define SET_ENDIAN(a, b)	(-EINVAL)
   103	#endif
   104	#ifndef GET_TSC_CTL
   105	# define GET_TSC_CTL(a)		(-EINVAL)
   106	#endif
   107	#ifndef SET_TSC_CTL
   108	# define SET_TSC_CTL(a)		(-EINVAL)
   109	#endif
   110	#ifndef GET_FP_MODE
   111	# define GET_FP_MODE(a)		(-EINVAL)
   112	#endif
   113	#ifndef SET_FP_MODE
   114	# define SET_FP_MODE(a,b)	(-EINVAL)
   115	#endif
   116	#ifndef SVE_SET_VL
   117	# define SVE_SET_VL(a)		(-EINVAL)
   118	#endif
   119	#ifndef SVE_GET_VL
   120	# define SVE_GET_VL()		(-EINVAL)
   121	#endif
   122	#ifndef SME_SET_VL
   123	# define SME_SET_VL(a)		(-EINVAL)
   124	#endif
   125	#ifndef SME_GET_VL
   126	# define SME_GET_VL()		(-EINVAL)
   127	#endif
   128	#ifndef PAC_RESET_KEYS
   129	# define PAC_RESET_KEYS(a, b)	(-EINVAL)
   130	#endif
   131	#ifndef PAC_SET_ENABLED_KEYS
   132	# define PAC_SET_ENABLED_KEYS(a, b, c)	(-EINVAL)
   133	#endif
   134	#ifndef PAC_GET_ENABLED_KEYS
   135	# define PAC_GET_ENABLED_KEYS(a)	(-EINVAL)
   136	#endif
   137	#ifndef SET_TAGGED_ADDR_CTRL
   138	# define SET_TAGGED_ADDR_CTRL(a)	(-EINVAL)
   139	#endif
   140	#ifndef GET_TAGGED_ADDR_CTRL
   141	# define GET_TAGGED_ADDR_CTRL()		(-EINVAL)
   142	#endif
   143	#ifndef RISCV_V_SET_CONTROL
   144	# define RISCV_V_SET_CONTROL(a)		(-EINVAL)
   145	#endif
   146	#ifndef RISCV_V_GET_CONTROL
   147	# define RISCV_V_GET_CONTROL()		(-EINVAL)
   148	#endif
   149	#ifndef SET_MEMORY_CONSISTENCY_MODEL
 > 150	# define SET_MEMORY_CONSISTENCY_MODEL	(-EINVAL)
   151	#endif
   152	#ifndef GET_MEMORY_CONSISTENCY_MODEL
   153	# define GET_MEMORY_CONSISTENCY_MODEL	(-EINVAL)
   154	#endif
   155	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
