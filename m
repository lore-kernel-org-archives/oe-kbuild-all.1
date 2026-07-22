Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD7F368D47
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Jul 2026 18:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784746400; cv=none; b=BIqAQbnrFlwu7L2Z+TVggy/oiif7Q1etGUn3rsxYscl/vB6MhwZ0aT29Q9SHHlW64T9t3AedkHiOgT61aSpFi/7SC842UVzqzfYd6SuJuUXOdf8CsSc7rGtItiXxt3qu1OGwY8ctKKvLunuaNgd/yJXIu7a0zTka/mP4uVQU0Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784746400; c=relaxed/simple;
	bh=3tJ36a82kszDh95w5nlZB060GNPUKLD0wKtXhoOB3OI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=P+4dEzG+VR+WqeFhu2MnDDr+cIWCOusUUUT10WEQ/eWZWajlVMdRYq1HcR/vOhi86nUawyX7KcaDTBv52iMDttRSaxPm5ir2WHlCLxnZdfw9Mh0ergMo1WQW+XUPnFbhjBLHYU8NuCSg7BnQBXOD+XL92VT0rmdTLEfc1OWKx7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hG13+SRL; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hG13+SRL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784746397; x=1816282397;
  h=date:from:to:cc:subject:message-id;
  bh=3tJ36a82kszDh95w5nlZB060GNPUKLD0wKtXhoOB3OI=;
  b=hG13+SRLbb06dChIhJgrUk9r2fTfDFkebKKhjEC38dVdpjvuKvK3vTyS
   G5Xmty1YccrzBI914wxFey+ky+M5VjREYTd22W910Eix4DA3GcuO1mzV8
   Ok4d51oFxnHOvW1YFfqv7znjcf90AP4uLdi2F0ysDoUF34TcWoQcsamfC
   PEuYn3QnDF2jEaJzC25RFpTfhpjv+O9FM0sqRTh0dOig56r2BT1xMHbVu
   cTP1cCy3AXMDI1FmdIxhwoCxwIHhqS6GRw32LiWXu6rNYnRYIOPQLbPus
   r/zm3IVbQLlsjY6C5SXTnzGDtsrYC495b9Z/jooRFkhEc+NhKUetAOlXs
   w==;
X-CSE-ConnectionGUID: FmDmVDvTS26SgnXnl9Vd+Q==
X-CSE-MsgGUID: k+R6Z9UKTYOazkiYPcPzQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96531079"
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; 
   d="scan'208";a="96531079"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 11:53:14 -0700
X-CSE-ConnectionGUID: ZGFIWnqkQsmdpRPQh/o74A==
X-CSE-MsgGUID: w3q59lrvRj+jnQgxwut7PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; 
   d="scan'208";a="282697688"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 22 Jul 2026 11:53:12 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmc46-000000000X0-2K4j;
	Wed, 22 Jul 2026 18:53:10 +0000
Date: Wed, 22 Jul 2026 20:53:01 +0200
From: kernel test robot <lkp@intel.com>
To: "Shahidan, Muhammad Shahmil" <muhammad.shahmil.shahidan@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:6.18/linux 1/1] kismet: WARNING: unmet direct
 dependencies detected for VIDEO_V4L2_SUBDEV_API when selected by VIDEO_MAX9X
Message-ID: <202607222052.DjgaZkYc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel/linux-intel-lts.git 6.18/linux
head:   af406d75818b912a1b72efa75a20f8bf3e9a3f01
commit: 6e6aefa2d1fba10ddbfa66f5d4c4f835b9f7a8bc [1/1] Add ISX301 and MAX9X sensor
config: sh-kismet-CONFIG_VIDEO_V4L2_SUBDEV_API-CONFIG_VIDEO_MAX9X-0-0 (https://download.01.org/0day-ci/archive/20260722/202607222052.DjgaZkYc-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260722/202607222052.DjgaZkYc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607222052.DjgaZkYc-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API when selected by VIDEO_MAX9X
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
     Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=y] && MEDIA_CONTROLLER [=n]
     Selected by [y]:
     - VIDEO_MAX9X [=y] && MEDIA_SUPPORT [=y] && VIDEO_DEV [=y] && I2C [=y] && MEDIA_CAMERA_SUPPORT [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
