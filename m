Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DA19475
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Oct 2026 00:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792023898; cv=none; b=DfRTw9X97Xg3vwSC/Od7C6RKRkR58isVvigADW09sQ7QD0Ix8Yj2LNdf1nAfImQTkosdC9GoGr32nBlQY8zY2TsarrLmIvNReNv03I0e2ovv+JY45i7XaVKwgX/aW/WUDv33/vOk0KCatC9BICMnr4HHp/qyqx4Pu/Ve3ZGYdjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792023898; c=relaxed/simple;
	bh=n1HmAV0s/4WoK4lSuW3sVpvXJhXfcjjOE/qxqvbFsmI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Msxzx6Au0NajlTScWGSVRinvP27rEw6kfqaKdhYlOcE8lqyeqQBtqOi27NxurGxe1oo31ncZ0PDFE/FraehiYUYtGV/3xyjF23+4MyXKewEtc5W6LNWmDV0PIcoLilUtqnBBUP0FYlHB6fbR9JugYi7mRcOIdRlaUC1BmGedEas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FQg0ucG9; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FQg0ucG9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792023897; x=1823559897;
  h=date:from:to:cc:subject:message-id;
  bh=n1HmAV0s/4WoK4lSuW3sVpvXJhXfcjjOE/qxqvbFsmI=;
  b=FQg0ucG9Nv6oCYEdJPDgaBRZFcmAv9JKA23S7byV+UiAcUH70kQAt3V3
   bvXTGSA5dWMnzsBYINTlL6HQiJJCDjNQDUuGYZFePdpD5jhmPq3iyylOt
   X38o/iuit7ZeiEzFBJJWXaprTKQaVdHvmVrAJia5JMYlwvebVBAvLakwc
   vnjblSc6BVgSe10AHg3FrsN+v0TeazYwXfhGAIJ0EekFrTzmdasqJmHX+
   jso7XX+FOU8Ddl+0BwVEnLcyKWlRNm3QBc977sGE/LTY+yMJ8k4rWjEmA
   XPfJ5HcSP2iXt6AHF5CCfRTdILhfgnvyBH5JWZfDcl26hmP/jlekrqjpX
   w==;
X-CSE-ConnectionGUID: 0SAhVe7QQT6ktJpAZ27Www==
X-CSE-MsgGUID: nrx5RHAuTGeo2b4Tn5LmKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="791766"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="791766"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 17:24:56 -0700
X-CSE-ConnectionGUID: RCDyENnkSp+qeUGXVuhTEQ==
X-CSE-MsgGUID: cq2/eYxaRVyRwCsSDsTMXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="3398599"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 14 Oct 2026 17:24:55 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xH9H9-00000000FQn-2zEr;
	Thu, 15 Oct 2026 00:24:51 +0000
Date: Thu, 15 Oct 2026 08:24:12 +0800
From: kernel test robot <lkp@intel.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: oe-kbuild-all@lists.linux.dev, David Woodhouse <dwmw@amazon.co.uk>
Subject: [dwmw2:spinpark-will 29/40] WARNING: modpost: vmlinux:
 section mismatch in reference: arch_cpu_preserved_park_init+0x4c (section:
 .text.cpu_preserved) -> trace_hardirqs_off (section: .text)
Message-ID: <202610150817.8VZXcYha-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux spinpark-will
head:   b105e7721006184fc170416343bb6676af249265
commit: f815dea5c648409365bb42d1e903fc7c1976a4db [29/40] arm64: liveupdate: Add support for physical CPU preservation
config: arm64-randconfig-1001-20261013 (https://download.01.org/0day-ci/archive/20261015/202610150817.8VZXcYha-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261015/202610150817.8VZXcYha-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610150817.8VZXcYha-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: arch_cpu_preserved_park_init+0x4c (section: .text.cpu_preserved) -> trace_hardirqs_off (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: arch_cpu_preserved_park_finish+0x38 (section: .text.cpu_preserved) -> trace_hardirqs_off (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: cpu_preserved_stack_va+0x58 (section: .text.cpu_preserved) -> memstart_addr (section: .data..ro_after_init)
WARNING: modpost: vmlinux: section mismatch in reference: cpu_preserved_stack_va+0x60 (section: .text.cpu_preserved) -> memstart_addr (section: .data..ro_after_init)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
