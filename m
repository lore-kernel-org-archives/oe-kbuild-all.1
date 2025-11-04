Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BB62F8BE6
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Nov 2025 13:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762262098; cv=none; b=uOtpf0zs00tTJxp0Q5SD8SHxVwHSKxMmylHeNPR43PPB2oy5rEbA4e8Urovq84vARt9p/ys1OBt4Chv3Kluxiw3pydieSuaD4r1X/yy9oq/+R/wflsY3Zonwsdd88uvc2utxsE64r0rWt35wNS7slVGu2tKNTYToEt+c7DyEa5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762262098; c=relaxed/simple;
	bh=ZEU8FvkHiwIhUuKOfPNCnyWW5StZUux0a+VENGL9yng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AzaEdaYlhXVTHlTAHCtmkVh6izVVuNCU/YxvcwRo1UmflG4WaK10GrmOsZ/rMYCKbNTGvpXhHni+ECtaeW67NhJyNoCtLonspvT6IgsggI0NIwWwJpz2OH/QusJnstN65dShTirKsnQ4MnnYoxu/+NwVfINajRanGA957SjaTcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WLesqKx6; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WLesqKx6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762262097; x=1793798097;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZEU8FvkHiwIhUuKOfPNCnyWW5StZUux0a+VENGL9yng=;
  b=WLesqKx6CJCdtkXxI519kQw5zIF/7H5HQqtLazIS2uhbkHSjCS1pIMGG
   PCIWif0+ZxdYZ5Da5mlmvfAG/DZt+w5ejeYIqKrXJou8F29FmgXi2wxs4
   RAWj5zWeHdWfP54nPHWkXXYaCYTgL9CxCtFCTSXwSA/lLw8G4o9ynLfbJ
   Zi1xIbfuayq0gjCbba//eGeyrgL+DC/sFBQ83wL5E4AWW1lrujXnhSdSc
   0t3YSlVcXO8dveW19HHneYQOgmV1WzPLfQ9ucW8GRXvoKPn9hK2Qfu87a
   +WpWv3EMYuua+cNUfFmg3NWu+oT26cqMHngTJywQWmlzwegLxlYuHc7GD
   A==;
X-CSE-ConnectionGUID: Oc3hpPgtQAedqm5hSJ9AJQ==
X-CSE-MsgGUID: +S1k9ZwnQgeobAC2IcGUcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="75465263"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="75465263"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 05:14:57 -0800
X-CSE-ConnectionGUID: dCqmaljzTcyrDLfwN0qA1Q==
X-CSE-MsgGUID: jRDMMh8+RIOlcOj7+nYusg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="186833101"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 04 Nov 2025 05:14:54 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGGrl-000RQC-2H;
	Tue, 04 Nov 2025 13:14:41 +0000
Date: Tue, 4 Nov 2025 21:13:07 +0800
From: kernel test robot <lkp@intel.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, andersson@kernel.org,
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, sre@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: Re: [PATCH 4/5] firmware: qcom: scm: Support for EDL reboot mode
Message-ID: <202511042044.FqeSCxnF-lkp@intel.com>
References: <20251103182006.1158383-5-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103182006.1158383-5-loic.poulain@oss.qualcomm.com>

Hi Loic,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on sre-power-supply/for-next linus/master v6.18-rc4 next-20251104]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Loic-Poulain/dt-bindings-power-reset-qcom-pon-Document-qcom-warm-reset/20251104-022140
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20251103182006.1158383-5-loic.poulain%40oss.qualcomm.com
patch subject: [PATCH 4/5] firmware: qcom: scm: Support for EDL reboot mode
config: arm64-randconfig-003-20251104 (https://download.01.org/0day-ci/archive/20251104/202511042044.FqeSCxnF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511042044.FqeSCxnF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511042044.FqeSCxnF-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "devm_reboot_mode_register" [drivers/firmware/qcom/qcom-scm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
