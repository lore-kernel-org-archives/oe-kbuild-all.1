Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCF1275105
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 21:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765316595; cv=none; b=WQIZNLDTk56d5z9rd02EwTUAbYrNdq5pUvXyCIcmK+Kp92Qp1N5X9kUfVNq2dLU8ruFXeacq2vxhHHh7APZlFbPhV2lfLHenzRWFYRS9lrn4VI7Hk3/dnbuEM5G0pjU1KRGAdnaH4hXKnaVa+YznX8y3GzybnBa8GTcIooTCRUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765316595; c=relaxed/simple;
	bh=D3J9BuWGQlNK5VNkC0aOEGKp/8bA+YyECzoloW+jHlE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ut+NrcOH3fzGbfeMHIiaqVDjClQR3CxN/PKmZvenglVA4fs7yoTrJCnYQTDNNs7Wm2kfYAQLPxBgFLJuKfzllaFT4qgSha5E3e0wlW1iMsAaBvYYaJuFZ4pHzau11axHVf32hqTAxouWWmFysHTcBnJpWmDPLKDovSjQRnq6koo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fgMVrIT0; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fgMVrIT0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765316594; x=1796852594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D3J9BuWGQlNK5VNkC0aOEGKp/8bA+YyECzoloW+jHlE=;
  b=fgMVrIT0lCUpoa87tj++igRN3wEBlbXVoaPxKF7pxEGKxNmt1C1t0Ryr
   M780SCnOg6X+o1iKOECKaF1I3PZkx5NTkMzBa2fjGhLfYsNgwj1GCZSiO
   nzywINR1oWE0ahy8vFTXmlvtWci3ZJfG8S2PUMd2UscFT2xRCWFJdxRW+
   Pw7/NWFZ6xvARH7BeT8FftPIHL0mhgaD4CXM5F99QDfe+y29Y2Qn5tZaM
   3M2Hr5cBg0njc4eyy86vcv1d1gcAdzkdQZ4K4iV0Py9GSLjNhlKPIvRSQ
   xW1EnTY6Z/WfUo6Naw3Hsdj5E7xpAR6w3FOp9l+Ot0qFWJ5n+J/GYGRW2
   Q==;
X-CSE-ConnectionGUID: qvyV+KsgQRaT+1Uijxtf1w==
X-CSE-MsgGUID: oY9fsLnXTWuHk84Mh52bTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="66461244"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="66461244"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 13:43:13 -0800
X-CSE-ConnectionGUID: GfLMeoy+TN2sJrOQ25gecA==
X-CSE-MsgGUID: vZjgdO2PSeWXpzz54UnIBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="200815939"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 09 Dec 2025 13:43:13 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vT5UE-000000000Nd-0E8W;
	Tue, 09 Dec 2025 21:43:10 +0000
Date: Tue, 9 Dec 2025 22:42:24 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3398/3398] htmldocs: Warning:
 arch/x86/kernel/cpu/resctrl/monitor.c references a file that doesn't exist:
 Documentation/x86/resctrl.rst
Message-ID: <202512092256.qjUEQ2Ay-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Fenghua,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   ea8b5fbcdf7f5ce2d966ae6aa4e95e2ebde6cb03
commit: a6c0245e15d65203dbe3b21d47e8618b4444bf27 [3398/3398] x86/resctrl: Correct MBM total and local values
reproduce: (https://download.01.org/0day-ci/archive/20251209/202512092256.qjUEQ2Ay-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512092256.qjUEQ2Ay-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: MAINTAINERS references a file that doesn't exist: Documentation/x86/amd_hsmp.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
   Warning: arch/Kconfig references a file that doesn't exist: Documentation/unaligned-memory-access.txt
   Warning: arch/riscv/kvm/vcpu.c references a file that doesn't exist: Documentation/virtual/kvm/vcpu-requests.rst
>> Warning: arch/x86/kernel/cpu/resctrl/monitor.c references a file that doesn't exist: Documentation/x86/resctrl.rst
   Warning: crypto/asymmetric_keys/pgp_preload.c references a file that doesn't exist: Documentation/security/keys-crypto.txt
   Warning: drivers/irqchip/Kconfig references a file that doesn't exist: Documentation/loongarch/irq-chip-model.rst
   Warning: drivers/net/ethernet/yunsilicon/xsc/common/xsc_ioctl.h references a file that doesn't exist: Documentation/ioctl/ioctl-number.txt
   Warning: openEuler/MAINTAINERS references a file that doesn't exist: Documentation/networking/hinic3.rst
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:0  ./Documentation/ABI/testing/sysfs-bus-iio:394

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
