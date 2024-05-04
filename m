Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4BB39FD0
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 May 2024 12:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714826854; cv=none; b=BE1GOyAEFAsbbkjc8ObEWWb+frjQBNhWTrMwP7Otx3nmR7aPvzeaxjW3yixHWb7oq0dQAedKSWEM6lBJHrsatDRcCuur7pMdYVDAq7sP5JfsE7YN5cWp2jR7fhVyDYsuGrCPewL2tQOk1ru2I76kG5/hbBFtLHGCwTMVi1xIwe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714826854; c=relaxed/simple;
	bh=hrMkbsrstHyhq5wwCShdeniuRz0zu6y+Ah7yMty/moA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LEJDPt4H9/CG1X3upx5U1+bTepasqaO1m3fJyB9Rgl+YEAXV4JnbgUg5eDAsHYA0/W3RY4/BTdmIYFym+twckNFRDdZugweew/rQ+mDMWJCY6MQqQ2+3ftoOkQsRBzDcUcBMf2zIUir4agKwIwic3fiveb7jbf5bfrAACs2YSC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kMwnt077; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kMwnt077"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714826852; x=1746362852;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hrMkbsrstHyhq5wwCShdeniuRz0zu6y+Ah7yMty/moA=;
  b=kMwnt077fAolwrn4YXO4gQ7y3Tvrchk0spVSgIkPMIw4dugcDZr4qbbC
   xZACMMYj2V8FppYRODba+fa+jQqXdX94glo8p07xv3VGiL5xTDVCp4I4C
   rZ0u3xMORtdMcOBN9v1NitXTSCyBdx9PrvuSeXyDbI7sRX9XDed3VcIFp
   6fBImus8YXb7/jeLYXlrAtuh84/nwECTYof3svGq6fWNWf/QRFyBRbSd0
   2zuLANukJID7sT19MA2xvvKb3lUluwci7hHaMZUT5KIVacID6YoLCntUt
   O0GE3bGbAWuCjl5k3yREY+hqsK8rtIlSKidIJ/v9aSA/G5M7M2Yijn09T
   w==;
X-CSE-ConnectionGUID: R/CwQkG/Rlm5XIU7d3xZGQ==
X-CSE-MsgGUID: 9AlyTKzaTqWTxACvarpySQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="21241043"
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; 
   d="scan'208";a="21241043"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2024 05:47:31 -0700
X-CSE-ConnectionGUID: ast/9bMrRMqya6nqKUPwhg==
X-CSE-MsgGUID: 572iopJnQYaYFh3f+ID6/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; 
   d="scan'208";a="27726403"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 04 May 2024 05:47:30 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3EnX-000Clk-2a;
	Sat, 04 May 2024 12:47:27 +0000
Date: Sat, 4 May 2024 20:47:17 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 724/1143]
 drivers/net/can/aspeed_can.c:301:6: warning: no previous prototype for
 'aspeed_can_err_init'
Message-ID: <202405042003.wbWT0aDv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux aspeed-6.9-rebase
head:   9bdcee91eb5d9149678acb9d066e9dafbd026721
commit: 2ee73951fe1501d2112dffe0779046c31b9e84c8 [724/1143] can: aspeed: Can driver initial support
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240504/202405042003.wbWT0aDv-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240504/202405042003.wbWT0aDv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405042003.wbWT0aDv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/can/aspeed_can.c:301:6: warning: no previous prototype for 'aspeed_can_err_init' [-Wmissing-prototypes]
     301 | void aspeed_can_err_init(struct net_device *ndev)
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/net/can/aspeed_can.c:312:6: warning: no previous prototype for 'aspeed_can_interrupt_conf' [-Wmissing-prototypes]
     312 | void aspeed_can_interrupt_conf(struct net_device *ndev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/can/aspeed_can.c: In function 'aspeed_can_err_interrupt':
>> drivers/net/can/aspeed_can.c:836:13: warning: variable 'tecnt' set but not used [-Wunused-but-set-variable]
     836 |         u32 tecnt;
         |             ^~~~~
>> drivers/net/can/aspeed_can.c:835:13: warning: variable 'recnt' set but not used [-Wunused-but-set-variable]
     835 |         u32 recnt;
         |             ^~~~~


vim +/aspeed_can_err_init +301 drivers/net/can/aspeed_can.c

   300	
 > 301	void aspeed_can_err_init(struct net_device *ndev)
   302	{
   303		struct aspeed_can_priv *priv = netdev_priv(ndev);
   304		u32 reg_val;
   305	
   306		reg_val = (STAT_AFWL << CAN_ERR_AFWL_BITOFF) & CAN_ERR_AFWL_MASK;
   307		reg_val |= (STAT_EWL << CAN_ERR_EWL_BITOFF) & CAN_ERR_EWL_MASK;
   308	
   309		writel(reg_val, priv->reg_base + CAN_ERR_STAT);
   310	}
   311	
 > 312	void aspeed_can_interrupt_conf(struct net_device *ndev)
   313	{
   314		struct aspeed_can_priv *priv = netdev_priv(ndev);
   315		u32 inte;
   316	
   317		inte = CAN_INT_EIE_BIT | CAN_INT_TSIE_BIT | CAN_INT_TPIE_BIT |
   318		       CAN_INT_RAFIE_BIT | CAN_INT_RFIE_BIT | CAN_INT_ROIE_BIT |
   319		       CAN_INT_RIE_BIT | CAN_INT_BEIE_BIT | CAN_INT_ALIE_BIT |
   320		       CAN_INT_EPIE_BIT;
   321	
   322		writel(inte, priv->reg_base + CAN_INTE);
   323	}
   324	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
