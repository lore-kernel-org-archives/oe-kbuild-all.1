Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA4E23A9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Oct 2024 00:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728780812; cv=none; b=l3Gnmwkn1VLCTceO0RlD2lNKN8wUfc/ub9jRHhxAXG90gPaAFn2RJTTVhIbXU91cqCKD3o6YwkAEjElMqWD+3jx2rgoyvlHqo8GXDy3qZlWmW8SHQdhZBnngGtY7YGV++k9MOe2fcsd+5tNaJvUC+fr/tJxBfscNA9E0l2WpOwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728780812; c=relaxed/simple;
	bh=Qy88CjGQ6IjXzfxbqJGRdXP9toYcd9WG07RaOnVcc3o=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B1iMiuk1z0lk45OWkbllkPpilrGwje4JCCTpWNnrDerjCxIWgY0Yd7R7KtHcucQi7u2xHdQTFIMczHwlxAPLl7dD3joP6NdmV3oVMSda5+1um1Z0HNqRjxvGmtSQ2p7YPF8lAuJUFAERStfDQJvVG+0nP77+LEvkOiKNdTXn9lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O1CbHpam; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O1CbHpam"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728780811; x=1760316811;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Qy88CjGQ6IjXzfxbqJGRdXP9toYcd9WG07RaOnVcc3o=;
  b=O1CbHpamz+3yLfbRnAyyIOvdBTAYc3n1fPs9n4492PKF+AGJoX2aR+kE
   bh/hfXd9kJvxu7bQJrLZLKc9SIrfTqSuJ+/RkL0HhIaTU3W+a/yL8kP/z
   CARbjwIx/A8wA4xNOZ3EZKnJDFt9re8wbwkG5bwYQNWWNN91QHZpKU62A
   UNjl5CW4ku2F44fSwmqgw6hPDG+L74sW9RhQRN3q38vNPG848zyLWH1qM
   sS8dlWgjQp3wN8FxmrEeb42L1mKSd8ip53RfQ4/FnvOcPRqF54lzaUhCR
   lE2kA/dKT5X8p6X2qNq6UG8Lxzx3zeE+/uYTFHxk+VvOSuUH9HEJrJDTM
   g==;
X-CSE-ConnectionGUID: 8gVkjPVdR9K8YEKxPNA+Zg==
X-CSE-MsgGUID: 1CqGqILbRAWG2btNx1prwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31956317"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31956317"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 17:53:31 -0700
X-CSE-ConnectionGUID: XHIyw4ZYThCGgim5XZT1RA==
X-CSE-MsgGUID: uNN0/s9rRKC9mbBN0qyrmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="77336335"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Oct 2024 17:53:29 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szmrO-000DvP-2j;
	Sun, 13 Oct 2024 00:53:26 +0000
Date: Sun, 13 Oct 2024 08:52:54 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Jai Luthra <j-luthra@ti.com>
Subject: [ti:ti-rt-linux-6.1.y 46/107] kismet: WARNING: unmet direct
 dependencies detected for OF_GPIO when selected by VIDEO_DS90UB913
Message-ID: <202410130834.EHYKk0cg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y
head:   451df8c0a2a3bcf0656b2f6fdc49d6fb4d05f186
commit: b18364151a13ff12dcf5655d4c13e734e824206c [46/107] media: i2c: add DS90UB913 driver
config: alpha-kismet-CONFIG_OF_GPIO-CONFIG_VIDEO_DS90UB913-0-0 (https://download.01.org/0day-ci/archive/20241013/202410130834.EHYKk0cg-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241013/202410130834.EHYKk0cg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410130834.EHYKk0cg-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for OF_GPIO when selected by VIDEO_DS90UB913
   WARNING: unmet direct dependencies detected for OF_GPIO
     Depends on [n]: GPIOLIB [=n] && OF [=y] && HAS_IOMEM [=y]
     Selected by [y]:
     - VIDEO_DS90UB913 [=y] && MEDIA_SUPPORT [=y] && OF [=y] && I2C [=y] && VIDEO_DEV [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
