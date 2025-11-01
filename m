Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731B12405E7
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Nov 2025 06:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761978873; cv=none; b=sUPGNAIUe+WxOEKW9PFlsU9ZcdmkhoFvkX4LSGtpBBaTj/MWNAEugsGWvXneRfnQYhnlPlf40yFJESIGQxi/rvCjIKR/M+BmOCEQwAK2xW5sMbHekHGbL8WKvdsG/f7gpE76s+d9fHgaY12Uqgceu3JJVrXGIEqqQb/3FJl17fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761978873; c=relaxed/simple;
	bh=svHrHLDDhTnGKlEJaxJBVr2ClX4h1Mz3MZ8oZRBL50U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CwXLrempom2u35fBbUqZUzhV/2sKt/4Fq5DLOb4na+lsCtqs+lcfLTrmfKxCeCaL84PVZMjGJidusuiunvQCEcMnQ1aCSvxaI5y6eRIKQAF6r5smP330NN4REiBua/aWyItSrEyz/BWdwIa2iPTe3v+0AOD9bNrxwNGXrFeOMNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gg2vD9Il; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gg2vD9Il"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761978871; x=1793514871;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=svHrHLDDhTnGKlEJaxJBVr2ClX4h1Mz3MZ8oZRBL50U=;
  b=Gg2vD9Il7ic6Um3Ho6/vtM44ogNcLyYqdA7ZKqAaY5OKTPqhCVntDw1Q
   cIgzBUncXbMkzJl5pLpQ836bg1QV/qCHxis4tqmYV0qhbacAekdHC6TXj
   fH4o5hdsCh7/APCP2/hqRTOU8Tg7exQKgERiDSziYWS7jqph1U5Vjdvx6
   +4Mj2gEk5m63czuoAzBcjbKkTorjY9juABh2L4lUC4HZyrhsWSNjo+aSo
   PRpQLHfTretjhQLBdhY/ZuCm41Qpvw1DZ7khLejy+4bcx2b58Sa4kFAdq
   wEesymk+f1Z7Dk3/vUqDjuBFsrhh3WSQl/eOq+nPqIMKM7mRHUygfHCqy
   w==;
X-CSE-ConnectionGUID: OSVWf1mGRFuDZSKqgHtopQ==
X-CSE-MsgGUID: TSsNFaw6RsmDmaeCalFvsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="74429270"
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="74429270"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 23:34:31 -0700
X-CSE-ConnectionGUID: TOVc8IFERiOx9yzGOalz9w==
X-CSE-MsgGUID: bHthRj8XTdGc0S/Gcn+6Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="185632982"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 31 Oct 2025 23:34:26 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vF5Bw-000Nxw-1a;
	Sat, 01 Nov 2025 06:34:24 +0000
Date: Sat, 1 Nov 2025 14:33:29 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	sboyd@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, mturquette@baylibre.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, laura.nao@collabora.com,
	nfraprado@collabora.com, wenst@chromium.org,
	y.oudjana@protonmail.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 7/7] clk: mediatek: Add support for MT6685 PM/Clock IC
 Clock Controller
Message-ID: <202511011423.LH8doBcv-lkp@intel.com>
References: <20251027111343.21723-8-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027111343.21723-8-angelogioacchino.delregno@collabora.com>

Hi AngeloGioacchino,

kernel test robot noticed the following build errors:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on linus/master v6.18-rc3 next-20251031]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/clk-mediatek-Split-out-registration-from-mtk_clk_register_gates/20251027-191633
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20251027111343.21723-8-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v2 7/7] clk: mediatek: Add support for MT6685 PM/Clock IC Clock Controller
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20251101/202511011423.LH8doBcv-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511011423.LH8doBcv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511011423.LH8doBcv-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/clk/mediatek/clk-mtk-spmi.c: In function 'mtk_spmi_clk_simple_probe':
>> drivers/clk/mediatek/clk-mtk-spmi.c:48:20: error: implicit declaration of function 'devm_spmi_subdevice_alloc_and_add' [-Wimplicit-function-declaration]
      48 |         sub_sdev = devm_spmi_subdevice_alloc_and_add(&pdev->dev, sparent);
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/clk/mediatek/clk-mtk-spmi.c:48:18: error: assignment to 'struct spmi_subdevice *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      48 |         sub_sdev = devm_spmi_subdevice_alloc_and_add(&pdev->dev, sparent);
         |                  ^
   In file included from drivers/clk/mediatek/clk-mtk-spmi.c:16:
