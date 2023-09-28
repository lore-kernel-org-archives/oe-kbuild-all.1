Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E4641AB8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Sep 2023 14:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695912903; x=1727448903;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yAZxkex2MVwwRjotH8r3yYzwGZ91xIQB2KDgPznuW8M=;
  b=Y/scBCD+JfQB4nKM/p+rKo3mb77AWFFvFwRvf6+ng9slUOtW1NVix9ZF
   sndksT1JxBQAD76gJ9w8vkCMsiO1hA90YPQqyd3nNEDZsdC27mflYC/TV
   UodRdQmcUqJA7LRB4ZYiZ9ZXXNAhsROZOOKYJ66bezgcGToURjEJ3M4/y
   n7J+05OeenYLFmSNBdfULbbdus8iFMIe257Otd0ar2o1mP6tKcOAr7c8g
   56w4Wu3k/Ag8pOaX5qeCtU4LWOYxwA79z8/FOLisKZXQjQVbw/LmDkt2W
   IRLScUmSg0UTr9XMX6KqDAidZ2rDMiKeXlHM0bfPMyvp5bR8h8ydyLyZp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="446232022"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; 
   d="scan'208";a="446232022"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 07:55:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="873319277"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; 
   d="scan'208";a="873319277"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 28 Sep 2023 07:55:01 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlsPr-0001Zb-0j;
	Thu, 28 Sep 2023 14:54:59 +0000
Date: Thu, 28 Sep 2023 22:54:30 +0800
From: kernel test robot <lkp@intel.com>
To: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v8 3/5] media: add V4L2 vendor specific control handlers
Message-ID: <202309282252.TqzctFjf-lkp@intel.com>
References: <20230925232806.950683-4-yuji2.ishikawa@toshiba.co.jp>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925232806.950683-4-yuji2.ishikawa@toshiba.co.jp>

Hi Yuji,

kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[also build test WARNING on linus/master v6.6-rc3]
[cannot apply to next-20230928]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuji-Ishikawa/dt-bindings-media-platform-visconti-Add-Toshiba-Visconti-Video-Input-Interface/20230926-073703
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230925232806.950683-4-yuji2.ishikawa%40toshiba.co.jp
patch subject: [PATCH v8 3/5] media: add V4L2 vendor specific control handlers
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20230928/202309282252.TqzctFjf-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230928/202309282252.TqzctFjf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309282252.TqzctFjf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/toshiba/visconti/viif_controls.c: In function 'viif_l1_set_dpc':
>> drivers/media/platform/toshiba/visconti/viif_controls.c:598:27: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     598 |                 table_h = (dma_addr_t)viif_dev->tables_dma->dpc_table_h;
         |                           ^
   drivers/media/platform/toshiba/visconti/viif_controls.c:602:27: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     602 |                 table_m = (dma_addr_t)viif_dev->tables_dma->dpc_table_m;
         |                           ^
   drivers/media/platform/toshiba/visconti/viif_controls.c:606:27: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     606 |                 table_l = (dma_addr_t)viif_dev->tables_dma->dpc_table_l;
         |                           ^
   drivers/media/platform/toshiba/visconti/viif_controls.c: In function 'viif_l1_set_lsc':
   drivers/media/platform/toshiba/visconti/viif_controls.c:1308:28: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1308 |                 table_gr = (dma_addr_t)viif_dev->tables_dma->lsc_table_gr;
         |                            ^
   drivers/media/platform/toshiba/visconti/viif_controls.c:1309:27: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1309 |                 table_r = (dma_addr_t)viif_dev->tables_dma->lsc_table_r;
         |                           ^
   drivers/media/platform/toshiba/visconti/viif_controls.c:1310:27: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1310 |                 table_b = (dma_addr_t)viif_dev->tables_dma->lsc_table_b;
         |                           ^
   drivers/media/platform/toshiba/visconti/viif_controls.c:1311:28: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1311 |                 table_gb = (dma_addr_t)viif_dev->tables_dma->lsc_table_gb;
         |                            ^
   drivers/media/platform/toshiba/visconti/viif_controls.c: In function 'viif_l2_set_gamma':
   drivers/media/platform/toshiba/visconti/viif_controls.c:2609:33: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    2609 |                                 (dma_addr_t)viif_dev->tables_dma->l2_gamma_table[pathid][i];
         |                                 ^


