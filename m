Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39D45645E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 10:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ihow/SVG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701772463; x=1733308463;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qI3TjHUMot/Zr56ZTctFAbA2DjX5E9s30s6IUc2kTjg=;
  b=ihow/SVGV2aSpWbT+21uC+UN22pc1i8RcqdfArRade3D0ycFNSLm2yat
   +tsyqgC2cCh//UHuxvNjs8dMhuR2p77aal315wJvark0yUzdsS8euJrWh
   qqVo5ziFqDXA8pB7joPrDvV3V6cgYmMB+3Z74AUdExJE7Rfzy8domjltR
   g2H8bFCvmmo7iuIIZ0iZz6hu7kF/NzkFEaA7ZufsuHgWgOHF+74uRqqDC
   E9+vwU2YAjt0BZYGRSzqFfo980KjYTMVntpORPoyjvUZr1ShVTLQ4FiLW
   0oYLWotXEPHmwqegsd/s/ylh144VjTX03YVBL4aH68Kn5OSakKFAu0I4D
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="7217879"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="7217879"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 02:34:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="799924053"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="799924053"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 05 Dec 2023 02:34:21 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rASks-0008m6-1X;
	Tue, 05 Dec 2023 10:34:18 +0000
Date: Tue, 5 Dec 2023 18:33:20 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [plbossart-sound:sdw/start-BRA-support 43/64]
 drivers/soundwire/intel_ace2x.c:303: undefined reference to
 `hda_sdw_bpt_wait'
Message-ID: <202312051858.MixX1X04-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound sdw/start-BRA-support
head:   397fa61fc8605656143d539ebd1b1fa11c274ed4
commit: 9036aad8cde37ea883e7689366dbb48f2825aa34 [43/64] soundwire: intel_ace2x: add BPT open/close/send_async/wait
config: x86_64-randconfig-014-20231203 (https://download.01.org/0day-ci/archive/20231205/202312051858.MixX1X04-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312051858.MixX1X04-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312051858.MixX1X04-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `intel_ace2x_bpt_wait':
>> drivers/soundwire/intel_ace2x.c:303: undefined reference to `hda_sdw_bpt_wait'
   ld: vmlinux.o: in function `intel_ace2x_bpt_send_async':
>> drivers/soundwire/intel_ace2x.c:273: undefined reference to `hda_sdw_bpt_send_async'
   ld: vmlinux.o: in function `intel_ace2x_bpt_close_stream':
>> drivers/soundwire/intel_ace2x.c:236: undefined reference to `hda_sdw_bpt_close'
   ld: vmlinux.o: in function `intel_ace2x_bpt_open_stream':
