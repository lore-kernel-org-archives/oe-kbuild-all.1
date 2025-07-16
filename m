Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFDF2877D9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Jul 2025 07:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752651889; cv=none; b=t8FNGQI+kNBf9LxnDkYurzvH0i2aQzwPmpRIiLYFTYnKwdCZz1aPQTDRhcfX7oy+8CuJ+TRR2R5qbwDlS3Zf5Fhjvgsue1FPWBP6J+FLIIu8EvUIAcG+1z6MehoQk1sZMqQFzDpzk4MlAZIyq3EWnMV7KFvoS9hXxjSbEM9DXMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752651889; c=relaxed/simple;
	bh=rakUwOidur4ow2ll0FZlBfrzzDi2qZ2wFlnPMfyI4NA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ia4ChMB6jQ4gYNPCOfQpDVMrK2+dYZKf5he+KdYwqTcsPDUzXOoaHlYHs+sVKpQvYrT1O8Zt5l8EyxEP6chA2gSw7Ub+R7GoLrHWbiiUKZGaVFZx+5v44T++DOBofiByfW0tNTqI6NLwdSr9rP8cyDOzWDhHHl6zjJWCZye8bj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m2Q/crDd; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m2Q/crDd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752651887; x=1784187887;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rakUwOidur4ow2ll0FZlBfrzzDi2qZ2wFlnPMfyI4NA=;
  b=m2Q/crDdgCr/xu5nZDEPsoZYacqVoPQsX/iE2fRPGEmiPrydrYXtH69Q
   g2WhzxoutoM+tkPjlRf2nDUfywjsjYnV6LNI4v8D9Xbxdgn0iC4Z1SfIj
   GYP8QH5QgaI8lzCbLyv/IzcQWJEFTm6ZY9l/CDpwpEE7I6QssVy6r7aY3
   g0vJ/IuvQXKQntsdpzrJ5phvg+bkeBueTPbQUKsfcou+OSmTpEnhJEfkT
   mUXqRx/ha9zqxlOZCQ/UQew+Ro71gdU7S1jrpd9SMDZkUSwv2xP9JFdZO
   X2YgoNyOI9TBUEdDQLEUa1xsv8tFCFgag6C9LYx6BeYimH1DQbTvYfmqB
   g==;
X-CSE-ConnectionGUID: 2sdGXPSrQ3S+oXuI9xLlFA==
X-CSE-MsgGUID: LX0GnhNaTBCLUW/DmyKzng==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="55036697"
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; 
   d="scan'208";a="55036697"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 00:44:47 -0700
X-CSE-ConnectionGUID: M1j9vfWJRxC+oysMlnebtw==
X-CSE-MsgGUID: zyEkj1I3QwWjD+2/1+tvcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; 
   d="scan'208";a="157096427"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 Jul 2025 00:44:44 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubwok-000C4F-1V;
	Wed, 16 Jul 2025 07:44:42 +0000
Date: Wed, 16 Jul 2025 15:44:04 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Anderson <sean.anderson@linux.dev>,
	Jonathan Cameron <jic23@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, linux-iio@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Andy Shevchenko <andy@kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: Re: [PATCH 7/7] hwmon: iio: Add alarm support
Message-ID: <202507161550.frzFNyCa-lkp@intel.com>
References: <20250715012023.2050178-8-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715012023.2050178-8-sean.anderson@linux.dev>

Hi Sean,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on groeck-staging/hwmon-next akpm-mm/mm-nonmm-unstable linus/master v6.16-rc6 next-20250715]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Anderson/math64-Add-div64_s64_rem/20250715-092337
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20250715012023.2050178-8-sean.anderson%40linux.dev
patch subject: [PATCH 7/7] hwmon: iio: Add alarm support
config: i386-randconfig-063-20250716 (https://download.01.org/0day-ci/archive/20250716/202507161550.frzFNyCa-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250716/202507161550.frzFNyCa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507161550.frzFNyCa-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hwmon/iio_hwmon.c:25:1: sparse: sparse: symbol 'iio_hwmon_listener_lock' was not declared. Should it be static?
>> drivers/hwmon/iio_hwmon.c:26:1: sparse: sparse: symbol 'iio_hwmon_listeners' was not declared. Should it be static?

vim +/iio_hwmon_listener_lock +25 drivers/hwmon/iio_hwmon.c

    23	
    24	/* Protects iio_hwmon_listeners and listeners' refcnt */
  > 25	DEFINE_MUTEX(iio_hwmon_listener_lock);
  > 26	LIST_HEAD(iio_hwmon_listeners);
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
