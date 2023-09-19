Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4709F3B7AA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 15:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695137428; x=1726673428;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oWeXSQPtUiPUqGfjOQckVWGeyHasO/de5g3+UoWk7rg=;
  b=HajNqDl+yNk6eULDN5j8vgcOWpAqgFPXZ0qo8E3nRPkRFocBBwat0QQ8
   4PzrXO8JZ6+WxfI8gX9n/gcubZxK9d/DaAoKx+cpY+7aQCuEJOF/c8Xrx
   +Jk/nUFLsuiOI6jIJv0U7JzC4UJuGsCwvV36OHuYbZUqsX1dXiPh7Yq6U
   Kk5PIsSo7OsRv2jy4+/JOsD2JWSxa+JlCqoJZfdcEOT2o7zB4ubi/tTbP
   C4oR1dapuWVfk/dUQ7CIVekF2mfgW8fYg4ko+1TrIjCMIOYCjmKCH4skW
   MJjGPT17woDiUOXcH3OeZB87oxknY//xVIEVR+c87293GpsNO7THIjlFd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="370286854"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="370286854"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 08:30:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="739759900"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="739759900"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 19 Sep 2023 08:30:24 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qicg9-0007YA-0S;
	Tue, 19 Sep 2023 15:30:21 +0000
Date: Tue, 19 Sep 2023 23:29:22 +0800
From: kernel test robot <lkp@intel.com>
To: Rohit Athavale <rohit.athavale@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>, Hyun Kwon <hyun.kwon@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 333/1363]
 drivers/media/platform/xilinx/xilinx-vpss-csc.c:660:17: warning:
 'xcsc_correct_coeff' accessing 48 bytes in a region of size 16
Message-ID: <202309192343.ltuBatmX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   4f412ed20fd2c5353c1e878ef9ed77952a5040a1
commit: 9626b289ddbc935c133304a957c2ac1ce43f98f5 [333/1363] v4l: xilinx-vpss-csc: driver support for xilinx vpss csc
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230919/202309192343.ltuBatmX-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230919/202309192343.ltuBatmX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309192343.ltuBatmX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In function 'xcsc_set_red_gain',
       inlined from 'xcsc_s_stream' at drivers/media/platform/xilinx/xilinx-vpss-csc.c:759:2:
>> drivers/media/platform/xilinx/xilinx-vpss-csc.c:660:17: warning: 'xcsc_correct_coeff' accessing 48 bytes in a region of size 16 [-Wstringop-overflow=]
     660 |                 xcsc_correct_coeff(xcsc, xcsc->shadow_coeff);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/xilinx/xilinx-vpss-csc.c:660:17: note: referencing argument 2 of type 's32[3][4]' {aka 'int[3][4]'}
   drivers/media/platform/xilinx/xilinx-vpss-csc.c: In function 'xcsc_s_stream':
   drivers/media/platform/xilinx/xilinx-vpss-csc.c:552:1: note: in a call to function 'xcsc_correct_coeff'
     552 | xcsc_correct_coeff(struct xcsc_dev *xcsc,
         | ^~~~~~~~~~~~~~~~~~


vim +/xcsc_correct_coeff +660 drivers/media/platform/xilinx/xilinx-vpss-csc.c

   641	
   642	static void xcsc_set_red_gain(struct xcsc_dev *xcsc)
   643	{
   644		dev_dbg(xcsc->xvip.dev,
   645			"%s: Red Gain %d Red Gain Active %d", __func__,
   646			(xcsc->red_gain - 20) / 2,
   647			(xcsc->red_gain_active - 20) / 2);
   648	
   649		if (xcsc->red_gain != xcsc->red_gain_active) {
   650			xcsc->shadow_coeff[0][0] = (xcsc->shadow_coeff[0][0] *
   651						    xcsc->red_gain) /
   652						    xcsc->red_gain_active;
   653			xcsc->shadow_coeff[0][1] = (xcsc->shadow_coeff[0][1] *
   654						    xcsc->red_gain) /
   655						    xcsc->red_gain_active;
   656			xcsc->shadow_coeff[0][2] = (xcsc->shadow_coeff[0][2] *
   657						    xcsc->red_gain) /
   658						    xcsc->red_gain_active;
   659			xcsc->red_gain_active = xcsc->red_gain;
 > 660			xcsc_correct_coeff(xcsc, xcsc->shadow_coeff);
   661			xcsc_write_coeff(xcsc);
   662		}
   663	#ifdef DEBUG
   664		xcsc_print_k_hw(xcsc);
   665		xcsc_print_coeff(xcsc);
   666	#endif
   667	}
   668	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
