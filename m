Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A9329C321
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Oct 2025 03:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761535079; cv=none; b=TxOb6DkIlUgcpbFsNFVzgXRhtA79RjHBPKsUPexslYWPmZTO3KgKBSFa5nSoiuG364EA9GQ/afjhfGPym0YZrOjATOk2DywVp+F4MHM9g1rBcwDVQjCWdB1I5TmLY76Pvel/LJSdaA7wm31BlX1TRrKD++Jkm2QK0yOKDyVT7xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761535079; c=relaxed/simple;
	bh=MdiL29RbM9K8LEu5RDJVmGcAQoQItYkeahQnAMsbek4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WXstZH61oRccsq+PLN/1kKB3pi0zgsF0ZGT53Msp9Obr5OPq6y//EyLcKciOb9W0j02OqMyIUK8rFhQ6zLEQjKbjNf983teVFsIFQjPQO2Wp/9jmH/VDZCp1qb5R5fT8ln//njnvj4XRICNoTVPtw3DpUfB3lUr2BIxpbpT0KkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OqSxvQR3; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OqSxvQR3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761535077; x=1793071077;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MdiL29RbM9K8LEu5RDJVmGcAQoQItYkeahQnAMsbek4=;
  b=OqSxvQR3KJoy0HJI4fdvD4ZNGM9pLD2ymHQJe1cmc9vvWxMz4hWDGJnX
   dovpfA7hUNIj2B8iBuhj/2e1fN5HLlip7p0jtvYvCNHAItUfD0W1cEZ4D
   eNDeh5HJxAfdDyYmS2BjuO9xsJUAnx5uz5mfsyjRmV63tDTAQPZg0q8Tv
   wb2g7Qb4Pd6ApvUy3opyJdjT434FoBPagnw7ihCNt9w1HmM87BnxSNPCO
   B2HF+B/S2yDpDthe1z2HIWq164Ao1kBimvhZPdo5ZFyFw3FzNUwJw+kle
   DadoGuG+832yBo6HXQhz3egacMH+4+1K8klsXFNhjxyx76Jn++YVX8Cl8
   A==;
X-CSE-ConnectionGUID: F9ObhvZkQJayArdvEF1g+Q==
X-CSE-MsgGUID: aHaABjqRQiW+wkaI8LyXtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62818124"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="62818124"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 20:17:56 -0700
X-CSE-ConnectionGUID: wa7/eBRwQfqzXlqhzIufiQ==
X-CSE-MsgGUID: X4Fsah2mSo2Flp1HesWdUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="185014567"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 26 Oct 2025 20:17:55 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDDjt-000GUL-0h;
	Mon, 27 Oct 2025 03:17:46 +0000
Date: Mon, 27 Oct 2025 11:16:59 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [ulfh-pm:next 20/20]
 drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:418:26: sparse: sparse:
 incorrect type in initializer (different base types)
Message-ID: <202510271119.lxpHxCoY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git next
head:   1ff1f0db6aec80eae1639eff31b5875632d539c0
commit: 1ff1f0db6aec80eae1639eff31b5875632d539c0 [20/20] pmdomain: mediatek: Add support for MFlexGraphics
config: arc-randconfig-r112-20251027 (https://download.01.org/0day-ci/archive/20251027/202510271119.lxpHxCoY-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251027/202510271119.lxpHxCoY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510271119.lxpHxCoY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:418:26: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] magic @@     got unsigned long @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:418:26: sparse:     expected restricted __le32 [usertype] magic
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:418:26: sparse:     got unsigned long
>> drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:458:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] magic @@     got unsigned int [usertype] ipi_magic @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:458:20: sparse:     expected restricted __le32 [usertype] magic
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:458:20: sparse:     got unsigned int [usertype] ipi_magic
>> drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:472:19: sparse: sparse: restricted signed int degrades to integer
>> drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:490:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 [assigned] [usertype] base @@     got unsigned int [usertype] shared_mem_phys @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:490:31: sparse:     expected restricted __le64 [assigned] [usertype] base
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:490:31: sparse:     got unsigned int [usertype] shared_mem_phys
>> drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:491:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [assigned] [usertype] size @@     got unsigned int shared_mem_size @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:491:31: sparse:     expected restricted __le32 [assigned] [usertype] size
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:491:31: sparse:     got unsigned int shared_mem_size
>> drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:509:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cmd @@     got int @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:509:17: sparse:     expected restricted __le32 [usertype] cmd
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:509:17: sparse:     got int
>> drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:510:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] power_state @@     got int @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:510:27: sparse:     expected restricted __le32 [usertype] power_state
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:510:27: sparse:     got int
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:523:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cmd @@     got int @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:523:17: sparse:     expected restricted __le32 [usertype] cmd
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:523:17: sparse:     got int
>> drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:524:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted signed int [usertype] gpu_oppidx @@     got unsigned int opp_idx @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:524:38: sparse:     expected restricted signed int [usertype] gpu_oppidx
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:524:38: sparse:     got unsigned int opp_idx
>> drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:525:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted signed int [usertype] stack_oppidx @@     got unsigned int opp_idx @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:525:40: sparse:     expected restricted signed int [usertype] stack_oppidx
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:525:40: sparse:     got unsigned int opp_idx
>> drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:578:42: sparse: sparse: restricted __le32 degrades to integer
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:579:44: sparse: sparse: restricted __le32 degrades to integer
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:593:44: sparse: sparse: restricted __le32 degrades to integer
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:594:46: sparse: sparse: restricted __le32 degrades to integer

