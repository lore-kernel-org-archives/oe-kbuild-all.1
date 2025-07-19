Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09A41C861E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Jul 2025 23:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752969258; cv=none; b=qYPM1kYaXtpoiIJ/Vfht3FVIOM4pE4Jrg7SGqz2MTvMKcAz0t28hMKy9SG1IxJ3FZPYJiycbwVcFDA4bsCwYj3yAPi06LQKf99YsnV2pZymuqw0M+E8kG3Gv/ol1xNLpeoTsBwO+e9CuFJoOUzy/Uvkfpqs2zZrBFaKhhhNQFAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752969258; c=relaxed/simple;
	bh=k42ZPcELF09Ls0CPn8uX8PXyG0mSH6okYho0N+tutak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M1BbCj7QwhEOpLNMI6I5SgIr4emFLhNqGv9jfvrrq3ztsyhUTwnA+Z1kvee8k1Qyl6C1N1pKSWYcPZIEP/wcVgL+YDQIgsDhd31E05movqStg7V/mL4a8/E42SBv2gWzSAvXfs/IwZAVwwtHzyDUPe9LnHj0jVzbU7kKXdHiWnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eJ40ujfB; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eJ40ujfB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752969257; x=1784505257;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=k42ZPcELF09Ls0CPn8uX8PXyG0mSH6okYho0N+tutak=;
  b=eJ40ujfBjwhwo4QYNoIGXgZyQ1Vc0rIHxh4AQiJR+24oAb8tnj9RP0u0
   CbPlm6zbyz/8kzqZ6R93DNHhRx/gnyV/YSS+xd38q8P5AM4For4ol1pXb
   yqO0FXWVNlJSUkBzGID1PEKjBhGb7ETmaLC3tCfKRlqNC2RZjA0hkslH9
   5FSjiMv3jQkB2wzqGrZvbnZS3zKHXW3CaikrEtLSjPP0zMQf4HWFgJIKy
   fDVFxUx0GGSketm2bZl3Gy3VBXph1kwjF/s9VJTla6Cg9nS4cIswCN+7d
   gfZWZlWBkob+VuiUYfHiSFpOeZr0zgrfyWkzZ1nMKtreSk/CG0nl2jLQz
   Q==;
X-CSE-ConnectionGUID: v0Zug0anSoWKaTBOttLKKw==
X-CSE-MsgGUID: MJJjfPQ3QhmWz3hNkxJ0/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11497"; a="59013249"
X-IronPort-AV: E=Sophos;i="6.16,325,1744095600"; 
   d="scan'208";a="59013249"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2025 16:54:16 -0700
X-CSE-ConnectionGUID: ZwuDnb1nTeqYaxipw8Mp2g==
X-CSE-MsgGUID: yfSCdcFWTWGwX7fLSqMdxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,325,1744095600"; 
   d="scan'208";a="164009199"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 19 Jul 2025 16:54:14 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udHNc-000Fqb-1F;
	Sat, 19 Jul 2025 23:54:12 +0000
Date: Sun, 20 Jul 2025 07:53:29 +0800
From: kernel test robot <lkp@intel.com>
To: jeff_chang@richtek.com, lgirdwood@gmail.com, broonie@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, jeff_chang@richtek.com
Subject: Re: [PATCH v2] regulator: rt5133: Add RT5133 PMIC regulator Support
Message-ID: <202507200730.Lj2qVDqU-lkp@intel.com>
References: <20250718081052.2685826-1-jeff_chang@richtek.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718081052.2685826-1-jeff_chang@richtek.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-regulator/for-next]
[also build test WARNING on linus/master v6.16-rc6 next-20250718]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/jeff_chang-richtek-com/regulator-rt5133-Add-RT5133-PMIC-regulator-Support/20250718-161216
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20250718081052.2685826-1-jeff_chang%40richtek.com
patch subject: [PATCH v2] regulator: rt5133: Add RT5133 PMIC regulator Support
config: alpha-kismet-CONFIG_OF_GPIO-CONFIG_REGULATOR_RT5133-0-0 (https://download.01.org/0day-ci/archive/20250720/202507200730.Lj2qVDqU-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250720/202507200730.Lj2qVDqU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507200730.Lj2qVDqU-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for OF_GPIO when selected by REGULATOR_RT5133
   WARNING: unmet direct dependencies detected for OF_GPIO
     Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
     Selected by [y]:
     - REGULATOR_RT5133 [=y] && REGULATOR [=y] && I2C [=y] && GPIOLIB [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
