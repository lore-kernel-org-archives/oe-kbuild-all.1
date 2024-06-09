Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EBF18C22
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Jun 2024 21:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717967973; cv=none; b=Ue9kI4oJZJOe3oqdW9pHYchFXpXeWPRqKjjcbzgtwVaye8F76dwzuqe0FWESfVH5BOhnsUcwyCrxeD5ML68LY3mmJG+3LNo7ISCkoMXUmQR8H5zBli4Uq8ICUx6XGs4oQccnBzTsvUc2ADR1+qsPiIhjevZY0usq/MzwD42YBIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717967973; c=relaxed/simple;
	bh=ujmEG/haNqGtOiCMZeFXJd2akwZU85MqT4uF7YCiK+I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HGIvvNzPHpQ6t1uN9vql2ciibeXsC87iimNlY4U40l3unb+bafdixY7SChMmD0P6NQtjvWEtI6kU6cc0GLb7OEKnubZ+uYo7GqLazHEjBcHpa5Q032HzZHkACOJNY8s8jvUa6OLbnKqV4O/cGntuatKs1SVHYWEI8Jhu+patrKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EkU9to5e; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EkU9to5e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717967971; x=1749503971;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ujmEG/haNqGtOiCMZeFXJd2akwZU85MqT4uF7YCiK+I=;
  b=EkU9to5e9aDnVJT59Z1+8Z7dScxvHZmdHo7LWUub3GxCz+xx887fjODU
   r1JhlIpan7EFtOgXMW45t3mYifnKRvamu452hww66f1EjTZ2tU4VvY2oS
   RmMOJsdjQVy1e/dF9RtL65EX6+VfaxfPSVcVnmYwWy11mC/NTK/BlFYHm
   YlXW3at0DY+8DGSLPfGHMCu3lD8sAYAYh//3O5mPwmQIrzbFbJiXqlbAx
   JLWTHjFY9C4qWSazQLXWqCsM06+A7pvlgNMATwlhMqjZ2HvTehb6eyqwM
   FlHTRXAzKd6tAFecEMVX/Njkb7H/itL76gs1plKu3VfUT+GvDGUGqgGgm
   A==;
X-CSE-ConnectionGUID: arcoFAVXTv+Pqyk6ysNL8g==
X-CSE-MsgGUID: 6BWCJuSoRVqSaGxCw1b+WA==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="25731019"
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="25731019"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 14:19:31 -0700
X-CSE-ConnectionGUID: NtQ2yyywSMiGZlndnh6M9g==
X-CSE-MsgGUID: gEdbjh1DSAyvRlpdY7QQqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="62043002"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Jun 2024 14:19:29 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGPwl-0001ba-2w;
	Sun, 09 Jun 2024 21:19:27 +0000
Date: Mon, 10 Jun 2024 05:18:58 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [pinchartl:nxp/v6.10/compulab 3/4]
 arch/arm64/boot/dts/freescale/imx8mp-sb-ucm.dtb:
 interrupt-controller@32fc2000: 'power-domains' does not match any of the
 regexes: 'pinctrl-[0-9]+'
Message-ID: <202406100556.rPe47Vtv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git nxp/v6.10/compulab
head:   19e286ef0384a44b8d3320bca2bb46f54188235c
commit: 17d66bd52cc0227dfb057c5ece3060d509184b1b [3/4] arm64: dts: freescale: Add device tree for Compulab SB-UCM-iMX8MPLUS
config: arm64-randconfig-051-20240609 (https://download.01.org/0day-ci/archive/20240610/202406100556.rPe47Vtv-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240610/202406100556.rPe47Vtv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406100556.rPe47Vtv-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mp-sb-ucm.dtb: interrupt-controller@32fc2000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
