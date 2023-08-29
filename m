Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83264EC9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Aug 2023 05:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693285258; x=1724821258;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nYqvRCEfGF1L0QWOK0YZqnE2B/xasCUH9RVmro0SXfc=;
  b=HiiVKbTIYHua7wH/FegBPA4aUbT/yzkeRPCXtS0L3xP4v8V0LwKipJ1C
   gxIOAz9fSg4WzWGzxh8EMrHs/pSAliVl2ADBh3ZCAjUXmReOPl2HoMdvy
   x98tq7fqnZkA8YR6slnof59GA09+JoiZmMMJeflg01KcrHeHhde+TBhYL
   mSm+tDcbqXQhDnKscGu9ELjHTWU61P+ENUHGx812X7TBzArewh0pcLaYS
   nna2jBrmRjPOi20pO/sEWPaydXCdwLv6Y2Bo37/qRI04tY/gZs+Zu9E0B
   tqzJeQwrHIPRNVoq1JPYL7Ja1FJH17QeGA9cFtDgj2aXRS7mxu8Q/9mnp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="372691737"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="372691737"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 22:00:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="773533550"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="773533550"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 28 Aug 2023 22:00:54 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaqqT-0008PH-26;
	Tue, 29 Aug 2023 05:00:53 +0000
Date: Tue, 29 Aug 2023 13:00:35 +0800
From: kernel test robot <lkp@intel.com>
To: Naushir Patuck <naush@raspberrypi.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [pinchartl:rpi/v6.5/isp/v2 21/23] htmldocs:
 ./include/uapi/linux/bcm2835-isp.h:146: warning: Function parameter or
 member 'padding' not described in 'bcm2835_isp_black_level'
