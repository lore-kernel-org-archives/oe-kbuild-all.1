Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF96F11715
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 08:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695199628; x=1726735628;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Odwv8FMHnIAKv0TwOjZNQX08qMKx/FnUI2oadH/h60Y=;
  b=Y4+x4jxaGVfnbb5DOYYVr6w0Ayv2DHowi3EaKrENN1BYv5WlO4WhKrpv
   FPRyYKR5MdUmeZQlA90RON8B5MUhGibdcLRm6cJuEBAegi7XBkW2nBPrW
   YP+5u1svedCU9OviUhw/1pc2apimCyz23J8x/M7f6bJ6GeNB4tHLZ19HE
   t5tQmyHvJP7YYeiuRvR2GyHStbK4904g6LAC1pC3UrcM+b8Y8lDF+EyOr
   q6kK3HC+PROsykWOLWjToZKNCQ5jFryu7ry9f+BJC+GF60hTYERF1UEHU
   RT0lnN84iy+Y8hy8FPy1QxG1hvXahYokXYmp+dlg50sa4Ti5rb0eoReWz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="380071200"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="380071200"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 01:47:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="870285456"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="870285456"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 20 Sep 2023 01:47:02 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qisrM-0008Xu-1S;
	Wed, 20 Sep 2023 08:47:00 +0000
Date: Wed, 20 Sep 2023 16:46:39 +0800
From: kernel test robot <lkp@intel.com>
To: Praveen Teja Kundanala <praveen.teja.kundanala@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 1288/1363]
 ./usr/include/misc/xilinx_puf.h:32:9: error: unknown type name 'u8'
Message-ID: <202309201629.Yl9kj7i9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   4f412ed20fd2c5353c1e878ef9ed77952a5040a1
commit: 7137797b78b36e6bf5b21a6a8ade44619c84721c [1288/1363] misc: Add driver support for PUF
config: x86_64-buildonly-randconfig-002-20230920 (https://download.01.org/0day-ci/archive/20230920/202309201629.Yl9kj7i9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309201629.Yl9kj7i9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309201629.Yl9kj7i9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/misc/xilinx_puf.h:32:9: error: unknown type name 'u8'
      32 |         u8 pufoperation;
         |         ^~
   ./usr/include/misc/xilinx_puf.h:33:9: error: unknown type name 'u8'
      33 |         u8 globalvarfilter;
         |         ^~
   ./usr/include/misc/xilinx_puf.h:34:9: error: unknown type name 'u8'
      34 |         u8 readoption;
         |         ^~
>> ./usr/include/misc/xilinx_puf.h:35:9: error: unknown type name 'u32'
      35 |         u32 shuttervalue;
         |         ^~~
>> ./usr/include/misc/xilinx_puf.h:36:9: error: unknown type name 'u64'
      36 |         u64 pufdataaddr;
         |         ^~~
   ./usr/include/misc/xilinx_puf.h:37:9: error: unknown type name 'u64'
      37 |         u64 pufidaddr;
         |         ^~~
   ./usr/include/misc/xilinx_puf.h:38:9: error: unknown type name 'u64'
      38 |         u64 trimsyndataaddr;
         |         ^~~
   ./usr/include/misc/xilinx_puf.h:48:9: error: unknown type name 'u32'
      48 |         u32 syndata[PUF_MAX_SYNDROME_DATA_LEN_IN_WORDS];
         |         ^~~
   ./usr/include/misc/xilinx_puf.h:49:9: error: unknown type name 'u32'
      49 |         u32 chash;
         |         ^~~
   ./usr/include/misc/xilinx_puf.h:50:9: error: unknown type name 'u32'
      50 |         u32 aux;
         |         ^~~
   ./usr/include/misc/xilinx_puf.h:61:9: error: unknown type name 'u32'
      61 |         u32 pufid[PUF_ID_LEN_IN_WORDS];
         |         ^~~
   ./usr/include/misc/xilinx_puf.h:62:9: error: unknown type name 'u32'
      62 |         u32 efusesyndata[PUF_EFUSE_TRIM_SYN_DATA_IN_WORDS];
         |         ^~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
