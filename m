Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2061108
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Sep 2023 01:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695001799; x=1726537799;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yOuOHi6X9B/B+O3RussW/88vQm3wtPBlzjo9XAqaGeU=;
  b=HpPS6QJyM2xCsaC04YfKx7H3ry+IhqbXB5g9RBkYqL9GLp1ipJSYVZnx
   C9TmzgHm6D9o8PJYiw7z0epO0BZZbnBkKjrqIlxaN6E5gPqVWzmHbLN/n
   RJitpsjWqTty3YMO0gThAzRfqxde/TI9vmz+TzjUfq4KKtHPDzGljCFYW
   bG0c+zIn3qJH/mEvCKLvxZz7XvkxrAEwIS4NraCoDmFYLSNYOnRmFppFb
   QjFv6R3B2KP/h+Z4JAwX1A94ndJcIwwRyIlpsc4R/9ZN6PjXm96txp/sb
   RxZp3aSqeeffV1/g8X7iNzGUl5AqR2Eoyn+OimVKuwWBA2pJ1RcM48luB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="359798369"
X-IronPort-AV: E=Sophos;i="6.02,155,1688454000"; 
   d="scan'208";a="359798369"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2023 18:49:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="774961844"
X-IronPort-AV: E=Sophos;i="6.02,155,1688454000"; 
   d="scan'208";a="774961844"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 17 Sep 2023 18:49:57 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qi3Oc-0005cm-2A;
	Mon, 18 Sep 2023 01:49:54 +0000
Date: Mon, 18 Sep 2023 09:48:56 +0800
From: kernel test robot <lkp@intel.com>
To: Sandor Yu <Sandor.yu@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c:332
 dw_hdmi_cec_suspend() warn: inconsistent indenting
Message-ID: <202309180927.E3Hl6TEo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ce9ecca0238b140b88f43859b211c9fdfd8e5b70
commit: db1184e410744a680f92ca21e5acd5ae54510db8 drm: bridge: dw_hdmi: Add cec suspend/resume functions
date:   7 weeks ago
config: csky-randconfig-r071-20230917 (https://download.01.org/0day-ci/archive/20230918/202309180927.E3Hl6TEo-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230918/202309180927.E3Hl6TEo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309180927.E3Hl6TEo-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c:332 dw_hdmi_cec_suspend() warn: inconsistent indenting

vim +332 drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c

   326	
   327	static int __maybe_unused dw_hdmi_cec_suspend(struct device *dev)
   328	{
   329		struct dw_hdmi_cec *cec = dev_get_drvdata(dev);
   330	
   331		/* store interrupt status/mask registers */
 > 332		 cec->regs_polarity = dw_hdmi_read(cec, HDMI_CEC_POLARITY);
   333		 cec->regs_mask = dw_hdmi_read(cec, HDMI_CEC_MASK);
   334		 cec->regs_mute_stat0 = dw_hdmi_read(cec, HDMI_IH_MUTE_CEC_STAT0);
   335	
   336		return 0;
   337	}
   338	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
