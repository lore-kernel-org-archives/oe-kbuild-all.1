Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C768F242D88
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Jul 2025 11:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753530281; cv=none; b=N9axVTWSm8XAQhzKD+MP7VPz6dEWIgsZxiXupodPyhlVcvTRIsi/vY9lS+nvHvCUQNW/xjds65NXtGdLTArprypV2ie8TuBqLLUwN4w1EflwM8oOdjad/65HPyW3wtEnCM2kP+WS01KPrDxQe9qtDreb3aaTJWENB4M3L0oDCNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753530281; c=relaxed/simple;
	bh=uyQ3hvel8FiTzLIIOnoyXPtaBzDUCYEs67gUItksXts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gP3GG40M3XDobFUNKCv1dNW4+QfNvklDwm1pz0FTvhf2VnNOh5xU+CndVAfLZAVPRVOJb29vFq7OVq5dcSpF/fciqXBZOoycBg1t+Rm9TEYBJeXtDh/ZKze8WD9Ehc9MoUQyvh756bEts6PQu9T3/jBnlgR4RCu0VjB1WkJNJFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FbS2mgjz; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FbS2mgjz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753530280; x=1785066280;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uyQ3hvel8FiTzLIIOnoyXPtaBzDUCYEs67gUItksXts=;
  b=FbS2mgjz7nimKALdc/SSShMVJIKLZywDrTwvBfidG+yGXs8ulzTmcNY9
   zzitcHJ7kqPnRioW/Xq6rV12otXPDxN4nsrfcVQMHD/6Qx5BHOLSqHy7C
   lxovj/upRzKDgevgG70InYySB/DGdN1rcFMK7KOh9mAaaYh9z198gPCoZ
   A6GA/iyqljU0TWDL01B8tTdtMeRAled0l4xgrvKiU0QAIaCOUbnWqFqXb
   2nW9mi1/n6qmYH7HZjmBSpVKkZpfIE+10PAbYg3QiI0SSoeI/vCdkUyG2
   rnPHuFV56lLXj/g51DYU7UFOx+3DeSv+Ti2GaMY5e/vCvyDEJ9c72ViVP
   Q==;
X-CSE-ConnectionGUID: zslXZg7eT5up9T5X5BSRhQ==
X-CSE-MsgGUID: PrUZLAF4RhSnF6ORkOfV/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="78399358"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="78399358"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 04:44:38 -0700
X-CSE-ConnectionGUID: ZRS6btumTZONS6dS3GNfJQ==
X-CSE-MsgGUID: tO90XUDlTnipKFCUTloRGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="161854318"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Jul 2025 04:44:35 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufdKK-000LwN-1g;
	Sat, 26 Jul 2025 11:44:32 +0000
Date: Sat, 26 Jul 2025 19:43:57 +0800
From: kernel test robot <lkp@intel.com>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 1/4] platform/x86: (ayn-ec) Add PWM Fan HWMON Interface
Message-ID: <202507261959.HASYxpK8-lkp@intel.com>
References: <20250725004533.63537-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725004533.63537-1-derekjohn.clark@gmail.com>

Hi Derek,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on linus/master v6.16-rc7 next-20250725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Derek-J-Clark/platform-x86-ayn-ec-Add-Temperature-Sensors/20250725-084850
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20250725004533.63537-1-derekjohn.clark%40gmail.com
patch subject: [PATCH 1/4] platform/x86: (ayn-ec) Add PWM Fan HWMON Interface
config: i386-kismet-CONFIG_LEDS_CLASS-CONFIG_AYN_EC-0-0 (https://download.01.org/0day-ci/archive/20250726/202507261959.HASYxpK8-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250726/202507261959.HASYxpK8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507261959.HASYxpK8-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for LEDS_CLASS when selected by AYN_EC
   WARNING: unmet direct dependencies detected for LEDS_CLASS
     Depends on [n]: NEW_LEDS [=n]
     Selected by [y]:
     - AYN_EC [=y] && X86_PLATFORM_DEVICES [=y] && ACPI [=y] && HWMON [=y]
   
   WARNING: unmet direct dependencies detected for LEDS_CLASS_MULTICOLOR
     Depends on [n]: NEW_LEDS [=n] && LEDS_CLASS [=y]
     Selected by [y]:
     - AYN_EC [=y] && X86_PLATFORM_DEVICES [=y] && ACPI [=y] && HWMON [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
