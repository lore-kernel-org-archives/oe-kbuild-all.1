Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C4363B6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Aug 2023 18:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691777329; x=1723313329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sjYNdxAeaaV0B8BocYBa/TV1XXwxUrb0PArT8+Dgxds=;
  b=O/7rXOTJOCplxGWQNjPUm/3H7eKzdYdIqN51YdiOoD+3c4MkUnOKuMgE
   bKiymrT9+2jVPFgxLWnRKEVt6MPggAlOnxFFAU+3zTX11uwJKSUSuYCFs
   akR1+TpThKoEXnUMfn0fJICbtffa3jFmiqZtWNEb2x1wI3wGCPQKQXL1P
   13o16FrPBtu897Z3akNYXg64s9ltvfEPXWq5jF8yoy9PA4duLE7gSppL+
   9iuJ5w/9QVqqwzy4sttM5NCLp66uI4RpvsukrRPpDwS5Wg7RnW9w7+1zc
   zqY6ImgkguhwVtAOGHZuVWNNB9OI5lvBCyGUYIyyATHqEJck5WAOVrIY7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="369199831"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="369199831"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 11:08:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="682615924"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="682615924"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 11 Aug 2023 11:08:47 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUWZ4-0007vr-2u;
	Fri, 11 Aug 2023 18:08:46 +0000
Date: Sat, 12 Aug 2023 02:08:43 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davejiang:cxl-ide 22/24] drivers/acpi/x86/keyp.c:369:5: warning: no
 previous prototype for 'keyp_tx_keys_validate'
