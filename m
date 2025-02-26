Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037BE21D59C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Feb 2025 16:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740586842; cv=none; b=jNt4zMGIchzcKgiPh4VDfaCtNYYkRLPy2A0tsCV+vreWYZgHjKBS3s2nhhRpz+vwTwaCj7m4p7S9QLINqEDp9JNfjl2R2M6fN7olc1METgQobyy9GkWNzaSyK2D/s5vvcef5ByGsdotNXEFKZAtmdKGUgvilzZnHaa+4eKz1cGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740586842; c=relaxed/simple;
	bh=n78AzgIQvgt6EJU2MLmi5NgnjlqvlmpIuzJVJuCkbIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oxPwCSu3JjcMvDwRz5P/+qtENVvF29oSQml/GvHpnbsm6b2ZBfytffyIp6zPw25geTvcqx0wem/pEuARbC0GJj116MziBKSC3XLewdLvXyZXoV5dfT3oMaktbG4oNtzTr2NNmUktjQX7f56GLKt/VzexzDG7uFuvJk+umdQQOX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GkSIIr1l; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GkSIIr1l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740586841; x=1772122841;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n78AzgIQvgt6EJU2MLmi5NgnjlqvlmpIuzJVJuCkbIQ=;
  b=GkSIIr1lZwDMgExK7pO74/Z+28Up9EAc8cZ1dUNQVAD1puxHxNyYGhYt
   K+ao6LL4+WvYpRe4tlLA36qSPtHm4zGWoDIFfIuYxlwIxkLsWwIEqY6IP
   7JOGAVdlRoj9k3dbbv26kqi6smD7DnHhR6fe5hC+I8Ud4wtca1GWcfFR2
   9tCy4TYVHvl84OZxmEswNMqBOIuci4mGVgN5+RyEbfa+nm9msNxsGB2iy
   LF0r8vPcM3H04kQCZ9K6w4ceaTNe1B9NN3I/iaixKG6xMC5T3tisqJxnw
   1NYgecOJGu+06aryuLVE2OH7k7vTE76MXThDlRdoX1/0UrSJ5xcwXxOZ6
   g==;
X-CSE-ConnectionGUID: mp4euj3zQGqsFB/D1N3+5Q==
X-CSE-MsgGUID: pH+U7KTjTwCgKZdhoTm/3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="45223626"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="45223626"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:20:40 -0800
X-CSE-ConnectionGUID: YWf3uE2FShyFUPAK95GdEg==
X-CSE-MsgGUID: HmL9sGpiSOay2pL3WniB1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="121742461"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 26 Feb 2025 08:20:39 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnK9F-000C3X-1C;
	Wed, 26 Feb 2025 16:20:37 +0000
Date: Thu, 27 Feb 2025 00:19:51 +0800
From: kernel test robot <lkp@intel.com>
To: Huisong Li <lihuisong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] hwmon: (acpi_power_meter) Replace hwmon_device_register
Message-ID: <202502262337.HnzBP0zJ-lkp@intel.com>
References: <20250225085158.6989-1-lihuisong@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225085158.6989-1-lihuisong@huawei.com>

Hi Huisong,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on groeck-staging/hwmon-next]
[also build test ERROR on linus/master v6.14-rc4 next-20250226]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Huisong-Li/hwmon-acpi_power_meter-Replace-hwmon_device_register/20250225-171340
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20250225085158.6989-1-lihuisong%40huawei.com
patch subject: [RFC] hwmon: (acpi_power_meter) Replace hwmon_device_register
config: i386-buildonly-randconfig-003-20250226 (https://download.01.org/0day-ci/archive/20250226/202502262337.HnzBP0zJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250226/202502262337.HnzBP0zJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502262337.HnzBP0zJ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-mgr-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-bridge-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-region-test.o
>> ERROR: modpost: "__udivdi3" [drivers/hwmon/acpi_power_meter.ko] undefined!
>> ERROR: modpost: "__udivmoddi4" [drivers/hwmon/acpi_power_meter.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
