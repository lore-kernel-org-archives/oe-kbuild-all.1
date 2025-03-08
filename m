Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE701474B8
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Mar 2025 20:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741467428; cv=none; b=FLTliLgVgdkOpGhiw3zcHkuswrH5wO39I2VBONStrCGFDkzNb0OlKppCelY10iHPXQR7udfi3k8DkJTKURguSlKGoS+49vYCGzcbxQbFsxCDQG8lSbjK1oTprxpgvxcqZFM7CUtD63iz/gGr+M7MgC/XVw7Eftf9SczAs9M8FFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741467428; c=relaxed/simple;
	bh=xquJh1iDTzUTixkp8H/ct2VKW4PsAesCQbj0tZ1EYw0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O9ZfJNhmaS50tG0cRLMyTFnuM5LHBEmt07hTuazoOJwCdbCBT2oBHZjQvWiWmNgB0xOjBmk6Re9X6BjRuv8CT3rGZ0LUGe0onDkUcrbYGo1cnxmEPO2HiWZCAo5NkB+JPZ/0ibIKbHLTFOk8ciZAKUJe4tg7A4jo+2mvpcJ54B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fylTqoRM; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fylTqoRM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741467427; x=1773003427;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xquJh1iDTzUTixkp8H/ct2VKW4PsAesCQbj0tZ1EYw0=;
  b=fylTqoRMybs10d1G+04op8nTOdkMYCEsQAqiABLLYgau8IQk1qQGT2Vr
   iSXRiM/0QyiN872TE2A44S2Ad6EoMSBC8Lq/4N/8/QOf2TMG0ZqBfmOUO
   ROPhqezlvimRth1DE7ZbCcLnrQNKLH6j0k5nSQNHa51BKQhBGldEcCLUx
   aQESOmK14g+RKMCMNffQ4/EgHhrxo7Lkv+JFw6YW2AGQZ22gQfXGNlhou
   ryWkcheI5FmIw5Xva1W+Vu4N2xlNehc0kP5H0Zs3KRE2yO/rMKaAC9cKK
   7ZmuWh5EXBfIGdPdqDvFKOiDihiOffxACnpFFRq1IiaRgkpy2IZa39a6O
   A==;
X-CSE-ConnectionGUID: J3bqIA+5TReLVr9rtkCdWw==
X-CSE-MsgGUID: U27Aax58THaimHLx5idvuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="42716693"
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; 
   d="scan'208";a="42716693"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 12:57:06 -0800
X-CSE-ConnectionGUID: G28eCsXKQMSkxPqs3WKpew==
X-CSE-MsgGUID: sXcYnGvdS0i30u5+YFi/tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; 
   d="scan'208";a="124552323"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 08 Mar 2025 12:57:05 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tr1EE-0002Ik-0z;
	Sat, 08 Mar 2025 20:57:02 +0000
Date: Sun, 9 Mar 2025 04:56:45 +0800
From: kernel test robot <lkp@intel.com>
To: Andrea Righi <arighi@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Tejun Heo <tj@kernel.org>,
	Yury Norov <yury.norov@gmail.com>
Subject: [linux-next:master 3203/9634]
 arch/powerpc/include/asm/bitops.h:126:26: error: constraint 'n' expects an
 integer constant expression
Message-ID: <202503090435.wITkzD2e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0a2f889128969dab41861b6e40111aa03dc57014
commit: 48849271e66114cb980a3bc44218b04d0f8cdcdd [3203/9634] sched_ext: idle: Per-node idle cpumasks
config: powerpc-randconfig-r112-20250308 (https://download.01.org/0day-ci/archive/20250309/202503090435.wITkzD2e-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce: (https://download.01.org/0day-ci/archive/20250309/202503090435.wITkzD2e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503090435.wITkzD2e-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:16:
   In file included from include/linux/sched/clock.h:5:
   In file included from include/linux/smp.h:13:
   In file included from include/linux/cpumask.h:11:
   In file included from include/linux/kernel.h:23:
   In file included from include/linux/bitops.h:68:
>> arch/powerpc/include/asm/bitops.h:126:26: error: constraint 'n' expects an integer constant expression
     126 | DEFINE_CLROP(clear_bits, "")
         |                          ^
   1 error generated.


vim +/n +126 arch/powerpc/include/asm/bitops.h

fb350784d8d179 Christophe Leroy 2021-09-21  125  
fb350784d8d179 Christophe Leroy 2021-09-21 @126  DEFINE_CLROP(clear_bits, "")
fb350784d8d179 Christophe Leroy 2021-09-21  127  DEFINE_CLROP(clear_bits_unlock, PPC_RELEASE_BARRIER)
fb350784d8d179 Christophe Leroy 2021-09-21  128  

:::::: The code at line 126 was first introduced by commit
:::::: fb350784d8d17952afa93383bb47aaa6b715c459 powerpc/bitops: Use immediate operand when possible

:::::: TO: Christophe Leroy <christophe.leroy@csgroup.eu>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
