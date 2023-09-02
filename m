Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6123BBA2C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Sep 2023 00:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693699238; x=1725235238;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WDnw4cEC1+2HHlRpfQnLW2wiczBIUozhnh6GWXeZQaU=;
  b=nxXqNa4NokkwrOEJchVt8RauVdqiBQKCQZKmJLe7EW2esXch4oMSIAw7
   Oa27fHioyAENHBDaldOq8IfjxvuoObo5RkfJdQtAXGGpfb46Se2t9AYEG
   eDM4SsbOFw/9pCRm0U4VFkB1vWSCRtkID8oObJv+tQ3Cy0vr5UBoocbh8
   pQw8HUG8YbWPeMdPgYFLVOMN3rMMTIKt29MSsC2PM/jL32dMovUMHQTrO
   133RFB2dxf1kyfsLvxa2dHaLiWiFFlVgQWeWt+O/X6Pb3a7bYDIkLat1S
   XPfh+ZDTLUp0wX8/tk16Kq9THdr2gSO5QSRzwQN85eOxHMvOCNTOnebd4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="440377040"
X-IronPort-AV: E=Sophos;i="6.02,223,1688454000"; 
   d="scan'208";a="440377040"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2023 17:00:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="830514387"
X-IronPort-AV: E=Sophos;i="6.02,223,1688454000"; 
   d="scan'208";a="830514387"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 02 Sep 2023 17:00:35 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcaXZ-0002hp-0c;
	Sun, 03 Sep 2023 00:00:33 +0000
Date: Sun, 3 Sep 2023 07:59:48 +0800
From: kernel test robot <lkp@intel.com>
To: Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Liu Yun <liuyun@loongson.cn>,
	Liu Peibao <liupeibao@loongson.cn>
Subject: loongson2_pm.c:undefined reference to `input_allocate_device'
Message-ID: <202309030723.tbXa6lNB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   92901222f83d988617aee37680cb29e1a743b5e4
commit: 67694c076bd7d6b8b73c59d4881822f0493caf35 soc: loongson2_pm: add power management support
date:   12 days ago
config: loongarch-randconfig-r004-20230903 (https://download.01.org/0day-ci/archive/20230903/202309030723.tbXa6lNB-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230903/202309030723.tbXa6lNB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309030723.tbXa6lNB-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/soc/loongson/loongson2_pm.o: in function `.L7':
>> loongson2_pm.c:(.text+0x9c): undefined reference to `input_allocate_device'
>> loongarch64-linux-ld: loongson2_pm.c:(.text+0xd4): undefined reference to `input_set_capability'
>> loongarch64-linux-ld: loongson2_pm.c:(.text+0xdc): undefined reference to `input_register_device'
>> loongarch64-linux-ld: loongson2_pm.c:(.text+0xe8): undefined reference to `input_free_device'
   loongarch64-linux-ld: drivers/soc/loongson/loongson2_pm.o: in function `.L47':
>> loongson2_pm.c:(.text+0x2bc): undefined reference to `input_event'
>> loongarch64-linux-ld: loongson2_pm.c:(.text+0x2d0): undefined reference to `input_event'
   loongarch64-linux-ld: loongson2_pm.c:(.text+0x2e4): undefined reference to `input_event'
   loongarch64-linux-ld: loongson2_pm.c:(.text+0x2f8): undefined reference to `input_event'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
