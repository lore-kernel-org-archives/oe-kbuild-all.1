Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73ED930CF2
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Oct 2023 17:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696353081; x=1727889081;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JaMgfBHv+U+jae7gSkrdSxVhtTM9p5tPKmhLcAxLuQ8=;
  b=Ssik8xGhqFCET18M6bKVL1AEQymVcBHgYDBrglBKUNq2VpvJgg7yPlyR
   iWa4EM5MXQlWASS2arPPIkTPL/VqckTGcf2yAUrvYHpYXK88RLhokm8v1
   OUi3Cv8it7Kam4Aj6kPr9Lm+ChUxNqdjbcYiaPS4QiHoj7pQN5bKpYNWP
   D/h97+swz8y4mc9AHNc/FSoNhXuvBmz9M/Cyo8dKZmEPkul2XcWcagNHI
   VqW10qpYL6yNggTCVFwPncf8Oyh2D3sN6aDJ8wqE4lWRL9Luyv1MSokIY
   FwN1gZC/pmFzBS6Qo2xCxPwLxN5/U2oC9XzIVKPSlcGfcbepHrsG/omsZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="385754920"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="385754920"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 10:11:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="874769965"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="874769965"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 03 Oct 2023 10:11:19 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnivU-0007dg-2i;
	Tue, 03 Oct 2023 17:11:16 +0000
Date: Wed, 4 Oct 2023 01:10:45 +0800
From: kernel test robot <lkp@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [plbossart-sound:test/i915-deferred-probe 34/35]
 sound/soc/sof/intel/hda.c:1187:26: warning: variable 'bus' set but not used
Message-ID: <202310040035.xqBMHm1E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound test/i915-deferred-probe
head:   db13878890a9df49edcf07663bcc500b625a8832
commit: 016ae1a16ca146258063ab2700dd543fc5a14eb6 [34/35] ASoC: SOF: Intel: Move binding to display driver outside of deferred probe
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20231004/202310040035.xqBMHm1E-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231004/202310040035.xqBMHm1E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310040035.xqBMHm1E-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/sof/intel/hda.c: In function 'hda_dsp_probe':
>> sound/soc/sof/intel/hda.c:1187:26: warning: variable 'bus' set but not used [-Wunused-but-set-variable]
    1187 |         struct hdac_bus *bus;
         |                          ^~~


vim +/bus +1187 sound/soc/sof/intel/hda.c

