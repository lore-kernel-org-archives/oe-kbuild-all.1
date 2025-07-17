Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB341F582C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Jul 2025 05:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752729393; cv=none; b=UsPd7PfBg9cgNean3XrTUpeQoZfzY0cQQFHvWkLWrV/c3hlP0ujBaxaQhc1X4g+jHAwg8YKxhm85+PPV6xInRdxOSA+cuD/p6Fbq5pJFUPVx6W2BQOK4vuKlzIFJF3FYvv+PyWTWvk0f9UQ3VCX4OlrfX7RttV+TdEsfrYCSCdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752729393; c=relaxed/simple;
	bh=Lv7U8dJEOwHVATq46bvmtfFh8J3c2guGmNeJbxSnI40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IL8xe9xHI/0hGIzEpkX2zYOoPCmeoaLdXsYyVB3uGAn/b3eXUvT5G5lNVtvrHFuWzydwxWmPCIeqX8j9V5aeIWW2/nbint3T48tVvXdSX5AJ3gzXM6TUtI3/YQ6vvFAjL94xQQu8ypN4hNNIygzt/DsVx6K6U3KRHMkW2X0JIlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iByD1L2y; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iByD1L2y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752729392; x=1784265392;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Lv7U8dJEOwHVATq46bvmtfFh8J3c2guGmNeJbxSnI40=;
  b=iByD1L2yANbi9R3RfDfmrEKAeskVcpLKf0z9BA7xXaB03sPGevcgjClX
   HFDp/n7AseyfFc3omo7sH1coJecl8Q/2mOPFcOXSFK70z3WckDs86yRbj
   nBQUNxe9O3y65f/CBNFY39wGmzxSlQgA8ClNxKELRQJcigaKJC9hly6Nh
   FIWJGQX4MhKi0uirHZwstDaJmBdRbbybnlzgEMvDNhu+VBL2ha7VRWT6a
   ksmvcXWuZOLlu+jQSz72EQbSePQ0a93qWrUSd2B/dR7Hxn5pYm0XLQAaW
   sUqMuc7zn1igpHzmcyG7bNKeq5c73Kd5Iz7JtXbdn4iHB4isMtgb5d/3y
   g==;
X-CSE-ConnectionGUID: fuSGX66QSSm/pFh+2dAk+Q==
X-CSE-MsgGUID: SGiXs18ZRhue+nIyni5+0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="65558155"
X-IronPort-AV: E=Sophos;i="6.16,317,1744095600"; 
   d="scan'208";a="65558155"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 22:16:30 -0700
X-CSE-ConnectionGUID: cEF91deRRVyaIRX8O+/L8g==
X-CSE-MsgGUID: Qmubu0ZqR+CL04dr+z7KAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,317,1744095600"; 
   d="scan'208";a="161986912"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 16 Jul 2025 22:16:26 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucGyl-000DAb-2o;
	Thu, 17 Jul 2025 05:16:23 +0000
Date: Thu, 17 Jul 2025 13:16:06 +0800
From: kernel test robot <lkp@intel.com>
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
	martin.petersen@oracle.com
Cc: oe-kbuild-all@lists.linux.dev, wsd_upstream@mediatek.com,
	linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
	chun-hung.wu@mediatek.com, alice.chao@mediatek.com,
	cc.chou@mediatek.com, chaotian.jing@mediatek.com,
	jiajie.hao@mediatek.com, yi-fan.peng@mediatek.com,
	qilin.tan@mediatek.com, lin.gui@mediatek.com,
	tun-yu.yu@mediatek.com, eddie.huang@mediatek.com,
	naomi.chu@mediatek.com, ed.tsai@mediatek.com
Subject: Re: [PATCH v1 08/10] ufs: host: mediatek: Add clock scaling query
 function
Message-ID: <202507171210.1ZvrCG7u-lkp@intel.com>
References: <20250716062830.3712487-9-peter.wang@mediatek.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716062830.3712487-9-peter.wang@mediatek.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jejb-scsi/for-next]
[also build test WARNING on mkp-scsi/for-next linus/master v6.16-rc6 next-20250716]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/peter-wang-mediatek-com/ufs-host-mediatek-Change-return-type-to-bool/20250716-184239
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git for-next
patch link:    https://lore.kernel.org/r/20250716062830.3712487-9-peter.wang%40mediatek.com
patch subject: [PATCH v1 08/10] ufs: host: mediatek: Add clock scaling query function
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250717/202507171210.1ZvrCG7u-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250717/202507171210.1ZvrCG7u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507171210.1ZvrCG7u-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ufs/host/ufs-mediatek.c: In function 'ufs_mtk_init_clocks':
>> drivers/ufs/host/ufs-mediatek.c:941:29: warning: unused variable 'mclk' [-Wunused-variable]
     941 |         struct ufs_mtk_clk *mclk = &host->mclk;
         |                             ^~~~


vim +/mclk +941 drivers/ufs/host/ufs-mediatek.c

2c89e41326b16e drivers/scsi/ufs/ufs-mediatek.c Stanley Chu 2021-05-31  931  
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  932  /**
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  933   * ufs_mtk_init_clocks - Init mtk driver private clocks
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  934   *
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  935   * @hba: per adapter instance
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  936   */
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  937  static void ufs_mtk_init_clocks(struct ufs_hba *hba)
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  938  {
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  939  	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  940  	struct list_head *head = &hba->clk_list_head;
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03 @941  	struct ufs_mtk_clk *mclk = &host->mclk;
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  942  	struct ufs_clk_info *clki, *clki_tmp;
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  943  
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  944  	/*
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  945  	 * Find private clocks and store them in struct ufs_mtk_clk.
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  946  	 * Remove "ufs_sel_min_src" and "ufs_sel_min_src" from list to avoid
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  947  	 * being switched on/off in clock gating.
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  948  	 */
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  949  	list_for_each_entry_safe(clki, clki_tmp, head, list) {
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  950  		if (!strcmp(clki->name, "ufs_sel")) {
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  951  			host->mclk.ufs_sel_clki = clki;
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  952  		} else if (!strcmp(clki->name, "ufs_sel_max_src")) {
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  953  			host->mclk.ufs_sel_max_clki = clki;
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  954  			clk_disable_unprepare(clki->clk);
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  955  			list_del(&clki->list);
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  956  		} else if (!strcmp(clki->name, "ufs_sel_min_src")) {
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  957  			host->mclk.ufs_sel_min_clki = clki;
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  958  			clk_disable_unprepare(clki->clk);
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  959  			list_del(&clki->list);
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  960  		}
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  961  	}
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  962  
37e94f8b8c2c07 drivers/ufs/host/ufs-mediatek.c Peter Wang  2025-07-16  963  	if (!ufs_mtk_is_clk_scale_ready(hba)) {
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  964  		hba->caps &= ~UFSHCD_CAP_CLK_SCALING;
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  965  		dev_info(hba->dev,
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  966  			 "%s: Clk-scaling not ready. Feature disabled.",
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  967  			 __func__);
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  968  	}
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  969  }
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  970  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
