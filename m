Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F733321DE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Aug 2026 01:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788139700; cv=none; b=Ym6oW/PfjrXsUzaXEnM20UpLDsJPmH9njj83e0CRmiOHq40CVV7KlqU51g2G+40gAfVgnj62Kerkv0KISj4OaZfzsYC3Lo5QiV67q1a7bGUDejrQ/4+DqUi3X9SJA267UakDcb6svk0M6+rhc7fu2KA29rOblguNXE+VLvI3PoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788139700; c=relaxed/simple;
	bh=7GF4ak90E+rLb4r/Rg0vfSoobti4IFdSBgfbyPJGuFM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pfttMf2H91dxUpf6E7GjP5tCYPZw9w+inGbmcFHdQ9j8KbAXj8iSEp+39SkO0C6VPT0yS3EcYSSP+AV8uDs+7A7c3aXy5OM8+7sRDxre+fwMmXnoCuAUHS3v/0kf66x4anMHQmYaEX+xjKs+/JjL46uSxuH0E7xgI9ueyMaZrNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hgwbtUgs; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hgwbtUgs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788139697; x=1819675697;
  h=date:from:to:cc:subject:message-id;
  bh=7GF4ak90E+rLb4r/Rg0vfSoobti4IFdSBgfbyPJGuFM=;
  b=hgwbtUgsp4mwCoX+2G/vEhDM4pfZRJAC6QRdg7bXeHQ3z5+6zjdljR1r
   3dLLh+H0Vab32o9RrtSW3FCsG2+ov5N79YJz5MzX1zsK07hiPPNu2uETr
   hGxErWw4TKyjAZi33REr+kT9+oy0OvPLJUDgQSBfK5wYZaUSvz7jZzzk+
   zYbIPshBhMn8WT+XbGvTUTUBt0MBtGQSxGJdcy43a+McxHf48rtDNHZb3
   g2fW6jkrrQCzJip2i773awlwSBxDX97SsLO3lp7XBc0tF5lo6Sasln9q7
   8O3PT5zaHgwQnyG8WtBwamKGKOKWvi4UyeylyBOpw8RTRTNKnjBUS9qv/
   Q==;
X-CSE-ConnectionGUID: Wh44NP5TR9WihnzD1smNjQ==
X-CSE-MsgGUID: HR9s1wp1QG+WZurppp0lTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88565239"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="88565239"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 18:28:16 -0700
X-CSE-ConnectionGUID: u33JSENUQZ+BldC/5/ed8Q==
X-CSE-MsgGUID: ZrPlifLSTOaDANCSNmImwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="292157933"
Received: from igk-lkp-server01.igk.intel.com (HELO 32268bdb9915) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 30 Aug 2026 18:28:14 -0700
Received: from kbuild by 32268bdb9915 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0qom-000000000JX-0i1r;
	Mon, 31 Aug 2026 01:28:12 +0000
Date: Mon, 31 Aug 2026 03:28:10 +0200
From: kernel test robot <lkp@intel.com>
To: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/crypto/amlogic/amlogic-gxl-core.c:166:42: error:
 implicit declaration of function 'devm_crypto_engine_alloc_init'; did you
 mean 'crypto_engine_alloc_init'?
Message-ID: <202608310329.QgxCCMs1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Mohamad-Raizudeen/crypto-amlogic-Use-devm-APIs-for-clock-and-engine-management/20260821-204303
head:   9f703793f0a723cf495c90aed76fb7f1e99e02b1
commit: 9f703793f0a723cf495c90aed76fb7f1e99e02b1 crypto: amlogic: Use devm APIs for clock and engine management
date:   8 days ago
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260831/202608310329.QgxCCMs1-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260831/202608310329.QgxCCMs1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608310329.QgxCCMs1-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/crypto/amlogic/amlogic-gxl-core.c: In function 'meson_allocate_chanlist':
>> drivers/crypto/amlogic/amlogic-gxl-core.c:166:42: error: implicit declaration of function 'devm_crypto_engine_alloc_init'; did you mean 'crypto_engine_alloc_init'? [-Wimplicit-function-declaration]
     166 |                 mc->chanlist[i].engine = devm_crypto_engine_alloc_init(mc->dev, true);
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                          crypto_engine_alloc_init
>> drivers/crypto/amlogic/amlogic-gxl-core.c:166:40: error: assignment to 'struct crypto_engine *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     166 |                 mc->chanlist[i].engine = devm_crypto_engine_alloc_init(mc->dev, true);
         |                                        ^


vim +166 drivers/crypto/amlogic/amlogic-gxl-core.c

   150	
   151	/*
   152	 * Allocate the channel list structure
   153	 */
   154	static int meson_allocate_chanlist(struct meson_dev *mc)
   155	{
   156		int i, err;
   157	
   158		mc->chanlist = devm_kcalloc(mc->dev, MAXFLOW,
   159					    sizeof(struct meson_flow), GFP_KERNEL);
   160		if (!mc->chanlist)
   161			return -ENOMEM;
   162	
   163		for (i = 0; i < MAXFLOW; i++) {
   164			init_completion(&mc->chanlist[i].complete);
   165	
 > 166			mc->chanlist[i].engine = devm_crypto_engine_alloc_init(mc->dev, true);
   167			if (!mc->chanlist[i].engine) {
   168				dev_err(mc->dev, "Cannot allocate engine\n");
   169				i--;
   170				err = -ENOMEM;
   171				goto error_engine;
   172			}
   173			err = crypto_engine_start(mc->chanlist[i].engine);
   174			if (err) {
   175				dev_err(mc->dev, "Cannot start engine\n");
   176				goto error_engine;
   177			}
   178			mc->chanlist[i].tl = dma_alloc_coherent(mc->dev,
   179								sizeof(struct meson_desc) * MAXDESC,
   180								&mc->chanlist[i].t_phy,
   181								GFP_KERNEL);
   182			if (!mc->chanlist[i].tl) {
   183				err = -ENOMEM;
   184				goto error_engine;
   185			}
   186		}
   187		return 0;
   188	error_engine:
   189		meson_free_chanlist(mc, i);
   190		return err;
   191	}
   192	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
