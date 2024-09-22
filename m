Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8176FBF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Sep 2024 14:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727015761; cv=none; b=P1NsXkOc4dsNcHxUdZ89yYasb+cI3FWYfjItd0kDTuzAcDuV5wWNMHxYYHeeISkqkT+JtFlC55BkLdGC5Bru3TbjDVR4g8rFFzVe4T/b3Hu3J2MAD5W9L9Ih6IGLBLGnzCU4lMrO1XFjwX6jjveSp5VRZr7ouCePu68Sx/MKZ5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727015761; c=relaxed/simple;
	bh=MgBrF8Sihn06O4NfpD4mZkdZrwfHrkD3e11Tj7IRdyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O7sAghSjhYPPyHmPGTf9qOqXs3EknpB8oA901dTxh7C8IqgridjfFpU4GJCrCr61lentW9Y1ItAOcCI/mWGynuucskbEFT3JHU/sBtqtKJ85l0JvXe7LQLN39MoiMIW43CriOKqv2jStqk/RTdgUwUxNZsXaSI+Cu2+8HHh+ENI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e4GikoQu; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e4GikoQu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727015761; x=1758551761;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MgBrF8Sihn06O4NfpD4mZkdZrwfHrkD3e11Tj7IRdyM=;
  b=e4GikoQu8p21reNYupPNAJQw8PC5JYEIB0k/1P0zyV2utx0S5fgvZBJ3
   wuBB0hjRQbe5wjiW7fL0Cf9fJlXcIbS+533TTCiS/g16AwEo6hE6bupGk
   m9yAp/ponVt8pZv3wYEE/i1AYBKVNxs/gCiyOl57kFVVKOOdoQxUfzgZK
   IzLq1BSEHWewrA36nlPyn11TMvy1ynQFIPkheSRbnEMmWMUIZuFiOv7od
   rvsGYxh2a3X9CnH3pmQFzClqmaD3fFUlBBXOZ9o3pWCGwAAdHoq587atT
   X0NoFwNz+HPW2Y5KeQxY+65WY2U5kBM+WxNCQZkID1ckP9vzpaFmM/Fd8
   w==;
X-CSE-ConnectionGUID: 0RhboBXrSlukaPjOyTkJzQ==
X-CSE-MsgGUID: BQxFNl9/RsOM0BVnkJBaeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="48491962"
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="48491962"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 07:36:00 -0700
X-CSE-ConnectionGUID: 7AzAfHvITCmOcnJWAv7D4Q==
X-CSE-MsgGUID: Ps3lp4cIR2WDiOm+/iWsug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="70962687"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 22 Sep 2024 07:35:55 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssNgn-000GNM-0d;
	Sun, 22 Sep 2024 14:35:53 +0000
Date: Sun, 22 Sep 2024 22:35:25 +0800
From: kernel test robot <lkp@intel.com>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Subject: Re: [PATCH v3 3/4] gpio: siul2-s32g2: add NXP S32G2/S32G3 SoCs
 support
Message-ID: <202409222107.1XGvOBqS-lkp@intel.com>
References: <20240919134732.2626144-4-andrei.stefanescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240919134732.2626144-4-andrei.stefanescu@oss.nxp.com>

Hi Andrei,

kernel test robot noticed the following build errors:

[auto build test ERROR on brgl/gpio/for-next]
[also build test ERROR on driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus robh/for-next linus/master v6.11 next-20240920]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrei-Stefanescu/drivers-provide-devm_platform_get_and_ioremap_resource_byname/20240919-215018
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20240919134732.2626144-4-andrei.stefanescu%40oss.nxp.com
patch subject: [PATCH v3 3/4] gpio: siul2-s32g2: add NXP S32G2/S32G3 SoCs support
config: powerpc-randconfig-r133-20240921 (https://download.01.org/0day-ci/archive/20240922/202409222107.1XGvOBqS-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240922/202409222107.1XGvOBqS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409222107.1XGvOBqS-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test_module.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/usb-serial-simple.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_userspace.o
>> ERROR: modpost: "__udivdi3" [drivers/gpio/gpio-siul2-s32g2.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
