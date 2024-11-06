Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93808824A3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Nov 2024 06:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730874854; cv=none; b=estuZWqY3kVLG/2/KAkYC5z3NuE1RZGO4vqkctBef2c+NGimlReP9PDE5HnIyjeLC8vOHVqkOtQW4yJqvxNTDkT+SdtpcqjocyM9HVGdWUps/6M0OT78e+za/DdIYHJxqF4chi+ZGZpr6pYAP66Q8cJpol5Zu7KP4KcT4pxYriE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730874854; c=relaxed/simple;
	bh=SBw+xp7ijhl0NY8e9bVgquDRLxgGWTblpszLFEwAwDY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lb+OlLI+dHPdR2TQbyjzWAkZ/W9cPKLChCL9dddjbeC/xkTm7zaeT+4Hd6QOVU6bmf0W2a+WuhNLwgt7LmOGuJ30Yvj0eg+/Pvuj8tdURWc9qoSf/QTSic0sG0SwS+hnG45v4ZiKGQJlS1D3iUcEqYDxwCIQ/Q7ADSXQVH9tPY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q+hISQIL; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q+hISQIL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730874853; x=1762410853;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SBw+xp7ijhl0NY8e9bVgquDRLxgGWTblpszLFEwAwDY=;
  b=Q+hISQILg2gG+nERDVATDWwQBTKerlW+/i9uQxl7A5MUejw1XoIsXaus
   WwOfJUNhnn7CiL/ZBBhTUcecXZFgvU+O72keZHWYHfdUm7aTzvu1Y7Y4X
   4zJZtJyDhs+uCk6CDCyrqTCNZywEeWHqKO0f6jadLKWb8FLAXtrN8aAZo
   jHe9DRh6K1c3+iw7fyNdGhGWy+uFhkfIXpY76VStVuX3pXEh6+1A1fpFB
   fFiqaWdNzHRrmCJhgzBwZTseL0LOq+jyNsC9QgjYARBf97rYXtbzrnuz2
   mDRbMy72ggLBYiukR/g+IfuWk8uJSikNZSMRODutD+sHWQ+8B2BgCd1iG
   A==;
X-CSE-ConnectionGUID: yy4q36VASQSPIzKCBen23A==
X-CSE-MsgGUID: I7TbQc5ASDGK+UQ2ygWE0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41205450"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41205450"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 22:34:13 -0800
X-CSE-ConnectionGUID: e6GCsyQbQNydbOr6hLwpvQ==
X-CSE-MsgGUID: OI+o/hsPSFadJm4JctvQjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="89491707"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Nov 2024 22:34:11 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8ZcH-000mzS-01;
	Wed, 06 Nov 2024 06:34:09 +0000
Date: Wed, 6 Nov 2024 14:33:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 8/16] kismet: WARNING: unmet
 direct dependencies detected for P2SB when selected by
 GKI_HIDDEN_I2C_CONFIGS
Message-ID: <202411061455.0WB4DDe6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   cefa8bf9f032171eb1be08266aec68726ab8e8e5
commit: 0a9642cdae626bb6996cea1727dff4abfc599936 [8/16] ANDROID: GKI: x86: Add hidden i2c configs
config: x86_64-kismet-CONFIG_P2SB-CONFIG_GKI_HIDDEN_I2C_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20241106/202411061455.0WB4DDe6-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241106/202411061455.0WB4DDe6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411061455.0WB4DDe6-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for P2SB when selected by GKI_HIDDEN_I2C_CONFIGS
   WARNING: unmet direct dependencies detected for P2SB
     Depends on [n]: PCI [=n] && X86 [=y]
     Selected by [y]:
     - GKI_HIDDEN_I2C_CONFIGS [=y] && X86 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
