Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FEE2D3A6A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Jul 2025 22:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751583570; cv=none; b=eop5ILhpcXyp+vbPHkC6MW13Yg6mzhQxHyL0ABib8bynFexVi/iRST0+D4EyMdhVuEcR1yNilXqzx+cQJA7pzdexWwEQ7mLCTAIiiwDmrmwvDkNavx3drmaGpvvekVBCDLWLAsslR0QEGe71jN1xsb3MUyIpUk6AaveFQJPg/8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751583570; c=relaxed/simple;
	bh=75boxUXxZZSaPZpPMRa/Od0+l9Q/FbqYkwRpG5JkyDU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kBv+JGUmzOIo3HAcijIbmWU60ocenapSUIOVcYevLrwFjvFWAx9hsI+T+2fOfP0QwsBoZkoAzpRMTbrCPbYJnqyGekr+LsEcoNzyxO1mj5Zd3G9Hk7wsZ0H0vIJw0g/rqIB0kELrBBRD5eYZDBqsIp5YlE1lVGRSNbfU94P6B4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nd4Djrum; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nd4Djrum"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751583569; x=1783119569;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=75boxUXxZZSaPZpPMRa/Od0+l9Q/FbqYkwRpG5JkyDU=;
  b=Nd4DjrumU4pA9/L+Y9E0eSlv/QxL5W0eCujH0Ze/8kCfwdzaAh6yNWqN
   FXWDR77xBq01I2m1W6g1taN2MBEYi5lV+wyUYbDy1ruS1sR3AZLxgQEN4
   oUAFwri9KOup+Ru7kMyucgTBd9rT7/YcDxbJqMDMzKRWBHvqYsn//m6+F
   JoXLIexXB7yPqVpHPRgwFBA7eon6sXEYYPJq4cTDgzUMbSRqmBOwL9PKW
   j/DyDiaxezRgm2F+MWEt1C5vmyHdGTM1V29QlUsTvn88b+UITFfn/QL2n
   PUCTu2nBCttUjrw0BaOFUfzupO7u08ahCMfbyZboxYenIms1heG7zYXff
   w==;
X-CSE-ConnectionGUID: SKBeg80mSZu+MLB4/mY/VQ==
X-CSE-MsgGUID: GsMT3/U+T5qNgzuxZMt/qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64974030"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="64974030"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 15:59:28 -0700
X-CSE-ConnectionGUID: PAg67if8TfOAFn5elcbVVg==
X-CSE-MsgGUID: dHEZw643QoyRjSYtmeEH6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="158765171"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Jul 2025 15:59:27 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXSto-00035n-2b;
	Thu, 03 Jul 2025 22:59:24 +0000
Date: Fri, 4 Jul 2025 06:58:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, s00851154 <shijing34@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2455/2455]
 drivers/net/ethernet/huawei/hinic3/hinic3_tx.c:395:5: warning: no previous
 prototype for 'hinic3_tx_offload'
Message-ID: <202507040654.Wl8xfk0X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   9b85bcf0e6357841885264f42859bec05c9073f4
commit: 74e3846262704452212a3245dccb10c2cd185ac3 [2455/2455] net/hinic3: Support new TX feature
config: x86_64-buildonly-randconfig-006-20250704 (https://download.01.org/0day-ci/archive/20250704/202507040654.Wl8xfk0X-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507040654.Wl8xfk0X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507040654.Wl8xfk0X-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/huawei/hinic3/hinic3_tx.c:395:5: warning: no previous prototype for 'hinic3_tx_offload' [-Wmissing-prototypes]
     395 | u32 hinic3_tx_offload(struct sk_buff *skb, struct hinic3_offload_info *offload_info,
         |     ^~~~~~~~~~~~~~~~~


vim +/hinic3_tx_offload +395 drivers/net/ethernet/huawei/hinic3/hinic3_tx.c

   394	
 > 395	u32 hinic3_tx_offload(struct sk_buff *skb, struct hinic3_offload_info *offload_info,
   396			      struct hinic3_queue_info *queue_info, struct hinic3_txq *txq)
   397	{
   398		u32 offload = 0;
   399		int tso_cs_en;
   400	
   401		tso_cs_en = hinic3_tso(offload_info, queue_info, skb);
   402		if (tso_cs_en < 0) {
   403			offload = TX_OFFLOAD_INVALID;
   404			return offload;
   405		} else if (tso_cs_en) {
   406			offload |= TX_OFFLOAD_TSO;
   407		} else {
   408			tso_cs_en = hinic3_tx_csum(txq, skb, offload_info, queue_info);
   409			if (tso_cs_en)
   410				offload |= TX_OFFLOAD_CSUM;
   411		}
   412	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
