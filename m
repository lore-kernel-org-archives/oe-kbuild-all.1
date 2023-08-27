Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F00D65E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Aug 2023 05:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693113379; x=1724649379;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FMTDi16DfSTduVTEm+8m7URFp+DchDR1gimfXWvCv1s=;
  b=TS9dBZgL6hzMzYy6ZD6z0z1OcT+UeOKsH16Pfhq6xwazk+GGbwPimCa0
   0uq3URPdb0x60x5C+7pGC7WXNB5SozWFCQHbZT1uoh8doZ8N7pq1F/kf0
   F7dSSi86oeBKrhrrkEQFzLgELth5lNpf+PLCRIpRFWfkt8pGAQ09aIQD6
   6UOvgm6l5DyD29kmIbQWtdzLTyDHd8wuF468s3MS1oEh6PE8NPrXzSb/+
   6uHbFxv1EVfuD9Rt/qkO9M0VijKQRcbV0W9i/eqkgn2hafjYX/PQWuLUd
   XkbCDtqDOxP7o+UqG9n5v8/hjERju2rZG7EI3H8Ut9JP1woXTfTeqppjB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="374889102"
X-IronPort-AV: E=Sophos;i="6.02,204,1688454000"; 
   d="scan'208";a="374889102"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 22:16:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="881575959"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2023 22:16:22 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qa88G-0005PL-2O;
	Sun, 27 Aug 2023 05:16:16 +0000
Date: Sun, 27 Aug 2023 13:15:55 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.5-rc1-esp32wifi 25/48]
 drivers/net/wireless/espressif/esp_shmem.c:474:34: warning:
 'esp_wifi_shmem_match' defined but not used
Message-ID: <202308271352.paAoTcIp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Max,

FYI, the error/warning still remains.

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.5-rc1-esp32wifi
head:   37fd9d9c4f957906efc14a9849942100af4f99e2
commit: a35d9035c4d7eacb28bc465097fbbee739fe81fa [25/48] esp_wifi: add shmem transport
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20230827/202308271352.paAoTcIp-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230827/202308271352.paAoTcIp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308271352.paAoTcIp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/wireless/espressif/esp_shmem.c: In function 'init_hw':
   drivers/net/wireless/espressif/esp_shmem.c:384:20: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     384 |         hw->hw_q = (void *)readl(p);
         |                    ^
   drivers/net/wireless/espressif/esp_shmem.c: At top level:
>> drivers/net/wireless/espressif/esp_shmem.c:474:34: warning: 'esp_wifi_shmem_match' defined but not used [-Wunused-const-variable=]
     474 | static const struct of_device_id esp_wifi_shmem_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~


vim +/esp_wifi_shmem_match +474 drivers/net/wireless/espressif/esp_shmem.c

   473	
 > 474	static const struct of_device_id esp_wifi_shmem_match[] = {
   475		{
   476			.compatible = "esp,esp-wifi-shmem",
   477		}, {},
   478	};
   479	MODULE_DEVICE_TABLE(of, esp_wifi_shmem_match);
   480	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
