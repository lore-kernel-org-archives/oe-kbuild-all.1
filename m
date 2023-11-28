Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0F050275
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Nov 2023 22:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tmy+u76+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701211876; x=1732747876;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wM3wen/zQ5ZSPTjW+74T4zK4X2a83GPNtOy766NaVcA=;
  b=Tmy+u76+yZw+IHDzoXLmGWOTcYXF6JyPPx5eCxhudYKcspRRndXXX21v
   alyLSSF7VEil72qqoClOy/WbyWAmf2PQ4YZn2GTql8DZWBXMN2MhmSxU+
   i6/uCFXai8+N353/yI4gNolXd0MMJe1Hsg3xzRLC4zoMr765dzF0WW2uF
   hEsd0jeQghBcwAGzQKz6uXUC07dRVe3SuipyviqmxXOS5OWYOxCkosorq
   WZha06j4sNoNG2P7Ts7YSA4QFYuU1nGOMdqix6zWc19OtIq73+Z4NojwM
   VIJvylUD8N4Yf9IrL+1x3LAg+a54v9b8iMaSDU6lHZE2ongCk90gfjWVE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="6304169"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="6304169"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 14:51:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="839215225"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="839215225"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 28 Nov 2023 14:51:09 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r86v5-0008EB-1M;
	Tue, 28 Nov 2023 22:51:07 +0000
Date: Wed, 29 Nov 2023 06:50:22 +0800
From: kernel test robot <lkp@intel.com>
To: Wentong Wu <wentong.wu@intel.com>, gregkh@linuxfoundation.org,
	tomas.winkler@intel.com, hdegoede@redhat.com
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, andriy.shevchenko@linux.intel.com,
	sakari.ailus@linux.intel.com, alexander.usyskin@intel.com,
	zhifeng.wang@intel.com, linux-kernel@vger.kernel.org,
	Wentong Wu <wentong.wu@intel.com>
Subject: Re: [PATCH 2/2] mei: Add MEI hardware support for IVSC device
Message-ID: <202311290342.lucjHsTH-lkp@intel.com>
References: <1701174846-16316-3-git-send-email-wentong.wu@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1701174846-16316-3-git-send-email-wentong.wu@intel.com>

Hi Wentong,

kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.7-rc3 next-20231128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wentong-Wu/mei-Add-transport-driver-for-IVSC-device/20231128-203609
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/1701174846-16316-3-git-send-email-wentong.wu%40intel.com
patch subject: [PATCH 2/2] mei: Add MEI hardware support for IVSC device
config: x86_64-kismet-CONFIG_INTEL_MEI_VSC_HW-CONFIG_INTEL_MEI_VSC-0-0 (https://download.01.org/0day-ci/archive/20231129/202311290342.lucjHsTH-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231129/202311290342.lucjHsTH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311290342.lucjHsTH-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for INTEL_MEI_VSC_HW when selected by INTEL_MEI_VSC
   
   WARNING: unmet direct dependencies detected for INTEL_MEI_VSC_HW
     Depends on [n]: ACPI [=y] && SPI [=y] && (GPIOLIB [=n] || COMPILE_TEST [=n])
     Selected by [y]:
     - INTEL_MEI_VSC [=y] && INTEL_MEI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
