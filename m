Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBA31D6DC5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Feb 2025 13:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739970387; cv=none; b=ouIP50GRoJZdmQoscOBYwOvVO0iygO9Y3IvH6JBxsLaD2Qa6uCokRR0qlmcA0D7HiMnYl7D422vxMg+8eL/P/QhSO+BBLwRgGEQ4Jrrgn+tQ4UYLcYFsc8GrU2GzhDwkjpiclds4aRFPKGN5I+6LShgtdlD+bhTB7sGIzuF3IV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739970387; c=relaxed/simple;
	bh=iH23NujkWMWuWYJf3VR7USCUyzS0VBCBkj+jRBEFslk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rmgIAMaQVI6w7zJNrQCo7cuvAYW4jCdbXROvYa65GyqF+0v6BMgJpf4delfxx31YgcPMM46sezJ90KtNTfLfxJf6OpLYfakXZPURqBKT7FQoYXw+tABayPmphWmA6a00N5UkqRxslmg1dAPJYfkzKXPtaD5+9BK8XhSnWt/JzQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l/QqVcpx; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l/QqVcpx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739970386; x=1771506386;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iH23NujkWMWuWYJf3VR7USCUyzS0VBCBkj+jRBEFslk=;
  b=l/QqVcpxxEgvtAQUmaF9PyuPmQTY+0yph0rPoDlsrrdMMz5CA+vT4hvE
   cZyGpwLxGcW4qv+VRCTCBsR54gK00IKko13opx2W2BfrEeNQomNx7ZBvK
   h+sIEgIegvevKv3rSy4cjMZ/+b6Dq5RABLkWSxypi52mUsU9Bb/Lisiva
   y3EinHABZXqwopMNw1Aas+IE4lZd4LU2Y6JTHOO0zJbvupldnL0s2kX6s
   VylLSMZJwLnbliSEc3vVpcJhUbh4IWh7PHSK3z9KqePChdoMOYpGPR0fr
   7G7UnKLjOrgxPUSoYxePflO642RiIb1/p2s2pU4W42rb7F0CEAOX29vGW
   Q==;
X-CSE-ConnectionGUID: oLHVshwRQXaOR5GTjfIGDQ==
X-CSE-MsgGUID: 5/YzP4LLQUCfYSxiEXZiNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="44621732"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; 
   d="scan'208";a="44621732"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 05:06:25 -0800
X-CSE-ConnectionGUID: S5BsbZazS8K4s2QX4UQVww==
X-CSE-MsgGUID: mcuqJ9u1SUK28JbkUxzSMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; 
   d="scan'208";a="119820281"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 19 Feb 2025 05:06:24 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkjmQ-0002yv-0j;
	Wed, 19 Feb 2025 13:06:22 +0000
Date: Wed, 19 Feb 2025 21:05:26 +0800
From: kernel test robot <lkp@intel.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [linux-next:master 4017/4901]
 arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dtb: lvds-decoder:
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202502192006.39kKHbN3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8936cec5cb6e27649b86fabf383d7ce4113bba49
commit: 72f016fc918793e1fa2267758f7e233d94468f77 [4017/4901] arm64: dts: imx8mp-skov: describe LVDS display pipeline
config: arm64-randconfig-051-20250219 (https://download.01.org/0day-ci/archive/20250219/202502192006.39kKHbN3-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 910be4ff90d7d07bd4518ea03b85c0974672bf9c)
dtschema version: 2025.2
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250219/202502192006.39kKHbN3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502192006.39kKHbN3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dtb: lvds-decoder: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,sn65lvds822', 'lvds-decoder'] is too long
   	'ti,sn65lvds822' is not one of ['ti,ds90c185', 'ti,ds90c187', 'ti,sn75lvds83']
   	'ti,sn65lvds822' is not one of ['ti,ds90cf364a', 'ti,ds90cf384a', 'ti,sn65lvds94']
   	'ti,sn65lvds822' is not one of ['thine,thc63lvdm83d']
   	'lvds-encoder' was expected
   	from schema $id: http://devicetree.org/schemas/display/bridge/lvds-codec.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dtb: /lvds-decoder: failed to match any schema with compatible: ['ti,sn65lvds822', 'lvds-decoder']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
