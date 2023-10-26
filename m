Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8062DF87
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Oct 2023 13:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mx12Cq0J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698326931; x=1729862931;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OmDa3RzcbQ/VeKX1sPqLXLUlPv4hO5tKQNi9qdtoKRk=;
  b=Mx12Cq0JKa6fmfv/tcSSlJbhJ3kToo6X7jJnxscOgMwMDOGyAe+Xwclg
   UL0JgsYbuGf11pKMtxKBzO8gaz/qe/dxtNStySh32cQ+7Ou6MCYbDusg6
   P8UQR51ADudPkPx/w4p9AwXHAAnAmaK9p/SJDmGJg014vHNxT046B0Od+
   qNUeD/dUJ8q99WI70ObSpjAYzCvy5ujyRSDIdMjDnqBKaDa3ja/+tUH9P
   NfZdVSI104yNOEqjoEC30/7QXHm2fALDWBxxEVPpbDfte9lOQggYbTSNs
   KyZCbuFo1Z9nj96QmcTPge/1hC0yI2lZlPFpt9m/djAF3F7dlhXXv602n
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="454016918"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="454016918"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 06:27:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="6909555"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 Oct 2023 06:26:01 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qw0OO-0009ot-0t;
	Thu, 26 Oct 2023 13:27:20 +0000
Date: Thu, 26 Oct 2023 21:26:34 +0800
From: kernel test robot <lkp@intel.com>
To: Sergey Khimich <serghox@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vinod Koul <vkoul@kernel.org>
Subject: [linux-next:master 9065/14992]
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:1239 dma_chan_pause() warn:
 inconsistent indenting
Message-ID: <202310262104.JQhDdU3I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2ef7141596eed0b4b45ef18b3626f428a6b0a822
commit: 495e18b16e3dd8218eaec6a8a55334fb55245d59 [9065/14992] dmaengine: dw-axi-dmac: Add support DMAX_NUM_CHANNELS > 16
config: x86_64-randconfig-161-20231022 (https://download.01.org/0day-ci/archive/20231026/202310262104.JQhDdU3I-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231026/202310262104.JQhDdU3I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310262104.JQhDdU3I-lkp@intel.com/

New smatch warnings:
drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:1239 dma_chan_pause() warn: inconsistent indenting
drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:1286 axi_chan_resume() warn: inconsistent indenting

Old smatch warnings:
drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:1345 axi_dma_resume() warn: 'chip->cfgr_clk' from clk_prepare_enable() not released on lines: 1340.

vim +1239 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c

  1218	
  1219	static int dma_chan_pause(struct dma_chan *dchan)
  1220	{
  1221		struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
  1222		unsigned long flags;
  1223		unsigned int timeout = 20; /* timeout iterations */
  1224		u64 val;
  1225	
  1226		spin_lock_irqsave(&chan->vc.lock, flags);
  1227	
  1228		if (chan->chip->dw->hdata->nr_channels >= DMAC_CHAN_16) {
  1229			val = axi_dma_ioread64(chan->chip, DMAC_CHSUSPREG);
  1230			if (chan->id >= DMAC_CHAN_16) {
  1231				val |= (u64)(BIT(chan->id) >> DMAC_CHAN_16)
  1232					<< (DMAC_CHAN_SUSP2_SHIFT + DMAC_CHAN_BLOCK_SHIFT) |
  1233					(u64)(BIT(chan->id) >> DMAC_CHAN_16)
  1234					<< (DMAC_CHAN_SUSP2_WE_SHIFT + DMAC_CHAN_BLOCK_SHIFT);
  1235			} else {
  1236				val |= BIT(chan->id) << DMAC_CHAN_SUSP2_SHIFT |
  1237				       BIT(chan->id) << DMAC_CHAN_SUSP2_WE_SHIFT;
  1238				}
> 1239				axi_dma_iowrite64(chan->chip, DMAC_CHSUSPREG, val);
  1240		} else {
  1241			if (chan->chip->dw->hdata->reg_map_8_channels) {
  1242				val = axi_dma_ioread32(chan->chip, DMAC_CHEN);
  1243				val |= BIT(chan->id) << DMAC_CHAN_SUSP_SHIFT |
  1244				BIT(chan->id) << DMAC_CHAN_SUSP_WE_SHIFT;
  1245				axi_dma_iowrite32(chan->chip, DMAC_CHEN, (u32)val);
  1246			} else {
  1247				val = axi_dma_ioread32(chan->chip, DMAC_CHSUSPREG);
  1248				val |= BIT(chan->id) << DMAC_CHAN_SUSP2_SHIFT |
  1249				BIT(chan->id) << DMAC_CHAN_SUSP2_WE_SHIFT;
  1250				axi_dma_iowrite32(chan->chip, DMAC_CHSUSPREG, (u32)val);
  1251			}
  1252		}
  1253	
  1254		do  {
  1255			if (axi_chan_irq_read(chan) & DWAXIDMAC_IRQ_SUSPENDED)
  1256				break;
  1257	
  1258			udelay(2);
  1259		} while (--timeout);
  1260	
  1261		axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
  1262	
  1263		chan->is_paused = true;
  1264	
  1265		spin_unlock_irqrestore(&chan->vc.lock, flags);
  1266	
  1267		return timeout ? 0 : -EAGAIN;
  1268	}
  1269	
  1270	/* Called in chan locked context */
  1271	static inline void axi_chan_resume(struct axi_dma_chan *chan)
  1272	{
  1273		u64 val;
  1274	
  1275		if (chan->chip->dw->hdata->nr_channels >= DMAC_CHAN_16) {
  1276			val = axi_dma_ioread64(chan->chip, DMAC_CHSUSPREG);
  1277			if (chan->id >= DMAC_CHAN_16) {
  1278				val &= ~((u64)(BIT(chan->id) >> DMAC_CHAN_16)
  1279					<< (DMAC_CHAN_SUSP2_SHIFT + DMAC_CHAN_BLOCK_SHIFT));
  1280				val |=  ((u64)(BIT(chan->id) >> DMAC_CHAN_16)
  1281					<< (DMAC_CHAN_SUSP2_WE_SHIFT + DMAC_CHAN_BLOCK_SHIFT));
  1282			} else {
  1283				val &= ~(BIT(chan->id) << DMAC_CHAN_SUSP2_SHIFT);
  1284				val |=  (BIT(chan->id) << DMAC_CHAN_SUSP2_WE_SHIFT);
  1285			}
> 1286				axi_dma_iowrite64(chan->chip, DMAC_CHSUSPREG, val);
  1287		} else {
  1288			if (chan->chip->dw->hdata->reg_map_8_channels) {
  1289				val = axi_dma_ioread32(chan->chip, DMAC_CHEN);
  1290				val &= ~(BIT(chan->id) << DMAC_CHAN_SUSP_SHIFT);
  1291				val |=  (BIT(chan->id) << DMAC_CHAN_SUSP_WE_SHIFT);
  1292				axi_dma_iowrite32(chan->chip, DMAC_CHEN, (u32)val);
  1293			} else {
  1294				val = axi_dma_ioread32(chan->chip, DMAC_CHSUSPREG);
  1295				val &= ~(BIT(chan->id) << DMAC_CHAN_SUSP2_SHIFT);
  1296				val |=  (BIT(chan->id) << DMAC_CHAN_SUSP2_WE_SHIFT);
  1297				axi_dma_iowrite32(chan->chip, DMAC_CHSUSPREG, (u32)val);
  1298			}
  1299		}
  1300	
  1301		chan->is_paused = false;
  1302	}
  1303	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
