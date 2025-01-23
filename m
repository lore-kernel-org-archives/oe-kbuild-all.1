Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895C21B3948
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jan 2025 23:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737675058; cv=none; b=T4up4rQ1Hz/x1COzUC96J5cobOODHm3a6RgYAwUdBgvwhRMZ1z0N1QHcF31pTwAGLCg782RpQEowCrh3yVYeot2NiJ8h71uXR6jkAMJreH6K4aJg86+al81hnl86ytViC5qLFberi45pj0S+vLjLlq5YZcQyapMI7jgM0LmzAss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737675058; c=relaxed/simple;
	bh=AjWXlqStyMjVEk2bVKFN968ZIN3nRKZRsb5vgoRGTUI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rtmib1ZpFWxSBJ8lajiyLz9IH80WEC12JbQrL0BuGk1aiRZVLbkUkmNcNa1QHNnF3TqdrjL6dVy0YecCJrCL2xbox5yCchL4JJBvyCBlDnfa9SAAKaYDrZsm9P9qdtsFhDz8DRY3Yn2TuIVZH8m+Nb8uMoaztidPsIgHHlEiOOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CqK4gcAW; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CqK4gcAW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737675056; x=1769211056;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AjWXlqStyMjVEk2bVKFN968ZIN3nRKZRsb5vgoRGTUI=;
  b=CqK4gcAWp7dev/76hvkkCJ//TKlRbIxothlzInF14k23vzGZ9LUbZ587
   XUrGqQBNN2LDVODNze5Xd+0RE2ksMTq4/0RV0LUzsOZT7bNPGUfFTsMZK
   4H0Q/SnRJU6tUjocGHzW6BZHjutasqM5o972oi9dRSRNTjXUtasndNIom
   IVyheE/TDG5MVoL2n1b0m+5IB/N6j4XQCY6zWakjIkdbE4Ne06P8YbKg+
   o2JaXd7cEau3AqlKieFgtVYeVr+7T7AidSSNPwcZWqkHZJj063b8TPnQK
   zJipkih07+8SP23HskIUHM8fIt2KdgBAXU6L3xDlPD8vaTxdPRWLpQj7N
   g==;
X-CSE-ConnectionGUID: 6vbmg+6UTXCngKsr9N8LQg==
X-CSE-MsgGUID: wOSeBMoDTHK1D34PPTzdjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="38456692"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; 
   d="scan'208";a="38456692"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 15:30:56 -0800
X-CSE-ConnectionGUID: GLkzT+t5ThC3i6ELgUEAGw==
X-CSE-MsgGUID: LnjQ3aK7RQi1MFN1c1qmfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112236242"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Jan 2025 15:30:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb6ez-000br5-08;
	Thu, 23 Jan 2025 23:30:53 +0000
Date: Fri, 24 Jan 2025 07:30:20 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 228/228] kismet: WARNING: unmet
 direct dependencies detected for DEBUG_MAPLE_TREE when selected by
 TEST_MAPLE_TREE
Message-ID: <202501240748.ZwePDNnM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   2c8b3afe8866ca4bb189aa69f1185ff225dabfa3
commit: 120b116208a0877227fc82e3f0df81e7a3ed4ab1 [228/228] maple_tree: reorganize testing to restore module testing
config: x86_64-kismet-CONFIG_DEBUG_MAPLE_TREE-CONFIG_TEST_MAPLE_TREE-0-0 (https://download.01.org/0day-ci/archive/20250124/202501240748.ZwePDNnM-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250124/202501240748.ZwePDNnM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501240748.ZwePDNnM-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DEBUG_MAPLE_TREE when selected by TEST_MAPLE_TREE
   WARNING: unmet direct dependencies detected for DEBUG_MAPLE_TREE
     Depends on [n]: DEBUG_KERNEL [=n]
     Selected by [y]:
     - TEST_MAPLE_TREE [=y] && RUNTIME_TESTING_MENU [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
