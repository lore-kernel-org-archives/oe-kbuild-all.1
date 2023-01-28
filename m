Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A33E5CBA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jan 2023 16:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674921717; x=1706457717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z6cZHyrmQ8FRifBdV4xL7gV3g7/G+O2zQRcuXqOKBl0=;
  b=bpzvgff2vG+fk1zszwRqkFv6bzf1Ai/lHW2BwG/e5W81of2IRHduhS13
   nVOxsSTsJZpW6Dq2g95cxS7qkECs6GZt7mAFVJD2P498Y0p0XwN2toWp9
   bwVjfzoI4VB4CCrrqgkmdNg6PdeJZ6Z1mDrm7LmlKu6VNmJgvkr6oVV2L
   tdlbZqnHXJZsOX5mBhCKdwG7/29vDd4FWCzGU+H/SvE94AKy/0kra9uM8
   aRl5AnqcXywnDWcHf4hi77667rzGCDu45mZfafDjN6xmOntSebnRQotV5
   ByP4PAcULz5XeL8LJ4tWf/iDW63FfdjvNY1R7voJffIGw5SfQlQSPNNck
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="354612613"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="354612613"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 08:01:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="837496571"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="837496571"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 28 Jan 2023 08:01:40 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLne7-0000rn-0a;
	Sat, 28 Jan 2023 16:01:39 +0000
Date: Sun, 29 Jan 2023 00:01:05 +0800
From: kernel test robot <lkp@intel.com>
To: Song Liu <song@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: include/linux/vmalloc.h:143: multiple definition of
 `register_text_tail_vm';
 drivers/mfd/wm8994-core.o:include/linux/vmalloc.h:143: first defined here
Message-ID: <202301282341.ooayeduo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel-lab-lkp/linux/commits/Song-Liu/module-replace-module_layout-with-module_memory/20230128-155809
head:   3d043be5ab6ba8f9103bf6e4fe555f9d094e5b2c
commit: 9588973ddc5527f751cae5e1a3e895538d935b4b vmalloc: introduce register_text_tail_vm()
date:   8 hours ago
config: arm-randconfig-r046-20230123 (https://download.01.org/0day-ci/archive/20230128/202301282341.ooayeduo-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/9588973ddc5527f751cae5e1a3e895538d935b4b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Song-Liu/module-replace-module_layout-with-module_memory/20230128-155809
        git checkout 9588973ddc5527f751cae5e1a3e895538d935b4b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/mfd/wm8994-irq.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/mfd/wm8994-core.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/mfd/wm8994-regmap.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/mfd/wm8994-core.o:include/linux/vmalloc.h:143: first defined here
--
   arm-linux-gnueabi-ld: drivers/mfd/da9063-irq.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/mfd/da9063-core.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/mfd/da9063-i2c.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/mfd/da9063-core.o:include/linux/vmalloc.h:143: first defined here
--
   arm-linux-gnueabi-ld: drivers/mfd/pcf50633-irq.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/mfd/pcf50633-core.o:include/linux/vmalloc.h:143: first defined here
--
   arm-linux-gnueabi-ld: drivers/nfc/nxp-nci/firmware.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/nfc/nxp-nci/core.o:include/linux/vmalloc.h:143: first defined here
--
   arm-linux-gnueabi-ld: drivers/nfc/s3fwrn5/firmware.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/nfc/s3fwrn5/core.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/nfc/s3fwrn5/nci.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/nfc/s3fwrn5/core.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/nfc/s3fwrn5/phy_common.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/nfc/s3fwrn5/core.o:include/linux/vmalloc.h:143: first defined here
--
   arm-linux-gnueabi-ld: drivers/dma-buf/st-dma-fence-unwrap.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/dma-buf/st-dma-fence-chain.o:include/linux/vmalloc.h:143: first defined here
--
   arm-linux-gnueabi-ld: drivers/misc/lkdtm/heap.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/misc/lkdtm/core.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/misc/lkdtm/perms.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/misc/lkdtm/core.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/misc/lkdtm/usercopy.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/misc/lkdtm/core.o:include/linux/vmalloc.h:143: first defined here
--
   arm-linux-gnueabi-ld: drivers/scsi/hosts.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/scsi/scsi.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/scsi/scsi_ioctl.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/scsi/scsi.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/scsi/scsicam.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/scsi/scsi.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/scsi/scsi_error.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/scsi/scsi.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/scsi/scsi_lib.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/scsi/scsi.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/scsi/scsi_lib_dma.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/scsi/scsi.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/scsi/scsi_scan.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/scsi/scsi.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/scsi/scsi_sysfs.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/scsi/scsi.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/scsi/scsi_devinfo.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/scsi/scsi.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/scsi/scsi_debugfs.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/scsi/scsi.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/scsi/scsi_trace.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/scsi/scsi.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/scsi/scsi_logging.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/scsi/scsi.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/scsi/scsi_pm.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/scsi/scsi.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/scsi/scsi_dh.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/scsi/scsi.o:include/linux/vmalloc.h:143: first defined here
--
   arm-linux-gnueabi-ld: drivers/nvme/target/configfs.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/nvme/target/core.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/nvme/target/admin-cmd.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/nvme/target/core.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/nvme/target/fabrics-cmd.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/nvme/target/core.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/nvme/target/discovery.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/nvme/target/core.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/nvme/target/io-cmd-file.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/nvme/target/core.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/nvme/target/io-cmd-bdev.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/nvme/target/core.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/nvme/target/passthru.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/nvme/target/core.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/nvme/target/zns.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/nvme/target/core.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/nvme/target/fabrics-cmd-auth.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/nvme/target/core.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/nvme/target/auth.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/nvme/target/core.o:include/linux/vmalloc.h:143: first defined here
--
   arm-linux-gnueabi-ld: drivers/net/wireless/marvell/libertas/cmd.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/net/wireless/marvell/libertas/cfg.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/net/wireless/marvell/libertas/cmdresp.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/net/wireless/marvell/libertas/cfg.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/net/wireless/marvell/libertas/debugfs.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/net/wireless/marvell/libertas/cfg.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/net/wireless/marvell/libertas/ethtool.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/net/wireless/marvell/libertas/cfg.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/net/wireless/marvell/libertas/main.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/net/wireless/marvell/libertas/cfg.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/net/wireless/marvell/libertas/rx.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/net/wireless/marvell/libertas/cfg.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/net/wireless/marvell/libertas/tx.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/net/wireless/marvell/libertas/cfg.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/net/wireless/marvell/libertas/firmware.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/net/wireless/marvell/libertas/cfg.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/net/wireless/marvell/libertas/mesh.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/net/wireless/marvell/libertas/cfg.o:include/linux/vmalloc.h:143: first defined here
--
   arm-linux-gnueabi-ld: drivers/net/wireless/marvell/mwifiex/init.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/net/wireless/marvell/mwifiex/main.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/net/wireless/marvell/mwifiex/cfp.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/net/wireless/marvell/mwifiex/main.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/net/wireless/marvell/mwifiex/cmdevt.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/net/wireless/marvell/mwifiex/main.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/net/wireless/marvell/mwifiex/util.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/net/wireless/marvell/mwifiex/main.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/net/wireless/marvell/mwifiex/txrx.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/net/wireless/marvell/mwifiex/main.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/net/wireless/marvell/mwifiex/wmm.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/net/wireless/marvell/mwifiex/main.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/net/wireless/marvell/mwifiex/11n.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/net/wireless/marvell/mwifiex/main.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/net/wireless/marvell/mwifiex/11ac.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/net/wireless/marvell/mwifiex/main.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/net/wireless/marvell/mwifiex/11n_aggr.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/net/wireless/marvell/mwifiex/main.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/net/wireless/marvell/mwifiex/11n_rxreorder.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/net/wireless/marvell/mwifiex/main.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/net/wireless/marvell/mwifiex/scan.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/net/wireless/marvell/mwifiex/main.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/net/wireless/marvell/mwifiex/join.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/net/wireless/marvell/mwifiex/main.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/net/wireless/marvell/mwifiex/sta_ioctl.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/net/wireless/marvell/mwifiex/main.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/net/wireless/marvell/mwifiex/sta_cmd.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/net/wireless/marvell/mwifiex/main.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/net/wireless/marvell/mwifiex/uap_cmd.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/net/wireless/marvell/mwifiex/main.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/net/wireless/marvell/mwifiex/ie.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/net/wireless/marvell/mwifiex/main.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/net/wireless/marvell/mwifiex/sta_cmdresp.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/net/wireless/marvell/mwifiex/main.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/net/wireless/marvell/mwifiex/sta_event.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/net/wireless/marvell/mwifiex/main.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/net/wireless/marvell/mwifiex/uap_event.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/net/wireless/marvell/mwifiex/main.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/net/wireless/marvell/mwifiex/sta_tx.o: in function `register_text_tail_vm':
