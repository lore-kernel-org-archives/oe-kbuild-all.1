Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD49111A0
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 18:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694025052; x=1725561052;
  h=date:from:cc:subject:message-id:mime-version;
  bh=35F3QJYitxQDk6AW2MLEfuyizT+YMGR9HfXjuHmitfA=;
  b=MQcY/CXzbqbhjQhFAG6MqciMoF/r4ug8nVrVwQ/hUUqoJUg7GxkjJmY+
   wF3Yrx6kB2qIIVWGa+P7qJmeHkKuRI/h/Mi0k1Pk/qa5ly1mW5AyVw+ri
   0uM+ET1B6WfP1ZGq8GfZKGoimsvBbeE+L34VYY60j2zKNJg9PsowYzYA2
   rsk709HtETUhF5LG7Sb0QocjU9RHPDv4r4CqLqSwIi9uAIUXoz1IlSmOS
   Q8WeVK+69+eCQsdY5rdIyJLwHR3F9QeYgr3TUqW3rzenH8pOkAW3pSQGG
   JHwAjoi9tCv9p71acBvj+OkE9HUxM+KMj5ICYSgi+utDqsaf+qylxB+3f
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="362183705"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="362183705"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 11:30:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="915390861"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="915390861"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 06 Sep 2023 11:30:50 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdxIe-0000UI-29
	for oe-kbuild-all@lists.linux.dev;
	Wed, 06 Sep 2023 18:30:48 +0000
Date: Thu, 7 Sep 2023 02:30:14 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:4.19/android_s 12919/30000]
 drivers/soc/qcom/rpmh-rsc.c:697:16: error: expected declaration specifiers
 or '...' before string constant
Message-ID: <202309070245.uLFxHPyC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Will,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   6bfae51123c09ed71d82cfc739c5ccbeac60c4aa
commit: 1ee367d36875a25c92ae7bb66d4b6f25f0d386d5 [12919/30000] ANDROID: GKI: drivers: qcom: rpmh-rsc: Add tristate support for qcom,rpmh-rsc driver
config: m68k-randconfig-r004-20230906 (https://download.01.org/0day-ci/archive/20230907/202309070245.uLFxHPyC-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309070245.uLFxHPyC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309070245.uLFxHPyC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/m68k/include/asm/io_mm.h:25,
                    from arch/m68k/include/asm/io.h:8,
                    from include/linux/io.h:25,
                    from drivers/soc/qcom/rpmh-rsc.c:11:
   arch/m68k/include/asm/raw_io.h: In function 'raw_rom_outsb':
   arch/m68k/include/asm/raw_io.h:83:14: warning: variable '__w' set but not used [-Wunused-but-set-variable]
      83 |         ({u8 __w, __v = (b);  u32 _addr = ((u32) (addr)); \
         |              ^~~
   arch/m68k/include/asm/raw_io.h:399:17: note: in expansion of macro 'rom_out_8'
     399 |                 rom_out_8(port, *buf++);
         |                 ^~~~~~~~~
   arch/m68k/include/asm/raw_io.h: In function 'raw_rom_outsw':
   arch/m68k/include/asm/raw_io.h:86:15: warning: variable '__w' set but not used [-Wunused-but-set-variable]
      86 |         ({u16 __w, __v = (w); u32 _addr = ((u32) (addr)); \
         |               ^~~
   arch/m68k/include/asm/raw_io.h:417:17: note: in expansion of macro 'rom_out_be16'
     417 |                 rom_out_be16(port, *buf++);
         |                 ^~~~~~~~~~~~
   arch/m68k/include/asm/raw_io.h: In function 'raw_rom_outsw_swapw':
   arch/m68k/include/asm/raw_io.h:90:15: warning: variable '__w' set but not used [-Wunused-but-set-variable]
      90 |         ({u16 __w, __v = (w); u32 _addr = ((u32) (addr)); \
         |               ^~~
   arch/m68k/include/asm/raw_io.h:435:17: note: in expansion of macro 'rom_out_le16'
     435 |                 rom_out_le16(port, *buf++);
         |                 ^~~~~~~~~~~~
   drivers/soc/qcom/rpmh-rsc.c: At top level:
>> drivers/soc/qcom/rpmh-rsc.c:697:16: error: expected declaration specifiers or '...' before string constant
     697 | MODULE_LICENSE("GPL v2");
         |                ^~~~~~~~
   drivers/soc/qcom/rpmh-rsc.c:698:20: error: expected declaration specifiers or '...' before string constant
     698 | MODULE_DESCRIPTION("Qualcomm RPM-Hardened (RPMH) Communication driver");
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +697 drivers/soc/qcom/rpmh-rsc.c

   696	
 > 697	MODULE_LICENSE("GPL v2");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
