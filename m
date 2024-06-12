Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8495BAF0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jun 2024 11:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718191971; cv=none; b=Id0aWSMDHsJBev0weW2ehmEgEZfpP1ULaA6wxFjOuxcCOMvxfwu5JIOwIyosOkCVFUj7tktvF3uH80PxfTAiu7b8912H/Ie3H36J37P3T1vq6/YbPhR/qUp3ZGv3e7QzUdBNqztOPE9QDReDvBzflbT+3bimXCP6GuOPXjOktho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718191971; c=relaxed/simple;
	bh=J/2p+WJFfzBQyves4mvLIa8weaPH5Za68Zy37xn84S8=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e/RWoRpJg1QdQXWUbai6LzSDD4mmfb/mUhvtegDHMwPzh9h9i/wccwyYXgHcsRwOp/2qG0fWMwDBcJj5mecQE5NC1dw5dd4y3MoVsfN9rcMeiMRbfq4Hhs7luRXvGat2Z/T3czIJtX2JIOnFLAhsPp3FCI/N3BWUXC8JrfkmnLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CxG9Kb7Q; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CxG9Kb7Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718191970; x=1749727970;
  h=date:from:cc:subject:message-id:mime-version;
  bh=J/2p+WJFfzBQyves4mvLIa8weaPH5Za68Zy37xn84S8=;
  b=CxG9Kb7QgF8b5ovsLoLSy8ZdANaxVhxaUAzzGe15Ye376ENN2OigUVjD
   SOge14qaHBQdpcv3bCaX7NRU3bNIF1LR/Z55OGStaKFmIho0770IG+Tz4
   E8hT9ywDFbOQnV2Wsq5qDbT5Qh8DpiGLWnSB5KjnN/6t2+HM0bWZi/kN6
   kOuTMbRNPEGDDr4nAuAekfuWpnJ2Ii0aOfeU+RREY5q6W5jiE51oBUyqE
   kQM27rH7XvQ7B5qYkv9SrtS0L7yQ91qMW+4BFLYM6MCatj7N8wnwAc6XG
   DghIpv3e/0iV20z71I1CrsnwMrKzTvuiI0mRkNzzIaQ0JQPTQkaP8Fqs3
   Q==;
X-CSE-ConnectionGUID: Usj9Pr/aR4KALTLyHv1Cnw==
X-CSE-MsgGUID: eGBqZZgYQhGqosLoTEbACA==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="26066861"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="26066861"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 04:32:48 -0700
X-CSE-ConnectionGUID: V0lTZnaxTMmGeBaToeDi7g==
X-CSE-MsgGUID: Yx3VqDaxRZqk1+0V5Zof+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="44158975"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Jun 2024 04:32:47 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHMDd-0001V6-0s
	for oe-kbuild-all@lists.linux.dev;
	Wed, 12 Jun 2024 11:32:45 +0000
Date: Wed, 12 Jun 2024 19:32:02 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/chromeos-4.19-s0ix 9034/9999] kismet: WARNING: unmet
 direct dependencies detected for MTK_SCP when selected by
 VIDEO_MEDIATEK_ISP_PASS1
Message-ID: <202406121928.GB0rWMYU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/chromeos-4.19-s0ix
head:   430bdaa0a8c38697780f45a148964d71951df11f
commit: 910bef3a45ed1e7f972f68e83327775901629aa7 [9034/9999] BACKPORT: FROMLIST: media: platform: Add Mediatek ISP P1 V4L2 device driver
config: arm64-kismet-CONFIG_MTK_SCP-CONFIG_VIDEO_MEDIATEK_ISP_PASS1-0-0 (https://download.01.org/0day-ci/archive/20240612/202406121928.GB0rWMYU-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240612/202406121928.GB0rWMYU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406121928.GB0rWMYU-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for MTK_SCP when selected by VIDEO_MEDIATEK_ISP_PASS1
   WARNING: unmet direct dependencies detected for MTK_SCP
     Depends on [n]: REMOTEPROC [=n] && ARCH_MEDIATEK [=y]
     Selected by [y]:
     - VIDEO_MEDIATEK_ISP_PASS1 [=y] && MEDIA_SUPPORT [=y] && V4L_PLATFORM_DRIVERS [=y] && VIDEO_V4L2 [=y] && VIDEO_V4L2_SUBDEV_API [=y] && (ARCH_MEDIATEK [=y] || COMPILE_TEST [=n])
   
   WARNING: unmet direct dependencies detected for CRYPTO_ARC4
     Depends on [n]: CRYPTO [=n]
     Selected by [m]:
     - RTLLIB_CRYPTO_TKIP [=m] && STAGING [=y] && RTLLIB [=m]
     - RTLLIB_CRYPTO_WEP [=m] && STAGING [=y] && RTLLIB [=m]
   
   WARNING: unmet direct dependencies detected for CRYPTO_AES
     Depends on [n]: CRYPTO [=n]
     Selected by [m]:
     - RTLLIB_CRYPTO_CCMP [=m] && STAGING [=y] && RTLLIB [=m]
   
   WARNING: unmet direct dependencies detected for CRYPTO_MICHAEL_MIC
     Depends on [n]: CRYPTO [=n]
     Selected by [m]:
     - RTLLIB_CRYPTO_TKIP [=m] && STAGING [=y] && RTLLIB [=m]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
