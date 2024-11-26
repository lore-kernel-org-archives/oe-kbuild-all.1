Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA70F1C4616
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Nov 2024 11:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732622151; cv=none; b=Oe2Ou5OLYCc/spa6wrtR2wcStPOOph09D44mwoIbK20soUPWlGg1xnuJmSvosfyXHK/gB8dRXv3Q830Joy6Xo49rjkSxOd+HX2BgPIjyZQb67RWbPfLesV06A/oJMUfjR5TbZt/EhfkFtJ8u5rNzBxXvdBf+uc4dbpzncfcM058=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732622151; c=relaxed/simple;
	bh=Lb5m/ilQcetTtQK/2LMT7mnHsud6bJ7XAe8QuV+VWmg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rjrqt9JRbZ3PKqHvOw7uK8vA+Ll8PMddM7lxEuaY5/hClEv9Ph5uw1HozTMn95NI5UZL1K8tuDc2jNI71CHtgi7wgRrgIbAJPksGj0t31XYkxN2C5iOj22/JI6pNvwsBf4vJAQO+Hu2Bttt9WbTDUVQP4kCqsfgPfVTZ/ah92h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GPtXWA2+; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GPtXWA2+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732622150; x=1764158150;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Lb5m/ilQcetTtQK/2LMT7mnHsud6bJ7XAe8QuV+VWmg=;
  b=GPtXWA2+bu/7QnthV1Akzn7IoolRhA//2+i5qNAUpYumEG/cmnb/YzLW
   bVjUy6DwbGKwjma13DqBj42EF/DwjfvUa4dUpfPH0lsL/ZVf3teQQI7dY
   O2U01oNo7Y3LxrqByPlXBwxRu276kJPLftb1EAWvQeCUqQSdtq3XxPMR/
   XQu5c8nbZ4XHrGWP9jJ2gDRtVv8qffE/hmAj3sK+AfV2Xu8P9RmSiLRQq
   qgq8oKTsocLWK9aylgohVxLstBSHRsa/x950d/AcmQWV7iNhWAfJqv8m7
   7JCIA8wEjKrdHt24bD9fXVroeepaU2/vZxZS/w+mYoKM5+n8sZa5aa49P
   w==;
X-CSE-ConnectionGUID: QRI6l88FSvizy4DS1sG0Jw==
X-CSE-MsgGUID: rWc+2H1JSI+/tVpU8zJVVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="50185411"
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; 
   d="scan'208";a="50185411"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 03:55:49 -0800
X-CSE-ConnectionGUID: K0PRGEvkRJ6cYw0+OeYarg==
X-CSE-MsgGUID: ymzieMH6QMeZvqhKiHNKQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; 
   d="scan'208";a="122443639"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Nov 2024 03:55:49 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFuAT-0007GP-3B;
	Tue, 26 Nov 2024 11:55:45 +0000
Date: Tue, 26 Nov 2024 19:54:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Pengyuan Zhao <zhaopengyuan@hisilicon.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2470/2470]
 drivers/vdpa/vdpa_sim/vdpa_sim_net.c:36:4: sparse: sparse: symbol
 'macaddr_buf' was not declared. Should it be static?
Message-ID: <202411261934.oQXSmYd5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b72e8e3239b08473e630c6c751eb719791d2f843
commit: d4a6c405d07d2c7eb60a781368d94c476ebe24ab [2470/2470] vdpa: split vdpasim to core and net modules
config: x86_64-randconfig-123-20241123 (https://download.01.org/0day-ci/archive/20241126/202411261934.oQXSmYd5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241126/202411261934.oQXSmYd5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411261934.oQXSmYd5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/vdpa/vdpa_sim/vdpa_sim_net.c:36:4: sparse: sparse: symbol 'macaddr_buf' was not declared. Should it be static?

vim +/macaddr_buf +36 drivers/vdpa/vdpa_sim/vdpa_sim_net.c

    35	
  > 36	u8 macaddr_buf[ETH_ALEN];
    37	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
