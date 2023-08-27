Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455147EE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Aug 2023 06:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693117741; x=1724653741;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cLWf4ZIPW4CqAe+alD4k6kGN7DhmfFwpiU2ZkdTuZh4=;
  b=jS792Hk4YZ2yapRDocmmH6gQ2YGzZVhuVkluZpO84+f2AjysvXkr+qT/
   7Q+p/8satt9B39WNEUPztRi1HzUGyUwOypLYJ/AlKKahZ+2UV5aBwE0c+
   Fn92NJbQULSXqCGq1eSTo9YOst5OxMWDMHKZ2fjMvMjDF2M5pLTTUfMem
   1j7AevJq99kbNhaevpcK2VmAdIVDyMz4UgKBiYZ2qXheevQH+HsBjbOlK
   v5208mpaQpudnscalGPETJq2038UZ3V4bA/YwtX0DeVVUQIcR6feVbz3q
   gaqbN2b6g9o2jzKq0XLdK2P5upoPfkXpi931j/4XI8DOaN3dg8D357fiE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="374892936"
X-IronPort-AV: E=Sophos;i="6.02,204,1688454000"; 
   d="scan'208";a="374892936"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 23:29:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="772918023"
X-IronPort-AV: E=Sophos;i="6.02,204,1688454000"; 
   d="scan'208";a="772918023"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 26 Aug 2023 23:28:57 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qa9Ga-0005Tf-1c;
	Sun, 27 Aug 2023 06:28:56 +0000
Date: Sun, 27 Aug 2023 14:27:58 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.5-rc1-esp32wifi 40/48] /usr/bin/ld:
 drivers/misc/esp32-ipc.c:148: undefined reference to `devm_of_iomap'
Message-ID: <202308271453.SOnvkIW8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Max,

First bad commit (maybe != root cause):

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.5-rc1-esp32wifi
head:   37fd9d9c4f957906efc14a9849942100af4f99e2
commit: 422f7405a1d5afa30398c9b6a9b6bc1b50a83be1 [40/48] esp_wifi: shmem: use esp_ipc driver
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20230827/202308271453.SOnvkIW8-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230827/202308271453.SOnvkIW8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308271453.SOnvkIW8-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: drivers/misc/esp32-ipc.o: in function `init_hw':
   drivers/misc/esp32-ipc.c:142: undefined reference to `devm_of_iomap'
   /usr/bin/ld: drivers/misc/esp32-ipc.c:146: undefined reference to `devm_iounmap'
>> /usr/bin/ld: drivers/misc/esp32-ipc.c:148: undefined reference to `devm_of_iomap'
   /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.o: in function `esp_wifi_shmem_remove':
   drivers/net/wireless/espressif/esp_shmem.c:360: undefined reference to `esp_wifi_deinit'
   /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.o: in function `process_event_esp_bootup':
   drivers/net/wireless/espressif/esp_shmem.c:129: undefined reference to `process_fw_data'
   /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.c:130: undefined reference to `esp_remove_card'
   /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.c:136: undefined reference to `process_test_capabilities'
   /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.c:189: undefined reference to `cfg80211_scan_done'
   /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.c:193: undefined reference to `cfg80211_disconnected'
   /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.c:198: undefined reference to `esp_remove_card'
   /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.c:203: undefined reference to `esp_add_card'
   /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.c:207: undefined reference to `process_capabilities'
   /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.c:208: undefined reference to `print_capabilities'
   collect2: error: ld returned 1 exit status

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ESP32_IPC
   Depends on [n]: OF [=n] && HAS_IOMEM [=n]
   Selected by [y]:
   - ESP32_WIFI_SHMEM [=y] && NETDEVICES [=y] && WLAN [=y] && WLAN_VENDOR_ESPRESSIF [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
