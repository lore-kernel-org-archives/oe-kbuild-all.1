Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55622258F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Sep 2023 23:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693696717; x=1725232717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zdJhYvh5EdNQDqFSABgtCjvOzBng2FJlqBUlybJhGAA=;
  b=LuP/DeF/v+n5hUmpQoD4ELIeGTOZs8XCl2aQJcZIB4gf8BeP3jFCDrQW
   PviVIDBgY2fqwcMSpb91KWMdFPB2Y+qteSCiFfM6BYA84h9LxqzGykdks
   s9j4eV1S+wPxRa1vTCO2ERqEB8668wvZ9e1YiMYhwdwXdwzYe3LYZEkG/
   CPSD56pKfQfoqCkxMhscHKXaKcbKus5Pdkn50hSQjmhWIGrzfckVacpMP
   DF5NJ9eIlGdCRBlkFjSMxX042qggcK0A7BDDUzOrGsoiSMp/Ls6/dZAl2
   bwDZmF0mFH1AG3RJhublH+HR3BiDNPoGEVYbRHa8ISgFUpnP9fsp58tDv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="376338689"
X-IronPort-AV: E=Sophos;i="6.02,223,1688454000"; 
   d="scan'208";a="376338689"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2023 16:18:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="855132307"
X-IronPort-AV: E=Sophos;i="6.02,223,1688454000"; 
   d="scan'208";a="855132307"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 02 Sep 2023 16:18:34 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcZsu-0002gN-0r;
	Sat, 02 Sep 2023 23:18:32 +0000
Date: Sun, 3 Sep 2023 07:17:38 +0800
From: kernel test robot <lkp@intel.com>
To: Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Liu Yun <liuyun@loongson.cn>,
	Liu Peibao <liupeibao@loongson.cn>
Subject: loongson2_pm.c:undefined reference to `input_free_device'
Message-ID: <202309030751.pDnTZX4E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b89b029377c8c441649c7a6be908386e74ea9420
commit: 67694c076bd7d6b8b73c59d4881822f0493caf35 soc: loongson2_pm: add power management support
date:   12 days ago
config: loongarch-randconfig-r014-20230903 (https://download.01.org/0day-ci/archive/20230903/202309030751.pDnTZX4E-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230903/202309030751.pDnTZX4E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309030751.pDnTZX4E-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/soc/loongson/loongson2_pm.o: in function `.LBB191':
   loongson2_pm.c:(.text+0x10c): undefined reference to `input_allocate_device'
   loongarch64-linux-ld: loongson2_pm.c:(.text+0x144): undefined reference to `input_set_capability'
   loongarch64-linux-ld: loongson2_pm.c:(.text+0x14c): undefined reference to `input_register_device'
   loongarch64-linux-ld: drivers/soc/loongson/loongson2_pm.o: in function `.LBB240':
>> loongson2_pm.c:(.text+0x25c): undefined reference to `input_free_device'
   loongarch64-linux-ld: drivers/soc/loongson/loongson2_pm.o: in function `.LBB387':
   loongson2_pm.c:(.text+0x390): undefined reference to `input_event'
   loongarch64-linux-ld: drivers/soc/loongson/loongson2_pm.o: in function `.LBE387':
   loongson2_pm.c:(.text+0x3a4): undefined reference to `input_event'
   loongarch64-linux-ld: drivers/soc/loongson/loongson2_pm.o: in function `.LBE389':
   loongson2_pm.c:(.text+0x3b8): undefined reference to `input_event'
   loongarch64-linux-ld: drivers/soc/loongson/loongson2_pm.o: in function `.LBE391':
   loongson2_pm.c:(.text+0x3cc): undefined reference to `input_event'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
