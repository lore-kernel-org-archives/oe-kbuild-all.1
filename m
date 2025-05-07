Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756FC1FECB4
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 05:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746596996; cv=none; b=QtLI6QagwCknppCpgzpszDmcwE2AaOCGvrxuvA0hPznYxZKZH8cJxNQm7IzYE2afIKXbK4lmfqsSCher37+fxmsGFwj/+v6uwQWKJpC/Rtr1vH0+ZX0MtwGaY7M9W+m4QSYqN8ZmaBVSokn1aFt63qBRmmrS9qbGTK/02cqKJWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746596996; c=relaxed/simple;
	bh=eOFjMzOvxzeemJh8sNYnPY/6YqCxGg3x8Rv/Cnl06Q4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p8yHiWLItVUP+Xobuz986eOo8ej8+xTxrf+6J2j3rze0XB9M3KEYe0z7vJ15OrNm9t4AfpZYgOgostGhn4gV1pHGKlE+VDcg+tzDofG3v6vEkVhOnBg9TLSb34+nSaBjlZSUU92uqOdfoK/ChYLtQMuhvEH1D+iyi6PPJzQI4/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=de5G5TVP; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="de5G5TVP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746596995; x=1778132995;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eOFjMzOvxzeemJh8sNYnPY/6YqCxGg3x8Rv/Cnl06Q4=;
  b=de5G5TVP/56JJEZXNLVK03cKL/ECTR799Wncvq61gjdxopJzAx7HwGac
   UhhZzo10w2fJmKyOtSH3gyA1VGbsq32Q9kdQV6570KW0Uo7wZ7YdKVg5o
   nFo64HFwOTD1GWzs/0cLv4CwlIPafAr1WmoFF3HD6zNOvZREW8a8o3w/r
   SeG93Nv1Ja/lIz1BTZMNWEKSXnhCywDEfEGp8R6F7woxm7lCjWZjSymdt
   BG76BF5m//krJ1WWBOVx0fbtBOME2yfDCIfKaPcYD2NBQckq6/xjJOzeF
   iXYrgOfvc0I9eGk8TCT7GW2hD0eiDeZFP5IXAxAGSOb+xvqX0ukSyBq4l
   w==;
X-CSE-ConnectionGUID: eHaVV6zWTbaPnXGm0OGJHQ==
X-CSE-MsgGUID: F/E8/gHRTduN57JzCx+5vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="52120528"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="52120528"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 22:49:51 -0700
X-CSE-ConnectionGUID: rGVxtBnZT1GSHnNlu/nOcQ==
X-CSE-MsgGUID: 4S+L+IaKRiCNIqyqe2KimQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="140580422"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 May 2025 22:49:49 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCXf8-00077r-3D;
	Wed, 07 May 2025 05:49:46 +0000
Date: Wed, 7 May 2025 13:49:28 +0800
From: kernel test robot <lkp@intel.com>
To: Zelong Dong <zelong.dong@amlogic.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kelvin Zhang <kelvin.zhang@amlogic.com>
Subject: [linux-next:master 8037/8679]
 arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dtb:
 reset-controller@2000 (amlogic,a4-reset): compatible:0: 'amlogic,a4-reset'
 is not one of ['amlogic,meson8b-reset', 'amlogic,meson-gxbb-reset',
 'amlogic,meson-axg-reset', 'amlogic,meson-a1-reset', 'a...
Message-ID: <202505071332.ZMtPvG1i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0a00723f4c2d0b273edd0737f236f103164a08eb
commit: 946b51882b84f0cbec2acd203467866a7378abac [8037/8679] arm64: dts: amlogic: Add A4 Reset Controller
config: arm64-randconfig-051-20250506 (https://download.01.org/0day-ci/archive/20250507/202505071332.ZMtPvG1i-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071332.ZMtPvG1i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071332.ZMtPvG1i-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dtb: reset-controller@2000 (amlogic,a4-reset): compatible:0: 'amlogic,a4-reset' is not one of ['amlogic,meson8b-reset', 'amlogic,meson-gxbb-reset', 'amlogic,meson-axg-reset', 'amlogic,meson-a1-reset', 'amlogic,meson-s4-reset', 'amlogic,c3-reset', 'amlogic,t7-reset']
   	from schema $id: http://devicetree.org/schemas/reset/amlogic,meson-reset.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dtb: reset-controller@2000 (amlogic,a4-reset): compatible: ['amlogic,a4-reset', 'amlogic,meson-s4-reset'] is too long
   	from schema $id: http://devicetree.org/schemas/reset/amlogic,meson-reset.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dtb: /soc/bus@fe000000/reset-controller@2000: failed to match any schema with compatible: ['amlogic,a4-reset', 'amlogic,meson-s4-reset']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
