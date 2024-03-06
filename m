Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB50513172D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Mar 2024 17:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709745274; cv=none; b=cAv2/e42kK+SBouy6I4VmUbHFjvebcgrrNZhIkpVG7Y1G6NsfHimBr3m6LUr7TCQleFFU66bkwrZ1RlRiOv/rUcbVp/FpTK7tIuNvktUhSToyHHc/o2ZZsTqii1S1Qj1+GpFkew3+8dfT1Wrm8nq2jdg69mp045sG4PWnoOvY7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709745274; c=relaxed/simple;
	bh=aA01/Y/RGUCQdef0gf5UcyUTpOrb0pgrc4DEX8nZVV4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YiRqryPloqOSLwdYhXtJBjrFF1EZCzMwu/nwgYR23MadfGdVPPEwjwTNSeVfd/gsiUTEl5b88V/evXB1qDUXLumPsNRZmuTEBu6BseHDJzp5bFTMTSRj+g4yoB4fFh+h9ugwl3NHfwob1y3ixqtX+4FNOW94kUoUgB4/6g96u6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IMPyDGS6; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IMPyDGS6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709745272; x=1741281272;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aA01/Y/RGUCQdef0gf5UcyUTpOrb0pgrc4DEX8nZVV4=;
  b=IMPyDGS6pzq8CFMQRd/9MzeNgxP05nvM2I5NmA/sRlHhaxrJp2QqEON9
   K9Q3knIalzC9ABoStELRX+Du4nWneaaLlE8FVaMkSFXeXspFg0QHdmIGb
   +X123Q45yalpWXSHWwaDwVezbBrmAFADXU6NPCJOoh1EQZPytU2lK0vLz
   MTL3EHaMxaimyBLg+GaNqJcSZ6mPWKdJghfbXbUDO1rF/VQiA3ZLKeQx1
   Lk8fbymku+a+Aaos/PQeOn/haCxvOj/uvf2tZfRxlIphiNf5CCa7s1EfZ
   qO4EADN+c/hGI9QBQkpzlFw1ZxkJkNZTPIf5QyEEjtoh3p5ziTwKoUMQG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="7310828"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="7310828"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 09:14:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="40797469"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 06 Mar 2024 09:14:29 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhuqZ-0004Q7-14;
	Wed, 06 Mar 2024 17:14:27 +0000
Date: Thu, 7 Mar 2024 01:13:58 +0800
From: kernel test robot <lkp@intel.com>
To: Naushir Patuck <naush@raspberrypi.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [pinchartl:rpi/v6.8/isp/v2 14/22] kismet: WARNING: unmet direct
 dependencies detected for BCM2835_VCHIQ_MMAL when selected by
 VIDEO_ISP_BCM2835
Message-ID: <202403070139.PJeDSM7W-lkp@intel.com>
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
commit: ccf04478fd461b0517a703743a57a65ca304faf2 [14/22] staging: vc04_services: bcm2835-isp: Add a more complex ISP processing component
config: alpha-kismet-CONFIG_BCM2835_VCHIQ_MMAL-CONFIG_VIDEO_ISP_BCM2835-0-0 (https://download.01.org/0day-ci/archive/20240307/202403070139.PJeDSM7W-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240307/202403070139.PJeDSM7W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403070139.PJeDSM7W-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for BCM2835_VCHIQ_MMAL when selected by VIDEO_ISP_BCM2835
   
   WARNING: unmet direct dependencies detected for BCM2835_VCHIQ_MMAL
     Depends on [n]: STAGING [=y] && BCM_VIDEOCORE [=y] && BCM2835_VCHIQ [=n]
     Selected by [y]:
     - VIDEO_ISP_BCM2835 [=y] && STAGING [=y] && BCM_VIDEOCORE [=y] && MEDIA_SUPPORT [=y] && VIDEO_DEV [=y] && (ARCH_BCM2835 || COMPILE_TEST [=y]) && MEDIA_CONTROLLER [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
