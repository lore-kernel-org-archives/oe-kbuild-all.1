Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A4D3BE627
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jun 2026 22:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780440929; cv=none; b=ivId7danjZlvfbvr/0sP0JVhVj5ZauAjRJrHblu6msogB/Mv7b9HVY6Ek2d8bZ/n4G2etuEyNBXsWrPVFmc5Rxi6r7oM7oxM6lpGnUN2kvqZCdfkxTr2xXV5jOYLqZBbQf29E8Gytuam9cVh9P75BNJIKBncIaUGN4QtslgnHLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780440929; c=relaxed/simple;
	bh=v3VzRlURdpdhvr9KUL9tB9KUCX/9iZP+QAUsVIDIQSE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dJ5uzBlODBJncpAf1xXUCrM1AD5HOl6hQhltQdzEB8RkRcriS9si4yjpugzre7iQhk9Fu9Q+NsFjD0nRaYXcYst6nqSDYO6NoYV3iQ8/O74FfprPxdhvIdNT0IZ+51AFCJrMlgwtKvkZCtIQcr6OitmB940aYEol5n5bbJyJXU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HHUjMOfA; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HHUjMOfA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780440929; x=1811976929;
  h=date:from:to:cc:subject:message-id;
  bh=v3VzRlURdpdhvr9KUL9tB9KUCX/9iZP+QAUsVIDIQSE=;
  b=HHUjMOfAd3l+qhxxiEBCTRv2ZSzyuwBmQsZKAUz633UgBKs0SyeEI52p
   zLxigAS8qulY8WdJ2NczF91IsATGRL9IPJHs4JBOR5sbbQxiP2aywxG2S
   Ra+lGDCjj3Mklxnxe1P4X9rPNtP6h6zeVXLCZdnvQt8BuZN16IgfRldry
   2+KgapjbyjtVJYTT/noO3l0lu1BGFUQPLgY4V2/otUjB4QU/QpWrvCz8z
   VUp25Vg35yLn6f4Kz+hxee4f7G11J/D9j6KsQ1GPgolSLt4Y8pVrs/iCX
   0UE7Dfs8C1hgYAzOP/ykZC1avPsuD0gDQXis2anuwYDMxUI1lxpqQQAn4
   w==;
X-CSE-ConnectionGUID: Em865/UzSwud8AWJ/zfyCw==
X-CSE-MsgGUID: SebwHwp3SwOAgpfGb9Utpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81214295"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="81214295"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 15:55:28 -0700
X-CSE-ConnectionGUID: XX6vrFsmRpm7kioBoK7Ypw==
X-CSE-MsgGUID: G0SgU5+lQTm0jL/gQhauDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="239885099"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 02 Jun 2026 15:55:26 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUY16-00000000CdK-2NQQ;
	Tue, 02 Jun 2026 22:55:24 +0000
Date: Wed, 03 Jun 2026 06:54:43 +0800
From: kernel test robot <lkp@intel.com>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sbates130272-p2pmem:switchtec-dma-sysfs 4/4]
 drivers/dma/switchtec_dma.c:1316:2-3: Unneeded semicolon
Message-ID: <202606030635.Qvc3uCeT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/sbates130272/linux-p2pmem.git switchtec-dma-sysfs
head:   7de58d38d826e9043f1c21054c804d326563a84a
commit: 7de58d38d826e9043f1c21054c804d326563a84a [4/4] dmaengine: switchtec-dma: Add pmon sysfs attributes
config: x86_64-randconfig-104-20260602 (https://download.01.org/0day-ci/archive/20260603/202606030635.Qvc3uCeT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606030635.Qvc3uCeT-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/dma/switchtec_dma.c:1316:2-3: Unneeded semicolon

vim +1316 drivers/dma/switchtec_dma.c

  1285	
  1286	static ssize_t latency_selector_store(struct dma_chan *chan, const char *page,
  1287					      size_t count)
  1288	{
  1289		struct switchtec_dma_chan *swdma_chan =
  1290			container_of(chan, struct switchtec_dma_chan, dma_chan);
  1291		struct chan_fw_regs __iomem *chan_fw = swdma_chan->mmio_chan_fw;
  1292		ssize_t ret = count;
  1293		int lat_type;
  1294	
  1295		if (kstrtoint(page, 0, &lat_type) < 0)
  1296			return -EINVAL;
  1297	
  1298		switch (lat_type) {
  1299		case 1:
  1300			lat_type = SWITCHTEC_LAT_SE_FETCH;
  1301			break;
  1302		case 2:
  1303			lat_type = SWITCHTEC_LAT_VDM;
  1304			break;
  1305		case 3:
  1306			lat_type = SWITCHTEC_LAT_RD_IMM;
  1307			break;
  1308		case 4:
  1309			lat_type = SWITCHTEC_LAT_SE_PROCESS;
  1310			break;
  1311		case 5:
  1312			lat_type = SWITCHTEC_LAT_FW_NP;
  1313			break;
  1314		default:
  1315			return -EINVAL;
> 1316		};
  1317	
  1318		rcu_read_lock();
  1319		if (!rcu_dereference(swdma_chan->swdma_dev->pdev)) {
  1320			ret = -ENODEV;
  1321			goto err_unlock;
  1322		}
  1323	
  1324		if (chan->client_count) {
  1325			ret = -EBUSY;
  1326			goto err_unlock;
  1327		}
  1328	
  1329		writel(lat_type, &chan_fw->perf_latency_selector);
  1330	
  1331	err_unlock:
  1332		rcu_read_unlock();
  1333	
  1334		return ret;
  1335	}
  1336	static struct dma_chan_sysfs_entry
  1337	latency_selector_attr = __ATTR_RW(latency_selector);
  1338	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
