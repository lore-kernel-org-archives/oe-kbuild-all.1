Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A16214A61
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jan 2025 19:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736539142; cv=none; b=bPgGG462kxkXeO75UIzZruh9Jnonniz7S/m6oOtRGjV8dDqEc68C7GS8YrAYOqmWhJqVOHFeRgiTCFcIDwKcH0sEswKrkXONNT1ftjoL0oMQp5VKL+mtjUoS5QJOhKi6f+LOj1fNyDc0S4PKwxTk3voTWkaFqK4Hsl8jkt7GiQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736539142; c=relaxed/simple;
	bh=G0dHKPfeRk5xsRBTrO/JDKGg+CYDX1OSeL+busfN+gg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k0NUCt1cJ8Q5CO6Hx57VRXhHdJMshNO4jyOb8KT7nrQPT6PdVBHt4p0J5D+yuErUylxIIAuo7R+jNKtnSRzDF1Y5blhd9wzTG6wVYi6Smx/9cvlJVYivEl7I3i9hdnm6nGnpSVd1b9l25b56Vzq6pdhK7fAAwtH1QEwkd2iH/HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JeWokR5T; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JeWokR5T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736539141; x=1768075141;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G0dHKPfeRk5xsRBTrO/JDKGg+CYDX1OSeL+busfN+gg=;
  b=JeWokR5TJcF/KzWzzQas09cSDMZD5FkSYgMVYgV3XPnDE/6NZMGHq2kn
   XxgiGYsGKAG2JnbjaAijbDFCr81fLtrrSNRw5QyUWJU+fpmVgjuXTer5k
   WGjSSjOEkO8oErDRceQkYq9AbGbxpRw7nfKAs8S0I5VY32z7K3T1JAPzV
   XnTe7zzjNqAWIh7FVjkV9ce9R+FAXQQJemyhyaw8hIysRu6MREhvM5y2S
   hV/mxbwp3Lf78yPwk5ij5R5awEkeEBfOfPaM0q+nfl0wHhjvn04aCQYyK
   GKjMesbICu6tvLsxAeUfUnEMXN3EEtEtz6SDz4ln5fUJWUkoj7FZkCoji
   Q==;
X-CSE-ConnectionGUID: W7MYMHr/S6+XtaZgFijtAQ==
X-CSE-MsgGUID: nIrbi1c9SRCmOwqr06My5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="37006194"
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="37006194"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 11:59:00 -0800
X-CSE-ConnectionGUID: LK79aDqTTSqf9UXk28PFOQ==
X-CSE-MsgGUID: epb9r/43R76hFu8os3XYVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108925133"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Jan 2025 11:58:58 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWL9k-000Jgr-0g;
	Fri, 10 Jan 2025 19:58:56 +0000
Date: Sat, 11 Jan 2025 03:57:56 +0800
From: kernel test robot <lkp@intel.com>
To: Vishal Sagar <vishal.sagar@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>, Hyun Kwon <hyun.kwon@xilinx.com>
Subject: [xilinx-xlnx:lkp_test 180/504]
 drivers/media/platform/xilinx/xilinx-sdirxss.c:1869: warning: expecting
 prototype for xsdirxss_g_frame_interval(). Prototype was for
 xsdirxss_get_frame_interval() instead
Message-ID: <202501110321.7sjMORxs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: 17fa7c7a64b12cc18a87428721e4a65034240d11 [180/504] v4l: xilinx: Driver support for Xilinx UHDSDI Rx subsystem
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250111/202501110321.7sjMORxs-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501110321.7sjMORxs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501110321.7sjMORxs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/xilinx/xilinx-sdirxss.c:1869: warning: expecting prototype for xsdirxss_g_frame_interval(). Prototype was for xsdirxss_get_frame_interval() instead
   drivers/media/platform/xilinx/xilinx-sdirxss.c:1987: warning: Function parameter or struct member 'sd_state' not described in 'xsdirxss_get_format'
   drivers/media/platform/xilinx/xilinx-sdirxss.c:1987: warning: Excess function parameter 'cfg' description in 'xsdirxss_get_format'
   drivers/media/platform/xilinx/xilinx-sdirxss.c:2025: warning: Function parameter or struct member 'sd_state' not described in 'xsdirxss_set_format'
   drivers/media/platform/xilinx/xilinx-sdirxss.c:2025: warning: Excess function parameter 'cfg' description in 'xsdirxss_set_format'
   drivers/media/platform/xilinx/xilinx-sdirxss.c:2058: warning: Function parameter or struct member 'sd_state' not described in 'xsdirxss_enum_mbus_code'
   drivers/media/platform/xilinx/xilinx-sdirxss.c:2058: warning: Excess function parameter 'cfg' description in 'xsdirxss_enum_mbus_code'


vim +1869 drivers/media/platform/xilinx/xilinx-sdirxss.c

  1852	
  1853	/**
  1854	 * xsdirxss_g_frame_interval - Get the frame interval
  1855	 * @sd: V4L2 Sub device
  1856	 * @sd_state: V4L2 subdev state
  1857	 * @fi: Pointer to V4l2 Sub device frame interval structure
  1858	 *
  1859	 * This function is used to get the frame interval.
  1860	 * The frame rate can be integral or fractional.
  1861	 * Integral frame rate e.g. numerator = 1000, denominator = 24000 => 24 fps
  1862	 * Fractional frame rate e.g. numerator = 1001, denominator = 24000 => 23.97 fps
  1863	 *
  1864	 * Return: 0 on success
  1865	 */
  1866	static int xsdirxss_get_frame_interval(struct v4l2_subdev *sd,
  1867					       struct v4l2_subdev_state *sd_state,
  1868					       struct v4l2_subdev_frame_interval *fi)
> 1869	{
  1870		struct xsdirxss_state *xsdirxss = to_xsdirxssstate(sd);
  1871		struct xsdirxss_core *core = &xsdirxss->core;
  1872	
  1873		if (!xsdirxss->vidlocked) {
  1874			dev_err(core->dev, "Video not locked!\n");
  1875			return -EINVAL;
  1876		}
  1877	
  1878		fi->interval = xsdirxss->frame_interval;
  1879	
  1880		dev_dbg(core->dev, "frame rate numerator = %d denominator = %d\n",
  1881			xsdirxss->frame_interval.numerator,
  1882			xsdirxss->frame_interval.denominator);
  1883		return 0;
  1884	}
  1885	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
