Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A522753FD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Feb 2025 06:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739601430; cv=none; b=cskKQUy1pxCFYVh2RdTFqbZTrGKFIlf0zHMx0hYPPl4uOD3TrB3Lf7LdJ1kXycCeqoTA7NSQZsJHIPKNQOYRUAYB8pqRoQUKwx3Og7iAa0MUeQ6xfa4O3vCK4rr7XgBZYZrAykSE34JioONtmvvAiEDNwWG7ecWdES3nrr7QIiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739601430; c=relaxed/simple;
	bh=ijlgQHGJHh4wCisbN6NeAOVAiVCenUFxNRULI8u2Hlw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GJ7WoToMwtjazHFpEYcOB02TjuJuX9PouWdF3b6HLOlVOVxCN7s28ht2UN8FB2a92nrbBCCmFN5zIfSWjwct67PXK2wRl72IAlWoXMvoZy9cS7JcdjeY9CuLn82B7NVhbrWS/TCU6jQSeEyiYL0bXdQBeE0jjbTkhDr+KIukphQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DjbKsbGN; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DjbKsbGN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739601429; x=1771137429;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ijlgQHGJHh4wCisbN6NeAOVAiVCenUFxNRULI8u2Hlw=;
  b=DjbKsbGNsAkOXj5M0B/nEeDNDlUCU1Ao0FZMWqFoUHNII8FVcDGD0iJQ
   82NW+bJzWmzDi+fRh3/wMTrYFRhHAGQ2qM5sQUYMXcwC87TNgiuP3PO06
   +QA4U5kB7zkVwbz2xmFKmwQUHGpDQzmlUaZ23nrZuTOFWzdSPY2WTEFg7
   jn62KlwpHQE0Q6YeWZDmGcBfsSVVTsdxNCotWH1oI8XNEWDyrM3+bZGej
   qZY0yIuqV2t93ikwXE1qkpeDyIZf1vu9Xe66JG6ARs2aiqzZOvtnkjE0N
   s3kQbacANtfaDDibReyTEoyViH7b9faUye/ulM32itbUm3jiosG7L90Mt
   A==;
X-CSE-ConnectionGUID: y6DIAZ8VS6WFitQfeCxxtQ==
X-CSE-MsgGUID: YueAVCbdQCuZlLMkJd3ReQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="44286462"
X-IronPort-AV: E=Sophos;i="6.13,288,1732608000"; 
   d="scan'208";a="44286462"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 22:37:08 -0800
X-CSE-ConnectionGUID: NdhKRAoXSnaVF2Mls9J2iw==
X-CSE-MsgGUID: TFqXAaLCQmy51uJ3r/6g2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113514708"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Feb 2025 22:37:08 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjBnV-001AZD-0i;
	Sat, 15 Feb 2025 06:37:05 +0000
Date: Sat, 15 Feb 2025 14:36:19 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:isolation 5/6] WARNING: modpost: vmlinux: section mismatch
 in reference: alloc_bootmem_cpumask_var+0x49 (section:
 .text.alloc_bootmem_cpumask_var) -> __memblock_alloc_or_panic (section:
 .init.text)
Message-ID: <202502151449.eMJq1mDK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git isolation
head:   7f684a3f36349d046c74e1ba46afb096a0cc2463
commit: 5f1e1e6fa5c4f220ae98b166aed05ca99ae7411d [5/6] sched/isolation: cpuset isolated_cpus don't do housekeeping work
config: x86_64-randconfig-102-20250215 (https://download.01.org/0day-ci/archive/20250215/202502151449.eMJq1mDK-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250215/202502151449.eMJq1mDK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502151449.eMJq1mDK-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: alloc_bootmem_cpumask_var+0x49 (section: .text.alloc_bootmem_cpumask_var) -> __memblock_alloc_or_panic (section: .init.text)
WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-mgr-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-bridge-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-region-test.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
