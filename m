Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BB9185B7C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 10:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727431995; cv=none; b=IR9O6NHPRjSA1d/sUgXLUHypxelhoQBIxHRydjC82PRUFqCGP31lJ+NNLvjknguxoHtCALdtM1RyTJpNK2qxe37/z+aoq0SXRNdd74TQhjYcwM7BpnQuXBhTT57rDEbfN2vPAmNeONV1LBanb5CYJgf0EF0mad9W2RCX9v392kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727431995; c=relaxed/simple;
	bh=c9q1v2KRRky31Lxsex/ejdB9DahzvXVraRtegItLdT4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lu7hav8TlpHsacC/wvQUtuy+SagqV4SJ7n6v2EKg3eXf+qF+F3Xyd4P++q7U9d2tH4zPz7PAjz7QcCETdNbRh2LnE/d40Ld63Jlvpo06sm4H9KrGPe2HkjNh/tyBHUNwqxj9MAiwteMBSgzdmM3XytFsC7PBOmhgv4l+L5cmxNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mFkDzT6S; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mFkDzT6S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727431994; x=1758967994;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c9q1v2KRRky31Lxsex/ejdB9DahzvXVraRtegItLdT4=;
  b=mFkDzT6SY6T3fE1w8oRBArxIx5nlFeQwLaE9Mxv9AcEn58i6M8F/dLsE
   v6sLvefBlciIu5OheT4rWnCUiJtEcf5TKzcCjYecLg9WCrbX3bShLBWGt
   oTj2VaBrhZvXlpHPWPyrkwCJnsEMXNkydDdOLDrZGHGZO2BPHa4wtKkMo
   D/opU0u8MQYjKTgyRQi8Jo9fwnkfeL/61Z/7OHnrky46Ras9oQraNoa9s
   CFZ4vFxPlBmTbcmeYCNiw/GIQcpc6Nvz6+c0fVXupF/fqlucjwAe0rSIx
   B5RtJrtGY001la8qYE0Crz0BcCV8/0FXi3g4422NmBo7cYJi726T8DRwa
   A==;
X-CSE-ConnectionGUID: DXsEjWpJSQyFE+FB8hoH6g==
X-CSE-MsgGUID: fOJvy3g1TOuFk4g+dYRgug==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="49098173"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="49098173"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 03:13:14 -0700
X-CSE-ConnectionGUID: G6XuC7VuRmyjwhuwzT9OHw==
X-CSE-MsgGUID: 0xj2cuB2T6uPIMcL5dQIew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="73279471"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 Sep 2024 03:13:12 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1su7yH-000Lnd-15;
	Fri, 27 Sep 2024 10:13:09 +0000
Date: Fri, 27 Sep 2024 18:12:29 +0800
From: kernel test robot <lkp@intel.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Davor Joja <davor.joja@logicbricks.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS_2024.1_update 230/1001]
 drivers/media/i2c/adv7511-v4l2.c:2221:21: warning: no previous prototype for
 'adv7511_subdev'
Message-ID: <202409271846.i8IbN40P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS_2024.1_update
head:   5365c13a86998da06d845c918f849b30b8735538
commit: c1d6baee0952a986dc51e9ca168acc6143b4a417 [230/1001] drivers: media: Customized adv7511 for Xylon LogiCVC (deprecated)
config: i386-buildonly-randconfig-002-20240927 (https://download.01.org/0day-ci/archive/20240927/202409271846.i8IbN40P-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409271846.i8IbN40P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409271846.i8IbN40P-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/adv7511-v4l2.c:2221:21: warning: no previous prototype for 'adv7511_subdev' [-Wmissing-prototypes]
    2221 | struct v4l2_subdev *adv7511_subdev(struct v4l2_subdev *sd)
         |                     ^~~~~~~~~~~~~~


vim +/adv7511_subdev +2221 drivers/media/i2c/adv7511-v4l2.c

  2220	
> 2221	struct v4l2_subdev *adv7511_subdev(struct v4l2_subdev *sd)
  2222	{
  2223		static struct v4l2_subdev *subdev;
  2224	
  2225		if (sd)
  2226			subdev = sd;
  2227	
  2228		return subdev;
  2229	}
  2230	EXPORT_SYMBOL(adv7511_subdev);
  2231	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