Message-ID: <202308120117.5X4ORWP4-lkp@intel.com>
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
commit: 0dbc667932bc8e9cc08c0dffe562e6ff19630e24 [22/24] acpi: keyp: Add support for IDE stream creation
config: x86_64-randconfig-r033-20230812 (https://download.01.org/0day-ci/archive/20230812/202308120117.5X4ORWP4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308120117.5X4ORWP4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308120117.5X4ORWP4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/acpi/x86/keyp.c:369:5: warning: no previous prototype for 'keyp_tx_keys_validate' [-Wmissing-prototypes]
     369 | int keyp_tx_keys_validate(struct stream *stm)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/acpi/x86/keyp.c:394:5: warning: no previous prototype for 'keyp_rx_keys_validate' [-Wmissing-prototypes]
     394 | int keyp_rx_keys_validate(struct stream *stm)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/acpi/x86/keyp.c:425:6: warning: no previous prototype for 'keyp_keys_validate_and_free' [-Wmissing-prototypes]
     425 | void keyp_keys_validate_and_free(struct work_struct *work)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/x86/keyp.c: In function 'keyp_stream_setup':
   drivers/acpi/x86/keyp.c:541:31: error: 'struct pci_dev' has no member named 'ide'
     541 |         stm->stream_id = pdev2->ide.stream_id;
         |                               ^~
   drivers/acpi/x86/keyp.c: In function 'keyp_setup_pcie_ide_stream':
   drivers/acpi/x86/keyp.c:641:13: error: 'struct pci_dev' has no member named 'ide'
     641 |         pdev->ide.stream_min = kcu->stream_id_claimed;
         |             ^~
   drivers/acpi/x86/keyp.c:642:13: error: 'struct pci_dev' has no member named 'ide'
     642 |         pdev->ide.stream_max = kcu->stream_id_claimed + max_rp_streams - 1;
         |             ^~
   drivers/acpi/x86/keyp.c: At top level:
>> drivers/acpi/x86/keyp.c:619:33: warning: 'keyp_ide_ops' defined but not used [-Wunused-const-variable=]
     619 | static const struct pci_ide_ops keyp_ide_ops = {
         |                                 ^~~~~~~~~~~~


vim +/keyp_tx_keys_validate +369 drivers/acpi/x86/keyp.c

   368	
 > 369	int keyp_tx_keys_validate(struct stream *stm)
   370	{
   371		struct keyp_config_unit *kcu = stm->kcu;
   372		int stm_base;
   373		u32 val, sts;
   374	
   375		stm_base = KEYP_STM_CAP_SIZE + KEYP_STM_CONFIG_SIZE * stm->pos_id;
   376		val = readl(kcu->addr + stm_base + KEYP_STM_TX_STS_OFS);
   377		sts = FIELD_GET(KEYP_STM_TX_STS_SET, val);
   378	
   379		if (sts == KEYP_STM_TX_STS_KEY_NONE ||
   380		    sts == KEYP_STM_TX_STS_KEY_TRANSITION)
   381			return -EAGAIN;
   382	
   383		if (stm->keyset == KEY_SET_0 &&
   384		    sts != KEYP_STM_TX_STS_KEY_SET_0)
   385			return -EINVAL;
   386	
   387		if (stm->keyset == KEY_SET_1 &&
   388		    sts != KEYP_STM_TX_STS_KEY_SET_1)
   389			return -EINVAL;
   390	
   391		return 0;
   392	}
   393	
 > 394	int keyp_rx_keys_validate(struct stream *stm)
   395	{
   396		struct keyp_config_unit *kcu = stm->kcu;
   397		u32 val, pr_sts, npr_sts, cpl_sts;
   398		int stm_base;
   399	
   400		stm_base = KEYP_STM_CAP_SIZE + KEYP_STM_CONFIG_SIZE * stm->pos_id;
   401		val = readl(kcu->addr + stm_base + KEYP_STM_TX_STS_OFS);
   402		pr_sts = FIELD_GET(KEYP_STM_RX_STS_LAST_RCVD_SET_PR, val);
   403		npr_sts = FIELD_GET(KEYP_STM_RX_STS_LAST_RCVD_SET_NPR, val);
   404		cpl_sts = FIELD_GET(KEYP_STM_RX_STS_LAST_RCVD_SET_CPL, val);
   405		if (pr_sts == KEYP_STM_RX_STS_LAST_RCVD_NONE ||
   406		    npr_sts == KEYP_STM_RX_STS_LAST_RCVD_NONE ||
   407		    cpl_sts == KEYP_STM_RX_STS_LAST_RCVD_NONE)
   408			return -EAGAIN;
   409	
   410		if (stm->keyset == KEY_SET_0 &&
   411		    pr_sts == KEYP_STM_RX_STS_LAST_RCVD_SET_0 &&
   412		    npr_sts == KEYP_STM_RX_STS_LAST_RCVD_SET_0 &&
   413		    cpl_sts == KEYP_STM_RX_STS_LAST_RCVD_SET_0)
   414			return 0;
   415	
   416		if (stm->keyset == KEY_SET_1 &&
   417		    pr_sts == KEYP_STM_RX_STS_LAST_RCVD_SET_1 &&
   418		    npr_sts == KEYP_STM_RX_STS_LAST_RCVD_SET_1 &&
   419		    cpl_sts == KEYP_STM_RX_STS_LAST_RCVD_SET_1)
   420			return 0;
   421	
   422		return -EINVAL;
   423	}
   424	
 > 425	void keyp_keys_validate_and_free(struct work_struct *work)
   426	{
   427		struct stream *stm = container_of(work, struct stream, dwork.work);
   428		int rc;
   429	
   430		guard(mutex)(&stm->lock);
   431		if (stm->key_slot_state == KEY_SLOT_STATE_CLEAR)
   432			return;
   433	
   434		stm->key_slot_state = KEY_SLOT_STATE_RELEASING;
   435		rc = keyp_tx_keys_validate(stm);
   436		if (rc) {
   437			queue_delayed_work(keyp_wq, &stm->dwork, msecs_to_jiffies(100));
   438			return;
   439		}
   440	
   441		rc = keyp_rx_keys_validate(stm);
   442		if (rc) {
   443			queue_delayed_work(keyp_wq, &stm->dwork, msecs_to_jiffies(100));
   444			return;
   445		}
   446	
   447		keyp_clear_keys(stm);
   448		keyp_keys_free(stm);
   449		stm->key_slot_state = KEY_SLOT_STATE_CLEAR;
   450	}
   451	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
