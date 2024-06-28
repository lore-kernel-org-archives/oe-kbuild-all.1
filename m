Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2256E55887
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jun 2024 18:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719601089; cv=none; b=SIiLkM8eQIVVZFvrB4rjGFZkIo5DTUipLbN7+KVt/3d7lMUhjJJF3vE3cHHtgp2wCQG/jK3InvKtJF9jHVo0y0uPxYtX84VdoWayDbeQDvfiAzG8y8EtOFolr6/jkLPt0N4Y+IbDVm8sV+wF7Hzv6pMTvRyoPCARgtx9EuCV3sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719601089; c=relaxed/simple;
	bh=YyhMV6jt1FcrFrizNxIZ2z3puCWYgX96A1cOfEmQcpg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aPq5G5ql9v1L3XjXh/GOsdDDAtl60Kyx2y/QrXIaAYob8nJ35Cl1TEkf1F+NVwpWQUxz5LzkMkzLAqBO3wZMLY3X6cjsqaeW+vjIEW9TXjVmJrwI1zjin7oCalFlqlAXq5WlLySVtwNd4zi2cboi6LGKsvvi61jpipx43sho8vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kezqRAWk; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kezqRAWk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719601088; x=1751137088;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YyhMV6jt1FcrFrizNxIZ2z3puCWYgX96A1cOfEmQcpg=;
  b=kezqRAWkQcXLSt7Q1FySg68X60K9jkDvCQAnsQQaUHxC/Tg0vt2gKluV
   FNqICK9wSynIo+qsKg4mAK55ngm+nTHjL+z3qcYsEfFIT/0WZt0zcaF1X
   rPotqfdp/x6kzh8XNvL6vlz0GjxvNOtZJl/qbtlyH8bMAkgUDHVdXlRQk
   cETM0LdnmBtKCdBeMyFE2QYQvvN8y44EfePifeSTuF+pdggSkj9euZuR5
   B/7BwO560kNI3blxYKkhxHdV9hetENRdPi3ipLH1Evn5HmAKiclNAi6Ee
   uyTqkaURjy9Sk9UtNMMLNucbxOeSAPQbHyWRvHxDVnVvpc62390eRRRbK
   g==;
X-CSE-ConnectionGUID: AN+qbFtQQdeCqaw6EY6csA==
X-CSE-MsgGUID: bQOFvo2WScCpG37MN80h2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="16676126"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; 
   d="scan'208";a="16676126"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 11:58:07 -0700
X-CSE-ConnectionGUID: OKUvKePmRF2MmJUarTcCUQ==
X-CSE-MsgGUID: OiCuaxSnTu2HrpKW/mXvuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; 
   d="scan'208";a="49441397"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Jun 2024 11:58:06 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNGnM-000HrE-0r;
	Fri, 28 Jun 2024 18:58:04 +0000
Date: Sat, 29 Jun 2024 02:57:25 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [amlogic:v6.11/arm64-dt 4/30]
 arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dtb: adc@8680: compatible:
 'oneOf' conditional failed, one must be fixed:
Message-ID: <202406290205.7o4PKeng-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git v6.11/arm64-dt
head:   1443b6ea806dfcdcee6c894784332c9c947ac319
commit: f6386b5afa81724164263c30c48de733e0aab74c [4/30] arm64: dts: meson: add GXLX/S905L/p271 support
config: arm64-randconfig-051-20240629 (https://download.01.org/0day-ci/archive/20240629/202406290205.7o4PKeng-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240629/202406290205.7o4PKeng-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406290205.7o4PKeng-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:363.31-774.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:363.31-774.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dtb: adc@8680: compatible: 'oneOf' conditional failed, one must be fixed:
   	['amlogic,meson-gxlx-saradc', 'amlogic,meson-saradc'] is too long
   	'amlogic,meson-saradc' was expected
   	'amlogic,meson-gxlx-saradc' is not one of ['amlogic,meson8-saradc', 'amlogic,meson8b-saradc', 'amlogic,meson8m2-saradc', 'amlogic,meson-gxbb-saradc', 'amlogic,meson-gxl-saradc', 'amlogic,meson-gxm-saradc', 'amlogic,meson-axg-saradc', 'amlogic,meson-g12a-saradc']
   	from schema $id: http://devicetree.org/schemas/iio/adc/amlogic,meson-saradc.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dtb: /soc/bus@c1100000/adc@8680: failed to match any schema with compatible: ['amlogic,meson-gxlx-saradc', 'amlogic,meson-saradc']
>> arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dtb: video-codec@c8820000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['amlogic,gxlx-vdec', 'amlogic,gx-vdec'] is too long
   	'amlogic,gxlx-vdec' is not one of ['amlogic,gxbb-vdec', 'amlogic,gxl-vdec', 'amlogic,gxm-vdec']
   	'amlogic,gxlx-vdec' is not one of ['amlogic,g12a-vdec', 'amlogic,sm1-vdec']
   	from schema $id: http://devicetree.org/schemas/media/amlogic,gx-vdec.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dtb: /soc/video-codec@c8820000: failed to match any schema with compatible: ['amlogic,gxlx-vdec', 'amlogic,gx-vdec']
   arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dtb: sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,gx-sound-card.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dtb: sound: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
