Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17802EAB6F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Apr 2026 12:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776256689; cv=none; b=UuHCeYtcQNWLSSNCSdGFAWrdUxrVmRAniVe7YUa+3SnvArDcikwDLv9zP2Z7RbbWgB82mEWVv26FcCpfD7I+d1vJYmME1K/A6ZQsobMvAa2KYUpL7f7uutBqSWHeK8dVhrf/a4gOiYTz95nLx6T0pQj0J4kj83oGINfHIs2QOVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776256689; c=relaxed/simple;
	bh=RhtKg45rikLXDelXWDngNHBHdDA++hvobqF5pWB1aCc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WLzBfbQQ4esuDjWPCiZA1UBf/AAx++cnWkpkQElk2ONF/ToCYutWu5unHzK8gyX4RfZr9jeiQ0YtpIWHOgM82MrhEfj+v/Gh8kF74RBNNlIZBRpVp1Cj/CosUb9/hjsGDFxAaQpbkpjSOd27PVmyIGq6YpxNYJW2m+pMS/K4gl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jC8ajV7z; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jC8ajV7z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776256688; x=1807792688;
  h=date:from:to:cc:subject:message-id;
  bh=RhtKg45rikLXDelXWDngNHBHdDA++hvobqF5pWB1aCc=;
  b=jC8ajV7zdnt1zRPJ7PnCTpERgMwlpyQ2m+9AJfCZQyqRCuf5E5uif8ke
   3Jmchp455GMHcVcUiyw9XWT0iYj47AfoKLbCRxOsmkcCVhDqjWdy1Auae
   sP6T/P7dpygqRdF5o8HiCf2Bo/BMGTC4k34jG3hRRVvcP0xDpryLyxzp6
   ecSDKw7AZvcqJags0s7KMURVijqC9TBnlu/jE1K0G9JwSmk9o+vUeRjIa
   VD9EAfqZ5lK8dCVLji8KqEAuMkGO8UM8St9WGrPcg7RNQ/bUmdJCE4keW
   8FRKo+xs5JzBrjUzm7cdPNE7aYpmnmapAn3PDrClEaZCgXDXm/8jHXZNs
   w==;
X-CSE-ConnectionGUID: Fqu7Qr9MT/2aX8OC2aOexQ==
X-CSE-MsgGUID: AAa5NaohT3acrOJ6yTwDSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="76263203"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="76263203"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 05:38:07 -0700
X-CSE-ConnectionGUID: MVdKiNy1RAmXNp+09E6vIw==
X-CSE-MsgGUID: E9d96qPbS92bQgzxttsvbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="234804377"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 15 Apr 2026 05:38:06 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCzVK-000000000Vf-3VmM;
	Wed, 15 Apr 2026 12:38:02 +0000
Date: Wed, 15 Apr 2026 20:37:07 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:490:31: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202604152059.jesiTWK3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1f5ffc672165ff851063a5fd044b727ab2517ae3
commit: f08e7a4e8d6ac4de677727af352ea33c6ce9f444 pmdomain: mediatek: Add support for MFlexGraphics
date:   5 months ago
config: arc-randconfig-r111-20260415 (https://download.01.org/0day-ci/archive/20260415/202604152059.jesiTWK3-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260415/202604152059.jesiTWK3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f08e7a4e8d6a ("pmdomain: mediatek: Add support for MFlexGraphics")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604152059.jesiTWK3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:418:26: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] magic @@     got unsigned long @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:418:26: sparse:     expected restricted __le32 [usertype] magic
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:418:26: sparse:     got unsigned long
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:458:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] magic @@     got unsigned int [usertype] ipi_magic @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:458:20: sparse:     expected restricted __le32 [usertype] magic
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:458:20: sparse:     got unsigned int [usertype] ipi_magic
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:472:19: sparse: sparse: restricted signed int degrades to integer
>> drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:490:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 [assigned] [usertype] base @@     got unsigned int [usertype] shared_mem_phys @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:490:31: sparse:     expected restricted __le64 [assigned] [usertype] base
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:490:31: sparse:     got unsigned int [usertype] shared_mem_phys
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:491:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [assigned] [usertype] size @@     got unsigned int shared_mem_size @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:491:31: sparse:     expected restricted __le32 [assigned] [usertype] size
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:491:31: sparse:     got unsigned int shared_mem_size
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:509:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cmd @@     got int @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:509:17: sparse:     expected restricted __le32 [usertype] cmd
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:509:17: sparse:     got int
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:510:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] power_state @@     got int @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:510:27: sparse:     expected restricted __le32 [usertype] power_state
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:510:27: sparse:     got int
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:523:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cmd @@     got int @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:523:17: sparse:     expected restricted __le32 [usertype] cmd
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:523:17: sparse:     got int
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:524:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted signed int [usertype] gpu_oppidx @@     got unsigned int opp_idx @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:524:38: sparse:     expected restricted signed int [usertype] gpu_oppidx
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:524:38: sparse:     got unsigned int opp_idx
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:525:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted signed int [usertype] stack_oppidx @@     got unsigned int opp_idx @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:525:40: sparse:     expected restricted signed int [usertype] stack_oppidx
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:525:40: sparse:     got unsigned int opp_idx
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:578:42: sparse: sparse: restricted __le32 degrades to integer
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:579:44: sparse: sparse: restricted __le32 degrades to integer
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:593:44: sparse: sparse: restricted __le32 degrades to integer
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:594:46: sparse: sparse: restricted __le32 degrades to integer

vim +490 drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c

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
   458		msg->magic = mfg->ipi_magic;
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
   472		if (msg->u.return_value < 0) {
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
   491		msg.u.shared_mem.size = mfg->shared_mem_size;
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
