Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822FC442107
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jul 2026 14:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785423399; cv=none; b=eAxSSnal7z8nWYJbIFMY1wPeuaC/s2eivDfKsg4Si5AQtJdWUubAaPjdtqopqVhLL3dJ06gpB772YgLajZjgMRQagWk5nBYCefdadP8irQIQn2ulCI3B/76DV+uITBYDstIeJdHqVEA7tr232En0EFVpxS1yssa/elNK1Bv0d0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785423399; c=relaxed/simple;
	bh=hyf62TUWEI8LXVKx93HmK59s7o4t3RBCAyzWC9YNJYU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Sje0GGlSsNAe6CHIBiLTGETP3X5BMpNZBR2lHfn4Y8xKbjb28yJfX3aOvTesEwEAqIIcx6p3ovZRo8STzuHtNl3Zzbl6lZImkVy18sgI+D0dlmJzUz3GCD8AGwMzj0nqqgHMuiaHsQKKZBdZaGHCrSOLYKHQHYofJmCo0j8s3h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VXWifYKs; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VXWifYKs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785423397; x=1816959397;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hyf62TUWEI8LXVKx93HmK59s7o4t3RBCAyzWC9YNJYU=;
  b=VXWifYKsBduFKNqCjL9p2STB3parUFNJpd0laFBqSvAefy1YcbzRHJFG
   mjI5egfIlOXssIoYp2MNlD2+I3ELAfCaUSaCXpWvzK6tyg0duLtkPNENk
   Jj6UHN07CXPw28YLDzYTqf6iNvvSMkaoBUGyrBTbo7GGwG/Op/idaH8PH
   Q7ACcomvmuccuxtcWikVNo6UIFPSqYPVGkerN9rokhaKI3hasQKBXjisv
   N1NAicddUzOd1QqjqyHyBYrfROULTXaxSWAP4E288+BzhqUKi3evuutVj
   cTuQQzkDojDqZzb01eObOnGgHay68ggbBXTkM5jbq6xQb/8zGwZ7Xhh1K
   A==;
X-CSE-ConnectionGUID: flh9T+5hQ6mknYudU91alQ==
X-CSE-MsgGUID: 96LpiTo6QFumnziA0Xv1bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="97558573"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="97558573"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 07:56:36 -0700
X-CSE-ConnectionGUID: W+s6oOuaRyKURE1QKmiU4w==
X-CSE-MsgGUID: pbfR5FyVQBq6eb7CJPaH5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="264599135"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 30 Jul 2026 07:56:36 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpSBV-000000002Oq-0ON2;
	Thu, 30 Jul 2026 14:56:33 +0000
Date: Thu, 30 Jul 2026 16:56:11 +0200
From: kernel test robot <lkp@intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, shiqingd <qingdong.shi@intel.com>,
 "Amadeusz =?utf-8?Q?S=C5=82awi=C5=84ski"?= <amadeuszx.slawinski@linux.intel.com>
Subject: [intel-lts:5.15/android_t 1/1] kismet: WARNING: unmet direct
 dependencies detected for SND_SOC_DMIC when selected by
 SND_SOC_INTEL_AVS_MACH_DMIC
Message-ID: <202607301629.HuXMnl7s-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/intel/linux-intel-lts.git 5.15/android_t
head:   cae1f18703f8b6ecf8a9d232c494bdd5130e6992
commit: de692204713be32e05da7a35e4fde9aca288e4d1 [1/1] UPSTREAM: ASoC: Intel: avs: Add DMIC machine board
config: alpha-kismet-CONFIG_SND_SOC_DMIC-CONFIG_SND_SOC_INTEL_AVS_MACH_DMIC-0-0 (https://download.01.org/0day-ci/archive/20260730/202607301629.HuXMnl7s-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260730/202607301629.HuXMnl7s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607301629.HuXMnl7s-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_SOC_DMIC when selected by SND_SOC_INTEL_AVS_MACH_DMIC
   WARNING: unmet direct dependencies detected for SND_SOC_DMIC
     Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && GPIOLIB [=n]
     Selected by [y]:
     - SND_SOC_INTEL_AVS_MACH_DMIC [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_INTEL_AVS [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
