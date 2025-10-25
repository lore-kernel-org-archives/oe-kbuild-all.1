Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09932E8B86
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Oct 2025 16:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761410262; cv=none; b=PGe/NEQwKRAVk5nmJbj1j24HiCF7ItDszpjfCIkVr2SW6ziNbVDwiGYf1/0F+OyS0SZhAPqnx+4z3GpoBhWwZMxB8xdHn8OsxW75iImuTO3jtDholEH8TGpGYkeOdZoF7e7GilRweHgCX4+FlCUD5PtJtQWJ0QzxAVo8CkGFH4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761410262; c=relaxed/simple;
	bh=vTefjoBVLUgxDcvgbWE1W8dtDBv4i1+gG7jBqTtre9A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=udyQcZxl2YBCY3kqOTneFy4/EZBGmcCHUABufWf+vtnBqYUwGEQMMKqALq/mvRs6/p5UeOBAd4iGGd45dr5hiSI39+TluLZcx/EHZr9laq5rXVQmagmmqTyGrYruVifRNrOMWZ6SEThEKNJ8huH4pjiMkWhkY4rdnU49VUE9VL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dl+7shBT; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dl+7shBT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761410261; x=1792946261;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vTefjoBVLUgxDcvgbWE1W8dtDBv4i1+gG7jBqTtre9A=;
  b=dl+7shBTXFXXfKiUZsWMFGoMSD1pwQ4WUR9/UZxSSf7fv2b6b9yhN6is
   9jhKhe7qpkbtF2SWdlIKibDcqQlNsewazbRHaDyJeZ8rxukkTbvnZMS9s
   AU5wQn1xuakvU/xJ4155+XNkaRLlglaaKiE3LAVG14Zlr6+3tuR00wdz5
   dw0C4tW57IFJ9P2zuhkYh4m/yIjAud/m5EgX6a7QHFKd47eXkjJ3EKHQH
   RhScEanUHY2vbQ2Wb11JenCeoEGgkWdT3VZlfyi5rwqbrtb4kQV2VnJcl
   9BGVqAMg0HZIdBRBxUoFFc17Xjvep1EvfuxrDjurSJ1iYkFh4yIFVhjvO
   g==;
X-CSE-ConnectionGUID: G8EE1NRjSBa94v12tToJAg==
X-CSE-MsgGUID: gm4BoN98QA+D3oq/0d5DcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81183748"
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="81183748"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 09:37:40 -0700
X-CSE-ConnectionGUID: cCObrSvwQEiCDu5sLehhkg==
X-CSE-MsgGUID: /pehufNbRT6Nh6cY1ZJNrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="189797170"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 25 Oct 2025 09:37:39 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vChGr-000FQp-02;
	Sat, 25 Oct 2025 16:37:37 +0000
Date: Sun, 26 Oct 2025 00:37:28 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.18-rc 115/137]
 drivers/net/ethernet/mediatek/mtk_eth_soc.c:5027:25: warning: unused
 variable 'phylink'
