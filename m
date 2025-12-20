Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8C32BE7A1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 16:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766247526; cv=none; b=oLrpSrKdiVfM7ytvuqv606BE6/LBeNQeEHdVDiBvg84wWb7vJxjAl6b6sSJMcPopo0lO2TvFi/iLVJmPmDPjU5qjZg0hR490YDyVH6570v3tt9uSpEpLETTM/MjYaUFIzL8GCMqkqOlEHR41+V38MnJ/WFzMxm09pem5EhSOpjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766247526; c=relaxed/simple;
	bh=8HE/nyrfxEmRD2hvZ9bA5Jcav9ArWOZGNZ0ZxzrkS0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X2hR+oPg4/uFh/DWfqXkUljf05Pq9XO80L1We7kaqOazHr9mindb26Ug0hom++z9VuGfEx1bTOqm9cKmHGCCZqdO9U7FV9SvtwFAzrb7n77gd3YrmHzsTgfXLydkn0nJTSi1UmKrRgy7e9UIwOHcbPyfKsJBzn4Cuw6FYEkNmh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mf6EaQOv; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mf6EaQOv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766247525; x=1797783525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8HE/nyrfxEmRD2hvZ9bA5Jcav9ArWOZGNZ0ZxzrkS0Q=;
  b=mf6EaQOv+hfoM6+FbfQS0MeKKEBjlG/IEZq7gHMIs13iYoTqX6xgvBka
   N+uikKcewkfkAbwkJ60U9lqMNRBU/pFoZfbLQhVLrasT3TpT/vCnAVN7r
   MVrC2iwYvH5CeZ8uc4iB4UAtWiUdhc5osUIQYp4S3ndSpeQfcJxcdCCLx
   1JdPbSQaokqPVUieJ+ghA/vfBd42Wzl8NJdnhrdX8QfG+JMQ7RfpUcY5p
   bD3PRK43LZ0QBcFght4TxLLedYfXnX6ItnYZqunPAoYDo47EJit/Qwh8O
   JKPLsE9EewrsciPZIVaVLFFXZbWfZkCMwmLhsWJQZY8hFadKcIBv/Heor
   w==;
X-CSE-ConnectionGUID: uZnt00zkQxOHb8ePyhNehA==
X-CSE-MsgGUID: PA5cdloLSliPH9tY+Pfm6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="78496472"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="78496472"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 08:18:45 -0800
X-CSE-ConnectionGUID: 4HDYNeVpTyq0YZQCGoSb+w==
X-CSE-MsgGUID: TB4VZZRPTle7Nssq2/30Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="203575261"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 20 Dec 2025 08:18:44 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWzfF-000000004hs-2k5f;
	Sat, 20 Dec 2025 16:18:41 +0000
Date: Sat, 20 Dec 2025 17:18:27 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1/1] kismet: WARNING: unmet direct dependencies
 detected for MOTORCOMM_PHY when selected by YT6801
Message-ID: <202512201757.3Ll2KuBN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   04473ee9ed912a16fff0d8846ad565bbf3d63c77
commit: 6460d9d3c42d1357c8292d7be5c26cb7b84e84d7 [1/1] yt6801: Add Motorcomm yt6801 PCIe driver
config: x86_64-kismet-CONFIG_MOTORCOMM_PHY-CONFIG_YT6801-0-0 (https://download.01.org/0day-ci/archive/20251220/202512201757.3Ll2KuBN-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251220/202512201757.3Ll2KuBN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512201757.3Ll2KuBN-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for MOTORCOMM_PHY when selected by YT6801
   WARNING: unmet direct dependencies detected for MOTORCOMM_PHY
     Depends on [n]: NETDEVICES [=y] && PHYLIB [=n]
     Selected by [y]:
     - YT6801 [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_MOTORCOMM [=y] && PCI [=y] && NET [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
