Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A06A2147F7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 May 2025 05:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746681724; cv=none; b=fA+i04/gGSKvsGAqtATOuOQs2xEu3f/iEIB+Isj/+UkmcJQ/sCZdE+xL2qYe+Y4hW0WXdeastEux9FBB+l9tl6eOXvPVVeXJ1kwnWDzKEUVadMQaQTil37pqnWtFCXjg21VXp3cFZQv54Yb7yi2Tc5aT0OBKa8VqYkpks1cOk4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746681724; c=relaxed/simple;
	bh=GYHCcKnoVGOC9yiljx2FPenfP0V4MKbLFXlfaRDswXg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lcJzknrIVFQEiGt+XJ4OibDkNb5yjVKtDBeYI4xTByujvDawsAKYErgIfEw3aPYP4FjWiIZIiViL2dgBqb/pRntRTrDsgxJ6E5tpFAIVR1jSmmLfUtwlNnzdJJEqEp9CN5DWPh6Cxwv3BfRUb+Kiw95dyn7J1RFXcooY+VFYDlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H5URJAoR; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H5URJAoR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746681723; x=1778217723;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GYHCcKnoVGOC9yiljx2FPenfP0V4MKbLFXlfaRDswXg=;
  b=H5URJAoRyiKRd2s/uN5SKQlCN5wEPKgVIdpHoB/PVrcGkl+t9kv98tuH
   psgkDz3sQvicVNKXW7TtWckK6nUP+2AbClGayEus9ugCkRmqZu5xcZghZ
   vqI4s/TVv/RamSIto+aU/PKWJLA5zf3BmqmduV1Aua+umKcu1HdBTJ6mv
   V4x+qhjLiUxWJ3GcvcO/iPRk+XN+PrB4TnyUKlOeLaTD3a25kDb1UhQtB
   yroH6BlLi54HBCjg0RNobXfDH4JvPXH6t+VgjZ3+lzB0k86rShHGhFwjK
   gpn3xg4Gz9ijNt0yiAdrioXoPPU3+AHhDK+XI8u+2tNwzgalcmchTmciS
   A==;
X-CSE-ConnectionGUID: RM70AVUFQWmXLmt0Q34oxQ==
X-CSE-MsgGUID: +KxBfiYlQzibs2V6LJXZXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="36073344"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="36073344"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 22:22:03 -0700
X-CSE-ConnectionGUID: bqWMBwG+TLy9hwK6Yqjf4g==
X-CSE-MsgGUID: n7T6trgYQaq3xZWBR0NvLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="173390880"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 May 2025 22:22:01 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCthn-000AKF-0h;
	Thu, 08 May 2025 05:21:59 +0000
Date: Thu, 8 May 2025 13:21:49 +0800
From: kernel test robot <lkp@intel.com>
To: Zelong Dong <zelong.dong@amlogic.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kelvin Zhang <kelvin.zhang@amlogic.com>
Subject: [linux-next:master 7940/9308]
 arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dtb:
 reset-controller@2000 (amlogic,a4-reset): compatible:0: 'amlogic,a4-reset'
 is not one of ['amlogic,meson8b-reset', 'amlogic,meson-gxbb-reset',
 'amlogic,meson-axg-reset', 'amlogic,meson-a1-reset', 'a...
Message-ID: <202505081345.tUOimWEw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   08710e696081d58163c8078e0e096be6d35c5fad
commit: 946b51882b84f0cbec2acd203467866a7378abac [7940/9308] arm64: dts: amlogic: Add A4 Reset Controller
config: arm64-randconfig-051-20250506 (https://download.01.org/0day-ci/archive/20250508/202505081345.tUOimWEw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250508/202505081345.tUOimWEw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505081345.tUOimWEw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dtb: reset-controller@2000 (amlogic,a4-reset): compatible:0: 'amlogic,a4-reset' is not one of ['amlogic,meson8b-reset', 'amlogic,meson-gxbb-reset', 'amlogic,meson-axg-reset', 'amlogic,meson-a1-reset', 'amlogic,meson-s4-reset', 'amlogic,c3-reset', 'amlogic,t7-reset']
   	from schema $id: http://devicetree.org/schemas/reset/amlogic,meson-reset.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dtb: reset-controller@2000 (amlogic,a4-reset): compatible: ['amlogic,a4-reset', 'amlogic,meson-s4-reset'] is too long
   	from schema $id: http://devicetree.org/schemas/reset/amlogic,meson-reset.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dtb: /soc/bus@fe000000/reset-controller@2000: failed to match any schema with compatible: ['amlogic,a4-reset', 'amlogic,meson-s4-reset']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
