Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF8D146D59
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Dec 2024 05:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735535300; cv=none; b=EAXZaen2HQuUCMmAgxFFWqfKbQt2DEZV4AhNbdBCjSa9yj/7d9HspbbQL75EPuAyOBAVswHbkzDMuqm6yMRIcyS0XqbI9K8qAmxrayBymK2NUMoS4qkOPZikmLmBCM/mEgdA6tYYuGw4tD8wliFbo/lIDOu1ZVxm+mvRbTVnGCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735535300; c=relaxed/simple;
	bh=QEr9m/kpwoAKcOTXFZdpA4TR0Ejlf9x+n93FmmoNoTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EQOA+OJ7l+Zf8+Bq4tCBO5xr6Xs3hyxeqwLy54gRhOBrQVMEfqLDq104ZLJ0rylKuJhk7a/aZNQdfWI7sjlVW/BUMjz3bl6AqYlzVQjaUUObGivzeRJgVBSuEmYY/JrWgyR1hKfZ9d9PnmMNRCwEfGnotmmP7CK4GF1voSVHlRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cq7IMIga; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cq7IMIga"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735535299; x=1767071299;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QEr9m/kpwoAKcOTXFZdpA4TR0Ejlf9x+n93FmmoNoTo=;
  b=Cq7IMIgalTG1B1N2cZjNlYKYtJ+QM2wTlagjAus9qERPaW5LXbZDGZbs
   NksOe8QPC4Or0GX2FeptFiwx+yeXTsti1b0caVqlbVm1ULHchZp5wgxlI
   z0u24PKTSHs+y8W9xie2lQZOqqqoYcPQhEXIi9HAInI0cAxgHqfSsalQN
   bNs5aaJzu/kRIXMqWQkONdT/6Fxnf8RWKGNWidotxV+bYoFoSd+/Oz3nv
   yVVlN+JsshfJMa1V0l4hbFdUashbuOlW3kEBIhHb0189cx8SbQPxUxbiB
   vYLQO6rr08rohWiJM2m18kO4p4XP/4DPM5zdso8o5xQC+L4da1HRwBDW1
   A==;
X-CSE-ConnectionGUID: Z93QB7LMQTa959fYva11oQ==
X-CSE-MsgGUID: ClVmw21lQNO/Yb6nkmQEdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="46405687"
X-IronPort-AV: E=Sophos;i="6.12,275,1728975600"; 
   d="scan'208";a="46405687"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2024 21:08:18 -0800
X-CSE-ConnectionGUID: V6tjbp4pQ1ymisDzV8sSGg==
X-CSE-MsgGUID: ikn8ysUhSIKMtYZzU4aohg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101542016"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Dec 2024 21:08:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tS80j-0005NA-1d;
	Mon, 30 Dec 2024 05:08:13 +0000
Date: Mon, 30 Dec 2024 13:07:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jimmy Hon <honyuenkwun@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Cc: oe-kbuild-all@lists.linux.dev, Ondrej Jirman <megi@xff.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jimmy Hon <honyuenkwun@gmail.com>
Subject: Re: [PATCH UNTESTED 7/7] arm64: dts: rockchip: Enable HDMI1 on
 Orange Pi 5 Plus
Message-ID: <202412301233.GT87d39d-lkp@intel.com>
References: <20241229184256.1870-13-honyuenkwun@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241229184256.1870-13-honyuenkwun@gmail.com>

Hi Jimmy,

kernel test robot noticed the following build errors:

[auto build test ERROR on rockchip/for-next]
[also build test ERROR on robh/for-next linus/master v6.13-rc5 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jimmy-Hon/arm64-dts-rockchip-refactor-common-rk3588-orangepi-5-dtsi/20241230-064740
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20241229184256.1870-13-honyuenkwun%40gmail.com
patch subject: [PATCH UNTESTED 7/7] arm64: dts: rockchip: Enable HDMI1 on Orange Pi 5 Plus
config: arm64-randconfig-001-20241230 (https://download.01.org/0day-ci/archive/20241230/202412301233.GT87d39d-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241230/202412301233.GT87d39d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412301233.GT87d39d-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts:127.1-7 Label or path hdmi1 not found
>> Error: arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts:131.1-10 Label or path hdmi1_in not found
>> Error: arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts:137.1-11 Label or path hdmi1_out not found
>> Error: arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts:147.1-11 Label or path hdptxphy1 not found
   FATAL ERROR: Syntax error parsing input tree

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
   Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
   Selected by [m]:
   - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=m] && DRM_XE [=m] && DRM_XE [=m]=m [=m] && HAS_IOPORT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
