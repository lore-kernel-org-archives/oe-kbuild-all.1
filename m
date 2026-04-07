Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C1D35836B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 03:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534257; cv=none; b=WzSxN62YluBH3WdiVAnsepb1nJ1VHQ8cJ7HJ4FQuWVm8xvVUsmw95Soq00PoBWVH6sOvaLb6sBxRia6qQKAqA5q3y2eBgOkInmaAA0nX/fBrjSbzM27s4GGbk2ulqF5wU9QwWGc3k6Be9QYUt47ySiR9RGF6DV2SpserDYP46Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534257; c=relaxed/simple;
	bh=wRP2dS0L4I47Wy41ZitBRsqFEbkfXtlQxk2cU+ps3f8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TIsSKBafvY8kPapF5yijVr/aeRf2B1a0Al5Zf0S1OplQJBd5b04zxw3UyHWcFrGtAYqFp3c7z2Ikn40Sb89wtoyEkP6k1sqMxWllazeSW8tzOEQBgKzeDSLUuy7w60XeEbViOvCEsvgIRktwwRCUrY92fMzA/wMVU+zQ726lj14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I9x9WVjl; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I9x9WVjl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534257; x=1807070257;
  h=date:from:to:cc:subject:message-id;
  bh=wRP2dS0L4I47Wy41ZitBRsqFEbkfXtlQxk2cU+ps3f8=;
  b=I9x9WVjl+l0RObX7whYJn4iD6YkqxF/woUwZCnFW6/LUKF+qx4Y3++1e
   7otz3sd68YcttH9GS6asmjmxbGtD4h8j7oBfhxRmjI9Gk7oktsxxKJgSM
   WUSaf5nPCAVA3vWTZ+xFJB1RSTSvBgSQf7ILpG+JQzNi14AV2kRbYRIhL
   Vx5SbsrdmDouVr/zhlzRW9Ih+Nz6mfAbn94obcb5uPD3n2j8A9OV0nkRK
   ibFkORtZy/EpMqnA0KOloqdwI+oZY3UrlL5E9uKyhM+N91Z/0e/q4vaz/
   9lLw/lNCCc2ELj8aDwsS+8drdQXzb+5bGH3DgRxKgNCGrtvThAG4qt2sZ
   Q==;
X-CSE-ConnectionGUID: YetYWw4sSYq8EG9S78EqCw==
X-CSE-MsgGUID: uTcH7XLMTRW+a+BoToFFZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="80081092"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="80081092"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:57:37 -0700
X-CSE-ConnectionGUID: Dv6LTE15QEGGEyqVC1TfHw==
X-CSE-MsgGUID: 6x6pDpbYQJGtO06c1rBwRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="227995290"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Apr 2026 20:57:35 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xZE-0000000005L-3H0u;
	Tue, 07 Apr 2026 03:57:32 +0000
Date: Tue, 07 Apr 2026 11:56:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1]
 drivers/vfio/vfio_main.c:65:6: sparse: sparse: symbol 'allow_non_coherent'
 was not declared. Should it be static?
Message-ID: <202604050345.OFbVEE0i-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   ada21cf1539a8f6cc18fdcfef09428a01df5b627
commit: 88e59f90e918a5d074d07e6f6c5af7a58317a1d4 [1/1] ANDROID: drivers/vfio: Allow non-coherent device for pKVM
config: arm-randconfig-r131-20260405 (https://download.01.org/0day-ci/archive/20260405/202604050345.OFbVEE0i-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260405/202604050345.OFbVEE0i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604050345.OFbVEE0i-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/vfio/vfio_main.c:65:6: sparse: sparse: symbol 'allow_non_coherent' was not declared. Should it be static?

vim +/allow_non_coherent +65 drivers/vfio/vfio_main.c

    64	
  > 65	bool allow_non_coherent __read_mostly;
    66	module_param(allow_non_coherent, bool, 0444);
    67	MODULE_PARM_DESC(allow_non_coherent, "Allow binding of non-coherent devices, not supported with type1 IOMMU. (default: false)");
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
