Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768E1282FA
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Apr 2025 02:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744164697; cv=none; b=fAzjCVNFQR3ycDDCBdMZP12kXkprKVW5ZLoi8wkX+8A81MUjjeKDdzTx1ZVGkAg0tMmVaa1/GZsYBlxZZAU0HrwLWhMI+1qtlIh8LUy/g19yLiWNu4mSnp43/M5nYsC1uowP1xvkUlxXePSrbwauWQ7ENYbPEe+ikw2oX6thxhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744164697; c=relaxed/simple;
	bh=lT4dqsZsNby/RxWe7UXu1FK1U8SrjaI3u2qqJIvaq70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z6zEHgpZXAikBZpS+MFA0cIeRxXJLDq4BeetK3ZVmCX47WuPs7DY5HdGnOyVIlSw0MARtY/8NuIIobB17LGxMRDYIIP8lqsr/3atmvMq8Aan8eGt4rYOfOexRbCetroSZC1p5yqWfjIoStEG8OCJxgq+sfJKvD7Q0A9a5ScSnOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=div3gxco; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="div3gxco"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744164696; x=1775700696;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lT4dqsZsNby/RxWe7UXu1FK1U8SrjaI3u2qqJIvaq70=;
  b=div3gxco6I5HToPOoQFiRAwUXj4PSUjPjX67mc4d9oGiw49BXVGeBiBH
   LtaIjZm/Hm59+HE79n01NewpO+z/fvU4JGSyCtq84oBXZcHRIhl0+qRpB
   /WI7Qh3IqYfDz8MstO2RsjKmscm2UhYPqF6X8qH7ddGbX4A4BSEu2eRdG
   zdmPOSOoOlpFxkddNOl9DPKGHTni7s6u3WLFXnWIjfbDiWThw3gXTmojq
   3O91uponSuCDyB3t2Q6bKSJTwYqR3h2qd5dp8cYugaMpfHiqR/ZLwmA4V
   yqXq/IgJslEMLBi9lsj3TQqRFzpFWZIv8Tpw0fvqVWwIlGMzsIG2t9XCO
   w==;
X-CSE-ConnectionGUID: LakRGB5PS+ORGkz5/el4iQ==
X-CSE-MsgGUID: 6jlFKbsIR7eTWymijcEYAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56992188"
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="56992188"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 19:11:33 -0700
X-CSE-ConnectionGUID: cCallOZRSo2s10FfnaQZBw==
X-CSE-MsgGUID: 28+2TRLDQiCcIefEoK0KNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="128298421"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Apr 2025 19:11:31 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2KuW-0008B9-35;
	Wed, 09 Apr 2025 02:11:28 +0000
Date: Wed, 9 Apr 2025 10:11:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jelle van der Waa <jvanderw@redhat.com>,
	Sebastian Reichel <sre@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Hans de Goede <hdegoede@redhat.com>, linux-pm@vger.kernel.org,
	Jelle van der Waa <jvanderwaa@redhat.com>
Subject: Re: [PATCH 1/1] power: supply: support charge_types in extensions
Message-ID: <202504090859.yXF0zkoj-lkp@intel.com>
References: <20250407201845.332348-2-jvanderw@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407201845.332348-2-jvanderw@redhat.com>

Hi Jelle,

kernel test robot noticed the following build warnings:

[auto build test WARNING on sre-power-supply/for-next]
[also build test WARNING on linus/master v6.15-rc1 next-20250408]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jelle-van-der-Waa/power-supply-support-charge_types-in-extensions/20250408-045501
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply.git for-next
patch link:    https://lore.kernel.org/r/20250407201845.332348-2-jvanderw%40redhat.com
patch subject: [PATCH 1/1] power: supply: support charge_types in extensions
config: csky-randconfig-001-20250409 (https://download.01.org/0day-ci/archive/20250409/202504090859.yXF0zkoj-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250409/202504090859.yXF0zkoj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504090859.yXF0zkoj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/power/supply/test_power.c: In function 'test_power_battery_property_is_writeable':
>> drivers/power/supply/test_power.c:148:20: warning: suggest parentheses around comparison in operand of '|' [-Wparentheses]
     148 |         return psp == POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR | POWER_SUPPLY_PROP_CHARGE_TYPES;
         |                ~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +148 drivers/power/supply/test_power.c

   144	
   145	static int test_power_battery_property_is_writeable(struct power_supply *psy,
   146							    enum power_supply_property psp)
   147	{
 > 148		return psp == POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR | POWER_SUPPLY_PROP_CHARGE_TYPES;
   149	}
   150	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
