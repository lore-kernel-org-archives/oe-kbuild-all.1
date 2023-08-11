Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7761B8468
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Aug 2023 19:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691780559; x=1723316559;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sbrr0bzpgZtVjp5KCq9x3+d6+K9sjQxxtwrPNPHB5Co=;
  b=VDf+3LXTqqUDNG7uGuSnPToEqJ+62/Hs6ucZhesgw6J1/vAC8ISfjYSk
   izLVYN2HJgLlNL6XiTaQmHt+L6m7zNiirCEc+nCEWJbUu1WcPd4HRA0n5
   JweQN96CD5+AxqRD4y7IF7lA9egpo2XZWvcwvIzlVOjvokvUHGoEedGzK
   gPhXOJF90HuXeWgxFFoNlIVB/GywnrQbL40A2/gELNX8fyJ4VOp+f6oMQ
   6+24ehsebWAWYvZFE2srQNBGTMLkySJy3XYevrX1YSQO8GLePz9PNabt6
   RBXWci/kQXGLYkjmjoHu7Gfu+68l2L8h14mwP0n8Hw+0v0bDSySiJFBCP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="458114475"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="458114475"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 12:01:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="682624179"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="682624179"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 11 Aug 2023 12:01:49 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUXOP-0007xi-0B;
	Fri, 11 Aug 2023 19:01:49 +0000
Date: Sat, 12 Aug 2023 03:01:06 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davejiang:cxl-ide 23/24] drivers/acpi/x86/keyp.c:625:14: warning:
 variable 'found' set but not used
Message-ID: <202308120218.5PAeKNTr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davejiang/linux.git cxl-ide
head:   ee3a63e65f46140bcb484e3d0052d641abceb9da
commit: 4ce639e2c2c30cd3334860b59423996b636dbfcf [23/24] acpi: keyp: Add support for IDE shutdown
config: x86_64-randconfig-r033-20230812 (https://download.01.org/0day-ci/archive/20230812/202308120218.5PAeKNTr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308120218.5PAeKNTr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308120218.5PAeKNTr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/acpi/x86/keyp.c:369:5: warning: no previous prototype for 'keyp_tx_keys_validate' [-Wmissing-prototypes]
     369 | int keyp_tx_keys_validate(struct stream *stm)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/x86/keyp.c:394:5: warning: no previous prototype for 'keyp_rx_keys_validate' [-Wmissing-prototypes]
     394 | int keyp_rx_keys_validate(struct stream *stm)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/x86/keyp.c:425:6: warning: no previous prototype for 'keyp_keys_validate_and_free' [-Wmissing-prototypes]
     425 | void keyp_keys_validate_and_free(struct work_struct *work)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/x86/keyp.c: In function 'keyp_stream_setup':
   drivers/acpi/x86/keyp.c:541:31: error: 'struct pci_dev' has no member named 'ide'
     541 |         stm->stream_id = pdev2->ide.stream_id;
         |                               ^~
   drivers/acpi/x86/keyp.c: In function 'keyp_stream_shutdown':
>> drivers/acpi/x86/keyp.c:625:14: warning: variable 'found' set but not used [-Wunused-but-set-variable]
     625 |         bool found = false;
         |              ^~~~~
   drivers/acpi/x86/keyp.c: In function 'keyp_setup_pcie_ide_stream':
   drivers/acpi/x86/keyp.c:689:13: error: 'struct pci_dev' has no member named 'ide'
     689 |         pdev->ide.stream_min = kcu->stream_id_claimed;
         |             ^~
   drivers/acpi/x86/keyp.c:690:13: error: 'struct pci_dev' has no member named 'ide'
     690 |         pdev->ide.stream_max = kcu->stream_id_claimed + max_rp_streams - 1;
         |             ^~
   drivers/acpi/x86/keyp.c: At top level:
   drivers/acpi/x86/keyp.c:666:33: warning: 'keyp_ide_ops' defined but not used [-Wunused-const-variable=]
     666 | static const struct pci_ide_ops keyp_ide_ops = {
         |                                 ^~~~~~~~~~~~


vim +/found +625 drivers/acpi/x86/keyp.c

   618	
   619	static void keyp_stream_shutdown(struct pci_dev *pdev1, struct pci_dev *pdev2)
   620	{
   621		u16 segment = pci_domain_nr(pdev2->bus);
   622		u32 index = construct_xa_key(segment, pdev2->bus->number, pdev2->devfn);
   623		struct keyp_config_unit *kcu;
   624		struct stream *stm;
 > 625		bool found = false;
   626		int i;
   627	
   628		/* Stream traffic is expected to be quiesced */
   629		/* PCIe stream termination */
   630		kcu = xa_load(&keyp_xa, index);
   631		if (!kcu)
   632			return;
   633	
   634		for (i = 0; i < kcu->stream_id_claimed; i++) {
   635			stm = &kcu->streams[i];
   636			mutex_lock(&stm->lock);
   637			if (stm->dsd == pdev2) {
   638				found = true;
   639				break;
   640			}
   641			mutex_unlock(&stm->lock);
   642		}
   643	
   644		cancel_delayed_work_sync(&stm->dwork);
   645	
   646		if (stm->key_slot_state != KEY_SLOT_STATE_CLEAR) {
   647			keyp_clear_keys(stm);
   648			keyp_keys_free(stm);
   649			stm->key_slot_state = KEY_SLOT_STATE_CLEAR;
   650		}
   651	
   652		pci_ide_stream_disable(pdev1, pdev2);
   653		keyp_stream_control(stm, false);
   654	
   655		/*
   656		 * No need to write random values to key slots. This is done by the delayed
   657		 * workqueue.
   658		 */
   659	
   660		stream_pos_id_put(kcu, stm->pos_id);
   661		stm->dsd = NULL;
   662		mutex_unlock(&stm->lock);
   663		pci_ide_stream_release(pdev1, pdev2);
   664	}
   665	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
