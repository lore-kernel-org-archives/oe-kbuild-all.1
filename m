Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AC613C3EF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Apr 2024 22:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713392822; cv=none; b=mdCfroM56Cl4yFEKRhx9Edm2qAUKogt0QGFbmyi8LTqQ9Eq7cec0JC8fCPGiZ6FsveLjMucrlPtHE1oJJpnezBV+Y25+EXP6Qb5NNBUY92eZNi92ExWBvkf3LvEas8Q3UNif8Pvg0veUGVW7GV1SOvHIauf05VnqTHOdB+nXBvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713392822; c=relaxed/simple;
	bh=pZ0d2eGpkwb96kEoMeXtuCEbTvr2wznI6PnFsqdmqlM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XvNvD/8LNf2885f1xzBKU2oz42R7oC2HAWKW9GD0DXqDm3UjDnth9BoerF7lTIfJI4EBT1En1OWBNIyeWb04cic0K8OlcLg5CXbquUiomwS4gliTKBE788HCAy7f8fcwlhY3q1NO34KVlsamYQjnWnZFUyFIIDGMEWN+2kkQTiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NlSoI9/N; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NlSoI9/N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713392821; x=1744928821;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pZ0d2eGpkwb96kEoMeXtuCEbTvr2wznI6PnFsqdmqlM=;
  b=NlSoI9/N3Xhjp8lS+xVOnn4CWrDqTXIzY+tl53KVYl0KaD1INQHeplly
   v1NFA0bOR9zoof4gqGLq6sstXI1DUBA1shBJD0O1UU6/Ql+wMQa1AkWhE
   s9sxt5n7BoZyORdbyUYnt1LaMPKg32ChG4IBcckfWLKit8s3PRwYJRIQo
   Ds9S+OZozbWOZoSxln30KFrD4NMNBbAGcLlLxxQG2lJ1c/LZs9wynZAfZ
   AFAKCFbHzU0NfL8Mb8PHIcmqF9j5maS6POvyVUEH1JsYaUhA/ahdfax75
   WlrhxyJ+gZ2u99m+OFwiED80AZqDmEkKS3qwMOaR3386E1/uLbjXTnF6D
   Q==;
X-CSE-ConnectionGUID: gvsSYqCqREmUEpwfYwfQUw==
X-CSE-MsgGUID: XPeLb1aBRhCK8QAF81+MvA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9079960"
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; 
   d="scan'208";a="9079960"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 15:26:58 -0700
X-CSE-ConnectionGUID: P5cIeCgsQlWImKF4rCex9w==
X-CSE-MsgGUID: jXAJSYS8TPG+Sgd4XZZamg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; 
   d="scan'208";a="22772794"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 17 Apr 2024 15:26:57 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxDjz-00072Y-0C;
	Wed, 17 Apr 2024 22:26:55 +0000
Date: Thu, 18 Apr 2024 06:26:42 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm:zii 20/80] drivers/net/dsa/xrs700x/xrs700x.c:714:37: warning:
 'xrs700x_phylink_mac_ops' defined but not used
Message-ID: <202404180634.GZNTrBPU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git zii
head:   151b88b21c8ef27598749fb5f240a15a32bef669
commit: 055235891082f2adc943a9f7abfdd4931b6a1911 [20/80] net: dsa: xrs700x: provide own phylink MAC operations
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240418/202404180634.GZNTrBPU-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240418/202404180634.GZNTrBPU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404180634.GZNTrBPU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/dsa/xrs700x/xrs700x.c:714:37: warning: 'xrs700x_phylink_mac_ops' defined but not used [-Wunused-const-variable=]
     714 | static const struct phylink_mac_ops xrs700x_phylink_mac_ops = {
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~


vim +/xrs700x_phylink_mac_ops +714 drivers/net/dsa/xrs700x/xrs700x.c

   713	
 > 714	static const struct phylink_mac_ops xrs700x_phylink_mac_ops = {
   715		.mac_config		= xrs700x_mac_config,
   716		.mac_link_down		= xrs700x_mac_link_down,
   717		.mac_link_up		= xrs700x_mac_link_up,
   718	};
   719	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