Message-ID: <202308291211.kJYIPEDZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git rpi/v6.5/isp/v2
head:   f21e9808068119a1ea8f1ddb5677c982b79ac10d
commit: f53111061a1c4624e8c08104ced1b968eeb173f5 [21/23] docs: admin-guide: media: bcm2835-isp: Add documentation for bcm2835-isp
reproduce: (https://download.01.org/0day-ci/archive/20230829/202308291211.kJYIPEDZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308291211.kJYIPEDZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./include/uapi/linux/bcm2835-isp.h:146: warning: Function parameter or member 'padding' not described in 'bcm2835_isp_black_level'
>> ./include/uapi/linux/bcm2835-isp.h:178: warning: Function parameter or member 'x' not described in 'bcm2835_isp_gamma'
>> ./include/uapi/linux/bcm2835-isp.h:178: warning: Function parameter or member 'y' not described in 'bcm2835_isp_gamma'
>> Documentation/userspace-api/media/drivers/index.rst:30: WARNING: toctree contains reference to nonexisting document 'userspace-api/media/drivers/bcm2835-isp'
>> Documentation/admin-guide/media/bcm2835-isp.rst: WARNING: document isn't included in any toctree
>> Documentation/admin-guide/media/bcm2835-isp.rst:76: WARNING: undefined label: v4l2-meta-fmt-bcm2835-isp-stats (if the link has no caption the label must precede a section header)

vim +146 ./include/uapi/linux/bcm2835-isp.h

2374cc3ebbe4f56 Dave Stevenson 2020-10-12  130  
2374cc3ebbe4f56 Dave Stevenson 2020-10-12  131  /**
2374cc3ebbe4f56 Dave Stevenson 2020-10-12  132   * struct bcm2835_isp_black_level - Sensor black level set with the
2374cc3ebbe4f56 Dave Stevenson 2020-10-12  133   *				    V4L2_CID_USER_BCM2835_ISP_BLACK_LEVEL ctrl.
2374cc3ebbe4f56 Dave Stevenson 2020-10-12  134   *
2374cc3ebbe4f56 Dave Stevenson 2020-10-12  135   * @enabled:		Enable black level.
2374cc3ebbe4f56 Dave Stevenson 2020-10-12  136   * @black_level_r:	Black level for red channel.
2374cc3ebbe4f56 Dave Stevenson 2020-10-12  137   * @black_level_g:	Black level for green channels.
2374cc3ebbe4f56 Dave Stevenson 2020-10-12  138   * @black_level_b:	Black level for blue channel.
2374cc3ebbe4f56 Dave Stevenson 2020-10-12  139   */
2374cc3ebbe4f56 Dave Stevenson 2020-10-12  140  struct bcm2835_isp_black_level {
2374cc3ebbe4f56 Dave Stevenson 2020-10-12  141  	__u32 enabled;
2374cc3ebbe4f56 Dave Stevenson 2020-10-12  142  	__u16 black_level_r;
2374cc3ebbe4f56 Dave Stevenson 2020-10-12  143  	__u16 black_level_g;
2374cc3ebbe4f56 Dave Stevenson 2020-10-12  144  	__u16 black_level_b;
2374cc3ebbe4f56 Dave Stevenson 2020-10-12  145  	__u8 padding[2]; /* Unused */
2374cc3ebbe4f56 Dave Stevenson 2020-10-12 @146  };
2374cc3ebbe4f56 Dave Stevenson 2020-10-12  147  
2374cc3ebbe4f56 Dave Stevenson 2020-10-12  148  /**
2374cc3ebbe4f56 Dave Stevenson 2020-10-12  149   * struct bcm2835_isp_geq - Green equalisation parameters set with the
2374cc3ebbe4f56 Dave Stevenson 2020-10-12  150   *			    V4L2_CID_USER_BCM2835_ISP_GEQ ctrl.
2374cc3ebbe4f56 Dave Stevenson 2020-10-12  151   *
2374cc3ebbe4f56 Dave Stevenson 2020-10-12  152   * @enabled:	Enable green equalisation.
2374cc3ebbe4f56 Dave Stevenson 2020-10-12  153   * @offset:	Fixed offset of the green equalisation threshold.
2374cc3ebbe4f56 Dave Stevenson 2020-10-12  154   * @slope:	Slope of the green equalisation threshold.
2374cc3ebbe4f56 Dave Stevenson 2020-10-12  155   */
2374cc3ebbe4f56 Dave Stevenson 2020-10-12  156  struct bcm2835_isp_geq {
2374cc3ebbe4f56 Dave Stevenson 2020-10-12  157  	__u32 enabled;
2374cc3ebbe4f56 Dave Stevenson 2020-10-12  158  	__u32 offset;
2374cc3ebbe4f56 Dave Stevenson 2020-10-12  159  	struct bcm2835_isp_rational slope;
2374cc3ebbe4f56 Dave Stevenson 2020-10-12  160  };
2374cc3ebbe4f56 Dave Stevenson 2020-10-12  161  
2374cc3ebbe4f56 Dave Stevenson 2020-10-12  162  #define BCM2835_NUM_GAMMA_PTS 33
2374cc3ebbe4f56 Dave Stevenson 2020-10-12  163  
2374cc3ebbe4f56 Dave Stevenson 2020-10-12  164  /**
2374cc3ebbe4f56 Dave Stevenson 2020-10-12  165   * struct bcm2835_isp_gamma - Gamma parameters set with the
2374cc3ebbe4f56 Dave Stevenson 2020-10-12  166   *			      V4L2_CID_USER_BCM2835_ISP_GAMMA ctrl.
2374cc3ebbe4f56 Dave Stevenson 2020-10-12  167   *
2374cc3ebbe4f56 Dave Stevenson 2020-10-12  168   * @enabled:	Enable gamma adjustment.
2374cc3ebbe4f56 Dave Stevenson 2020-10-12  169   * @X:		X values of the points defining the gamma curve.
2374cc3ebbe4f56 Dave Stevenson 2020-10-12  170   *		Values should be scaled to 16 bits.
2374cc3ebbe4f56 Dave Stevenson 2020-10-12  171   * @Y:		Y values of the points defining the gamma curve.
2374cc3ebbe4f56 Dave Stevenson 2020-10-12  172   *		Values should be scaled to 16 bits.
2374cc3ebbe4f56 Dave Stevenson 2020-10-12  173   */
2374cc3ebbe4f56 Dave Stevenson 2020-10-12  174  struct bcm2835_isp_gamma {
2374cc3ebbe4f56 Dave Stevenson 2020-10-12  175  	__u32 enabled;
2374cc3ebbe4f56 Dave Stevenson 2020-10-12  176  	__u16 x[BCM2835_NUM_GAMMA_PTS];
2374cc3ebbe4f56 Dave Stevenson 2020-10-12  177  	__u16 y[BCM2835_NUM_GAMMA_PTS];
2374cc3ebbe4f56 Dave Stevenson 2020-10-12 @178  };
2374cc3ebbe4f56 Dave Stevenson 2020-10-12  179  

:::::: The code at line 146 was first introduced by commit
:::::: 2374cc3ebbe4f56da5cdd08fad8e87f568521505 uapi: bcm2835-isp: Add bcm2835-isp uapi header file

:::::: TO: Dave Stevenson <dave.stevenson@raspberrypi.com>
:::::: CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
