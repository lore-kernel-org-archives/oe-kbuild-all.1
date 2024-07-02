Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA12B664
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jul 2024 09:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719912647; cv=none; b=mT73Vr62me2lTYGukblHQ7Sg/AgVHpG2T7G56uh6UYTmLeUbaDaqA3F9Bp0OeovgU/nZz0Vx0IQ2q9d4XgFkqYirsb0sVklzWLWjWvIPSXCMMeOeZFJECdyEQKoygF/LOJrNKAc97egrhXxb0HZcwJzpFSFM6hcB74BRL/FzZ34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719912647; c=relaxed/simple;
	bh=Q1t2qOjSIGxSzctF2l0ztfuIkyCMGKS2uTX3sv+M85Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cz55hceEBOGNv9IM2x8R76qLuKQyrrnjQwR8iiNxYvKjkuWu1ux7wT2oLwtn6WW69BVWE0tSr2FMrfQyEvzmtCZONyrO2eKZ2JekcsRlSUekdWX8xWiYRuczhC+lRY/qr/qbaTYsL9lTAH6SsE2nDix/EUBgmQ/EdKbjYf4oKHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZO2L6dgo; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZO2L6dgo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719912645; x=1751448645;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q1t2qOjSIGxSzctF2l0ztfuIkyCMGKS2uTX3sv+M85Q=;
  b=ZO2L6dgoz54GYDk1SALb3k3AQLsX2lbQcQJsUA39xRBmp9rckUIFs0Tk
   EP7Q4v96im/TxiSnOm8/61E6j8sfvPS66+a37Mpz8/E4DrUUzB39nD6Ec
   LQ03To2d82DAbEi9qjePftrwIDKcqZihK0qf5548I7tRTRoMsPcFl6bRz
   2IJHhVrde8+KJUvbo66r0XLiUJfi4yKHAVica27IShgh7eZ4G9hcmJn2E
   AQ8/jVKBfzcSGk+q3Gtift6QcTRQN7jlCVVrN7uI/QTgI6c9XI/ebReDV
   yEKXU2opTjAZo3ZuqdMEly6iZlHDTU6lqiW02CVhJ7E2/l1fcBqxgTOZf
   w==;
X-CSE-ConnectionGUID: 3OXCKtDMTg2/wnsgKyRg2w==
X-CSE-MsgGUID: v19yGY2oS+60Krgc+eiMgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="17288196"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="17288196"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 02:30:44 -0700
X-CSE-ConnectionGUID: DOZ002bsTvy6Sy4A5iL9FA==
X-CSE-MsgGUID: ZRZQmiaWQZiltQ8iqmGqBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="45813940"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 Jul 2024 02:30:44 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOZqT-000Nxo-1k;
	Tue, 02 Jul 2024 09:30:41 +0000
Date: Tue, 2 Jul 2024 17:30:11 +0800
From: kernel test robot <lkp@intel.com>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>
Subject: [qcom:arm64-fixes-for-6.10 6/11]
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: touchscreen@10:
 compatible:0: 'elan,ekth5015m' is not one of ['elan,ekth6915',
 'ilitek,ili2901']
Message-ID: <202407021718.P1h5gQRY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-fixes-for-6.10
head:   af355e799b3dc3dd0ed8bf2143641af05d8cd3d4
commit: 7bfb6a4289b0a63d67ec7d4ce3018cb4a7442f6a [6/11] arm64: dts: qcom: sc8280xp-x13s: fix touchscreen power on
config: arm64-randconfig-051-20240702 (https://download.01.org/0day-ci/archive/20240702/202407021718.P1h5gQRY-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240702/202407021718.P1h5gQRY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407021718.P1h5gQRY-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: touchscreen@10: compatible:0: 'elan,ekth5015m' is not one of ['elan,ekth6915', 'ilitek,ili2901']
   	from schema $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: touchscreen@10: compatible: ['elan,ekth5015m', 'elan,ekth6915'] is too long
   	from schema $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: touchscreen@10: 'no-reset-on-power-off' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: /soc@0/geniqup@9c0000/i2c@990000/touchscreen@10: failed to match any schema with compatible: ['elan,ekth5015m', 'elan,ekth6915']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
