Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2E1155A24
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Sep 2024 15:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725204171; cv=none; b=fHkPsvczYn0QZc3RrVRlLzA7j153mBp28AszhES6QWaIuVCWgnKlJUjbKWUBxV463dr4DjEPsWfD3WuYMZbLAAfjStcfBT53Ss7AF2zG9uALCnx+b3ZoLi0S+kVh34WYR6Oi/94p7KXii+7AiVIXySyAsIIVJJHugCa39ws8/RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725204171; c=relaxed/simple;
	bh=x6AZmMMVLQRihbILYTDPFYjcbN4xK59W7a9+rFPJG7w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nO1BPEhcX1Vvv0JkUt4ur6hykS9hNmtaVO5MdlQXIKR0YL75/9W3V3lP1oPXXiozSYT/WXRCUbdLFR6/HvK1B2Z5kLVio/HiMKbA7vHWZF5GxPBaCRhdCkCKVGZrnfw9mHU4kKFS3ag8LLA1PPNLwap4fhb1UNhqUp5/Faq89+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Os/hdbSw; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Os/hdbSw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725204169; x=1756740169;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x6AZmMMVLQRihbILYTDPFYjcbN4xK59W7a9+rFPJG7w=;
  b=Os/hdbSwSpZQ2QlMrrJOL70hHW5a3srk2ncbS+IvRBrwRqR3If9hwId7
   M8tlQkVdYRf1WNkA1HW/Aicb3ySvX4+vLurR4ozWFa+SQkehk+ciAiKLw
   dapXjoyq1qCMusJiJOAJBoOcYFMRNXQ00sse1Yj/x9ogmm/6u/i/CRGfj
   oouMUSnBKslPYd6cu80CJ5ZcwD2W6nr4weGKG3tk28CE8VdCAJikGuNd3
   naqIOKHxQ3ee16dfhmS1t3acXgOMk+Kt3voeX4Zui2hJO7p80JrMU9gcE
   j2rH1fwajB6P70dixd0KsZMcz7Wq3T3X6rweJ9KbpVK51PT5uERPgYx0h
   g==;
X-CSE-ConnectionGUID: ceL9dYXaRgK/uDZHQ4weDQ==
X-CSE-MsgGUID: AFCQTYRaSveUfWdjtnngKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="46291899"
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; 
   d="scan'208";a="46291899"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2024 08:22:48 -0700
X-CSE-ConnectionGUID: h1hiCQMiRTGKhSDryxuPSw==
X-CSE-MsgGUID: z0W2oDR6QXO4KpaLOzlJpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; 
   d="scan'208";a="69163795"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 01 Sep 2024 08:22:47 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skmPd-0003kc-05;
	Sun, 01 Sep 2024 15:22:45 +0000
Date: Sun, 1 Sep 2024 23:21:46 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liu Jian <liujian56@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 29384/30000]
 drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c:2327:6: warning: no previous
 prototype for 'mcp251xfd_tx_obj_write_sync'
Message-ID: <202409012356.7eBq1FpF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   02994a9b68a17040658e1a32a4438a31ae6f273b
commit: b4eaf3e808dc2abcab55bc72df3b0d15961f33f0 [29384/30000] can: mcp251xfd: fix infinite loop when xmit fails
config: x86_64-randconfig-071-20240901 (https://download.01.org/0day-ci/archive/20240901/202409012356.7eBq1FpF-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409012356.7eBq1FpF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409012356.7eBq1FpF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c:2327:6: warning: no previous prototype for 'mcp251xfd_tx_obj_write_sync' [-Wmissing-prototypes]
    2327 | void mcp251xfd_tx_obj_write_sync(struct work_struct *work)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/mcp251xfd_tx_obj_write_sync +2327 drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c

  2326	
> 2327	void mcp251xfd_tx_obj_write_sync(struct work_struct *work)
  2328	{
  2329		struct mcp251xfd_priv *priv = container_of(work, struct mcp251xfd_priv,
  2330				tx_work);
  2331		struct mcp251xfd_tx_obj *tx_obj = priv->tx_work_obj;
  2332		struct mcp251xfd_tx_ring *tx_ring = priv->tx;
  2333		int err;
  2334	
  2335		err = spi_sync(priv->spi, &tx_obj->msg);
  2336		if (err)
  2337			mcp251xfd_tx_failure_drop(priv, tx_ring, err);
  2338	}
  2339	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
