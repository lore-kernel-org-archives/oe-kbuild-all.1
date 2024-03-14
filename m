Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7447374BE8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Mar 2024 21:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710451912; cv=none; b=X7uSBfP7UJRBUegKc/yHqoDXAPbjk7ehKys3jgo+l2z1UMb8o3KKuS3duBZ342mZQbSih54XoH6B3eknVWX6OUQw1tkTDh62K8h2ht1+dbYJ8SGGYozSPQ+ByjLph+JPn8ofjk+A3trofcunI/6NqqRiyp2FGBDLuHZ71YLsCPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710451912; c=relaxed/simple;
	bh=qnT+6PYCrq8pWJrRHO9zkjo3YYj8BjNzn5x6vtMXn2w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d6nRvBiRivB9Xm5RC6bGH62KN6Vv4WgSvoeT+oZTYq1nkBnOeMAJ/LhKtvNVmlyPeEvyh76ihDKQKbjl3TwFzrgirvaaRP5BwIbuh5iPQgBFG7LgxzcD3rMPoe9U9t+FsgKXKDiyIS9h6tnW6QhldWCNKWhuwp+cWNVU9drUeVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gCYpPIRZ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gCYpPIRZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710451908; x=1741987908;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qnT+6PYCrq8pWJrRHO9zkjo3YYj8BjNzn5x6vtMXn2w=;
  b=gCYpPIRZMmICt0XZz0Zi2jhIGOEpdUxZ5TV0QTcRX3gJ4ZLJAp5JL/VT
   soROByv6H0flGN/FRMb2l4ZO428o72DU1u9mCK2qsIrDNkux30CfnK8TU
   WolmxQQmSoMN+aLv6uHWh6DBqRHQbkOXZytBP+EgMtB6Lb17dDzLio+jd
   89lx3i/8URVG7959RolajXpdix44ylBDAfK4poRrjbcd57o/j3PBF2uKd
   9u26fbok4DDO6VsRz62kgQL06srUjH+W4NDlKXDwR5bCI1Babdm7noJFi
   /X3sYQl7kbCTNHjieAmmZhj3SUPozCbjUiAss1I3ZXG/aJK9PElzjSrAw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5169506"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; 
   d="scan'208";a="5169506"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 14:31:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; 
   d="scan'208";a="12346765"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Mar 2024 14:31:45 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rksfu-000DoX-2c;
	Thu, 14 Mar 2024 21:31:42 +0000
Date: Fri, 15 Mar 2024 05:30:50 +0800
From: kernel test robot <lkp@intel.com>
To: Abhishek Sharma <abhishek.sharma@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 2/6] drivers/media/i2c/ox05b1s.c:815:12:
 warning: 'ox05b_suspend' defined but not used
Message-ID: <202403150528.b2dLCEFq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   871d5629a0ee4ae82d0caf8d57d4f711d54e1465
commit: baed438193a0f3edf9ddb5cd652b6ecb8cb1c3da [2/6] media: i2c: ox05b1s: add OmniVision OX05B1S driver
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240315/202403150528.b2dLCEFq-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240315/202403150528.b2dLCEFq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403150528.b2dLCEFq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/ox05b1s.c:815:12: warning: 'ox05b_suspend' defined but not used [-Wunused-function]
     815 | static int ox05b_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~
>> drivers/media/i2c/ox05b1s.c:806:12: warning: 'ox05b_resume' defined but not used [-Wunused-function]
     806 | static int ox05b_resume(struct device *dev)
         |            ^~~~~~~~~~~~


vim +/ox05b_suspend +815 drivers/media/i2c/ox05b1s.c

   805	
 > 806	static int ox05b_resume(struct device *dev)
   807	{
   808		struct i2c_client *client = to_i2c_client(dev);
   809		struct v4l2_subdev *sd = i2c_get_clientdata(client);
   810		struct ox05b *ox05b = to_ox05b(sd);
   811	
   812		return ox05b_power_on(ox05b);
   813	}
   814	
 > 815	static int ox05b_suspend(struct device *dev)
   816	{
   817		struct i2c_client *client = to_i2c_client(dev);
   818		struct v4l2_subdev *sd = i2c_get_clientdata(client);
   819		struct ox05b *ox05b = to_ox05b(sd);
   820	
   821		return ox05b_power_off(ox05b);
   822	}
   823	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