>> drivers/clk/mediatek/clk-mtk-spmi.c:52:53: error: invalid use of undefined type 'struct spmi_subdevice'
      52 |         regmap = devm_regmap_init_spmi_ext(&sub_sdev->sdev, &mtk_spmi_clk_regmap_config);
         |                                                     ^~
   include/linux/regmap.h:775:20: note: in definition of macro '__regmap_lockdep_wrapper'
     775 |                 fn(__VA_ARGS__, &_key,                                  \
         |                    ^~~~~~~~~~~
   drivers/clk/mediatek/clk-mtk-spmi.c:52:18: note: in expansion of macro 'devm_regmap_init_spmi_ext'
      52 |         regmap = devm_regmap_init_spmi_ext(&sub_sdev->sdev, &mtk_spmi_clk_regmap_config);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/devm_spmi_subdevice_alloc_and_add +48 drivers/clk/mediatek/clk-mtk-spmi.c

80a000281742dc AngeloGioacchino Del Regno 2025-10-27  21  
80a000281742dc AngeloGioacchino Del Regno 2025-10-27  22  int mtk_spmi_clk_simple_probe(struct platform_device *pdev)
80a000281742dc AngeloGioacchino Del Regno 2025-10-27  23  {
80a000281742dc AngeloGioacchino Del Regno 2025-10-27  24  	struct regmap_config mtk_spmi_clk_regmap_config = {
80a000281742dc AngeloGioacchino Del Regno 2025-10-27  25  		.reg_bits = 16,
80a000281742dc AngeloGioacchino Del Regno 2025-10-27  26  		.val_bits = 8,
80a000281742dc AngeloGioacchino Del Regno 2025-10-27  27  		.fast_io = true
80a000281742dc AngeloGioacchino Del Regno 2025-10-27  28  	};
80a000281742dc AngeloGioacchino Del Regno 2025-10-27  29  	struct device_node *node = pdev->dev.of_node;
80a000281742dc AngeloGioacchino Del Regno 2025-10-27  30  	const struct mtk_spmi_clk_desc *mscd;
80a000281742dc AngeloGioacchino Del Regno 2025-10-27  31  	struct spmi_subdevice *sub_sdev;
80a000281742dc AngeloGioacchino Del Regno 2025-10-27  32  	struct spmi_device *sparent;
80a000281742dc AngeloGioacchino Del Regno 2025-10-27  33  	struct regmap *regmap;
80a000281742dc AngeloGioacchino Del Regno 2025-10-27  34  	int ret;
80a000281742dc AngeloGioacchino Del Regno 2025-10-27  35  
80a000281742dc AngeloGioacchino Del Regno 2025-10-27  36  	ret = of_property_read_u32(node, "reg", &mtk_spmi_clk_regmap_config.reg_base);
80a000281742dc AngeloGioacchino Del Regno 2025-10-27  37  	if (ret)
80a000281742dc AngeloGioacchino Del Regno 2025-10-27  38  		return ret;
80a000281742dc AngeloGioacchino Del Regno 2025-10-27  39  
80a000281742dc AngeloGioacchino Del Regno 2025-10-27  40  	/* If the max_register was not declared the pdata is not valid */
80a000281742dc AngeloGioacchino Del Regno 2025-10-27  41  	mscd = device_get_match_data(&pdev->dev);
80a000281742dc AngeloGioacchino Del Regno 2025-10-27  42  	if (mscd->max_register == 0)
80a000281742dc AngeloGioacchino Del Regno 2025-10-27  43  		return -EINVAL;
80a000281742dc AngeloGioacchino Del Regno 2025-10-27  44  
80a000281742dc AngeloGioacchino Del Regno 2025-10-27  45  	mtk_spmi_clk_regmap_config.max_register = mscd->max_register;
80a000281742dc AngeloGioacchino Del Regno 2025-10-27  46  
80a000281742dc AngeloGioacchino Del Regno 2025-10-27  47  	sparent = to_spmi_device(pdev->dev.parent);
80a000281742dc AngeloGioacchino Del Regno 2025-10-27 @48  	sub_sdev = devm_spmi_subdevice_alloc_and_add(&pdev->dev, sparent);
80a000281742dc AngeloGioacchino Del Regno 2025-10-27  49  	if (IS_ERR(sub_sdev))
80a000281742dc AngeloGioacchino Del Regno 2025-10-27  50  		return PTR_ERR(sub_sdev);
80a000281742dc AngeloGioacchino Del Regno 2025-10-27  51  
80a000281742dc AngeloGioacchino Del Regno 2025-10-27 @52  	regmap = devm_regmap_init_spmi_ext(&sub_sdev->sdev, &mtk_spmi_clk_regmap_config);
80a000281742dc AngeloGioacchino Del Regno 2025-10-27  53  	if (IS_ERR(regmap))
80a000281742dc AngeloGioacchino Del Regno 2025-10-27  54  		return PTR_ERR(regmap);
80a000281742dc AngeloGioacchino Del Regno 2025-10-27  55  
80a000281742dc AngeloGioacchino Del Regno 2025-10-27  56  	return mtk_clk_simple_probe_internal(pdev, node, mscd->desc, regmap);
80a000281742dc AngeloGioacchino Del Regno 2025-10-27  57  }
80a000281742dc AngeloGioacchino Del Regno 2025-10-27  58  EXPORT_SYMBOL_GPL(mtk_spmi_clk_simple_probe);
80a000281742dc AngeloGioacchino Del Regno 2025-10-27  59  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
