Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC87EAFA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 02:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736561618; cv=none; b=VREBHgCvixr0mtkLYz4kDCaoW1CArGbC4ZrbqPvFmgHCk0dkbFryia1ha4laUx+yxdaEJnSFsycfxQo/y5tV5PZuPrXdt6WJi/joSGBaCaeC8veieiJK7MNMkO3s6rHZyOPFlbbR6w0jGFCTke2uFnk8DsJ32bfrLi6hilQjrWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736561618; c=relaxed/simple;
	bh=8wkQL9UBzXkXqlFW1fnyYZ1T/xZvpgs86Kwf2iQl1+k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e8x96VeJ9r/T5GnAPZNSxJjrABHf2FhYQrtcRyiOgst9Om11mgw83/cM3Whfek2Kuum1KF23gADvA+JD5wS1rWvHoekzthxMWrZOa8/cPXIgu3SZCdPBOViC5Q3gEGMU48iksK4MHVhjOJmxXtuMLSOgpkqLVMeDs78dtLwvVk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UD+964xx; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UD+964xx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736561617; x=1768097617;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8wkQL9UBzXkXqlFW1fnyYZ1T/xZvpgs86Kwf2iQl1+k=;
  b=UD+964xxpVx8bflA5T+J6kP7MWMZc9AHHdh1V1X2Pam/t2K33Pt2pfUQ
   HqeABClEL38paGWy/9r4R/dmxhgsoePmiCjD2UBQZ/LmeAX4XQfWb8tUw
   sYg4NhHF4n8FM7Q6j+0OimB2w965zMabk3a0c8IdzXd7EeEYM1fvyJPKz
   CNQduPdNCr2iyi8ligQeX8cbhRhrSpCM3R8H9cvaqtRMUw9pQTwgnj3NU
   P1yrwb7Pxb83d2lM/VchNz2ybVgfUNWbXqFfPKwa+3IXybeUW4/wLqjPn
   +MnHTGj2HZ2Y3SoOlR8bwU58ZNO+zn5jCbWz207fsYpJ3xTRwHzsd/QVU
   Q==;
X-CSE-ConnectionGUID: Zj536wloS8eEYwvxBIFIsA==
X-CSE-MsgGUID: M4QvsYCgT8ueKD2vMxXGjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="37097261"
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="37097261"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 18:13:34 -0800
X-CSE-ConnectionGUID: Q9B1Y/cVQimLA/OfM2VBiw==
X-CSE-MsgGUID: iXHP9PVGSV+UWKqWjeWW+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="108900359"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Jan 2025 18:13:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWR0E-000K2J-1R;
	Sat, 11 Jan 2025 02:13:30 +0000
Date: Sat, 11 Jan 2025 10:12:44 +0800
From: kernel test robot <lkp@intel.com>
To: Vishal Sagar <vishal.sagar@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:lkp_test 408/504]
 drivers/media/platform/xilinx/xilinx-hdmirxss.c:4015: warning: Function
 parameter or struct member 'pad' not described in 'xhdmirx_query_dv_timings'
Message-ID: <202501111058.1YiGbUM9-lkp@intel.com>
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
commit: ad8782a9e36654e85c53c90452e7b513c75c1c49 [408/504] v4l: xilinx: hdmirx: Add HDMI 2.1 Rx subsystem driver
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250111/202501111058.1YiGbUM9-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501111058.1YiGbUM9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501111058.1YiGbUM9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/xilinx/xilinx-hdmirxss.c:4015: warning: Function parameter or struct member 'pad' not described in 'xhdmirx_query_dv_timings'


vim +4015 drivers/media/platform/xilinx/xilinx-hdmirxss.c

  4002	
  4003	/**
  4004	 * xhdmirx_query_dv_timings - Gets the current incoming dv timings
  4005	 *
  4006	 * @subdev: pointer to v4l2 subdev
  4007	 * @timings: pointer to the dv timings to be filled and returned
  4008	 *
  4009	 * This function returns the incoming stream's dv timings
  4010	 *
  4011	 * Returns: 0 on success else -ENOLINK
  4012	 */
  4013	static int xhdmirx_query_dv_timings(struct v4l2_subdev *subdev, unsigned int pad,
  4014					    struct v4l2_dv_timings *timings)
> 4015	{
  4016		struct xhdmirx_state *xhdmi = to_xhdmirx_state(subdev);
  4017	
  4018		if (pad != 0)
  4019			return -EINVAL;
  4020	
  4021		if (!xhdmi->hdmi_stream_up) {
  4022			dev_dbg(xhdmi->dev, "failed as no link\n");
  4023			return -ENOLINK;
  4024		}
  4025	
  4026		v4l2_print_dv_timings(xhdmi->sd.name, "xhdmirx_query_dv_timing: ",
  4027				      &xhdmi->dv_timings, true);
  4028	
  4029		*timings = xhdmi->dv_timings;
  4030	
  4031		return 0;
  4032	}
  4033	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