>> include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/net/wireless/marvell/mwifiex/main.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/net/wireless/marvell/mwifiex/sta_rx.o: in function `register_text_tail_vm':
   include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/net/wireless/marvell/mwifiex/main.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/net/wireless/marvell/mwifiex/uap_txrx.o: in function `register_text_tail_vm':
   include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/net/wireless/marvell/mwifiex/main.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/net/wireless/marvell/mwifiex/cfg80211.o: in function `register_text_tail_vm':
   include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/net/wireless/marvell/mwifiex/main.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/net/wireless/marvell/mwifiex/ethtool.o: in function `register_text_tail_vm':
   include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/net/wireless/marvell/mwifiex/main.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/net/wireless/marvell/mwifiex/11h.o: in function `register_text_tail_vm':
   include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/net/wireless/marvell/mwifiex/main.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/net/wireless/marvell/mwifiex/tdls.o: in function `register_text_tail_vm':
   include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/net/wireless/marvell/mwifiex/main.o:include/linux/vmalloc.h:143: first defined here
   arm-linux-gnueabi-ld: drivers/net/wireless/marvell/mwifiex/debugfs.o: in function `register_text_tail_vm':
   include/linux/vmalloc.h:143: multiple definition of `register_text_tail_vm'; drivers/net/wireless/marvell/mwifiex/main.o:include/linux/vmalloc.h:143: first defined here
..


vim +143 include/linux/vmalloc.h

   131	
   132	#ifdef CONFIG_MMU
   133	extern void __init vmalloc_init(void);
   134	extern unsigned long vmalloc_nr_pages(void);
   135	void register_text_tail_vm(unsigned long start, unsigned long end);
   136	#else
   137	static inline void vmalloc_init(void)
   138	{
   139	}
   140	static inline unsigned long vmalloc_nr_pages(void) { return 0; }
   141	void register_text_tail_vm(unsigned long start, unsigned long end)
   142	{
 > 143	}
   144	#endif
   145	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