3cf0a4353f6c45 Pierre-Louis Bossart  2023-09-29  1182  
3cf0a4353f6c45 Pierre-Louis Bossart  2023-09-29  1183  int hda_dsp_probe(struct snd_sof_dev *sdev)
3cf0a4353f6c45 Pierre-Louis Bossart  2023-09-29  1184  {
3cf0a4353f6c45 Pierre-Louis Bossart  2023-09-29  1185  	struct pci_dev *pci = to_pci_dev(sdev->dev);
3cf0a4353f6c45 Pierre-Louis Bossart  2023-09-29  1186  	struct sof_intel_hda_dev *hdev = sdev->pdata->hw_pdata;
3cf0a4353f6c45 Pierre-Louis Bossart  2023-09-29 @1187  	struct hdac_bus *bus;
3cf0a4353f6c45 Pierre-Louis Bossart  2023-09-29  1188  	int ret = 0;
3cf0a4353f6c45 Pierre-Louis Bossart  2023-09-29  1189  
dd96daca6c83ec Liam Girdwood         2019-04-12  1190  	hdev->dmic_dev = platform_device_register_data(sdev->dev, "dmic-codec",
dd96daca6c83ec Liam Girdwood         2019-04-12  1191  						       PLATFORM_DEVID_NONE,
dd96daca6c83ec Liam Girdwood         2019-04-12  1192  						       NULL, 0);
dd96daca6c83ec Liam Girdwood         2019-04-12  1193  	if (IS_ERR(hdev->dmic_dev)) {
dd96daca6c83ec Liam Girdwood         2019-04-12  1194  		dev_err(sdev->dev, "error: failed to create DMIC device\n");
dd96daca6c83ec Liam Girdwood         2019-04-12  1195  		return PTR_ERR(hdev->dmic_dev);
dd96daca6c83ec Liam Girdwood         2019-04-12  1196  	}
dd96daca6c83ec Liam Girdwood         2019-04-12  1197  
dd96daca6c83ec Liam Girdwood         2019-04-12  1198  	/*
dd96daca6c83ec Liam Girdwood         2019-04-12  1199  	 * use position update IPC if either it is forced
dd96daca6c83ec Liam Girdwood         2019-04-12  1200  	 * or we don't have other choice
dd96daca6c83ec Liam Girdwood         2019-04-12  1201  	 */
dd96daca6c83ec Liam Girdwood         2019-04-12  1202  #if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_FORCE_IPC_POSITION)
dd96daca6c83ec Liam Girdwood         2019-04-12  1203  	hdev->no_ipc_position = 0;
dd96daca6c83ec Liam Girdwood         2019-04-12  1204  #else
dd96daca6c83ec Liam Girdwood         2019-04-12  1205  	hdev->no_ipc_position = sof_ops(sdev)->pcm_pointer ? 1 : 0;
dd96daca6c83ec Liam Girdwood         2019-04-12  1206  #endif
dd96daca6c83ec Liam Girdwood         2019-04-12  1207  
18146b77de3406 Peter Ujfalusi        2022-10-12  1208  	if (sdev->dspless_mode_selected)
18146b77de3406 Peter Ujfalusi        2022-10-12  1209  		hdev->no_ipc_position = 1;
18146b77de3406 Peter Ujfalusi        2022-10-12  1210  
dd96daca6c83ec Liam Girdwood         2019-04-12  1211  	/* set up HDA base */
dd96daca6c83ec Liam Girdwood         2019-04-12  1212  	bus = sof_to_bus(sdev);
dd96daca6c83ec Liam Girdwood         2019-04-12  1213  
d6e19d2711187f Pierre-Louis Bossart  2022-10-12  1214  	if (sdev->dspless_mode_selected)
d6e19d2711187f Pierre-Louis Bossart  2022-10-12  1215  		goto skip_dsp_setup;
d6e19d2711187f Pierre-Louis Bossart  2022-10-12  1216  
dd96daca6c83ec Liam Girdwood         2019-04-12  1217  	/* DSP base */
dd96daca6c83ec Liam Girdwood         2019-04-12  1218  	sdev->bar[HDA_DSP_BAR] = pci_ioremap_bar(pci, HDA_DSP_BAR);
dd96daca6c83ec Liam Girdwood         2019-04-12  1219  	if (!sdev->bar[HDA_DSP_BAR]) {
dd96daca6c83ec Liam Girdwood         2019-04-12  1220  		dev_err(sdev->dev, "error: ioremap error\n");
dd96daca6c83ec Liam Girdwood         2019-04-12  1221  		ret = -ENXIO;
dd96daca6c83ec Liam Girdwood         2019-04-12  1222  		goto hdac_bus_unmap;
dd96daca6c83ec Liam Girdwood         2019-04-12  1223  	}
dd96daca6c83ec Liam Girdwood         2019-04-12  1224  
dd96daca6c83ec Liam Girdwood         2019-04-12  1225  	sdev->mmio_bar = HDA_DSP_BAR;
dd96daca6c83ec Liam Girdwood         2019-04-12  1226  	sdev->mailbox_bar = HDA_DSP_BAR;
d6e19d2711187f Pierre-Louis Bossart  2022-10-12  1227  skip_dsp_setup:
dd96daca6c83ec Liam Girdwood         2019-04-12  1228  
dd96daca6c83ec Liam Girdwood         2019-04-12  1229  	/* allow 64bit DMA address if supported by H/W */
ab152afa2427bb Takashi Iwai          2021-01-14  1230  	if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(64))) {
dd96daca6c83ec Liam Girdwood         2019-04-12  1231  		dev_dbg(sdev->dev, "DMA mask is 32 bit\n");
ab152afa2427bb Takashi Iwai          2021-01-14  1232  		dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(32));
dd96daca6c83ec Liam Girdwood         2019-04-12  1233  	}
8872fc0d045929 Takashi Iwai          2022-02-15  1234  	dma_set_max_seg_size(&pci->dev, UINT_MAX);
dd96daca6c83ec Liam Girdwood         2019-04-12  1235  
dd96daca6c83ec Liam Girdwood         2019-04-12  1236  	/* init streams */
dd96daca6c83ec Liam Girdwood         2019-04-12  1237  	ret = hda_dsp_stream_init(sdev);
dd96daca6c83ec Liam Girdwood         2019-04-12  1238  	if (ret < 0) {
dd96daca6c83ec Liam Girdwood         2019-04-12  1239  		dev_err(sdev->dev, "error: failed to init streams\n");
dd96daca6c83ec Liam Girdwood         2019-04-12  1240  		/*
dd96daca6c83ec Liam Girdwood         2019-04-12  1241  		 * not all errors are due to memory issues, but trying
dd96daca6c83ec Liam Girdwood         2019-04-12  1242  		 * to free everything does not harm
dd96daca6c83ec Liam Girdwood         2019-04-12  1243  		 */
dd96daca6c83ec Liam Girdwood         2019-04-12  1244  		goto free_streams;
dd96daca6c83ec Liam Girdwood         2019-04-12  1245  	}
dd96daca6c83ec Liam Girdwood         2019-04-12  1246  
dd96daca6c83ec Liam Girdwood         2019-04-12  1247  	/*
dd96daca6c83ec Liam Girdwood         2019-04-12  1248  	 * register our IRQ
dd96daca6c83ec Liam Girdwood         2019-04-12  1249  	 * let's try to enable msi firstly
dd96daca6c83ec Liam Girdwood         2019-04-12  1250  	 * if it fails, use legacy interrupt mode
672ff5e3596ee2 Guennadi Liakhovetski 2019-07-22  1251  	 * TODO: support msi multiple vectors
dd96daca6c83ec Liam Girdwood         2019-04-12  1252  	 */
bb67dd1878de57 Pierre-Louis Bossart  2019-08-06  1253  	if (hda_use_msi && pci_alloc_irq_vectors(pci, 1, 1, PCI_IRQ_MSI) > 0) {
672ff5e3596ee2 Guennadi Liakhovetski 2019-07-22  1254  		dev_info(sdev->dev, "use msi interrupt mode\n");
7c11af9fcdc425 Bard Liao             2019-12-04  1255  		sdev->ipc_irq = pci_irq_vector(pci, 0);
672ff5e3596ee2 Guennadi Liakhovetski 2019-07-22  1256  		/* initialised to "false" by kzalloc() */
672ff5e3596ee2 Guennadi Liakhovetski 2019-07-22  1257  		sdev->msi_enabled = true;
672ff5e3596ee2 Guennadi Liakhovetski 2019-07-22  1258  	}
672ff5e3596ee2 Guennadi Liakhovetski 2019-07-22  1259  
672ff5e3596ee2 Guennadi Liakhovetski 2019-07-22  1260  	if (!sdev->msi_enabled) {
dd96daca6c83ec Liam Girdwood         2019-04-12  1261  		dev_info(sdev->dev, "use legacy interrupt mode\n");
dd96daca6c83ec Liam Girdwood         2019-04-12  1262  		/*
dd96daca6c83ec Liam Girdwood         2019-04-12  1263  		 * in IO-APIC mode, hda->irq and ipc_irq are using the same
dd96daca6c83ec Liam Girdwood         2019-04-12  1264  		 * irq number of pci->irq
dd96daca6c83ec Liam Girdwood         2019-04-12  1265  		 */
dd96daca6c83ec Liam Girdwood         2019-04-12  1266  		sdev->ipc_irq = pci->irq;
dd96daca6c83ec Liam Girdwood         2019-04-12  1267  	}
dd96daca6c83ec Liam Girdwood         2019-04-12  1268  
dd96daca6c83ec Liam Girdwood         2019-04-12  1269  	dev_dbg(sdev->dev, "using IPC IRQ %d\n", sdev->ipc_irq);
7c11af9fcdc425 Bard Liao             2019-12-04  1270  	ret = request_threaded_irq(sdev->ipc_irq, hda_dsp_interrupt_handler,
7c11af9fcdc425 Bard Liao             2019-12-04  1271  				   hda_dsp_interrupt_thread,
7c11af9fcdc425 Bard Liao             2019-12-04  1272  				   IRQF_SHARED, "AudioDSP", sdev);
dd96daca6c83ec Liam Girdwood         2019-04-12  1273  	if (ret < 0) {
dd96daca6c83ec Liam Girdwood         2019-04-12  1274  		dev_err(sdev->dev, "error: failed to register IPC IRQ %d\n",
dd96daca6c83ec Liam Girdwood         2019-04-12  1275  			sdev->ipc_irq);
7c11af9fcdc425 Bard Liao             2019-12-04  1276  		goto free_irq_vector;
dd96daca6c83ec Liam Girdwood         2019-04-12  1277  	}
dd96daca6c83ec Liam Girdwood         2019-04-12  1278  
dd96daca6c83ec Liam Girdwood         2019-04-12  1279  	pci_set_master(pci);
dd96daca6c83ec Liam Girdwood         2019-04-12  1280  	synchronize_irq(pci->irq);
dd96daca6c83ec Liam Girdwood         2019-04-12  1281  
dd96daca6c83ec Liam Girdwood         2019-04-12  1282  	/*
dd96daca6c83ec Liam Girdwood         2019-04-12  1283  	 * clear TCSEL to clear playback on some HD Audio
dd96daca6c83ec Liam Girdwood         2019-04-12  1284  	 * codecs. PCI TCSEL is defined in the Intel manuals.
dd96daca6c83ec Liam Girdwood         2019-04-12  1285  	 */
dd96daca6c83ec Liam Girdwood         2019-04-12  1286  	snd_sof_pci_update_bits(sdev, PCI_TCSEL, 0x07, 0);
dd96daca6c83ec Liam Girdwood         2019-04-12  1287  
dd96daca6c83ec Liam Girdwood         2019-04-12  1288  	/* init HDA capabilities */
dd96daca6c83ec Liam Girdwood         2019-04-12  1289  	ret = hda_init_caps(sdev);
dd96daca6c83ec Liam Girdwood         2019-04-12  1290  	if (ret < 0)
dd96daca6c83ec Liam Girdwood         2019-04-12  1291  		goto free_ipc_irq;
dd96daca6c83ec Liam Girdwood         2019-04-12  1292  
d6e19d2711187f Pierre-Louis Bossart  2022-10-12  1293  	if (!sdev->dspless_mode_selected) {
1f5253b08e06bc Zhu Yingjiang         2019-05-22  1294  		/* enable ppcap interrupt */
1f5253b08e06bc Zhu Yingjiang         2019-05-22  1295  		hda_dsp_ctrl_ppcap_enable(sdev, true);
1f5253b08e06bc Zhu Yingjiang         2019-05-22  1296  		hda_dsp_ctrl_ppcap_int_enable(sdev, true);
dd96daca6c83ec Liam Girdwood         2019-04-12  1297  
dd96daca6c83ec Liam Girdwood         2019-04-12  1298  		/* set default mailbox offset for FW ready message */
dd96daca6c83ec Liam Girdwood         2019-04-12  1299  		sdev->dsp_box.offset = HDA_DSP_MBOX_UPLINK_OFFSET;
dd96daca6c83ec Liam Girdwood         2019-04-12  1300  
0b5a28dbe0607b Ranjani Sridharan     2019-12-18  1301  		INIT_DELAYED_WORK(&hdev->d0i3_work, hda_dsp_d0i3_work);
d6e19d2711187f Pierre-Louis Bossart  2022-10-12  1302  	}
0b5a28dbe0607b Ranjani Sridharan     2019-12-18  1303  
daaa03a27b9340 Pierre-Louis Bossart  2021-12-06  1304  	init_waitqueue_head(&hdev->waitq);
daaa03a27b9340 Pierre-Louis Bossart  2021-12-06  1305  
4419741554993b Pierre-Louis Bossart  2022-04-05  1306  	hdev->nhlt = intel_nhlt_init(sdev->dev);
4419741554993b Pierre-Louis Bossart  2022-04-05  1307  
dd96daca6c83ec Liam Girdwood         2019-04-12  1308  	return 0;
dd96daca6c83ec Liam Girdwood         2019-04-12  1309  
dd96daca6c83ec Liam Girdwood         2019-04-12  1310  free_ipc_irq:
dd96daca6c83ec Liam Girdwood         2019-04-12  1311  	free_irq(sdev->ipc_irq, sdev);
dd96daca6c83ec Liam Girdwood         2019-04-12  1312  free_irq_vector:
dd96daca6c83ec Liam Girdwood         2019-04-12  1313  	if (sdev->msi_enabled)
dd96daca6c83ec Liam Girdwood         2019-04-12  1314  		pci_free_irq_vectors(pci);
dd96daca6c83ec Liam Girdwood         2019-04-12  1315  free_streams:
dd96daca6c83ec Liam Girdwood         2019-04-12  1316  	hda_dsp_stream_free(sdev);
dd96daca6c83ec Liam Girdwood         2019-04-12  1317  /* dsp_unmap: not currently used */
d6e19d2711187f Pierre-Louis Bossart  2022-10-12  1318  	if (!sdev->dspless_mode_selected)
dd96daca6c83ec Liam Girdwood         2019-04-12  1319  		iounmap(sdev->bar[HDA_DSP_BAR]);
dd96daca6c83ec Liam Girdwood         2019-04-12  1320  hdac_bus_unmap:
1c4eead6b427e3 Pierre-Louis Bossart  2021-02-16  1321  	platform_device_unregister(hdev->dmic_dev);
3cf0a4353f6c45 Pierre-Louis Bossart  2023-09-29  1322  
dd96daca6c83ec Liam Girdwood         2019-04-12  1323  	return ret;
dd96daca6c83ec Liam Girdwood         2019-04-12  1324  }
dd96daca6c83ec Liam Girdwood         2019-04-12  1325  

:::::: The code at line 1187 was first introduced by commit
:::::: 3cf0a4353f6c452953e43e8aa843fca9eec64748 ASoC: SOF: Intel: hda: start splitting the probe

:::::: TO: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
:::::: CC: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
