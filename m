Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810BE25757
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jan 2025 07:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735975457; cv=none; b=PnPVaSyl3w/QZ0XRYLJGik2pfVgBr0Drm4JKIBTAXgb7CzAH5vgMD9F8s1QpShTtCXH0TCmt0sqkufDrGgLTovY5xFOW5emzOiMCNiW9QeI9r2TL/XHUUaLpqlQ2oWjpwG6v8hkvlPdEkyl575n4EaWPvlqf+qpQ50Aj8p42D14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735975457; c=relaxed/simple;
	bh=hApevf4s8W35qlEae1IzG8ICVMdOQ9BpJ7wqh1gKCt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nLRHPfTL5MQGpeu+ZGPTza+bjig++lwVmob3ywhjrCmDxkfWDVED1Hwen5QT36TcUceUq0A7MxonrAJZtcZzqCmvd0t0XzY7b0m6HYsU9XTLgnDAtMCTj4mc+JFBb3fGyN9PgUJwZOd+4+wnQ+MthODHhqBDWoFwmwwZn575+7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hXmAbOP8; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hXmAbOP8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735975455; x=1767511455;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hApevf4s8W35qlEae1IzG8ICVMdOQ9BpJ7wqh1gKCt8=;
  b=hXmAbOP8Sdp4Kohd8RC8CIOmQDCjlYGXZvXd+BDLP/JI4FnF/uWzpRuu
   j7v1SIMqExQXmfnLVXR1JHf4gIjkBYoqLIcsnK9UbAC6/BwaFcjhQOTeS
   WDDQRvLu/sgA3ttTBZ683vsTERBbhEE4/MdOOSh/3dVloLo8tgduoUFE5
   AU3Ib+/+vz30D8SaILfo0m9t+8A1QpLOHrTstsRDrlSTRHXI7XalOjV2/
   SnngsO4tcnkhvllimHGoohF9VywLK4sJC7G6U0oRtoGvTU1I3IU9pUAw9
   u3LewmaHl4Blngu9Je7Zt9RQp7TzV45vOUbp3eBvxpiDROslPIppKZ0Xw
   g==;
X-CSE-ConnectionGUID: wSuE7S3PREaxTuN2StaQ9Q==
X-CSE-MsgGUID: 4jHSpsoPQXuzDszbWdQ7Iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="39030204"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="39030204"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 23:24:14 -0800
X-CSE-ConnectionGUID: /lzjVEECRMO8wtInbqsUSg==
X-CSE-MsgGUID: 3kwcATRGRHuLQHDtEimq8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102466773"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Jan 2025 23:24:12 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTyW1-000Ajd-2s;
	Sat, 04 Jan 2025 07:24:09 +0000
Date: Sat, 4 Jan 2025 15:23:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jimmy Hon <honyuenkwun@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Cc: oe-kbuild-all@lists.linux.dev, Ondrej Jirman <megi@xff.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jimmy Hon <honyuenkwun@gmail.com>
Subject: Re: [PATCH 6/7] arm64: dts: rockchip: Enable HDMI1 on Orange Pi 5 Max
Message-ID: <202501041500.EeQw8gzk-lkp@intel.com>
References: <20241229184256.1870-11-honyuenkwun@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241229184256.1870-11-honyuenkwun@gmail.com>

Hi Jimmy,

kernel test robot noticed the following build errors:

[auto build test ERROR on rockchip/for-next]
[also build test ERROR on robh/for-next linus/master v6.13-rc5 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jimmy-Hon/arm64-dts-rockchip-refactor-common-rk3588-orangepi-5-dtsi/20241230-064740
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20241229184256.1870-11-honyuenkwun%40gmail.com
patch subject: [PATCH 6/7] arm64: dts: rockchip: Enable HDMI1 on Orange Pi 5 Max
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20250104/202501041500.EeQw8gzk-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250104/202501041500.EeQw8gzk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501041500.EeQw8gzk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts:53.1-7 Label or path hdmi1 not found
>> Error: arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts:60.1-10 Label or path hdmi1_in not found
>> Error: arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts:66.1-11 Label or path hdmi1_out not found
>> Error: arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts:76.1-11 Label or path hdptxphy1 not found
>> FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
