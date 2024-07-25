Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891BA17999
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jul 2024 03:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721878855; cv=none; b=tDxcA+ku6OkAmu0KsmxCi25rLEdBRbPOP4fsaEvyLmR9Fw7H1TR41rrRma9ob1NDSiIdPUGsRfNxHHiKAb4Hidfwxdb5geA0IRm+QjbWgd795FDJZoY4iUs0v67ukRbFK0iNAUmvKjtGFEcP8m4kJKU3hQIzB0b5Jwy7/udIMLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721878855; c=relaxed/simple;
	bh=+/SfHcWvZuzX5BpxFTHb0SOKVhDlmAD0pvwxtii3/9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=txN/ynO6ULqzjzfq7PSkp2Hxj/zfU6whVQ4bgncgl3d6DyNFwapwbkRvU2CrYn1/JhmodU4Z1xXTqYCR/uoxkH/uOsbWCNFPMjH3WnwXGn7Q2xDzqyDv5QVR4HVFeov7pALCxxX0wgVAEIDWFkkYOY3JsSC9Qz+78ncrs+/2o+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KnjgLuCw; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KnjgLuCw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721878852; x=1753414852;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+/SfHcWvZuzX5BpxFTHb0SOKVhDlmAD0pvwxtii3/9s=;
  b=KnjgLuCw25nAAIEvjVqgnRBFlDqkWM/Q7Zc7eoY2ExFz2OPipfxNBGMu
   bg5RjX7Np2dlIhdkvegBTgv9WjAL4U0uhs1ItvVOCYWXCONrkIbJiZgjj
   V17PiO5l7TTQpww+f3TAmLRfNI7A7mjvikqs5tDjgIhTrdVlrBhiAd37R
   sVsJ27JH8Mx4QTVr16jZaS5Ri0z/688h1Y1l1nC258N0Mc6Pc14BRAvc6
   f2kygMDaVjmxpVkPZ94LIKG/CNwtIp7Dr/thFrdM+oamqWH1Rc2Kr3dZZ
   H7iwSR4iVNtIYGkJKQpwFR1yHxo/B6mkCPe2zPGntIjLlGCnHIBw+elc7
   A==;
X-CSE-ConnectionGUID: GBP8s5yWQs6ff0/wKesQ6Q==
X-CSE-MsgGUID: szeMcgZ3SS6J1MIf5KiZIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="31011510"
X-IronPort-AV: E=Sophos;i="6.09,234,1716274800"; 
   d="scan'208";a="31011510"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 20:40:51 -0700
X-CSE-ConnectionGUID: OPYShQlcTvOHVabSwQwkdw==
X-CSE-MsgGUID: D07xcoM9SzSpX0iEQmX2Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,234,1716274800"; 
   d="scan'208";a="52817584"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 24 Jul 2024 20:40:48 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWpLR-000nii-1V;
	Thu, 25 Jul 2024 03:40:45 +0000
Date: Thu, 25 Jul 2024 11:40:08 +0800
From: kernel test robot <lkp@intel.com>
To: Carlos Ferreira <carlosmiguelferreira.2003@gmail.com>,
	hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, mustafa.eskieksi@gmail.com,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	Carlos Ferreira <carlosmiguelferreira.2003@gmail.com>
Subject: Re: [PATCH v4 1/2] HP: wmi: added support for 4 zone keyboard rgb
Message-ID: <202407251136.aymIqEw3-lkp@intel.com>
References: <20240719100011.16656-2-carlosmiguelferreira.2003@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240719100011.16656-2-carlosmiguelferreira.2003@gmail.com>

Hi Carlos,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-leds/for-leds-next]
[also build test WARNING on v6.10]
[cannot apply to linus/master next-20240724]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Carlos-Ferreira/HP-wmi-added-support-for-4-zone-keyboard-rgb/20240719-180603
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/20240719100011.16656-2-carlosmiguelferreira.2003%40gmail.com
patch subject: [PATCH v4 1/2] HP: wmi: added support for 4 zone keyboard rgb
config: i386-kismet-CONFIG_LEDS_CLASS_MULTICOLOR-CONFIG_HP_WMI-0-0 (https://download.01.org/0day-ci/archive/20240725/202407251136.aymIqEw3-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240725/202407251136.aymIqEw3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407251136.aymIqEw3-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for LEDS_CLASS_MULTICOLOR when selected by HP_WMI
   WARNING: unmet direct dependencies detected for LEDS_CLASS_MULTICOLOR
     Depends on [n]: NEW_LEDS [=n] && LEDS_CLASS [=n]
     Selected by [y]:
     - HP_WMI [=y] && X86_PLATFORM_DEVICES [=y] && X86_PLATFORM_DRIVERS_HP [=y] && ACPI_WMI [=y] && INPUT [=y] && (RFKILL [=y] || RFKILL [=y]=n)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
