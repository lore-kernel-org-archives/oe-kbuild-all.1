Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49A3849C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jul 2023 08:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690361404; x=1721897404;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ZBPfSUOBEEUf5fQdeqovJY+0498evjKGGWBQi7m6ax4=;
  b=QM756toIVOLxZAqCv1NFQNuASdGyFyaYQwtFjlt9q1kMP7may5IVQ6J4
   tH4ymJzes4VNW5G06KqXrq65n+2yhNqmGoD93pzewELaQrY5PBSQ/ele2
   SRhoPUjoHPNcSTy8gosmlQlk+xGByFCstrcR63+w3ORxGZ/NEQQ48DQyW
   91sJAr6IbpcamdicEgInX9xvtoRnkR9aMFYhbOw0tfzGICoSZbPowck0G
   4ux7gjBoBDCnnNSapHxGoV1/6G9UE8WFDF4cbI1G5JOBKAFWjpiUo7EPE
   oU+7gn5v9Ewoc3jd1xicdO4LhjpxpQaiEBS2q7p3Fjq99I1Yq2j3W/nzP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="370632986"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="370632986"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 01:49:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="850389618"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="850389618"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 26 Jul 2023 01:49:47 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOaCU-0000pW-1R;
	Wed, 26 Jul 2023 08:49:09 +0000
Date: Wed, 26 Jul 2023 16:47:21 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] media: mediatek: vcodec: Consider vdecsys presence in
 reg range check
Message-ID: <202307261640.z33a4YO8-lkp@intel.com>
References: <20230725204043.569799-1-nfraprado@collabora.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230725204043.569799-1-nfraprado@collabora.com>

Hi Nícolas,

kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[also build test ERROR on linus/master v6.5-rc3 next-20230726]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/N-colas-F-R-A-Prado/media-mediatek-vcodec-Consider-vdecsys-presence-in-reg-range-check/20230726-044320
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230725204043.569799-1-nfraprado%40collabora.com
patch subject: [PATCH] media: mediatek: vcodec: Consider vdecsys presence in reg range check
config: arm-randconfig-r046-20230726 (https://download.01.org/0day-ci/archive/20230726/202307261640.z33a4YO8-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307261640.z33a4YO8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307261640.z33a4YO8-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c: In function 'mtk_vcodec_get_reg_bases':
>> drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c:90:15: error: 'has_vdecsys_reg' undeclared (first use in this function)
      90 |             (!has_vdecsys_reg && reg_num > NUM_MAX_VDEC_REG_BASE - 1)) {
         |               ^~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c:90:15: note: each undeclared identifier is reported only once for each function it appears in


vim +/has_vdecsys_reg +90 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c

    80	
    81	static int mtk_vcodec_get_reg_bases(struct mtk_vcodec_dev *dev)
    82	{
    83		struct platform_device *pdev = dev->plat_dev;
    84		int reg_num, i;
    85	
    86		/* Sizeof(u32) * 4 bytes for each register base. */
    87		reg_num = of_property_count_elems_of_size(pdev->dev.of_node, "reg",
    88							  sizeof(u32) * 4);
    89		if (reg_num <= 0 || reg_num > NUM_MAX_VDEC_REG_BASE ||
  > 90		    (!has_vdecsys_reg && reg_num > NUM_MAX_VDEC_REG_BASE - 1)) {
    91			dev_err(&pdev->dev, "Invalid register property size: %d\n", reg_num);
    92			return -EINVAL;
    93		}
    94	
    95		for (i = 0; i < reg_num; i++) {
    96			dev->reg_base[i] = devm_platform_ioremap_resource(pdev, i);
    97			if (IS_ERR(dev->reg_base[i]))
    98				return PTR_ERR(dev->reg_base[i]);
    99	
   100			mtk_v4l2_debug(2, "reg[%d] base=%p", i, dev->reg_base[i]);
   101		}
   102	
   103		return 0;
   104	}
   105	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
