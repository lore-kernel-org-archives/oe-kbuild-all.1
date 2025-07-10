Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A4B21C173
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Jul 2025 05:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752123795; cv=none; b=DQhygNPXqjth6K1sX6beHEEhgP5R1YJ+jW3QSKa8kTIg6DNiKzOZ48VPNd5gDLP3cgI8KzuGw13dTqSBB6+nG8wIPHZDWqVhLySfaFOfuHeLiKQO+j9xIQTci8yvES2tD7xfndhA7xy0xQdlmRj/vQeNaQ61758nAeuSl/9QvAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752123795; c=relaxed/simple;
	bh=dMN2rUzGESsiiRqH52L0eRjJBZo1a6XIQJN0e2ItsXY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EIDjq35fdUb/CjYrAfI7nIaMb6R/9+XaWn0rJijiCk7cwwL2zfKTqHy6tFdeZ5LvEDavkY2FfvHUIdZ7YjeAwqZEP6gA6JdMKmn1hOyNLBfxh3czlBzwJU5KRgJhQx8onRyY2bkFX99hxJDoBJnKS/m5tFPnfxmMAWcQyKB73nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OrSfmBHu; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OrSfmBHu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752123794; x=1783659794;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dMN2rUzGESsiiRqH52L0eRjJBZo1a6XIQJN0e2ItsXY=;
  b=OrSfmBHulyNfBekl6G4F6RfH/5XwMLxsrk2DMQmRzFNUMmtpjFhAN8Aw
   iG0P5QGpwuYZbXpM8B7HBRmaSmGj3SbvYsvbv7dBDSRiNZ8ZMOxayhxrv
   JlEOr7rHzwqs4gdm3788caob3BuHggqRZ39FjcTXMjAooK0gcdSPx/4PC
   BWVYEaPDHwOuzQ1s6Og5HlIuaOawsZEWF1hEKEqjl92lpLwvqrw/WhyJT
   gtCrq0mTOy2i1pboilQiXHKghG+tgZ7NaqLhbj/wsUAxx6frPTSKuWZET
   l4Zo4ZMurI4kiBGqqWqSOPKQBIcIDzpKr6lwAOsGdefKCZX8fgn7hQ2nz
   A==;
X-CSE-ConnectionGUID: zxZWjgOPSLiukt05n9Ksqw==
X-CSE-MsgGUID: Tmm5CSA8RJmYRj+3okgH6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="71977970"
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; 
   d="scan'208";a="71977970"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 22:03:13 -0700
X-CSE-ConnectionGUID: PgTsHcMJT/+2cHPEQpzgiA==
X-CSE-MsgGUID: DNyplCGZQyiIOItqCEQP3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; 
   d="scan'208";a="155380033"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Jul 2025 22:03:12 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZjR7-0004V1-2o;
	Thu, 10 Jul 2025 05:03:09 +0000
Date: Thu, 10 Jul 2025 13:02:40 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lunn:b4/v6-16-rc4-net-next-leds-netns 2/6] ERROR: modpost:
 "net_passive_dec" [drivers/leds/trigger/ledtrig-netdev.ko] undefined!
Message-ID: <202507101208.bcU16OB1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git b4/v6-16-rc4-net-next-leds-netns
head:   0b6e48013be06d27873eb6ab1e4f0016a5e4a97f
commit: 1c56a8561900d668d074a73933e952efc20828a8 [2/6] leds: ledtrig-netdev: Remember netns when cat to /sys/class/leds
config: sparc-randconfig-r121-20250710 (https://download.01.org/0day-ci/archive/20250710/202507101208.bcU16OB1-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 10.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250710/202507101208.bcU16OB1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507101208.bcU16OB1-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "net_passive_dec" [drivers/leds/trigger/ledtrig-netdev.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
