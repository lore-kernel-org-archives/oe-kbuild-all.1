Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0FB628
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jul 2023 01:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689382863; x=1720918863;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HXvTd8MiZIqj0eoRiBbX27u/cWqbUK69JIZ6+yReBXk=;
  b=P1Y9Yd6HPTeY+RGrdd6RXlVqIScT5tB2Y57jA4e2WDH1MX11ZzignpVL
   N8+y++LA9Q33sEWgrL9b/OwB1+/LjYzgbciS6VLRYoF67wuMQTZ3eu2UA
   gTp+ZurzdIhMm6zMmOQ4DjBxjwezPk2TO3Erax6xiFvH9Ev9d6fDlQHbF
   OWjTrXx9a82hiF0tKQXGtHPPul8BT8tn2bQJkF9Urn/TrhpqMxSdLaldd
   A+HDVOBJFSQKARYfZeGmJbjbwGC6nXmAlPdIuUFL3rQ0xdnR6qK+41Y4B
   LD2C5WgrW6AFKrwYrxk7iZhDIWWfVrKGaDqetay7heZMaZ0Y99DaqhT6W
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="364484224"
X-IronPort-AV: E=Sophos;i="6.01,206,1684825200"; 
   d="scan'208";a="364484224"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 18:00:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="788001105"
X-IronPort-AV: E=Sophos;i="6.01,206,1684825200"; 
   d="scan'208";a="788001105"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 14 Jul 2023 18:00:47 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKTeQ-0007nm-29;
	Sat, 15 Jul 2023 01:00:46 +0000
Date: Sat, 15 Jul 2023 09:00:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 65/105] mtk-mmsys.c:undefined reference to
 `cmdq_pkt_write_mask'
Message-ID: <202307150800.k36ksAJr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   728def01a062c3d0deaa96bcbf44b3f191a3dc92
commit: ea3d26b64d9b0564b9fff7293d9982b8b09fc7b1 [65/105] UPSTREAM: soc: mediatek: Cleanup ifdefs for IS_REACHABLE(CONFIG_MTK_CMDQ)
config: arm64-randconfig-r032-20230714 (https://download.01.org/0day-ci/archive/20230715/202307150800.k36ksAJr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230715/202307150800.k36ksAJr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307150800.k36ksAJr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-ld: Unexpected GOT/PLT entries detected!
>> aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: ID map text too big or misaligned
   aarch64-linux-ld: drivers/soc/mediatek/mtk-mmsys.o: in function `mtk_mmsys_update_bits':
>> mtk-mmsys.c:(.text+0x78): undefined reference to `cmdq_pkt_write_mask'
   aarch64-linux-ld: drivers/soc/mediatek/mtk-mmsys.o: in function `mtk_mmsys_probe':
>> mtk-mmsys.c:(.text+0x700): undefined reference to `cmdq_dev_get_client_reg'
   aarch64-linux-ld: drivers/soc/mediatek/mtk-mutex.o: in function `mtk_mutex_enable_by_cmdq':
>> mtk-mutex.c:(.text+0x244): undefined reference to `cmdq_pkt_write'
   aarch64-linux-ld: drivers/soc/mediatek/mtk-mutex.o: in function `mtk_mutex_probe':
>> mtk-mutex.c:(.text+0x308): undefined reference to `cmdq_dev_get_client_reg'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
