Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659E728F937
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Apr 2025 18:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745520044; cv=none; b=jagNRClopT/E53/VXdkJ9jvDE4LTxDznIh5d9nBm9unJRS4elONPQHUY87FZJEYUSGGDzs0RIm1AHigol2L2eEeFgD64RBvNcEXP4h92g64pZ6TCRMlNosPU75Ak7gWR02T/QA/cboffmKe0nuuGsp2nfbEm/OQobH/7WD1aOO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745520044; c=relaxed/simple;
	bh=OaGIl2pkxFcU+xDscBCi/KOKDkQxptD1wN/d+P8LA2I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TvZ96RU4CLE3KHJU18P3X+zyNs+HyspYwXlgOgaumMIhMJjkr6TLXdHZdFYbik88/ydI2zTg5Ren9/3Ps5zpSlZIZYL2hK2jYTZ8E7lv3Z0cmxTV2gbObdihHAZpgafq766ShtM02uO+rL6jwxa5sX+1TemgidJzr+shbtx9dDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WWTm4awH; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WWTm4awH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745520042; x=1777056042;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OaGIl2pkxFcU+xDscBCi/KOKDkQxptD1wN/d+P8LA2I=;
  b=WWTm4awH7BvEzi3591hxTRv4kfl6kat1azHsuMwRXFQpW7DFtDw7btza
   bsJ+LYrqzNrjP9MU124AZFrfds0ZalG24DkXYUzymAKVdk9fITNxc1CCc
   KWN0qDGupVU+rp/BfN/Km23YxfVcvBAq8PGcc94wyoO7n6cJFS8y88QUK
   9QJERk5KYoI8TAq9lDiAT/hnkNmFifGD7AbdavlAYJJ8MtOWLmsIEi526
   B7LLp5MqKutRAsa2j++cVIPCjqFktGoU7J5rNKO2vxbBjzl9Iuv3pI7HD
   1XDYKII5TRlNuus+TUzxy0+v0s+LS+HRlbewNCpWrEdPozMBk8bpqQ3t4
   Q==;
X-CSE-ConnectionGUID: 77l9pVa7SVqdVJsscM19tg==
X-CSE-MsgGUID: PZlF0OaGSJSQnKV5VNz2nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="57809552"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="57809552"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 11:40:41 -0700
X-CSE-ConnectionGUID: fZpXWjCnR3C9So1yfs3+HQ==
X-CSE-MsgGUID: ypXiVpRqQeexbbS7eIz4XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="132583070"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 Apr 2025 11:40:39 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u81V0-0004T7-1G;
	Thu, 24 Apr 2025 18:40:38 +0000
Date: Fri, 25 Apr 2025 02:39:43 +0800
From: kernel test robot <lkp@intel.com>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [linux-next:master 4796/6092]
 arch/arm64/boot/dts/amlogic/amlogic-s7-s805x3-bp201.dtb:
 /soc/bus@fe000000/serial@7a000: failed to match any schema with compatible:
 ['amlogic,s7-uart', 'amlogic,meson-s4-uart']
Message-ID: <202504250207.QVJ1DoFs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   393d0c54cae31317deaa9043320c5fd9454deabc
commit: 1b753fcfcff8ad1a63512b5be01cc6f3968a859b [4796/6092] arm64: dts: add support for S7 based Amlogic BP201
config: arm64-randconfig-051-20250423 (https://download.01.org/0day-ci/archive/20250425/202504250207.QVJ1DoFs-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev19+g53ef030
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504250207.QVJ1DoFs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504250207.QVJ1DoFs-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	['amlogic,s7-uart', 'amlogic,meson-s4-uart'] is too short
   	['amlogic,s7-uart', 'amlogic,meson-s4-uart'] is too long
   	'amlogic,s7-uart' is not one of ['amlogic,meson6-uart', 'amlogic,meson8-uart', 'amlogic,meson8b-uart', 'amlogic,meson-gx-uart', 'amlogic,meson-s4-uart', 'amlogic,meson-a1-uart']
   	'amlogic,meson-g12a-uart' was expected
   	'amlogic,s7-uart' is not one of ['amlogic,a4-uart', 'amlogic,t7-uart']
   	'amlogic,meson-ao-uart' was expected
   	'amlogic,meson-gx-uart' was expected
   	from schema $id: http://devicetree.org/schemas/serial/amlogic,meson-uart.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s7-s805x3-bp201.dtb: serial@7a000 (amlogic,s7-uart): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/amlogic,meson-uart.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-s7-s805x3-bp201.dtb: /soc/bus@fe000000/serial@7a000: failed to match any schema with compatible: ['amlogic,s7-uart', 'amlogic,meson-s4-uart']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
