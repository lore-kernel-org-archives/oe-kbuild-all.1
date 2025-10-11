Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C73A1F2382
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Oct 2025 10:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760178230; cv=none; b=YcNDjuuqjJ0xjVZeT1+t4qFvSJ7mDlPpnxdTnPqHBwUoPxR7VXLaGJ1MiJ8JRVxfwcBFi2hYJxWtQd4gVZf8pjgQdXijVhKJFPo7OPDUqx4qk2osy1+J3ucSi60rL0QMv3L/1olkRH87GzZHH3qhYAWSC91uqEVZjIWBL+KPKFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760178230; c=relaxed/simple;
	bh=3yD7UDdcW/vQXwyK/LT/qNUPX1GQjHCi0Qirli5ZlP4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MAUUTbaMtTg6rGMaWqHD72EzgiDfagro26B+wYPGdE4146xTcN9ZDP7ZtDOEn48Z0R5P3aeSlsIhByJ8vOMDnrTDYsdhiD7H3DZVUOK3Ai2Y1rybK95h+bgf1Bo7de1H2cZ74oO+m9F3SSI6qsNlgCWuLV/jp9FrBfE607gdEcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MKv3+Jjh; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MKv3+Jjh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760178223; x=1791714223;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3yD7UDdcW/vQXwyK/LT/qNUPX1GQjHCi0Qirli5ZlP4=;
  b=MKv3+JjhibaVYTw4Yutck0AiNadZjzPqkW3SShHD2DDQvqv0tE321YaN
   x2m+H8zrJpSfjTJgywvDiAJWFwHZXfzuDY5l7lBEAmRo/TbIl4c1vkIaB
   MzIUK2nLzYgb3rMAjCjM3bTVfszRVXm/gvKFWoLXJ7DAiCU6ueeJBfGOh
   /pM8Mpldx17Hh5EBL2d1kgQEl7F0Jmu7d8LxyqZ6xIO4A8eeFKlWfDbWq
   Mnwu929tW9KgPCuQu9A6t2pHDrPzTNDGRpsJuvR2QK/R2WOLm16IK73ki
   fPy+/8XZVsvQOnnMhN/Wip5j4C9Yjppj0+1QCsQpcosqSLya6fQTawRZ+
   g==;
X-CSE-ConnectionGUID: puHyKKPmSJavpm5IuA/pyg==
X-CSE-MsgGUID: Ly0RCapvSduS0aS/O+fBBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="73068033"
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="73068033"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2025 03:23:42 -0700
X-CSE-ConnectionGUID: lWhFFWovQrSJHpiHLtMnfg==
X-CSE-MsgGUID: SM42YnfaRpagQaCi0oJB1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="186459432"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Oct 2025 03:23:41 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7WlG-0003i1-2U;
	Sat, 11 Oct 2025 10:23:38 +0000
Date: Sat, 11 Oct 2025 18:23:38 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Matt Coster <matt.coster@imgtec.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: ld.lld: error: undefined symbol: devm_pwrseq_get
Message-ID: <202510111806.CMulNMKW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michal,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0739473694c4878513031006829f1030ec850bc2
commit: e38e8391f30b41c5a24bb46dc6ef4161921e782d drm/imagination: Use pwrseq for TH1520 GPU power management
date:   6 weeks ago
config: arm64-randconfig-r113-20251010 (https://download.01.org/0day-ci/archive/20251011/202510111806.CMulNMKW-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510111806.CMulNMKW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510111806.CMulNMKW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: devm_pwrseq_get
   >>> referenced by pvr_power.c:320 (drivers/gpu/drm/imagination/pvr_power.c:320)
   >>>               drivers/gpu/drm/imagination/pvr_power.o:(pvr_power_init_pwrseq) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: pwrseq_power_on
   >>> referenced by pvr_power.c:336 (drivers/gpu/drm/imagination/pvr_power.c:336)
   >>>               drivers/gpu/drm/imagination/pvr_power.o:(pvr_power_on_sequence_pwrseq) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: pwrseq_power_off
   >>> referenced by pvr_power.c:341 (drivers/gpu/drm/imagination/pvr_power.c:341)
   >>>               drivers/gpu/drm/imagination/pvr_power.o:(pvr_power_off_sequence_pwrseq) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
