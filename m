Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642E8214A69
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 May 2025 16:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748448507; cv=none; b=PZmc1ZosYypYYRvV28QflJriR+D2TiMvZRFsAboHxvvkqZ3QFY2+NE8Ps/zIsr7diHxIrFj30yW1cgrrY7kS7KuZMrHgoiANp+pTPuqIuvlIF31woZawHOmRce26AJG6Bw8aYFiROjiRIOT4zHpVO3aA0MSEwBJZLIQQLsa1PX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748448507; c=relaxed/simple;
	bh=wV1ai+M0wHUvbABMTQtfxoHuPXUEXDNCRpn8MurwwdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=btcyDvsXNTLSiV+cemCx0MFd1TOr8eamgLx+xvh5Brfm7KmG8OZsTGfDk4KMeTytSPBVL/5KapStR+vQ8kp3RW39NrBJek3J1ETr/cV70SsN0ySnOwa7t10VpvFswUfF5mlkZ9OsLU/uKKjcctFihj59Ibkkyg1RH/xm+3wi88I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iTFITgmE; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iTFITgmE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748448505; x=1779984505;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wV1ai+M0wHUvbABMTQtfxoHuPXUEXDNCRpn8MurwwdQ=;
  b=iTFITgmEsWz2l62pOmA9fTpFXhyJphTDnr6ou+E5pB9d2jBtOcL6QGd/
   B6N4E/y6a+EHM0FgjEGmat5W5ZJLrIFKVMXowCR3M+E89TKCjlccwu0KT
   Nz1wxT/gbM7XRZWaKXbROl+16pKgHIo2nssG/b9WPcCqtK8Z7myduFEKL
   GMjfTyX8rctZfVZDx6DVtB3zhJFdNcaY+0FxQkp7Tf1rWkOMMVwZ/sv4m
   U84diD263n+tkmV44hXPN2HWjrFM9nLR9s4KepPtbylOvu3OScMUUtjEm
   ANTeP0iSHxu+dv3RHH+QohQvVhawtHkYLuoQObJMc2LJm6e8d4qeN2DsR
   Q==;
X-CSE-ConnectionGUID: bCpEH5pXTtmdQmpzfRRWgA==
X-CSE-MsgGUID: 16CuSbDQSSu8CX8CR8iLTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="75871750"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="75871750"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 09:08:25 -0700
X-CSE-ConnectionGUID: H7PWQ1HQQde1Q8XSROrVxQ==
X-CSE-MsgGUID: vnXGkFgqT0m76zL9cng0Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="143282637"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 May 2025 09:08:23 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKJKH-000VqQ-1O;
	Wed, 28 May 2025 16:08:21 +0000
Date: Thu, 29 May 2025 00:08:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1592/1592] ld.lld: error: undefined
 symbol: init_net
Message-ID: <202505290015.YgAGQH9n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zhao,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5ae76523ccf96ec8b8d73d541e305bf15b6b697e
commit: 6636f4434a9c5c9c645694db206188ee5a6626dd [1592/1592] ext4: report error to userspace by netlink
config: x86_64-buildonly-randconfig-002-20250424 (https://download.01.org/0day-ci/archive/20250529/202505290015.YgAGQH9n-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250529/202505290015.YgAGQH9n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505290015.YgAGQH9n-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: init_net
   >>> referenced by super.c
   >>>               fs/ext4/super.o:(ext4_init_fs) in archive built-in.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
