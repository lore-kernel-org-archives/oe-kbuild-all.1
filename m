Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE0C1A724C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 20:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765310594; cv=none; b=jQaWd8bjNfssJzNR86QWrFBCwChuEjXqzrPSAz86QTvBeUM7eRi3eRjxbe8tgSWtEkxG0M5D4noq6TsA/MDmdfKP1UXEwCaNkiqyq3gl9g7dZsjSATDbbDuRikEYo2ldA3Zn/OMI5XzwxTkt6ZYER7U8NSkLVZGP2dUyKpoS0/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765310594; c=relaxed/simple;
	bh=0Gn0G0I5Pv2Zo4503YDoZ3qRaVGDzrfJ5AxrUJysG5U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S/e54p9e/2ocCIg49wVRF8s3kR1E9SjSyUtpcok7TX5uGL9nOnDjqW0lGehE+KUlJObYU6cPKqYsc1aKg8Va+pDJCl7Yk1QHlS9tJMWXiM1K93Wk23pBh/fk6AM8G8i0s8CFaGmkjOkMd6XSVu3lKiRG2rpFYsrWY3wnHei6hBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=geUHAe++; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="geUHAe++"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765310592; x=1796846592;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0Gn0G0I5Pv2Zo4503YDoZ3qRaVGDzrfJ5AxrUJysG5U=;
  b=geUHAe++eG6/B2f3i6VjfohxmCZ6kQCprnA1V7kSjMoAmNwefgL+LuxL
   J+QUORJWBmNHcDsxT6By3GpV1lN+DBG74fwJK9gH/x/u/3XdNvy+jDFGd
   e3WYiSGQz2N523WnFOKyMuGTZdlTJRxuxzowWfXiIcxANXceSspzHk/BM
   5yKjZcBoSBpVs43FllGsx4G+0iHgGxrYbhcHmZ3moFOIpPts/L1apvJPD
   Hyxl6aiCKPhN6FnbRKSCr2BnovU1RsoFAfAUwRNmjdeMwzITgms+q0xm9
   VQyOhW0YU320KBI0JDZ+TbItsXsJ1n1TnUJPv8AukqLlfZiELdHwa1CIW
   Q==;
X-CSE-ConnectionGUID: NuEL4v51RF+3fP1lxbCiGQ==
X-CSE-MsgGUID: WPPa2ZB2SzKTJvQhJ083WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67171638"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="67171638"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 12:03:12 -0800
X-CSE-ConnectionGUID: yQZg7CgiTRqRTHd8Bl4bWg==
X-CSE-MsgGUID: lTVlM+o8Ra+6eCysRCkfvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="196228113"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 09 Dec 2025 12:03:11 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vT3vR-000000000Mb-1DIo;
	Tue, 09 Dec 2025 20:03:09 +0000
Date: Tue, 9 Dec 2025 21:02:39 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3398/3398] htmldocs: Warning:
 drivers/irqchip/Kconfig references a file that doesn't exist:
 Documentation/loongarch/irq-chip-model.rst
Message-ID: <202512092124.8pmDXxxf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   ea8b5fbcdf7f5ce2d966ae6aa4e95e2ebde6cb03
commit: 8dbec732f16ae6510354065536da591114ec83ab [3398/3398] irqchip: Add LoongArch CPU interrupt controller support
reproduce: (https://download.01.org/0day-ci/archive/20251209/202512092124.8pmDXxxf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512092124.8pmDXxxf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/admin-guide/perf/hisi-pcie-pmu.rst
   Warning: arch/Kconfig references a file that doesn't exist: Documentation/unaligned-memory-access.txt
   Warning: arch/riscv/kvm/vcpu.c references a file that doesn't exist: Documentation/virtual/kvm/vcpu-requests.rst
   Warning: crypto/asymmetric_keys/pgp_preload.c references a file that doesn't exist: Documentation/security/keys-crypto.txt
>> Warning: drivers/irqchip/Kconfig references a file that doesn't exist: Documentation/loongarch/irq-chip-model.rst
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:0  ./Documentation/ABI/testing/sysfs-bus-iio:394
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_y_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:1  ./Documentation/ABI/testing/sysfs-bus-iio:395
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_z_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:2  ./Documentation/ABI/testing/sysfs-bus-iio:396
   Warning: /sys/bus/iio/devices/iio:deviceX/in_anglvel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:3  ./Documentation/ABI/testing/sysfs-bus-iio:397
   Warning: /sys/bus/iio/devices/iio:deviceX/in_anglvel_y_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:4  ./Documentation/ABI/testing/sysfs-bus-iio:398

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