Message-ID: <202510260043.bqHDrOTz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.18-rc
head:   7c2cb874579bbeec58dd89bfed9612882e0c6611
commit: 015b57783c6705404457c8e35f4e7c5b78055da1 [115/137] net: mtk: eth-mux: fix rcu_lock in mux
config: sparc-randconfig-002-20251025 (https://download.01.org/0day-ci/archive/20251026/202510260043.bqHDrOTz-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510260043.bqHDrOTz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510260043.bqHDrOTz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mediatek/mtk_eth_soc.c: In function 'mtk_add_mux_channel':
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:5027:25: warning: unused variable 'phylink' [-Wunused-variable]
    5027 |         struct phylink *phylink;
         |                         ^~~~~~~
   In file included from drivers/net/ethernet/mediatek/mtk_eth_soc.c:25:
   include/linux/pcs/pcs.h: At top level:
   include/linux/pcs/pcs.h:90:1: warning: 'fwnode_phylink_pcs_get_from_fwnode' defined but not used [-Wunused-function]
      90 | fwnode_phylink_pcs_get_from_fwnode(struct fwnode_handle *fwnode,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pcs/pcs.h:78:12: warning: 'register_fwnode_pcs_notifier' defined but not used [-Wunused-function]
      78 | static int register_fwnode_pcs_notifier(struct notifier_block *nb)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/phylink +5027 drivers/net/ethernet/mediatek/mtk_eth_soc.c

be353b0907fcec Bo-Cun Chen      2024-11-28  5020  
be353b0907fcec Bo-Cun Chen      2024-11-28  5021  static int mtk_add_mux_channel(struct mtk_mux *mux, struct device_node *np)
be353b0907fcec Bo-Cun Chen      2024-11-28  5022  {
be353b0907fcec Bo-Cun Chen      2024-11-28  5023  	const __be32 *_id = of_get_property(np, "reg", NULL);
be353b0907fcec Bo-Cun Chen      2024-11-28  5024  	struct mtk_mac *mac = mux->mac;
be353b0907fcec Bo-Cun Chen      2024-11-28  5025  	struct mtk_eth *eth = mac->hw;
be353b0907fcec Bo-Cun Chen      2024-11-28  5026  	struct mtk_mux_data *data;
be353b0907fcec Bo-Cun Chen      2024-11-28 @5027  	struct phylink *phylink;
be353b0907fcec Bo-Cun Chen      2024-11-28  5028  	phy_interface_t phy_mode;
be353b0907fcec Bo-Cun Chen      2024-11-28  5029  	int id, err;
be353b0907fcec Bo-Cun Chen      2024-11-28  5030  
be353b0907fcec Bo-Cun Chen      2024-11-28  5031  	if (!_id) {
be353b0907fcec Bo-Cun Chen      2024-11-28  5032  		dev_err(eth->dev, "missing mux channel id\n");
be353b0907fcec Bo-Cun Chen      2024-11-28  5033  		return -EINVAL;
be353b0907fcec Bo-Cun Chen      2024-11-28  5034  	}
be353b0907fcec Bo-Cun Chen      2024-11-28  5035  
be353b0907fcec Bo-Cun Chen      2024-11-28  5036  	id = be32_to_cpup(_id);
be353b0907fcec Bo-Cun Chen      2024-11-28  5037  	if (id < 0 || id > 1) {
be353b0907fcec Bo-Cun Chen      2024-11-28  5038  		dev_err(eth->dev, "%d is not a valid mux channel id\n", id);
be353b0907fcec Bo-Cun Chen      2024-11-28  5039  		return -EINVAL;
be353b0907fcec Bo-Cun Chen      2024-11-28  5040  	}
be353b0907fcec Bo-Cun Chen      2024-11-28  5041  
be353b0907fcec Bo-Cun Chen      2024-11-28  5042  	data = kmalloc(sizeof(*data), GFP_KERNEL);
be353b0907fcec Bo-Cun Chen      2024-11-28  5043  	if (unlikely(!data)) {
be353b0907fcec Bo-Cun Chen      2024-11-28  5044  		dev_err(eth->dev, "failed to create mux data structure\n");
be353b0907fcec Bo-Cun Chen      2024-11-28  5045  		return -ENOMEM;
be353b0907fcec Bo-Cun Chen      2024-11-28  5046  	}
be353b0907fcec Bo-Cun Chen      2024-11-28  5047  
be353b0907fcec Bo-Cun Chen      2024-11-28  5048  	err = of_get_phy_mode(np, &phy_mode);
be353b0907fcec Bo-Cun Chen      2024-11-28  5049  	if (err) {
be353b0907fcec Bo-Cun Chen      2024-11-28  5050  		dev_err(eth->dev, "incorrect phy-mode\n");
be353b0907fcec Bo-Cun Chen      2024-11-28  5051  		goto err_free_data;
be353b0907fcec Bo-Cun Chen      2024-11-28  5052  	}
be353b0907fcec Bo-Cun Chen      2024-11-28  5053  
015b57783c6705 Frank Wunderlich 2025-10-23  5054  	/*phylink = phylink_create(&mux->mac->phylink_config,
be353b0907fcec Bo-Cun Chen      2024-11-28  5055  				 of_fwnode_handle(np),
be353b0907fcec Bo-Cun Chen      2024-11-28  5056  				 phy_mode, &mtk_phylink_ops);
be353b0907fcec Bo-Cun Chen      2024-11-28  5057  	if (IS_ERR(phylink)) {
be353b0907fcec Bo-Cun Chen      2024-11-28  5058  		dev_err(eth->dev, "failed to create phylink structure\n");
be353b0907fcec Bo-Cun Chen      2024-11-28  5059  		err = PTR_ERR(phylink);
be353b0907fcec Bo-Cun Chen      2024-11-28  5060  		goto err_free_data;
015b57783c6705 Frank Wunderlich 2025-10-23  5061  	}*/
be353b0907fcec Bo-Cun Chen      2024-11-28  5062  
015b57783c6705 Frank Wunderlich 2025-10-23  5063  	dev_info(eth->dev, "ethernet mux: line:%d added new channel:%d\n",__LINE__,id);
be353b0907fcec Bo-Cun Chen      2024-11-28  5064  	data->of_node = np;
015b57783c6705 Frank Wunderlich 2025-10-23  5065  	data->phylink = NULL;//phylink;
be353b0907fcec Bo-Cun Chen      2024-11-28  5066  	mux->data[id] = data;
be353b0907fcec Bo-Cun Chen      2024-11-28  5067  
be353b0907fcec Bo-Cun Chen      2024-11-28  5068  	return 0;
be353b0907fcec Bo-Cun Chen      2024-11-28  5069  
be353b0907fcec Bo-Cun Chen      2024-11-28  5070  err_free_data:
be353b0907fcec Bo-Cun Chen      2024-11-28  5071  	kfree(data);
be353b0907fcec Bo-Cun Chen      2024-11-28  5072  	return err;
be353b0907fcec Bo-Cun Chen      2024-11-28  5073  }
be353b0907fcec Bo-Cun Chen      2024-11-28  5074  

:::::: The code at line 5027 was first introduced by commit
:::::: be353b0907fcecb2510a227fcbf697a24a7cc063 net: ethernet: mtk_eth_soc: support ethernet passive mux

:::::: TO: Bo-Cun Chen <bc-bocun.chen@mediatek.com>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
