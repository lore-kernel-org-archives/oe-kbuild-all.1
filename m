Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A8A1DE2BA
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Dec 2024 19:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733166747; cv=none; b=J5lSaZGKbBN/HTQM/e1JGQXNYQBgAzWmROlSp2/SPr7kahe65Z9U781+qd1WPjUw4YBxTIE63zjEvyYE159iHswY+Hz7E/B+3ORGCQ7FWjzLV4vkfXTiXeKjh5OtOSa0BpUBt/+UQ52pi2DOfZnkhbnzOzftVb3AvNAm+zA0SwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733166747; c=relaxed/simple;
	bh=v6l2nW7O4PYP5P3LDp3HcMbS4inMQbpTRT85eRQzoyA=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=er+xcLgVr7kUzrc/3efv4cdJKupFczBGp3vZe9NhicUJASKQzRwiFRHxCzRvvzljWdp1KRblMgIFI7UbTdcM0+qXoDLEO1GNyPUoFrqwiYJIs7EgPmoWqmtwlhs+Lzu+4xJTlB0XGIEHFW92ocwjvfvGN4EM0VeVdrVUghXxYYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PYYZi/MT; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PYYZi/MT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733166746; x=1764702746;
  h=date:from:cc:subject:message-id:mime-version;
  bh=v6l2nW7O4PYP5P3LDp3HcMbS4inMQbpTRT85eRQzoyA=;
  b=PYYZi/MTbGR3/ydm+ppKUYnsFGi4E+clO7qUF+5Q9BTVP2pMTmjbrBwx
   FeT0HdQWv/n3XjSw9hE//iCL/3Fk4DaOW3vrhv/sc6xEncL3DNa0+a2dD
   qbiqrN0cMo76TTzjjggxhKZ9wIB1x3O7JtBIOEnnL499NUG3D4GROKfRO
   UOhhJMbhcSml0b57QVQHU6kC3JuRGlOuQKHDDt9sY198So+XVoplWU/oZ
   WDtKwyB76NvHNXuzigzPWFKvuq5KRDWAZUx//HOKpqPC8ojXUjo1Z0vXu
   UjX6XxyOk/MPLVY5PQikCxUbNE6OFjQk6r1/Hz/LjkYLvQFD7y3iMFWv6
   g==;
X-CSE-ConnectionGUID: rNapMsZxTkaVhG4VFuM69w==
X-CSE-MsgGUID: W/b/P2hGQfK6hkXuU9bKLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="50765918"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="50765918"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 11:12:18 -0800
X-CSE-ConnectionGUID: 6pNTaPADTUK09Ymd3yGpUg==
X-CSE-MsgGUID: YYEEE/2YTBm9m1PDi3lgxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="124130604"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 02 Dec 2024 11:12:15 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIBpW-0002nb-1f;
	Mon, 02 Dec 2024 19:11:47 +0000
Date: Tue, 3 Dec 2024 03:10:48 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Junxiao Chang <junxiao.chang@intel.com>
Subject: [intel-lts:6.1/linux 1642/2351]
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c:429:10: warning: cast to
 smaller integer type 'enum mtk_ovl_adaptor_comp_type' from 'const void *'
