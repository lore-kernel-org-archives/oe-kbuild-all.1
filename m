Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AFC111BF
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Mar 2025 04:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741409179; cv=none; b=AYKgfhaRJ3bPiSc998kSUdBpHGak5ZWMiJpNfpcq5g4fiV7dppLeN/BjomnONo1z9ipKUfPujdaome1xZQPQIdUwi/hnWTgTfuFQSOxhtVNTF77MeQ0K62b0PAoxZl8vXQDu550tSH6qOHdb7eUm3cXeLHppruej/OtzTmxut4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741409179; c=relaxed/simple;
	bh=ZotRG5vvdUihfgpOjjqtD3WasKhEXexinN5gPnvIpZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B/zWgUafbSyP1NXZFt2YyODq/Dnjlx6y+30eCbPWEVE9sSlq8h/UVu3vsoe//x4HCppnbK/tPBfv+sFMXRpCOag19OxLHdLpEOcw9jc5rkogvim3LInYxExlj3vAYR9Pu9IMAiT2/6/6Cttatm7H5oEagVsvdRWN4slAaxpIDl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cP0MXwig; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cP0MXwig"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741409176; x=1772945176;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZotRG5vvdUihfgpOjjqtD3WasKhEXexinN5gPnvIpZ4=;
  b=cP0MXwiglwkjXcNRXKBSWMQwtDpUZLXNqDhihxa9mNQoaqtsu3lKy3QJ
   uojPbJKTAsT2tmL4COC1+YIJjQ1YzMWy/6zr9wIuivfGrmzEIWe9Ilcmc
   zH80nLiyxQcf1IVwD+PSwr9zeNE0b+o2yrR+/2xRvCz9PHBbGC2wuzvJn
   2J/9qk6DmVx9xbu5VqGHAkhwe3T3FojMDoQudA8NIknj0oYriXp1JtjiG
   03EW4+baRmJYqreS6RvgIU8yUuvoiQyuPO45ALbGbNA2bQr5bbMHUupRg
   /Ez2X3bCwjnA/MaLPrdIc/x2LjmZ8INU3+xS8OZ7HDf945huX/wV6UP8h
   A==;
X-CSE-ConnectionGUID: bvDSBnYNTc+FDxp1NPvagg==
X-CSE-MsgGUID: YSQihJtTSj6dA3pzM6MbVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="42664401"
X-IronPort-AV: E=Sophos;i="6.14,231,1736841600"; 
   d="scan'208";a="42664401"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 20:46:15 -0800
X-CSE-ConnectionGUID: 1kfAgvWMSvSs+udDuOglTg==
X-CSE-MsgGUID: fAMjztXaSseuIXQGOd7abw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,231,1736841600"; 
   d="scan'208";a="119484036"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 07 Mar 2025 20:46:14 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqm4h-0001V6-2p;
	Sat, 08 Mar 2025 04:46:11 +0000
Date: Sat, 8 Mar 2025 12:45:15 +0800
From: kernel test robot <lkp@intel.com>
To: Dongcheng Yan <dongcheng.yan@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v7] media: i2c: add lt6911uxe hdmi bridge driver
Message-ID: <202503081231.GnB3FBs8-lkp@intel.com>
References: <20250306060427.859679-1-dongcheng.yan@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306060427.859679-1-dongcheng.yan@intel.com>

Hi Dongcheng,

kernel test robot noticed the following build errors:

[auto build test ERROR on d98e9213a768a3cc3a99f5e1abe09ad3baff2104]

url:    https://github.com/intel-lab-lkp/linux/commits/Dongcheng-Yan/media-i2c-add-lt6911uxe-hdmi-bridge-driver/20250306-140642
base:   d98e9213a768a3cc3a99f5e1abe09ad3baff2104
patch link:    https://lore.kernel.org/r/20250306060427.859679-1-dongcheng.yan%40intel.com
patch subject: [PATCH v7] media: i2c: add lt6911uxe hdmi bridge driver
config: x86_64-randconfig-077-20250308 (https://download.01.org/0day-ci/archive/20250308/202503081231.GnB3FBs8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250308/202503081231.GnB3FBs8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503081231.GnB3FBs8-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "cci_read" [drivers/media/i2c/lt6911uxe.ko] undefined!
>> ERROR: modpost: "cci_write" [drivers/media/i2c/lt6911uxe.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
