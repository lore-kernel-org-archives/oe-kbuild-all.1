Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A35F2E92DF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Aug 2025 10:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755858420; cv=none; b=gKaLrJptZXu5ewb+PZoJg8jaiiONL7w5+mXN09hf2tQ+JDON5j9UD5iUFyePsdEoLGnzFno4bABfmldIPOWBbyr1b15/N9tcvOgcOqOshUmYgYfvhz079aNrCypR/MAUJdip9n8Pqc66/y7jidShTBOq3oSDiAjXCHQBur8bnMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755858420; c=relaxed/simple;
	bh=d51WBAZtzO21lTq7YK6XzaWOdDHez8d6dw3y5ZrvVKE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mndazXwIacGHWRSxDj34iwNw5LXejjUACUzwV6AwviP1gkeHgHathxfELYV79s4iUet2/noagyqaDdKYEdb/kl0c2m3yqk6aRfpsXrgB6scdWFY1W77RhQ3DcdsAjBYkIC7eC7XqwZ1tdGa8AjQgFYYX7joyRWyEnZH/3oFm37M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oAWPYVWm; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oAWPYVWm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755858418; x=1787394418;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d51WBAZtzO21lTq7YK6XzaWOdDHez8d6dw3y5ZrvVKE=;
  b=oAWPYVWm1u9bDS02kcF5LwUwvb0eR7mLXYGRGXmBjfo+szdpYeq0nYO0
   Y/dNvZKaK7ftuBf0meCsCoGS0/LXcm48PC/fDReDNShdFDRkNxXi7uf+T
   v7tWjG9+K53YSpMLmamo0QlFdRd/R8wrhmtneD7EBZQzVtUHEnixFWYH4
   uU2T/CybZ+WBaeDJoNSc0Rh/cR9dz4acFMGFFX9kj8FZvzJcXgTkzRAOF
   1gfSGxUdU9d5vKzv5R0NNfjN7Horu+M13sOMlt7WgYGgRFGT3uFBIYQSw
   BXj+zKex+6IIWgvWVzugEVy6HeuuDj7aqQThp+eZ75wSS1VVdjsAa1ipp
   A==;
X-CSE-ConnectionGUID: oy7m55HmQE6tKB79VMK21g==
X-CSE-MsgGUID: MEjq3XMJTSGVvwkuaE1mbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="68764122"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="68764122"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 03:26:57 -0700
X-CSE-ConnectionGUID: 0oum5MDZR2C4bqrKSIudEg==
X-CSE-MsgGUID: MR0FXn7uTiyr2KcpSVIZuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="169039959"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 22 Aug 2025 03:26:38 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upOyi-000L9r-0u;
	Fri, 22 Aug 2025 10:26:36 +0000
Date: Fri, 22 Aug 2025 18:26:32 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Chang <jeff_chang@richtek.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [krzk-github:n/var-fixes 15431/15926] kismet: WARNING: unmet direct
 dependencies detected for MFD_STMFX when selected by PINCTRL_STMFX
Message-ID: <202508221807.q7g8e03M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/var-fixes
head:   3ddd110a90ffe32c0875d378af8ea22bc70c3d7b
commit: 8ed259002bbb28bd2cb36920e592937703a2fb8e [15431/15926] regulator: rt5133: Add RT5133 PMIC regulator Support
config: s390-kismet-CONFIG_MFD_STMFX-CONFIG_PINCTRL_STMFX-0-0 (https://download.01.org/0day-ci/archive/20250822/202508221807.q7g8e03M-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250822/202508221807.q7g8e03M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508221807.q7g8e03M-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for MFD_STMFX when selected by PINCTRL_STMFX
   WARNING: unmet direct dependencies detected for OF_GPIO
     Depends on [n]: GPIOLIB [=y] && OF [=y] && HAS_IOMEM [=n]
     Selected by [y]:
     - REGULATOR_RT5133 [=y] && REGULATOR [=y] && I2C [=y] && GPIOLIB [=y] && OF [=y]
   
   WARNING: unmet direct dependencies detected for MFD_STMFX
     Depends on [n]: HAS_IOMEM [=n] && I2C [=y] && OF [=y]
     Selected by [y]:
     - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && OF_GPIO [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