vim +598 drivers/media/platform/toshiba/visconti/viif_controls.c

   586	
   587	static int viif_l1_set_dpc(struct viif_device *viif_dev, struct viif_l1_dpc_config *arg)
   588	{
   589		const struct viif_l1_dpc *param_h, *param_m, *param_l;
   590		dma_addr_t table_h = 0;
   591		dma_addr_t table_m = 0;
   592		dma_addr_t table_l = 0;
   593		unsigned long irqflags;
   594		u32 val;
   595	
   596		if (arg->param_h.abpc_sta_en) {
   597			memcpy(viif_dev->tables->dpc_table_h, arg->table_h, VIIF_DPC_TABLE_BYTES);
 > 598			table_h = (dma_addr_t)viif_dev->tables_dma->dpc_table_h;
   599		}
   600		if (arg->param_m.abpc_sta_en) {
   601			memcpy(viif_dev->tables->dpc_table_m, arg->table_m, VIIF_DPC_TABLE_BYTES);
   602			table_m = (dma_addr_t)viif_dev->tables_dma->dpc_table_m;
   603		}
   604		if (arg->param_l.abpc_sta_en) {
   605			memcpy(viif_dev->tables->dpc_table_l, arg->table_l, VIIF_DPC_TABLE_BYTES);
   606			table_l = (dma_addr_t)viif_dev->tables_dma->dpc_table_l;
   607		}
   608	
   609		spin_lock_irqsave(&viif_dev->regbuf_lock, irqflags);
   610		hwd_viif_isp_guard_start(viif_dev);
   611	
   612		dpc_table_transmission(viif_dev, table_h, table_m, table_l);
   613	
   614		param_h = &arg->param_h;
   615		param_m = &arg->param_m;
   616		param_l = &arg->param_l;
   617	
   618		val = (param_h->abpc_sta_en) ? MASK_L1_ABPC_ENABLE_H : 0;
   619		val |= (param_m->abpc_sta_en) ? MASK_L1_ABPC_ENABLE_M : 0;
   620		val |= (param_l->abpc_sta_en) ? MASK_L1_ABPC_ENABLE_L : 0;
   621		viif_capture_write(viif_dev, REG_L1_ABPC012_STA_EN, val);
   622	
   623		val = (param_h->abpc_dyn_en) ? MASK_L1_ABPC_ENABLE_H : 0;
   624		val |= (param_m->abpc_dyn_en) ? MASK_L1_ABPC_ENABLE_M : 0;
   625		val |= (param_l->abpc_dyn_en) ? MASK_L1_ABPC_ENABLE_L : 0;
   626		viif_capture_write(viif_dev, REG_L1_ABPC012_DYN_EN, val);
   627	
   628		val = (param_h->abpc_dyn_mode == VIIF_L1_DPC_2PIXEL) ? MASK_L1_ABPC_DYN_MODE_2PIXEL_H : 0;
   629		val |= (param_m->abpc_dyn_mode == VIIF_L1_DPC_2PIXEL) ? MASK_L1_ABPC_DYN_MODE_2PIXEL_M : 0;
   630		val |= (param_l->abpc_dyn_mode == VIIF_L1_DPC_2PIXEL) ? MASK_L1_ABPC_DYN_MODE_2PIXEL_L : 0;
   631		viif_capture_write(viif_dev, REG_L1_ABPC012_DYN_MODE, val);
   632	
   633		/* setup param_h */
   634		viif_capture_write(viif_dev, REG_L1_ABPC0_RATIO_LIMIT, param_h->abpc_ratio_limit);
   635		viif_capture_write(viif_dev, REG_L1_ABPC0_DARK_LIMIT, param_h->abpc_dark_limit);
   636		viif_capture_write(viif_dev, REG_L1_ABPC0_SN_COEF_W_AG_MIN, param_h->abpc_sn_coef_w_ag_min);
   637		viif_capture_write(viif_dev, REG_L1_ABPC0_SN_COEF_W_AG_MID, param_h->abpc_sn_coef_w_ag_mid);
   638		viif_capture_write(viif_dev, REG_L1_ABPC0_SN_COEF_W_AG_MAX, param_h->abpc_sn_coef_w_ag_max);
   639		viif_capture_write(viif_dev, REG_L1_ABPC0_SN_COEF_B_AG_MIN, param_h->abpc_sn_coef_b_ag_min);
   640		viif_capture_write(viif_dev, REG_L1_ABPC0_SN_COEF_B_AG_MID, param_h->abpc_sn_coef_b_ag_mid);
   641		viif_capture_write(viif_dev, REG_L1_ABPC0_SN_COEF_B_AG_MAX, param_h->abpc_sn_coef_b_ag_max);
   642		viif_capture_write(viif_dev, REG_L1_ABPC0_SN_COEF_W_TH_MIN, param_h->abpc_sn_coef_w_th_min);
   643		viif_capture_write(viif_dev, REG_L1_ABPC0_SN_COEF_W_TH_MAX, param_h->abpc_sn_coef_w_th_max);
   644		viif_capture_write(viif_dev, REG_L1_ABPC0_SN_COEF_B_TH_MIN, param_h->abpc_sn_coef_b_th_min);
   645		viif_capture_write(viif_dev, REG_L1_ABPC0_SN_COEF_B_TH_MAX, param_h->abpc_sn_coef_b_th_max);
   646	
   647		/* setup param_m */
   648		viif_capture_write(viif_dev, REG_L1_ABPC1_RATIO_LIMIT, param_m->abpc_ratio_limit);
   649		viif_capture_write(viif_dev, REG_L1_ABPC1_DARK_LIMIT, param_m->abpc_dark_limit);
   650		viif_capture_write(viif_dev, REG_L1_ABPC1_SN_COEF_W_AG_MIN, param_m->abpc_sn_coef_w_ag_min);
   651		viif_capture_write(viif_dev, REG_L1_ABPC1_SN_COEF_W_AG_MID, param_m->abpc_sn_coef_w_ag_mid);
   652		viif_capture_write(viif_dev, REG_L1_ABPC1_SN_COEF_W_AG_MAX, param_m->abpc_sn_coef_w_ag_max);
   653		viif_capture_write(viif_dev, REG_L1_ABPC1_SN_COEF_B_AG_MIN, param_m->abpc_sn_coef_b_ag_min);
   654		viif_capture_write(viif_dev, REG_L1_ABPC1_SN_COEF_B_AG_MID, param_m->abpc_sn_coef_b_ag_mid);
   655		viif_capture_write(viif_dev, REG_L1_ABPC1_SN_COEF_B_AG_MAX, param_m->abpc_sn_coef_b_ag_max);
   656		viif_capture_write(viif_dev, REG_L1_ABPC1_SN_COEF_W_TH_MIN, param_m->abpc_sn_coef_w_th_min);
   657		viif_capture_write(viif_dev, REG_L1_ABPC1_SN_COEF_W_TH_MAX, param_m->abpc_sn_coef_w_th_max);
   658		viif_capture_write(viif_dev, REG_L1_ABPC1_SN_COEF_B_TH_MIN, param_m->abpc_sn_coef_b_th_min);
   659		viif_capture_write(viif_dev, REG_L1_ABPC1_SN_COEF_B_TH_MAX, param_m->abpc_sn_coef_b_th_max);
   660	
   661		/* setup param_l */
   662		viif_capture_write(viif_dev, REG_L1_ABPC2_RATIO_LIMIT, param_l->abpc_ratio_limit);
   663		viif_capture_write(viif_dev, REG_L1_ABPC2_DARK_LIMIT, param_l->abpc_dark_limit);
   664		viif_capture_write(viif_dev, REG_L1_ABPC2_SN_COEF_W_AG_MIN, param_l->abpc_sn_coef_w_ag_min);
   665		viif_capture_write(viif_dev, REG_L1_ABPC2_SN_COEF_W_AG_MID, param_l->abpc_sn_coef_w_ag_mid);
   666		viif_capture_write(viif_dev, REG_L1_ABPC2_SN_COEF_W_AG_MAX, param_l->abpc_sn_coef_w_ag_max);
   667		viif_capture_write(viif_dev, REG_L1_ABPC2_SN_COEF_B_AG_MIN, param_l->abpc_sn_coef_b_ag_min);
   668		viif_capture_write(viif_dev, REG_L1_ABPC2_SN_COEF_B_AG_MID, param_l->abpc_sn_coef_b_ag_mid);
   669		viif_capture_write(viif_dev, REG_L1_ABPC2_SN_COEF_B_AG_MAX, param_l->abpc_sn_coef_b_ag_max);
   670		viif_capture_write(viif_dev, REG_L1_ABPC2_SN_COEF_W_TH_MIN, param_l->abpc_sn_coef_w_th_min);
   671		viif_capture_write(viif_dev, REG_L1_ABPC2_SN_COEF_W_TH_MAX, param_l->abpc_sn_coef_w_th_max);
   672		viif_capture_write(viif_dev, REG_L1_ABPC2_SN_COEF_B_TH_MIN, param_l->abpc_sn_coef_b_th_min);
   673		viif_capture_write(viif_dev, REG_L1_ABPC2_SN_COEF_B_TH_MAX, param_l->abpc_sn_coef_b_th_max);
   674	
   675		hwd_viif_isp_guard_end(viif_dev);
   676		spin_unlock_irqrestore(&viif_dev->regbuf_lock, irqflags);
   677	
   678		return 0;
   679	}
   680	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
