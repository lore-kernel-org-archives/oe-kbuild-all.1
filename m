Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AE9ED4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Aug 2023 08:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693123875; x=1724659875;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ymzo/X0+80b+l/W59jC5sSGuzK3KJN3dH7mPaphXPn8=;
  b=i5gBEeUmr/e2VEqy17xR3l8MjNmDR3uLSZHYAGFI0V1HtG8H/n3islmE
   h6ezhzm5HqIsYyt4/JgEJn94x3WpTcnIdi15KNc/N7UWed8wEW10drvuI
   flCpNBG4Lm3ZQwi4SekuneSYrMArQbf2LzmrLYDMkJeXDpnD+xyLfl5HZ
   yDAMwJBE6iOXEKPeUpXCAccraANlGPGco5gP1ZLXgdnA3uRS/S5f1rPMI
   NJa+4mleXhyD3o2pQIvpRXWAqJm6YIo5iItyoCCMtRMP5HZbIWIBA5nJO
   jH7NoNsmbk5+8D3UV+kh9D00EJDHZvoxzkB9HpkMqXZTwVyT3KxUz81BQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="441273921"
X-IronPort-AV: E=Sophos;i="6.02,204,1688454000"; 
   d="scan'208";a="441273921"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 01:11:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="984555583"
X-IronPort-AV: E=Sophos;i="6.02,204,1688454000"; 
   d="scan'208";a="984555583"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 27 Aug 2023 01:11:13 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaArY-0005Xm-1J;
	Sun, 27 Aug 2023 08:11:12 +0000
Date: Sun, 27 Aug 2023 16:10:45 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davejiang:cxl-ide 25/25] drivers/acpi/x86/keyp.c:697:14: error:
 assignment to 'struct pci_device *' from incompatible pointer type 'struct
 pci_dev *'
Message-ID: <202308271618.fcMki614-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davejiang/linux.git cxl-ide
head:   ecc190dd66d4c533dc9d4aa0058cd06888c318d6
commit: ecc190dd66d4c533dc9d4aa0058cd06888c318d6 [25/25] acpi: keyp: Add support for IDE stream keys refresh
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230827/202308271618.fcMki614-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230827/202308271618.fcMki614-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308271618.fcMki614-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/acpi/x86/keyp.c: In function 'keyp_stream_key_refresh':
>> drivers/acpi/x86/keyp.c:697:14: error: assignment to 'struct pci_device *' from incompatible pointer type 'struct pci_dev *' [-Werror=incompatible-pointer-types]
     697 |         pdev = stm->dsd;
         |              ^
>> drivers/acpi/x86/keyp.c:700:32: error: passing argument 1 of 'ide_km_set_keyset' from incompatible pointer type [-Werror=incompatible-pointer-types]
     700 |         rc = ide_km_set_keyset(pdev, stream_id, keyset, pkg, IDE_DEV_DOWNSTREAM);
         |                                ^~~~
         |                                |
         |                                struct pci_device *
   In file included from drivers/acpi/x86/keyp.c:15:
   include/linux/pci-ide.h:53:39: note: expected 'struct pci_dev *' but argument is of type 'struct pci_device *'
      53 | int ide_km_set_keyset(struct pci_dev *pdev, int stream_id, int keyset,
         |                       ~~~~~~~~~~~~~~~~^~~~
   In file included from include/linux/printk.h:564,
                    from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/fortify-string.h:5,
                    from include/linux/string.h:254,
                    from include/linux/uuid.h:11,
                    from include/linux/mod_devicetable.h:14,
                    from include/linux/pci.h:27,
                    from drivers/acpi/x86/keyp.c:8:
>> drivers/acpi/x86/keyp.c:702:30: error: invalid use of undefined type 'struct pci_device'
     702 |                 dev_dbg(&pdev->dev, "Refresh keyset failed to program.\n");
         |                              ^~
   include/linux/dynamic_debug.h:222:29: note: in definition of macro '__dynamic_func_call_cls'
     222 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:9: note: in expansion of macro '_dynamic_func_call_cls'
     248 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:271:9: note: in expansion of macro '_dynamic_func_call'
     271 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/acpi/x86/keyp.c:702:17: note: in expansion of macro 'dev_dbg'
     702 |                 dev_dbg(&pdev->dev, "Refresh keyset failed to program.\n");
         |                 ^~~~~~~
>> drivers/acpi/x86/keyp.c:709:14: error: implicit declaration of function 'kde_km_enable_keyset'; did you mean 'ide_km_enable_keyset'? [-Werror=implicit-function-declaration]
     709 |         rc = kde_km_enable_keyset(pdev, stream_id, keyset);
         |              ^~~~~~~~~~~~~~~~~~~~
         |              ide_km_enable_keyset
   drivers/acpi/x86/keyp.c:711:30: error: invalid use of undefined type 'struct pci_device'
     711 |                 dev_dbg(&pdev->dev, "Refresh keyset failed to activate.\n");
         |                              ^~
   include/linux/dynamic_debug.h:222:29: note: in definition of macro '__dynamic_func_call_cls'
     222 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:9: note: in expansion of macro '_dynamic_func_call_cls'
     248 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:271:9: note: in expansion of macro '_dynamic_func_call'
     271 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/acpi/x86/keyp.c:711:17: note: in expansion of macro 'dev_dbg'
     711 |                 dev_dbg(&pdev->dev, "Refresh keyset failed to activate.\n");
         |                 ^~~~~~~
   cc1: some warnings being treated as errors


vim +697 drivers/acpi/x86/keyp.c

   675	
   676	static void keyp_stream_key_refresh(struct work_struct *work)
   677	{
   678		struct stream *stm = container_of(work, struct stream, dwork.work);
   679		struct key_package *pkg __free(key_pkg_free) = key_pkg_alloc();
   680		int keyset = next_keyset(stm->keyset);
   681		struct pci_device *pdev;
   682		int stream_id, rc;
   683	
   684		if (!pkg)
   685			return;
   686	
   687		guard(mutex)(&stm->lock);
   688		rc = keyp_write_keys(stm, pkg, keyset);
   689		if (rc)
   690			return;
   691	
   692		rc = keyp_prime_key(stm, pkg, keyset);
   693		if (rc)
   694			return;
   695	
   696		stream_id = stm->dsd->ide.stream_id;
 > 697		pdev = stm->dsd;
   698		/* Distribute keys to EP as set 1 */
   699		/* Inform the EP Rx to get ready for next key set via DOE */
 > 700		rc = ide_km_set_keyset(pdev, stream_id, keyset, pkg, IDE_DEV_DOWNSTREAM);
   701		if (rc) {
 > 702			dev_dbg(&pdev->dev, "Refresh keyset failed to program.\n");
   703			return;
   704		}
   705	
   706		keyp_select_key(stm, keyset);
   707	
   708		/* Inform the EP Tx to switch to next key set via DOE */
 > 709		rc = kde_km_enable_keyset(pdev, stream_id, keyset);
   710		if (rc) {
   711			dev_dbg(&pdev->dev, "Refresh keyset failed to activate.\n");
   712			return;
   713		}
   714	
   715		queue_delayed_work(keyp_wq, &stm->key_refresh_dwork,
   716				   msecs_to_jiffies(KEYP_STM_KEY_REFRESH_TIME) * 1000);
   717	}
   718	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
