Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F082222A9
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Nov 2025 12:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762258211; cv=none; b=TLCMS/TaPjayP2KAQUCoVUxYQYtnL6GFzqU80qGNu6GqZEs/p7jf4l1jlxFd2hTTVdcBQvTA6MFTsTiGfTN2B2zp1Nfk5mQ9KBXlXKAUoQ5hii3uqede7DiOd3EnGIwOYmzs47ftOuhi1JdYlGfKosUQSedKrW41H9byeVrYOWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762258211; c=relaxed/simple;
	bh=+6EJ9lfIc5BbPa0NS7PF2URnPHdRP1lGEnDP8NUd2Ko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xyxjcg0VLS0wabu5JUVgvWBHczJo1nuRZDWNhT7Y3mZDr89IDvYYFfLzhgy1N+/JYA2W4l2dI1eNAl5LfiuJgIh+E6eaKgWzJjrZW5bTWnZmYp3fIQTwLIvO24HrDDfTCuHCDREl+/nPklFopCk7xDuuEXRag6GXfkELgWcprd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G3jTT762; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G3jTT762"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762258209; x=1793794209;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+6EJ9lfIc5BbPa0NS7PF2URnPHdRP1lGEnDP8NUd2Ko=;
  b=G3jTT762gjtACUuGQ+K2fN9asXSGNDMB+i9AS7uU2Tammt9lqON4gASl
   o6kj0Q2oIk19RzMrtnrdBqQ71WVkBTzCkTn2mL5RQFpNAejCBibi3C8rl
   8AhW93wRfjnnPVQHQDXAn81r4hNDlITTQDHd93B4XDPQaLOglH/sDT+/a
   bxtFqeEzl21Per15Bb5l0PHUoafIkjWuKHejb5BMNJG+EzsVk09u1WQ/6
   9U85esTOcoVFFKlpAJiBHLeDcQTn2ePR9c995cq1Q/wKnoQtV8e6sYC/6
   Z9q4+YRy/5zyw7ooceMAXhd+E4Kcpwyaxb43Y+2125OV1TRRZUp6xFsyM
   w==;
X-CSE-ConnectionGUID: 4Oz/jCWiTPGobPaRTyzrpw==
X-CSE-MsgGUID: 4D9Zeok7TNmB9gq+GLtajg==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="75799979"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="75799979"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 04:10:09 -0800
X-CSE-ConnectionGUID: If3LwOHXS9u+PNOfEGfuOw==
X-CSE-MsgGUID: 2Zyy1jrBTjiE0OLk+3zfQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="192232511"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 04 Nov 2025 04:10:03 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGFqz-000RNM-2V;
	Tue, 04 Nov 2025 12:09:43 +0000
Date: Tue, 4 Nov 2025 20:09:31 +0800
From: kernel test robot <lkp@intel.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, andersson@kernel.org,
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, sre@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: Re: [PATCH 4/5] firmware: qcom: scm: Support for EDL reboot mode
Message-ID: <202511041928.at1dqqZH-lkp@intel.com>
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
[also build test ERROR on sre-power-supply/for-next linus/master v6.18-rc4 next-20251103]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Loic-Poulain/dt-bindings-power-reset-qcom-pon-Document-qcom-warm-reset/20251104-022140
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20251103182006.1158383-5-loic.poulain%40oss.qualcomm.com
patch subject: [PATCH 4/5] firmware: qcom: scm: Support for EDL reboot mode
config: sparc-randconfig-001-20251104 (https://download.01.org/0day-ci/archive/20251104/202511041928.at1dqqZH-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511041928.at1dqqZH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511041928.at1dqqZH-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc64-linux-ld: drivers/spi/spi-amlogic-spifc-a4.o: in function `aml_sfc_set_bus_width':
   spi-amlogic-spifc-a4.c:(.text+0x3e8): undefined reference to `__ffsdi2'
   sparc64-linux-ld: drivers/firmware/qcom/qcom_scm.o: in function `qcom_scm_probe':
>> qcom_scm.c:(.text+0x2488): undefined reference to `devm_reboot_mode_register'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
