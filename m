Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F9E8F6C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Nov 2023 13:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eW7BDGZC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699794493; x=1731330493;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KD6PZ95WCa9IaKwGDxEwBP3Whywwfm+ODH+b7Oys+/4=;
  b=eW7BDGZCm7kPrUySnd8aj+0cJgEFl4rRL6USiUw5p0y5QX/vZTnkb9oE
   qbRuFu2ZbzRUGtHKkX3pOZTgCa9aaPb1zGJkY2TCfNea8CcioTVt2ao83
   E4wd+OtATl6E0+WRw4sOofAQ+9q+4qymDAkBgd6tFWh3g/eN13PepHO9u
   kacwDTLY+IcJwpnHgAl4ofKbFw0R2tkUudIG0VReFSkeFGDjZLBXyNyyE
   dl21iIwLRQtuGrxOKWfg48C1H5zGVqgZQgeyn38KR6NwUI2O8jUitQf0O
   uKpiZsiC67DzO4l2Gj0PT3wuzNdBkCSxs/auV+yyMfhir9Rlb4zaBKTQ3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="3353625"
X-IronPort-AV: E=Sophos;i="6.03,297,1694761200"; 
   d="scan'208";a="3353625"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 05:08:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="1095530967"
X-IronPort-AV: E=Sophos;i="6.03,297,1694761200"; 
   d="scan'208";a="1095530967"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 12 Nov 2023 05:08:11 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2AC8-000BAQ-2s;
	Sun, 12 Nov 2023 13:08:08 +0000
Date: Sun, 12 Nov 2023 21:07:11 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 7474/30000]
 drivers/spi/spi-nxp-fspi.c:1153:5: sparse: sparse: symbol
 'nxp_fspi_runtime_suspend' was not declared. Should it be static?
Message-ID: <202311122119.sQ8WsAr9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: 2c4cf9ce2fcf9581d6625025b76ae73f77dde922 [7474/30000] MLK-23644: spi: spi-nxp-fspi: enable runtime pm for fspi
config: i386-randconfig-063-20231021 (https://download.01.org/0day-ci/archive/20231112/202311122119.sQ8WsAr9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231112/202311122119.sQ8WsAr9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311122119.sQ8WsAr9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/spi/spi-nxp-fspi.c:479:25: sparse: sparse: cast from restricted __be32
>> drivers/spi/spi-nxp-fspi.c:1153:5: sparse: sparse: symbol 'nxp_fspi_runtime_suspend' was not declared. Should it be static?
>> drivers/spi/spi-nxp-fspi.c:1162:5: sparse: sparse: symbol 'nxp_fspi_runtime_resume' was not declared. Should it be static?

vim +/nxp_fspi_runtime_suspend +1153 drivers/spi/spi-nxp-fspi.c

  1151	
  1152	
> 1153	int nxp_fspi_runtime_suspend(struct device *dev)
  1154	{
  1155		struct nxp_fspi *f = dev_get_drvdata(dev);
  1156	
  1157		nxp_fspi_clk_disable_unprep(f);
  1158	
  1159		return 0;
  1160	}
  1161	
> 1162	int nxp_fspi_runtime_resume(struct device *dev)
  1163	{
  1164		struct nxp_fspi *f = dev_get_drvdata(dev);
  1165	
  1166		nxp_fspi_clk_prep_enable(f);
  1167	
  1168		if (nxp_fspi_initialized(f) && nxp_fspi_need_reinit(f))
  1169			nxp_fspi_default_setup(f);
  1170	
  1171		return 0;
  1172	}
  1173	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