>> drivers/soundwire/intel_ace2x.c:179: undefined reference to `hda_sdw_bpt_open'


vim +303 drivers/soundwire/intel_ace2x.c

   121	
   122		/*
   123		 * the port config direction, number of channels and frame
   124		 * rate is totally arbitrary
   125		 */
   126		sconfig.direction = dir;
   127		sconfig.ch_count = ch;
   128		sconfig.frame_rate = 16000;
   129		sconfig.type = SDW_STREAM_BPT;
   130		sconfig.bps = 32; /* this is required for BPT/BRA */
   131	
   132		/* Port configuration */
   133		pconfig = kcalloc(num_pdi, sizeof(*pconfig), GFP_KERNEL);
   134		if (!pconfig) {
   135			ret =  -ENOMEM;
   136			goto error;
   137		}
   138	
   139		for (i = 0; i < num_pdi; i++) {
   140			pconfig[i].num = i;
   141			pconfig[i].ch_mask = ch;
   142		}
   143	
   144		ret = sdw_stream_add_master(&cdns->bus, &sconfig,
   145					    pconfig, num_pdi, stream);
   146		kfree(pconfig);
   147	
   148		if (ret) {
   149			dev_err(cdns->dev, "add master to stream failed:%d\n", ret);
   150			goto error;
   151		}
   152	
   153		cdns->bus.bpt_stream->state = SDW_STREAM_CONFIGURED;
   154	
   155		ret = sdw_prepare_stream(cdns->bus.bpt_stream);
   156		if (ret < 0)
   157			return ret; // FIXME
   158	
   159		command = (msg->flags & SDW_MSG_FLAG_WRITE) ? 0 : 1;
   160	
   161		ret = sdw_cdns_bpt_find_buffer_sizes(command,
   162						     cdns->bus.params.row, cdns->bus.params.col,
   163						     msg->len,
   164						     SDW_BPT_MSG_MAX_BYTES,
   165						     &data_per_frame,
   166						     &pdi0_buffer_size,
   167						     &pdi1_buffer_size,
   168						     &num_frames);
   169		if (ret < 0)
   170			return ret; // FIXME
   171	
   172		sdw->bpt_ctx.pdi0_buffer_size = pdi0_buffer_size;
   173		sdw->bpt_ctx.pdi1_buffer_size = pdi1_buffer_size;
   174		sdw->bpt_ctx.num_frames = num_frames;
   175	
   176		dev_info(cdns->dev, "%s: sizes pdi0 %d pdi1 %d\n", __func__,
   177			 pdi0_buffer_size, pdi1_buffer_size);
   178	
 > 179		ret = hda_sdw_bpt_open(cdns->dev->parent, /* PCI device */
   180				       &sdw->bpt_ctx.bpt_tx_stream,
   181				       &sdw->bpt_ctx.dmab_tx_bdl,
   182				       pdi0_buffer_size,
   183				       &sdw->bpt_ctx.bpt_rx_stream,
   184				       &sdw->bpt_ctx.dmab_rx_bdl,
   185				       pdi1_buffer_size);
   186		if (ret < 0) {
   187			dev_err(cdns->dev, "%s: hda_sdw_bpt_open failed %d\n", __func__, ret);
   188			return ret; // FIXME
   189		}
   190	
   191		dev_info(cdns->dev, "%s: preparing dma buffer\n", __func__);
   192	
   193		if (!command) {
   194			ret = sdw_cdns_prepare_write_dma_buffer(
   195				msg->dev_num, msg->addr,
   196				msg->buf, msg->len,
   197				data_per_frame,
   198				sdw->bpt_ctx.dmab_tx_bdl.area,
   199				pdi0_buffer_size,
   200				&tx_total_bytes);
   201		} else {
   202			ret = sdw_cdns_prepare_read_dma_buffer(
   203				msg->dev_num, msg->addr,
   204				msg->len,
   205				data_per_frame,
   206				sdw->bpt_ctx.dmab_tx_bdl.area, pdi0_buffer_size,
   207				&tx_total_bytes);
   208	
   209		}
   210		if (ret < 0) {
   211			dev_err(cdns->dev, "%s: sdw_prepare_%s_dma_buffer failed %d\n",
   212				__func__, command ? "read" : "write", ret);
   213			return ret; // FIXME
   214		}
   215	
   216		dev_info(cdns->dev, "%s: done\n", __func__);
   217	
   218		return 0;
   219	error:
   220		sdw_release_stream(cdns->bus.bpt_stream);
   221	
   222		return ret;
   223	}
   224	
   225	static int intel_ace2x_bpt_close_stream(struct sdw_intel *sdw,
   226						struct sdw_slave *slave,
   227						enum sdw_bpt_type mode,
   228						struct sdw_bpt_msg *msg)
   229	{
   230		struct sdw_cdns *cdns = &sdw->cdns;
   231		int ret;
   232	
   233		if (mode != SDW_BRA)
   234			return -EINVAL;
   235	
 > 236		ret = hda_sdw_bpt_close(cdns->dev->parent, /* PCI device */
   237					sdw->bpt_ctx.bpt_tx_stream,
   238					&sdw->bpt_ctx.dmab_tx_bdl,
   239					sdw->bpt_ctx.bpt_rx_stream,
   240					&sdw->bpt_ctx.dmab_rx_bdl);
   241		if (ret < 0)
   242			dev_err(cdns->dev, "%s:  hda_sdw_bpt_close failed: ret %d\n",
   243				__func__, ret);
   244	
   245		ret = sdw_deprepare_stream(cdns->bus.bpt_stream);
   246		if (ret < 0)
   247			dev_err(cdns->dev, "%s: sdw_deprepare_stream failed: ret %d\n", __func__, ret);
   248		ret = sdw_stream_remove_slave(slave, cdns->bus.bpt_stream);
   249		if (ret < 0)
   250			dev_err(cdns->dev, "%s: remove slave failed: %d\n",
   251				__func__, ret);
   252	
   253		ret = sdw_stream_remove_master(&cdns->bus, cdns->bus.bpt_stream);
   254		if (ret < 0) {
   255			dev_err(cdns->dev, "%s: remove master failed: %d\n",
   256				__func__, ret);
   257			return ret;
   258		}
   259		cdns->bus.bpt_stream = NULL;
   260	
   261		return 0;
   262	}
   263	
   264	static int intel_ace2x_bpt_send_async(struct sdw_intel *sdw,
   265					      struct sdw_slave *slave,
   266					      struct sdw_bpt_msg *msg)
   267	{
   268		struct sdw_cdns *cdns = &sdw->cdns;
   269		int ret;
   270	
   271		dev_info(cdns->dev, "%s: starting\n", __func__);
   272	
 > 273		ret = hda_sdw_bpt_send_async(cdns->dev->parent, /* PCI device */
   274					     sdw->bpt_ctx.bpt_tx_stream,
   275					     sdw->bpt_ctx.bpt_rx_stream);
   276		if (ret < 0) {
   277			dev_info(cdns->dev, "%s: hda_sdw_bpt_send_async: %d\n", __func__, ret);
   278			return ret;
   279		} else {
   280			dev_info(cdns->dev, "%s: hda_sdw_bpt_send_async done", __func__);
   281		}
   282		ret = sdw_enable_stream(cdns->bus.bpt_stream);
   283		if (ret < 0) {
   284			dev_err(cdns->dev, "%s: sdw_stream_enable failed: %d\n",
   285				__func__, ret);
   286			return ret;
   287		}
   288	
   289		dev_info(cdns->dev, "%s: done\n", __func__);
   290	
   291		return 0;
   292	}
   293	
   294	static int intel_ace2x_bpt_wait(struct sdw_intel *sdw,
   295					struct sdw_slave *slave,
   296					struct sdw_bpt_msg *msg)
   297	{
   298		struct sdw_cdns *cdns = &sdw->cdns;
   299		int ret;
   300	
   301		dev_info(cdns->dev, "%s: starting wait\n", __func__);
   302	
 > 303		ret = hda_sdw_bpt_wait(cdns->dev->parent, /* PCI device */
   304				       sdw->bpt_ctx.bpt_tx_stream,
   305				       sdw->bpt_ctx.bpt_rx_stream);
   306		if (ret < 0)
   307			dev_err(cdns->dev, "%s: hda_sdw_bpt_wait failed: %d\n", __func__, ret);
   308	
   309		ret = sdw_disable_stream(cdns->bus.bpt_stream);
   310		if (ret < 0) {
   311			dev_err(cdns->dev, "%s: sdw_stream_enable failed: %d\n",
   312				__func__, ret);
   313			return ret;
   314		}
   315	
   316		if (1) {
   317			/* dump DMA TX buffer */
   318			print_hex_dump_debug("DMA out: ", DUMP_PREFIX_OFFSET,
   319					     4, 4,
   320					     sdw->bpt_ctx.dmab_tx_bdl.area,
   321					     sdw->bpt_ctx.pdi0_buffer_size,
   322					     false);
   323	
   324			print_hex_dump_debug("DMA in: ", DUMP_PREFIX_OFFSET,
   325					     4, 4,
   326					     sdw->bpt_ctx.dmab_rx_bdl.area,
   327					     sdw->bpt_ctx.pdi1_buffer_size,
   328					     false);
   329		}
   330	
   331		dev_info(cdns->dev, "%s: done\n", __func__);
   332	
   333		return 0;
   334	}
   335	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
