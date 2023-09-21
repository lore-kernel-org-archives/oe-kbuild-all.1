Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C902032D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 23:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695339618; x=1726875618;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KGNLZVgjnx5KVKQqKUlX+jOWwdVBwEq2V+ro2XyTICI=;
  b=Tk3ZMOFGNnNoZl+DeB4Thyv3zttw/tQzZNSCSgkTpsEn6bznMheeF4XP
   xeQFkhLyBcEozETpf19RR+eRegTBCqR+xh1wmp/lMcbknB+zWpZq5r7pB
   O1V22/dV9WqF8KNIpf6+2Qf66N7SEGc20XNScBxAWkZUgfBRCN9LrzD+i
   7gzW+Teo9C/hT8xzVGfmA9fkLxxK9dm6eUyx4T8SKZ59Wf3m5bJVD6ubs
   a2nL6ikFCrheQER5lksaj1N+6ddxfM3aEs5Ywjg3xkrzD9//yOZTDp2yM
   CPGlu29Tbm1oDcfro1oTBm2SAKwDi8/i5qg8zZNMCHllpQkNQ/obXtNp6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="384536165"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; 
   d="scan'208";a="384536165"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 16:40:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="920936837"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; 
   d="scan'208";a="920936837"
Received: from lkp-server02.sh.intel.com (HELO b77866e22201) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 21 Sep 2023 16:40:16 -0700
Received: from kbuild by b77866e22201 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjTHK-0000YN-2S;
	Thu, 21 Sep 2023 23:40:14 +0000
Date: Fri, 22 Sep 2023 07:40:14 +0800
From: kernel test robot <lkp@intel.com>
To: Sandor Yu <Sandor.yu@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c:332
 dw_hdmi_cec_suspend() warn: inconsistent indenting
Message-ID: <202309220730.BHfIyHe1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   27bbf45eae9ca98877a2d52a92a188147cd61b07
commit: db1184e410744a680f92ca21e5acd5ae54510db8 drm: bridge: dw_hdmi: Add cec suspend/resume functions
date:   7 weeks ago
config: csky-randconfig-r071-20230917 (https://download.01.org/0day-ci/archive/20230922/202309220730.BHfIyHe1-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230922/202309220730.BHfIyHe1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309220730.BHfIyHe1-lkp@intel.com/

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