Message-ID: <202412030317.3299J00N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.1/linux
head:   04072584e676a7bd8bd14677b7b87274efc36169
commit: 9e53a57c765372db79edcb5c06f8a70ac975fc5c [1642/2351] soc: mediatek: add mtk-mmsys ethdr and mdp_rdma components
config: arm64-randconfig-004-20240107 (https://download.01.org/0day-ci/archive/20241203/202412030317.3299J00N-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 7e186d366d6c7def0543acc255931f617e76dff0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412030317.3299J00N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412030317.3299J00N-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c:134:2: error: call to undeclared function 'mtk_mmsys_merge_async_config'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     134 |         mtk_mmsys_merge_async_config(ovl_adaptor->mmsys_dev, idx, align_width / 2,
         |         ^
>> drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c:429:10: warning: cast to smaller integer type 'enum mtk_ovl_adaptor_comp_type' from 'const void *' [-Wvoid-pointer-to-enum-cast]
     429 |                 type = (enum mtk_ovl_adaptor_comp_type)of_id->data;
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +429 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c

f66ce1e593e5d7 Nancy.Lin 2023-03-21  405  
f66ce1e593e5d7 Nancy.Lin 2023-03-21  406  static int ovl_adaptor_comp_init(struct device *dev, struct component_match **match)
f66ce1e593e5d7 Nancy.Lin 2023-03-21  407  {
f66ce1e593e5d7 Nancy.Lin 2023-03-21  408  	struct mtk_disp_ovl_adaptor *priv = dev_get_drvdata(dev);
f66ce1e593e5d7 Nancy.Lin 2023-03-21  409  	struct device_node *node, *parent;
f66ce1e593e5d7 Nancy.Lin 2023-03-21  410  	struct platform_device *comp_pdev;
f66ce1e593e5d7 Nancy.Lin 2023-03-21  411  
f66ce1e593e5d7 Nancy.Lin 2023-03-21  412  	parent = dev->parent->parent->of_node->parent;
f66ce1e593e5d7 Nancy.Lin 2023-03-21  413  
f66ce1e593e5d7 Nancy.Lin 2023-03-21  414  	for_each_child_of_node(parent, node) {
f66ce1e593e5d7 Nancy.Lin 2023-03-21  415  		const struct of_device_id *of_id;
f66ce1e593e5d7 Nancy.Lin 2023-03-21  416  		enum mtk_ovl_adaptor_comp_type type;
f66ce1e593e5d7 Nancy.Lin 2023-03-21  417  		int id;
f66ce1e593e5d7 Nancy.Lin 2023-03-21  418  
f66ce1e593e5d7 Nancy.Lin 2023-03-21  419  		of_id = of_match_node(mtk_ovl_adaptor_comp_dt_ids, node);
f66ce1e593e5d7 Nancy.Lin 2023-03-21  420  		if (!of_id)
f66ce1e593e5d7 Nancy.Lin 2023-03-21  421  			continue;
f66ce1e593e5d7 Nancy.Lin 2023-03-21  422  
f66ce1e593e5d7 Nancy.Lin 2023-03-21  423  		if (!of_device_is_available(node)) {
f66ce1e593e5d7 Nancy.Lin 2023-03-21  424  			dev_dbg(dev, "Skipping disabled component %pOF\n",
f66ce1e593e5d7 Nancy.Lin 2023-03-21  425  				node);
f66ce1e593e5d7 Nancy.Lin 2023-03-21  426  			continue;
f66ce1e593e5d7 Nancy.Lin 2023-03-21  427  		}
f66ce1e593e5d7 Nancy.Lin 2023-03-21  428  
f66ce1e593e5d7 Nancy.Lin 2023-03-21 @429  		type = (enum mtk_ovl_adaptor_comp_type)of_id->data;
f66ce1e593e5d7 Nancy.Lin 2023-03-21  430  		id = ovl_adaptor_comp_get_id(dev, node, type);
f66ce1e593e5d7 Nancy.Lin 2023-03-21  431  		if (id < 0) {
f66ce1e593e5d7 Nancy.Lin 2023-03-21  432  			dev_warn(dev, "Skipping unknown component %pOF\n",
f66ce1e593e5d7 Nancy.Lin 2023-03-21  433  				 node);
f66ce1e593e5d7 Nancy.Lin 2023-03-21  434  			continue;
f66ce1e593e5d7 Nancy.Lin 2023-03-21  435  		}
f66ce1e593e5d7 Nancy.Lin 2023-03-21  436  
f66ce1e593e5d7 Nancy.Lin 2023-03-21  437  		comp_pdev = of_find_device_by_node(node);
f66ce1e593e5d7 Nancy.Lin 2023-03-21  438  		if (!comp_pdev)
f66ce1e593e5d7 Nancy.Lin 2023-03-21  439  			return -EPROBE_DEFER;
f66ce1e593e5d7 Nancy.Lin 2023-03-21  440  
f66ce1e593e5d7 Nancy.Lin 2023-03-21  441  		priv->ovl_adaptor_comp[id] = &comp_pdev->dev;
f66ce1e593e5d7 Nancy.Lin 2023-03-21  442  
f66ce1e593e5d7 Nancy.Lin 2023-03-21  443  		drm_of_component_match_add(dev, match, compare_of, node);
f66ce1e593e5d7 Nancy.Lin 2023-03-21  444  		dev_dbg(dev, "Adding component match for %pOF\n", node);
f66ce1e593e5d7 Nancy.Lin 2023-03-21  445  	}
f66ce1e593e5d7 Nancy.Lin 2023-03-21  446  
f66ce1e593e5d7 Nancy.Lin 2023-03-21  447  	if (!*match) {
f66ce1e593e5d7 Nancy.Lin 2023-03-21  448  		dev_err(dev, "No match device for ovl_adaptor\n");
f66ce1e593e5d7 Nancy.Lin 2023-03-21  449  		return -ENODEV;
f66ce1e593e5d7 Nancy.Lin 2023-03-21  450  	}
f66ce1e593e5d7 Nancy.Lin 2023-03-21  451  
f66ce1e593e5d7 Nancy.Lin 2023-03-21  452  	return 0;
f66ce1e593e5d7 Nancy.Lin 2023-03-21  453  }
f66ce1e593e5d7 Nancy.Lin 2023-03-21  454  

:::::: The code at line 429 was first introduced by commit
:::::: f66ce1e593e5d7bd8537020db7b21042fd8cbddf drm/mediatek: Add ovl_adaptor support for MT8195

:::::: TO: Nancy.Lin <nancy.lin@mediatek.com>
:::::: CC: Junxiao Chang <junxiao.chang@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
