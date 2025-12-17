Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56697363C68
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 14:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765982028; cv=none; b=q6u30iMIee64kXbT6LIUjbMTZixo8qT7ShlkS+UCCI/ngdmgYF2O1Fsju+PPsKq14BlhlbPxLpFPg2OODvEyiIxwTGbIOoG5UVb39TEDi9sCpXuF/DrhHF0PUMGVCMzQ6rQlzMPVJaxaxXNHSqwgEiSXnbxrIj/aA7PLOhT1HVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765982028; c=relaxed/simple;
	bh=s4u5AW6S9hPMlcuY9buS/HaQ3zTcHOUpXeD4HzBY5lE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fQywP1xqL3oOcrOuJffU+D48JEr+XP6+KfV3k+KjROCcDIbjOY+lMJXsyGNyNDoIUc0XwqG5OHaJXL7OMC8I98js6aneQ0Y60dx3KWQqaMuIUuVrGIrFhAI7i4TesREkKOH50OqjSUJ5WF4V47AJPBz+0d4/cbiY0i2HccYiG8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WobVCXtJ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WobVCXtJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765982027; x=1797518027;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s4u5AW6S9hPMlcuY9buS/HaQ3zTcHOUpXeD4HzBY5lE=;
  b=WobVCXtJQXO+0ulAtyW/5BtyUNdabx8S8fo87sl7jgBgc9Oock3wjA8q
   1I8pG+7dCr8exrkCvDYULslXJkuH7o6IIgUVeaOzfHPBgf+aUpCOj8A+q
   BhZefFgHKq4LqhgjfPQgyxUs4GhhBEPJbQGQe+mf/DRGnOw2T5aoGpGeH
   ZL/Xvk6UiCV57AxoLbbKY8tP+heKAs8pLXckW69pgUGmD38WCv53dEbxO
   4VQU7iPhmc6ds03JYofoON5NA3zwNziCAIYze5ABVOQWMPQuvSs485FtR
   CrBegcKyKIv+FOO93RFKELFRUpAyRcwx80I0n4LIbzL6ia3+ByQVaoR1f
   w==;
X-CSE-ConnectionGUID: iP7dVtXvRLCE+jp+dNPTyA==
X-CSE-MsgGUID: xBgj4FhwQSOyB0dbvwsmEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="78631339"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="78631339"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 06:33:47 -0800
X-CSE-ConnectionGUID: Ji7FIxgVRnmPX0uRu0bcmA==
X-CSE-MsgGUID: lTbqy3/MS9iOd0IRgvIjyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="198804494"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Dec 2025 06:33:45 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVsb1-000000000in-1Yhi;
	Wed, 17 Dec 2025 14:33:43 +0000
Date: Wed, 17 Dec 2025 22:32:54 +0800
From: kernel test robot <lkp@intel.com>
To: Justin Lai <justinlai0215@realtek.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>, Joe Damato <jdamato@fastly.com>
Subject: drivers/net/ethernet/realtek/rtase/rtase_main.c:1117:52: warning:
 '%u' directive output may be truncated writing between 1 and 10 bytes into a
 region of size between 7 and 22
Message-ID: <202512172204.Xy2JD0p1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ea1013c1539270e372fc99854bc6e4d94eaeff66
commit: ef7d33e174564d6294edd00ca797e2b0aac76259 rtase: Modify the format specifier in snprintf to %u
date:   8 months ago
config: powerpc64-randconfig-r061-20251215 (https://download.01.org/0day-ci/archive/20251217/202512172204.Xy2JD0p1-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512172204.Xy2JD0p1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512172204.Xy2JD0p1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/realtek/rtase/rtase_main.c: In function 'rtase_open':
>> drivers/net/ethernet/realtek/rtase/rtase_main.c:1117:52: warning: '%u' directive output may be truncated writing between 1 and 10 bytes into a region of size between 7 and 22 [-Wformat-truncation=]
       snprintf(ivec->name, sizeof(ivec->name), "%s_int%u",
                                                       ^~
   drivers/net/ethernet/realtek/rtase/rtase_main.c:1117:45: note: directive argument in the range [0, 2147483647]
       snprintf(ivec->name, sizeof(ivec->name), "%s_int%u",
                                                ^~~~~~~~~~
   drivers/net/ethernet/realtek/rtase/rtase_main.c:1117:4: note: 'snprintf' output between 6 and 30 bytes into a destination of size 26
       snprintf(ivec->name, sizeof(ivec->name), "%s_int%u",
       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         tp->dev->name, i);
         ~~~~~~~~~~~~~~~~~


vim +1117 drivers/net/ethernet/realtek/rtase/rtase_main.c

  1086	
  1087	static int rtase_open(struct net_device *dev)
  1088	{
  1089		struct rtase_private *tp = netdev_priv(dev);
  1090		const struct pci_dev *pdev = tp->pdev;
  1091		struct rtase_int_vector *ivec;
  1092		u16 i = 0, j;
  1093		int ret;
  1094	
  1095		ivec = &tp->int_vector[0];
  1096		tp->rx_buf_sz = RTASE_RX_BUF_SIZE;
  1097	
  1098		ret = rtase_alloc_desc(tp);
  1099		if (ret)
  1100			return ret;
  1101	
  1102		ret = rtase_init_ring(dev);
  1103		if (ret)
  1104			goto err_free_all_allocated_mem;
  1105	
  1106		rtase_hw_config(dev);
  1107	
  1108		if (tp->sw_flag & RTASE_SWF_MSIX_ENABLED) {
  1109			ret = request_irq(ivec->irq, rtase_interrupt, 0,
  1110					  dev->name, ivec);
  1111			if (ret)
  1112				goto err_free_all_allocated_irq;
  1113	
  1114			/* request other interrupts to handle multiqueue */
  1115			for (i = 1; i < tp->int_nums; i++) {
  1116				ivec = &tp->int_vector[i];
> 1117				snprintf(ivec->name, sizeof(ivec->name), "%s_int%u",
  1118					 tp->dev->name, i);
  1119				ret = request_irq(ivec->irq, rtase_q_interrupt, 0,
  1120						  ivec->name, ivec);
  1121				if (ret)
  1122					goto err_free_all_allocated_irq;
  1123			}
  1124		} else {
  1125			ret = request_irq(pdev->irq, rtase_interrupt, 0, dev->name,
  1126					  ivec);
  1127			if (ret)
  1128				goto err_free_all_allocated_mem;
  1129		}
  1130	
  1131		rtase_hw_start(dev);
  1132	
  1133		for (i = 0; i < tp->int_nums; i++) {
  1134			ivec = &tp->int_vector[i];
  1135			napi_enable(&ivec->napi);
  1136		}
  1137	
  1138		netif_carrier_on(dev);
  1139		netif_wake_queue(dev);
  1140	
  1141		return 0;
  1142	
  1143	err_free_all_allocated_irq:
  1144		for (j = 0; j < i; j++)
  1145			free_irq(tp->int_vector[j].irq, &tp->int_vector[j]);
  1146	
  1147	err_free_all_allocated_mem:
  1148		rtase_free_desc(tp);
  1149	
  1150		return ret;
  1151	}
  1152	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
