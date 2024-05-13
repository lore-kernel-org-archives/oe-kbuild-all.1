Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96763BB30
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 May 2024 19:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715630335; cv=none; b=ZXbIkyQnxmMYZyDn1X9e3tIjxfWbSquDGJTAITM5LigvmtQlXv5kMMUBJ0yhG/TROIBmCe8fBstRasQnURLynF4Jbi6kI1E81FpnHW9qaUsFcapwjBEXT3d/jcxZZHbrbqGuhGkD1UU/fS+ymBLoGeC+fPJRXR8PdHbLCmvf6r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715630335; c=relaxed/simple;
	bh=BLPDP1Gs5px4pdIBZeo3EcatOEdX30LBF10HP53HO08=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pqH1Ij+Hs7EwrRP16DXpgfqudHO560MtUbCGY4vujh4UsQYG95HoXoO8+RTWTGR1U4TObqdbec0Cm/gdyJKxdqrek8BIE0pZqULqVoX4GPDmu/qlJP8h6Vf8cFuGu6Ys+f25Z6Cd808dLgrsrIZRPOnrNL2z5HPTebHOj5+qh5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gq0W4hHe; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gq0W4hHe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715630334; x=1747166334;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BLPDP1Gs5px4pdIBZeo3EcatOEdX30LBF10HP53HO08=;
  b=Gq0W4hHevO8V+Cn6WBR8nZHtvn074EkQHDHWrVRMdgSjMtV/P54CBw3H
   d1DpVMFmDYj6qeWAgJ9pyu4XvnIoYxahnpkb9VZkjUZo6CwDJ3fh0VDwy
   NSAJguspJbvyV0MTZhjJivqXnhEePxVEJm/cF9FIeCJT3fdRYokyA06lE
   gmWsXwkr8axvm7YFEJtTm5KRf+suhGt5iKcnP8hf2ED9uvEdOTXmSrP/0
   BSumUAau7i63SPHr31nPVoTRzRaJZihXIeWe85KMkeTeEIiNyhThfgoXs
   d65lGPbO1fGhTkBiY6oyOUg5F68RQEeiInIzh0/PSgFpygkA9vXjPje3j
   A==;
X-CSE-ConnectionGUID: dpcRifRGT7qzvW6f2+AUtg==
X-CSE-MsgGUID: p4OKoQ8gTSqh9As/oG7yiw==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11798375"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="11798375"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 12:58:53 -0700
X-CSE-ConnectionGUID: jbhKqnV/SCGN0pbZUNW8/A==
X-CSE-MsgGUID: alSsJzyjSTKyjjuIGzgKqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="34990388"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 May 2024 12:58:51 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6bow-000AfH-0k;
	Mon, 13 May 2024 19:58:50 +0000
Date: Tue, 14 May 2024 03:58:45 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xu Yan <xuyan1481@phytium.com.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21365/22424]
 drivers/media/platform/phytium-jpeg/phytium_jpeg_core.c:1301:5-11:
 inconsistent IS_ERR and PTR_ERR on line 1303.
Message-ID: <202405140308.WGE9RFya-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   819e21d7b3e4610b4f9d6531b4fcd61ad2e9770a
commit: a773f33429ed6187436dd27117f3cc74a65a5344 [21365/22424] jpeg: Add a Phytium JPEG Engine driver
config: arm64-randconfig-r051-20240514 (https://download.01.org/0day-ci/archive/20240514/202405140308.WGE9RFya-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405140308.WGE9RFya-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/media/platform/phytium-jpeg/phytium_jpeg_core.c:1301:5-11: inconsistent IS_ERR and PTR_ERR on line 1303.
   drivers/media/platform/phytium-jpeg/phytium_jpeg_core.c:1308:5-11: inconsistent IS_ERR and PTR_ERR on line 1310.

vim +1301 drivers/media/platform/phytium-jpeg/phytium_jpeg_core.c

  1279	
  1280	static int phytium_jpeg_probe(struct platform_device *pdev)
  1281	{
  1282		struct phytium_jpeg_dev *jpeg_dev;
  1283		const struct of_device_id *match;
  1284		const struct phytium_jpeg_config *config;
  1285		struct resource *res;
  1286		int ret;
  1287	
  1288		jpeg_dev = devm_kzalloc(&pdev->dev, sizeof(*jpeg_dev), GFP_KERNEL);
  1289		if (jpeg_dev == NULL)
  1290			return -ENOMEM;
  1291	
  1292		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
  1293		jpeg_dev->base_addr = devm_ioremap_resource(&pdev->dev, res);
  1294		if (IS_ERR(jpeg_dev->base_addr)) {
  1295			dev_err(jpeg_dev->dev, "Failed to ioremap.\n");
  1296			return PTR_ERR(jpeg_dev->base_addr);
  1297		}
  1298	
  1299		res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
  1300		jpeg_dev->timer30_addr = devm_ioremap_resource(&pdev->dev, res);
> 1301		if (IS_ERR(jpeg_dev->base_addr)) {
  1302			dev_err(jpeg_dev->dev, "Failed to parse timer30.\n");
> 1303			return PTR_ERR(jpeg_dev->timer30_addr);
  1304		}
  1305	
  1306		res = platform_get_resource(pdev, IORESOURCE_MEM, 2);
  1307		jpeg_dev->timer31_addr = devm_ioremap_resource(&pdev->dev, res);
  1308		if (IS_ERR(jpeg_dev->base_addr)) {
  1309			dev_err(jpeg_dev->dev, "Failed to parse timer30.\n");
  1310			return PTR_ERR(jpeg_dev->timer31_addr);
  1311		}
  1312		match = of_match_node(phytium_jpeg_match, pdev->dev.of_node);
  1313		if (match == NULL) {
  1314			dev_err(jpeg_dev->dev, "Failed to match.\n");
  1315			return -EINVAL;
  1316		}
  1317	
  1318		config = match->data;
  1319		jpeg_dev->comp_size_read = config->comp_size_read;
  1320	
  1321		jpeg_dev->frame_rate = 30;
  1322		jpeg_dev->dev = &pdev->dev;
  1323		spin_lock_init(&jpeg_dev->hw_lock);
  1324		mutex_init(&jpeg_dev->video_lock);
  1325		init_waitqueue_head(&jpeg_dev->wait);
  1326		INIT_DELAYED_WORK(&jpeg_dev->res_work, phytium_jpeg_resolution_work);
  1327		INIT_LIST_HEAD(&jpeg_dev->buffers);
  1328	
  1329		ret = phytium_jpeg_init(jpeg_dev);
  1330		if (ret != 0) {
  1331			dev_err(jpeg_dev->dev, "Failed to initialize the JPEG engine.\n");
  1332			return ret;
  1333		}
  1334	
  1335		ret = phytium_jpeg_setup_video(jpeg_dev);
  1336	
  1337		return ret;
  1338	}
  1339	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
