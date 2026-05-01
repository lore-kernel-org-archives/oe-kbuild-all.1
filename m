Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E2B3019DC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 May 2026 17:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777655095; cv=none; b=n+A9EWbb7oFkIqowKXq/ycpqx5H938FzXavAm0NkGpBewq4U/wgBaJPxWG91Z8HNzNa0L0Oa3VMOJT1NbMTgX109GZj8LQuEYGFGf79xbBUYF+FWW1Q2eNJGVi9q49sC6C20ZiHCa30x0KoLf5X6mgrt8j0d89ZNb78exVrWmDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777655095; c=relaxed/simple;
	bh=Cre+UowTfPBCRiUr2aozNaio4N4qYW5GR3dPZjuIo8c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Pog9ieMmK8qfuL5Ac3HwX7qxmjS9OxIF7Rc5JPT5kF6e33mB+bIpfAa+1NQSBKxdLLLft1tVKhlT2Caz7S7GBU7CygQ7C5KJ/oSQHH/ixeF1I0RyYiBjfbz6CrUWkFe7+Zf4DtgnNulxNzng3kmEiAF5kdXVXyJRi72IREQ0EFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cs7avA9z; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cs7avA9z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777655093; x=1809191093;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cre+UowTfPBCRiUr2aozNaio4N4qYW5GR3dPZjuIo8c=;
  b=Cs7avA9zAnIsZjAbPCtTMMlu220sm0d2SM/J1N/VLBHco5WfWVs1NDEX
   JwqV04TXTI6HA2VXynAYLvV7rVyZJkztHtiJL9M+KjU0FCQTQ/Q7SJbHc
   z01lqXTKUi4BdlxTPHVdcvwLO1wrhVU/O99EmlUBLj3yXeTi3zxewZofj
   KeynV8t0Nxm7Q8RcykPh0lCDkt6VPlQs5MtnVkWjwT0VBj/oIsBo0V1wY
   5msg2XRIc13yvNOJKwqshJbxzv35giqTrEbPW86eC+UWHRxIS49spSQC5
   Y2CJ3AK1wBKHq8leKuUTXTV9XuclTLHiEu6zZHkmp4hI4RjKaDrw31iQM
   g==;
X-CSE-ConnectionGUID: 63Bojw0ySz+nEIau7LWozw==
X-CSE-MsgGUID: eK0CspkbQJypcjegbptEzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="89997854"
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="89997854"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 10:04:52 -0700
X-CSE-ConnectionGUID: xS3lrx8aT2Syb4AmcbptBw==
X-CSE-MsgGUID: I9NrbofIQqCViMvp9MFY8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="273011578"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 01 May 2026 10:04:51 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIrIH-0000000054v-17Iq;
	Fri, 01 May 2026 17:04:49 +0000
Date: Fri, 01 May 2026 19:03:54 +0200
From: kernel test robot <lkp@intel.com>
To: Riccardo Mereu <r.mereu@arduino.cc>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: make[4]: *** No rule to make target
 =?us-ascii?Q?'arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-med?=
 =?us-ascii?Q?ia-panel-10in=5Ftouch=5Fa-dsi.dtbo',?= needed by
 'arch/arm64/boot/dts/qcom/'.
Message-ID: <202605011808.H7lI4uwp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/intel-lab-lkp/linux/commits/Riccardo-Mereu/arm64-qcom-agatti-Add-dai-3/20260501-040410
head:   66725037c66a655350b062f748630cb18d212a6a
commit: 66725037c66a655350b062f748630cb18d212a6a arm64: dts: qcom: imola: add support for media carrier board
date:   21 hours ago
config: arm64-randconfig-2053-20260501 (https://download.01.org/0day-ci/archive/20260501/202605011808.H7lI4uwp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260501/202605011808.H7lI4uwp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605011808.H7lI4uwp-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/Makefile.dtbs:20: .dtbo is not applied to any base: qrb2210-arduino-imola-carrier-media.dtbo qrb2210-arduino-imola-carrier-media-camera-imx219-csi0-2lanes.dtbo qrb2210-arduino-imola-carrier-media-camera-imx219-csi0-4lanes.dtbo qrb2210-arduino-imola-carrier-media-camera-imx219-csi1-2lanes.dtbo qrb2210-arduino-imola-carrier-media-camera-imx219-csi1-4lanes.dtbo qrb2210-arduino-imola-carrier-media-panel-10in_touch_a-dsi.dtbo qrb2210-arduino-imola-carrier-media-panel-8in_touch_a-dsi.dtbo qrb2210-arduino-imola-carrier-media-panel-5in_touch_a-dsi.dtbo
   make[4]: *** [scripts/Makefile.dtbs:140: arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-base.dtb] Error 2
>> make[4]: *** No rule to make target 'arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-panel-10in_touch_a-dsi.dtbo', needed by 'arch/arm64/boot/dts/qcom/'.
   make[4]: Target 'arch/arm64/boot/dts/qcom/' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