vim +418 drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c

   411	
   412	static int mtk_mfg_eb_off(struct mtk_mfg *mfg)
   413	{
   414		struct device *dev = &mfg->pdev->dev;
   415		struct mtk_mfg_ipi_sleep_msg msg = {
   416			.event = 0,
   417			.state = 0,
 > 418			.magic = GPUEB_SLEEP_MAGIC
   419		};
   420		u32 val;
   421		int ret;
   422	
   423		ret = mbox_send_message(mfg->slp_mbox->ch, &msg);
   424		if (ret < 0) {
   425			dev_err(dev, "Cannot send sleep command: %pe\n", ERR_PTR(ret));
   426			return ret;
   427		}
   428	
   429		ret = readl_poll_timeout(mfg->rpc + RPC_PWR_CON, val,
   430					 !(val & PWR_ACK_M), GPUEB_POLL_US,
   431					 GPUEB_TIMEOUT_US);
   432	
   433		if (ret) {
   434			dev_err(dev, "Timed out waiting for EB to power off, val=0x%08X\n", val);
   435			return ret;
   436		}
   437	
   438		return 0;
   439	}
   440	
   441	/**
   442	 * mtk_mfg_send_ipi - synchronously send an IPI message on the gpufreq channel
   443	 * @mfg: pointer to this driver instance's private &struct mtk_mfg
   444	 * @msg: pointer to a message to send; will have magic filled and response assigned
   445	 *
   446	 * Send an IPI message on the gpufreq channel, and wait for a response. Once a
   447	 * response is received, assign a pointer to the response buffer (valid until
   448	 * next response is received) to @msg.
   449	 *
   450	 * Returns 0 on success, negative errno on failure.
   451	 */
   452	static int mtk_mfg_send_ipi(struct mtk_mfg *mfg, struct mtk_mfg_ipi_msg *msg)
   453	{
   454		struct device *dev = &mfg->pdev->dev;
   455		unsigned long wait;
   456		int ret;
   457	
 > 458		msg->magic = mfg->ipi_magic;
   459	
   460		ret = mbox_send_message(mfg->gf_mbox->ch, msg);
   461		if (ret < 0) {
   462			dev_err(dev, "Cannot send GPUFreq IPI command: %pe\n", ERR_PTR(ret));
   463			return ret;
   464		}
   465	
   466		wait = wait_for_completion_timeout(&mfg->gf_mbox->rx_done, msecs_to_jiffies(500));
   467		if (!wait)
   468			return -ETIMEDOUT;
   469	
   470		msg = mfg->gf_mbox->rx_data;
   471	
 > 472		if (msg->u.return_value < 0) {
   473			dev_err(dev, "IPI return: %d\n", msg->u.return_value);
   474			return -EPROTO;
   475		}
   476	
   477		return 0;
   478	}
   479	
   480	static int mtk_mfg_init_shared_mem(struct mtk_mfg *mfg)
   481	{
   482		struct device *dev = &mfg->pdev->dev;
   483		struct mtk_mfg_ipi_msg msg = {};
   484		int ret;
   485	
   486		dev_dbg(dev, "clearing GPUEB shared memory, 0x%X bytes\n", mfg->shared_mem_size);
   487		memset_io(mfg->shared_mem, 0, mfg->shared_mem_size);
   488	
   489		msg.cmd = CMD_INIT_SHARED_MEM;
 > 490		msg.u.shared_mem.base = mfg->shared_mem_phys;
 > 491		msg.u.shared_mem.size = mfg->shared_mem_size;
   492	
   493		ret = mtk_mfg_send_ipi(mfg, &msg);
   494		if (ret)
   495			return ret;
   496	
   497		if (readl(mfg->shared_mem + GF_REG_MAGIC) != GPUEB_MEM_MAGIC) {
   498			dev_err(dev, "EB did not initialise shared memory correctly\n");
   499			return -EIO;
   500		}
   501	
   502		return 0;
   503	}
   504	
   505	static int mtk_mfg_power_control(struct mtk_mfg *mfg, bool enabled)
   506	{
   507		struct mtk_mfg_ipi_msg msg = {};
   508	
 > 509		msg.cmd = CMD_POWER_CONTROL;
 > 510		msg.u.power_state = enabled ? 1 : 0;
   511	
   512		return mtk_mfg_send_ipi(mfg, &msg);
   513	}
   514	
   515	static int mtk_mfg_set_oppidx(struct mtk_mfg *mfg, unsigned int opp_idx)
   516	{
   517		struct mtk_mfg_ipi_msg msg = {};
   518		int ret;
   519	
   520		if (opp_idx >= mfg->num_gpu_opps)
   521			return -EINVAL;
   522	
 > 523		msg.cmd = CMD_FIX_DUAL_TARGET_OPPIDX;
 > 524		msg.u.dual_commit.gpu_oppidx = opp_idx;
 > 525		msg.u.dual_commit.stack_oppidx = opp_idx;
   526	
   527		ret = mtk_mfg_send_ipi(mfg, &msg);
   528		if (ret) {
   529			dev_err(&mfg->pdev->dev, "Failed to set OPP %u: %pe\n",
   530				opp_idx, ERR_PTR(ret));
   531			return ret;
   532		}
   533	
   534		return 0;
   535	}
   536	
   537	static int mtk_mfg_read_opp_tables(struct mtk_mfg *mfg)
   538	{
   539		struct device *dev = &mfg->pdev->dev;
   540		struct mtk_mfg_opp_entry e = {};
   541		unsigned int i;
   542	
   543		mfg->num_gpu_opps = readl(mfg->shared_mem + GF_REG_GPU_OPP_NUM);
   544		mfg->num_stack_opps = readl(mfg->shared_mem + GF_REG_STK_OPP_NUM);
   545	
   546		if (mfg->num_gpu_opps > MAX_OPP_NUM || mfg->num_gpu_opps == 0) {
   547			dev_err(dev, "GPU OPP count (%u) out of range %u >= count > 0\n",
   548				mfg->num_gpu_opps, MAX_OPP_NUM);
   549			return -EINVAL;
   550		}
   551	
   552		if (mfg->num_stack_opps && mfg->num_stack_opps > MAX_OPP_NUM) {
   553			dev_err(dev, "Stack OPP count (%u) out of range %u >= count >= 0\n",
   554				mfg->num_stack_opps, MAX_OPP_NUM);
   555			return -EINVAL;
   556		}
   557	
   558		mfg->gpu_opps = devm_kcalloc(dev, mfg->num_gpu_opps,
   559					     sizeof(struct dev_pm_opp_data), GFP_KERNEL);
   560		if (!mfg->gpu_opps)
   561			return -ENOMEM;
   562	
   563		if (mfg->num_stack_opps) {
   564			mfg->stack_opps = devm_kcalloc(dev, mfg->num_stack_opps,
   565						       sizeof(struct dev_pm_opp_data), GFP_KERNEL);
   566			if (!mfg->stack_opps)
   567				return -ENOMEM;
   568		}
   569	
   570		for (i = 0; i < mfg->num_gpu_opps; i++) {
   571			memcpy_fromio(&e, mfg->shared_mem + GF_REG_OPP_TABLE_GPU + i * sizeof(e),
   572				      sizeof(e));
   573			if (mem_is_zero(&e, sizeof(e))) {
   574				dev_err(dev, "ran into an empty GPU OPP at index %u\n",
   575					i);
   576				return -EINVAL;
   577			}
 > 578			mfg->gpu_opps[i].freq = e.freq_khz * HZ_PER_KHZ;
   579			mfg->gpu_opps[i].u_volt = e.voltage_core * 10;
   580			mfg->gpu_opps[i].level = i;
   581			if (i < mfg->variant->turbo_below)
   582				mfg->gpu_opps[i].turbo = true;
   583		}
   584	
   585		for (i = 0; i < mfg->num_stack_opps; i++) {
   586			memcpy_fromio(&e, mfg->shared_mem + GF_REG_OPP_TABLE_STK + i * sizeof(e),
   587				      sizeof(e));
   588			if (mem_is_zero(&e, sizeof(e))) {
   589				dev_err(dev, "ran into an empty Stack OPP at index %u\n",
   590					i);
   591				return -EINVAL;
   592			}
   593			mfg->stack_opps[i].freq = e.freq_khz * HZ_PER_KHZ;
   594			mfg->stack_opps[i].u_volt = e.voltage_core * 10;
   595			mfg->stack_opps[i].level = i;
   596			if (i < mfg->variant->turbo_below)
   597				mfg->stack_opps[i].turbo = true;
   598		}
   599	
   600		return 0;
   601	}
   602	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
