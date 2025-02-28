Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F8F21348
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Feb 2025 16:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740759008; cv=none; b=M+pZlkF0l3KaT/mycdpNI2d3vFuzxyfRr6FdGNbq9bNIzmmc3TZB1ucSi07orvrzFkVweKVDT4lFeglVZH4OJ1rWBQ/yE3dhJAScQjTQZ9Qk8ZfdNylUebeGxwjxgJod7fq6u9LdKPY/+oaNYOHB0tHVGWsL/QAQbyDhFK31CPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740759008; c=relaxed/simple;
	bh=TRthhhul5H1IPMpKuoH880pcUxEDyeYrGcXAvDGl3WQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UCxEr/DBtZ1QAwv+sLnvpOVRaViRFzw7fuMVVHHkZwWxy6q/BESsRdCFV4X1Cq3z52J30E8oUWGFoaByzzS44zjVHddqbmVdnqmP16H6mIsUTAkx//4bLwJTgDAGIIlm41QmQT7jlD9DSohfaS9r9prwJwYo5Y6iuNUHlYxWpXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lsngWfU4; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lsngWfU4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740759006; x=1772295006;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TRthhhul5H1IPMpKuoH880pcUxEDyeYrGcXAvDGl3WQ=;
  b=lsngWfU4lBj+yvd1V11LEGM/va5ckfNBzanJ4J24ZiolYACWJwWbCmbL
   Drwo4sV8hAV3YGZepeusBhBMfXfyxJHVn9RQw96cnChhRJHNkk4a7Alqr
   KS7n4YEloQrdXeLGkQz8foRB+pB1asbOhnzNU1Bn8EoUMC9jESLMv4iSj
   /+C46zjYTTL/pp0/HEGLXCcNujlToD77eSMp2fVRWA1FcYPBX6H/TScYn
   27nMuA3Ou+vvJ3hkqEqKmb3Kn4ujQeCHht1Q/d+V4MwY0dbfDWVsRyGyd
   PFht6RuW5g7wCH3znRcPTGwhHOVB7wfooWaL3WqwyR6qNu8SEcvq9hIkU
   w==;
X-CSE-ConnectionGUID: NrwmKaB6QxKZG7eMMRy+lw==
X-CSE-MsgGUID: LzAc+5m2Tqin87Zk+rs+lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="41820166"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="41820166"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 08:09:58 -0800
X-CSE-ConnectionGUID: sneP6FaoQ1CMuS/O7GPk0w==
X-CSE-MsgGUID: FRJ0LodERvqYu/L3cEI6yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118287987"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 28 Feb 2025 08:09:56 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1to2vj-000FAC-0C;
	Fri, 28 Feb 2025 16:09:43 +0000
Date: Sat, 1 Mar 2025 00:06:16 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/1] htmldocs: Warning:
 anolis/changelog/000-changelog.base references a file that doesn't exist:
 Documentation/filesystem/dax
Message-ID: <202503010018.rl5Yals1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   33e283448f335063aab245460a2d3b85ac627b9d
commit: 88f66936c77127ed35d2e026e9a7bedf16385ff0 [0/1] anolis: spec: add script to generate kernel changelogs
reproduce: (https://download.01.org/0day-ci/archive/20250301/202503010018.rl5Yals1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503010018.rl5Yals1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/arm/Booting references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/userspace-api/ioasid.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/networking/device_drivers/ethernet/wangxun/ngbe.rst
>> Warning: anolis/changelog/000-changelog.base references a file that doesn't exist: Documentation/filesystem/dax
   Warning: arch/Kconfig references a file that doesn't exist: Documentation/unaligned-memory-access.txt
   Warning: arch/x86/Kconfig references a file that doesn't exist: Documentation/x86/user-interrupts.rst
   Warning: drivers/irqchip/Kconfig references a file that doesn't exist: Documentation/loongarch/irq-chip-model.rst
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:394  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:0
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_y_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:395  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:1

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
