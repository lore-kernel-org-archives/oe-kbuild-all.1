Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5806D1B94D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Mar 2024 14:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709823006; cv=none; b=cjbzNEOaricTODIzSgewMnvdN3p0lYQU0yxRq93PQvSawGZK06wgrPIphTxrkkqgdbZIOqMpiAjaWxmlhS9Fi/5uBv25ziAQ2yexP9xguP5RrMsFK2U6siPlfPZegGT+QvgdWlJ9YgLo6vlbR7pNY6yyJm2amj3U/CQrBwI2O8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709823006; c=relaxed/simple;
	bh=SQOHQ46R7d55UQ+DyCiL5tHPDLIBckoTvfoIBcBTQ3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o3Bb5klQpBIFF+UaBil5FH1IUOBrqc9OUjFVfHFUEcxEuQJSoCegzpaj1nfxAZu4t88RMSosiA5PIWtTnRjFm82nzfAKuS74qbUnc/gdoS5xIKlEVNFQviCFuRGT+uoKUxIFOd4r5TsxDdKqSJm8EHURoqLPKAsMlf3kX6okLEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gXJRq64U; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gXJRq64U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709823003; x=1741359003;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SQOHQ46R7d55UQ+DyCiL5tHPDLIBckoTvfoIBcBTQ3Q=;
  b=gXJRq64UlZUC5ZRRobcK8q5n3/f9Pzp0DUW2Zj3i9XxqixqJKzj2GiDt
   GMh4+Q/VL5cwAyY3IC/Xi728I9i4fTz9UzxYwQID18Kvl/+hr24QGuXB/
   jWkB2vEGR6xwr6PTlfjZHY/DGBcYhAM5jse6qRnygk1cEOXSFo6esREU0
   hAyJGr06gFapbdUTYlZ7fwkRR7RfC2aBU6+vJ02E565W+HmlRKfy2cTB+
   nBLJgS695qczC5bFBaZckY0Kz9pxfulCJoTW/EWxCWcfO8lCuMDxph5/F
   Ezk9jAa4Hnbfb8+yTyU6Tnha/GN/RH/fKmiJfDmSixVqh8AmmvrqSPzuD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4664610"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="4664610"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 06:50:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="10693161"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 Mar 2024 06:50:01 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riF4I-0005HN-28;
	Thu, 07 Mar 2024 14:49:58 +0000
Date: Thu, 7 Mar 2024 22:49:49 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [pinchartl:rpi/v6.8/isp/v2 1/22]
 drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c:476:55: sparse:
 sparse: Using plain integer as NULL pointer
Message-ID: <202403072206.EwsgoA5Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git rpi/v6.8/isp/v2
head:   429a9c05cc5a81e4f62c163c2e8bbdc600cf6b91
commit: 364969482811f5f21a5c14a8213c5297b027da5e [1/22] staging: vc04_services: Add new vc-sm-cma driver
config: alpha-randconfig-r132-20240305 (https://download.01.org/0day-ci/archive/20240307/202403072206.EwsgoA5Q-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240307/202403072206.EwsgoA5Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403072206.EwsgoA5Q-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c:476:55: sparse: sparse: Using plain integer as NULL pointer
   drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c:505:59: sparse: sparse: Using plain integer as NULL pointer
   drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

vim +476 drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c

   471	
   472	int vc_sm_cma_vchi_free(struct sm_instance *handle, struct vc_sm_free_t *msg,
   473				u32 *cur_trans_id)
   474	{
   475		return vc_sm_cma_vchi_send_msg(handle, VC_SM_MSG_TYPE_FREE,
 > 476					   msg, sizeof(*msg), 0, 0, cur_trans_id, 0);
   477	}
   478	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
