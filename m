Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38A363E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jul 2023 06:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689056271; x=1720592271;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3JQ+u8oGCq6n3DDQqrWu6Nl+shQeN/XnRMoqmGRbtqY=;
  b=SYEWfaa+NSQmlXEy/jvTplxW/Is4FU1FPx/WwJnvsOG0IU47gjMaUblg
   FhKZKKco+dNVsUyfipqI3Dw2kN3BojT/mPJ/2Yyo4dnRKnivOa/OqrZq8
   naW7qXGqLOXCNawRif2zZe8UUmXKqfV4E/foc+I/dJUuurtZRMWvmY31m
   A97DYwZYUo6Kv0qUz42HMeKhzyh169oc36N1TojiP6P5i5ACEE4B/oo2w
   kn1nh7MCzHtZ4cqO1Ho9pk6xgvnWV9QPh7fo4avws0/svU6aQcxmRrID6
   EbBumV00wZh9RLHmO0qpMPfXLtTQnQJOz1DD5oaa5M0uNO56LkEkOHd3k
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="344134407"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="344134407"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 23:17:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="720959092"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="720959092"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 10 Jul 2023 23:17:45 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJ6gy-0004O7-1O;
	Tue, 11 Jul 2023 06:17:44 +0000
Date: Tue, 11 Jul 2023 14:17:01 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.5-rc1-esp32wifi 25/27]
 drivers/net/wireless/espressif/esp_shmem.c:474:34: warning:
 'esp_wifi_shmem_match' defined but not used
Message-ID: <202307111441.RJcQn1XA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.5-rc1-esp32wifi
head:   0e48757b20c9e813e7c330d76e0a6f895f0660d4
commit: a35d9035c4d7eacb28bc465097fbbee739fe81fa [25/27] esp_wifi: add shmem transport
config: i386-randconfig-i011-20230711 (https://download.01.org/0day-ci/archive/20230711/202307111441.RJcQn1XA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230711/202307111441.RJcQn1XA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307111441.RJcQn1XA-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
