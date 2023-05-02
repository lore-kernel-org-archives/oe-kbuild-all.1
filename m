Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014E37E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 May 2023 13:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683034887; x=1714570887;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+WmzuKJqiLToZ7Mk0hiDMsmWiqB1GSE9C6L5BtV5nkg=;
  b=MCj0Ll3tRoKLBC5MBYMvwAt7xeUxUNE9b6Y15XQjbGG441s5xsc1jLzk
   3ltOOzxIZwsJsjjRiIf4mf0Hzq/6LcMo/TGtpCJU+whqJ6P0fUpCDv6/f
   DRjqlIKf6LeUJ0AKT/a1S6FEnR8K+XC0izsrMxTXpZJlCiCWctnPv7esr
   esCYCuHnIRD79qJzMMX+Y304QvVjSKA8c3EZcEINxJ+ZEfIJXsz1hJDZa
   q34wYNJ5zPusvgEAnduHulJ6pIRJZR7H3GcMTzsaynuEhoc3bXlaLYx4H
   ysuY/JvXDkvEi/vlNloRZGO6JNekidrfpACkrOZecg5tmKDj7qaDnStJm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="413842511"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; 
   d="scan'208";a="413842511"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2023 06:41:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="696183091"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; 
   d="scan'208";a="696183091"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 02 May 2023 06:41:26 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptqFx-000151-11;
	Tue, 02 May 2023 13:41:25 +0000
Date: Tue, 2 May 2023 21:40:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 1/2] drivers/pci/pci.c:1300:3: error:
 implicit declaration of function 'pcie_aspm_pm_state_change' is invalid in
 C99
Message-ID: <202305022121.JtBUtEMs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   73814d53fc5bbbe8e675352ac21aaf8a1ca059dc
commit: 73814d53fc5bbbe8e675352ac21aaf8a1ca059dc [1/2] BACKPORT: PCI/PM: Split pci_raw_set_power_state()
config: x86_64-randconfig-a012-20230501 (https://download.01.org/0day-ci/archive/20230502/202305022121.JtBUtEMs-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.15
        git checkout 73814d53fc5bbbe8e675352ac21aaf8a1ca059dc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305022121.JtBUtEMs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/pci.c:1300:3: error: implicit declaration of function 'pcie_aspm_pm_state_change' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   pcie_aspm_pm_state_change(dev->bus->self);
                   ^
   1 error generated.


vim +/pcie_aspm_pm_state_change +1300 drivers/pci/pci.c

  1230	
  1231	/**
  1232	 * pci_power_up - Put the given device into D0
  1233	 * @dev: PCI device to power up
  1234	 */
  1235	int pci_power_up(struct pci_dev *dev)
  1236	{
  1237		bool need_restore = false;
  1238		u16 pmcsr;
  1239	
  1240		pci_platform_power_transition(dev, PCI_D0);
  1241	
  1242		if (dev->current_state == PCI_D0)
  1243			return 0;
  1244	
  1245		if (!dev->pm_cap)
  1246			return -EIO;
  1247	
  1248		pci_read_config_word(dev, dev->pm_cap + PCI_PM_CTRL, &pmcsr);
  1249		if (PCI_POSSIBLE_ERROR(pmcsr)) {
  1250			pci_err(dev, "Unable to change power state from %s to D0, device inaccessible\n",
  1251				pci_power_name(dev->current_state));
  1252			return -EIO;
  1253		}
  1254	
  1255		/*
  1256		 * If we're (effectively) in D3, force entire word to 0. This doesn't
  1257		 * affect PME_Status, disables PME_En, and sets PowerState to 0.
  1258		 */
  1259		if (dev->current_state >= PCI_D3hot) {
  1260			if ((pmcsr & PCI_PM_CTRL_STATE_MASK) == PCI_D3hot &&
  1261			    !(pmcsr & PCI_PM_CTRL_NO_SOFT_RESET))
  1262				need_restore = true;
  1263	
  1264			pmcsr = 0;
  1265		} else {
  1266			pmcsr &= ~PCI_PM_CTRL_STATE_MASK;
  1267		}
  1268	
  1269		pci_write_config_word(dev, dev->pm_cap + PCI_PM_CTRL, pmcsr);
  1270	
  1271		/* Mandatory transition delays; see PCI PM 1.2. */
  1272		if (dev->current_state == PCI_D3hot)
  1273			pci_dev_d3_sleep(dev);
  1274		else if (dev->current_state == PCI_D2)
  1275			udelay(PCI_PM_D2_DELAY);
  1276	
  1277		pci_read_config_word(dev, dev->pm_cap + PCI_PM_CTRL, &pmcsr);
  1278		dev->current_state = pmcsr & PCI_PM_CTRL_STATE_MASK;
  1279		if (dev->current_state != PCI_D0)
  1280			pci_info_ratelimited(dev, "Refused to change power state from %s to D0\n",
  1281					     pci_power_name(dev->current_state));
  1282	
  1283		/*
  1284		 * According to section 5.4.1 of the "PCI BUS POWER MANAGEMENT
  1285		 * INTERFACE SPECIFICATION, REV. 1.2", a device transitioning
  1286		 * from D3hot to D0 _may_ perform an internal reset, thereby
  1287		 * going to "D0 Uninitialized" rather than "D0 Initialized".
  1288		 * For example, at least some versions of the 3c905B and the
  1289		 * 3c556B exhibit this behaviour.
  1290		 *
  1291		 * At least some laptop BIOSen (e.g. the Thinkpad T21) leave
  1292		 * devices in a D3hot state at boot.  Consequently, we need to
  1293		 * restore at least the BARs so that the device will be
  1294		 * accessible to its driver.
  1295		 */
  1296		if (need_restore)
  1297			pci_restore_bars(dev);
  1298	
  1299		if (dev->bus->self)
> 1300			pcie_aspm_pm_state_change(dev->bus->self);
  1301	
  1302		return 0;
  1303	}
  1304	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
