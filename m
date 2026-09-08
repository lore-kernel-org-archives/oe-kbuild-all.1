Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE285315D53
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Sep 2026 01:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788831710; cv=none; b=Tmv5ZjLTxKsfi3UYB+UHU5kUMrT2jmcP1AsMbu4jXJCS3+86PhP3CaR4plHykpAdQzwbNoMV6uOS0un4MpZDiTBmukN5RyRwwXU4SOLVoH0ByKR1Qkn8tq6jF/TmVVu13rmjy00XPdOKb+mpL7hpETpc3+FoZW5f7WUFX0Z7dsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788831710; c=relaxed/simple;
	bh=ZIAKJCqfnd6Munf8lqt8xYzw2Ak+dl/gyQ4K80Bief4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k4zy2GESascD7Hgux8UP1eP7v1OCCC7DMsE8ACMQ3CXdpLegUA/2MROH/AbJwn2ebDGJth/lJbNXaP6fLq/CU/rvv6YKgMKlGz3vyXA6YgGNY7nh7vqHo+kNlf9vT3vy3FMjKm2HC8oWUVqODN3bWEt4yriey6qMy3T5m2V3twk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ilVtkrpC; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ilVtkrpC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788831707; x=1820367707;
  h=date:from:to:cc:subject:message-id;
  bh=ZIAKJCqfnd6Munf8lqt8xYzw2Ak+dl/gyQ4K80Bief4=;
  b=ilVtkrpCzaucqTYO9k8WzR0PnqSxMbJs0BB/w4xPH5pYkurRzH2jd5Dw
   lgrsrobIQ/I9tjoTzjg8XUOZ44verjdT67AEjVuYu5wu4/BPY35uTA7jq
   pEFeW5H73IJGZ0z/5hryEgdfF2Ayvb7+0pmdEoH3GNbgUwxnWG64PoS64
   tncZKB7Xgvm0K/Oavr++T1qhUBM11bxefEM5mR/EpLkW55L3Bqobh04kd
   IJ5Ls9n8qUDQ8yRrvNkewwwgqVGKJ4iamg7abUOaK9vOvJFSYaElqK1mr
   deg/j52/3Q9bGgWPKaTTpJ9w+ut7KHAE7efBg+SaOKGHMJYnzZooacvmE
   g==;
X-CSE-ConnectionGUID: dUhFXI63SvS+05CSO9xJBg==
X-CSE-MsgGUID: ZQ8iuexOSQOkCAtRcL7Irg==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89100353"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="89100353"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 18:41:43 -0700
X-CSE-ConnectionGUID: rVmvipeyRXKAIcFx5PLAAQ==
X-CSE-MsgGUID: 6in3B+grTJyXaBX+10WqmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="295739484"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Sep 2026 18:41:42 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3kqC-000000001W7-1ZLI;
	Tue, 08 Sep 2026 01:41:40 +0000
Date: Tue, 08 Sep 2026 09:40:50 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lpieralisi:dev/acpi-static-table-gsi-deferral 4/6] ld.lld:
 error: undefined symbol: acpi_get_gsi_dispatcher
Message-ID: <202609080930.ZgZ38a1l-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/linux.git dev/acpi-static-table-gsi-deferral
head:   1d08fa15e38840796959db081e78ac188d2c882c
commit: 34e97e764f2788632c0b67499f639855e19d82d2 [4/6] acpi static fwnode irq_get/add_links
config: i386-randconfig-063-20260907 (https://download.01.org/0day-ci/archive/20260908/202609080930.ZgZ38a1l-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609080930.ZgZ38a1l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609080930.ZgZ38a1l-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: acpi_get_gsi_dispatcher
   >>> referenced by property.c:1798 (drivers/acpi/property.c:1798)
   >>>               drivers/acpi/property.o:(acpi_static_fwnode_add_irq_links) in archive vmlinux.a

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
