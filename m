Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D2510A1E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Oct 2024 14:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729521035; cv=none; b=fEpAWoAI5WOvS9QYUeCI9MXmJmF6aTuQ8+bMSjlsEQMM7zbtB2C0fLUO5hUUkWH0e5pEWHDmK8Wn6vbzfnOLStHu9bvr0R/CrADYqr6tB66oLk2ZxkWrWpTB6Z3U7VI0MNYslSqnhxlVssbbYk2gCv7DwCVkuiOh+h8sZK7MJjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729521035; c=relaxed/simple;
	bh=BZiR9+NJNRqwZy7g0ui+UeYJ1lfJzlGNn1IqtXSOUNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CVO1xJZYLjvcfH0gAfKjtjk/Uzi7o6Flf23XrYjhwG3IL2HNt46TYJAonYci05tIhNBqZfIEne9dO9khit2MfoGHZcaPpG8Dy+UEaqgE+Jm4/ivUBUjvCQOu09iDCCQ4dv/iqVn2X+c0slFGb8zK2CwPYOhocS3j5pcrk/iKnes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fJaVUuiX; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fJaVUuiX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729521032; x=1761057032;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BZiR9+NJNRqwZy7g0ui+UeYJ1lfJzlGNn1IqtXSOUNQ=;
  b=fJaVUuiXKGjML5Js6cd5H4oA9g8VUaQvIn9A5OFY3jJAezImPpNAc6RP
   +fA4xLfDC6pYJQ2iALL/r6pg8ctPwoinF/C9dE+vqa9G0vnwkx5RUxuyA
   xQOBHTBtrGt2oPgwRmOYORjTqYxCuuizE8GXidDlsflgYHzRjLTANYVIo
   NRankWq9U+Iae/9LlhY/GTbfQxdL6iZNoWuYOTBBE39xeQiOUUEIcADqw
   Mi2TFCpcsUVp8DzBeuCRaVKJuD8RQzKfmdHmNaUSyJdG9mWf5oK5ZYWm8
   5QIRTH8l/iUz92VTAKLSGO0psCrrxEQKuW37y2Lz+nQTnbWUz4Dtt2+/a
   g==;
X-CSE-ConnectionGUID: dd42kX18R0aH2KajNrBB7A==
X-CSE-MsgGUID: bRKZKn/RT+6xEOFtj5TRRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28956874"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28956874"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 07:30:32 -0700
X-CSE-ConnectionGUID: TGEQgBQCRZat7hC6guKTBw==
X-CSE-MsgGUID: c6cT7E7rSDGk7gI5e/RujA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; 
   d="scan'208";a="79940866"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 21 Oct 2024 07:30:29 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2tQQ-000SHW-2X;
	Mon, 21 Oct 2024 14:30:26 +0000
Date: Mon, 21 Oct 2024 22:29:36 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1449/2444] htmldocs:
 Warning: Documentation/userspace-api/ioasid.rst references a file that
 doesn't exist: Documentation/driver-api/ioasid.rst
Message-ID: <202410212252.IcfHjXzx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zhuo,

FYI, the error/warning still remains.

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   56b96e2ee1334c923cb707ff5b18d7cf858a2c46
commit: b43d7bba276172e21825b705cc9647687991163b [1449/2444] ioasid: Add /dev/ioasid for userspace
reproduce: (https://download.01.org/0day-ci/archive/20241021/202410212252.IcfHjXzx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410212252.IcfHjXzx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/hwmon/inspur-ipsps1.rst references a file that doesn't exist: Documentation/i2c/instantiating-devices
   Warning: Documentation/kernel-hacking/hacking.rst references a file that doesn't exist: Documentation/kbuild/namespaces.rst
   Warning: Documentation/kernel-hacking/hacking.rst references a file that doesn't exist: Documentation/kbuild/namespaces.rst
   Warning: Documentation/mips/ingenic-tcu.rst references a file that doesn't exist: Documentation/devicetree/bindings/mfd/ingenic,tcu.txt
   Warning: Documentation/networking/device_drivers/mellanox/mlx5.rst references a file that doesn't exist: Documentation/trace/ftrase.rst
>> Warning: Documentation/userspace-api/ioasid.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/networking/j1939.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/misc-devices/xilinx_sdfec.rst
   Warning: dist/templates/kernel.template.spec references a file that doesn't exist: linux-%%{kernel_unamer}/tools/perf/Documentation/examples.txt

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PCI_MSI_ARCH_FALLBACKS
   Depends on [n]: PCI [=n]
   Selected by [y]:
   - X86 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
