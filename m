Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB33718784A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Dec 2024 23:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735600922; cv=none; b=YWrjlGXZjx9BMuQ6W8u2bDh1pZXC+yEmm+kOjyKT7gVEYuqdMXwZQRPkxWNnUcs9HWqSA4iqEaIwzUaQRDCbrv2GG1iA3sryL9FUb3Lp5CnrD0VQgVuixj9SIgFx4GubV3cHL353bQPNI1ve7WP2Nw47oneGdJ/jdR8nso+nCkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735600922; c=relaxed/simple;
	bh=UGAo/89EA3tSQBBIzns6pKfOuHWCAnpF3az1Xbqfpiw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HKPC8CDH/tS9qtInOu+jneFpXCHSZ4oalefjMx8GU/VJKz8/np6R9Pe4lKQumedOP5jJtrInsgJw0w/aNQvqRdgHPMPQWp9Bc+T00umdmjWZRSe1H/cTOhGMUvSa++eN8vf8d6CJefHVqXI+qflY4taQY7S/lV0yaoT/MYGeSx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PUjLN1/k; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PUjLN1/k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735600921; x=1767136921;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UGAo/89EA3tSQBBIzns6pKfOuHWCAnpF3az1Xbqfpiw=;
  b=PUjLN1/kvNbh2LjYiZHqkqJRh9siBMPl7TmDsEuKtQeLGWcnDQjmdF1a
   4IcLxKFKJ14kGdrdf33ClGGz4xdgQKyDcnE0gnElrhF0Pu6y0S6J+NQ41
   Mk5UXLMu+8RRDBCN+S8sW3rRB6ELUvcNFPYyoIpUjeBGWMLJ3AxnGlwH/
   uJ4tHwgAHqFFSgx3Qh6RIm049AVECq6elrzFJErELxmh53LdSWRicyWQ6
   2Yx9laQ0QtszjmCTi0UhgkUmiACC/DBkyy0s6g4NSw7zw1RdRWU5e1hqX
   4RYHdeiHBq1IrxRmVh/bKTInen+k4DA3hw/vU1IWeh0ymObqvXsdWM3ls
   Q==;
X-CSE-ConnectionGUID: 7a9tkiTWT7iEF20EQDFXow==
X-CSE-MsgGUID: NImua2A4Rxiautpny8uasA==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="35195160"
X-IronPort-AV: E=Sophos;i="6.12,277,1728975600"; 
   d="scan'208";a="35195160"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 15:22:00 -0800
X-CSE-ConnectionGUID: p0gGlpgoQz+xQqU1XdtBtQ==
X-CSE-MsgGUID: jYjJNrFLQTCMV0SwOMz2Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,277,1728975600"; 
   d="scan'208";a="101024662"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 30 Dec 2024 15:21:59 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSP5A-0006TH-2r;
	Mon, 30 Dec 2024 23:21:56 +0000
Date: Tue, 31 Dec 2024 07:21:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1] WARNING: modpost: vmlinux:
 gic_v3_dist_init: EXPORT_SYMBOL used for init symbol. Remove __init or
 EXPORT_SYMBOL.
Message-ID: <202412310749.lq0h3oA2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   fa17d46017ddb3906be1fb17be44fd08fed9dd76
commit: bca065e876524f576da36657ffe0e7c99cc5660d [1/1] ANDROID: irqchip/irq-gic-v3: Add vendor hook for gic suspend
config: arm-randconfig-001-20241231 (https://download.01.org/0day-ci/archive/20241231/202412310749.lq0h3oA2-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412310749.lq0h3oA2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412310749.lq0h3oA2-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: gic_v3_dist_init: EXPORT_SYMBOL used for init symbol. Remove __init or EXPORT_SYMBOL.
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/xen/xenbus/xenbus_probe_frontend.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
