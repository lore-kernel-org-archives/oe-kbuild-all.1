Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D61B2765F8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jan 2026 01:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769565311; cv=none; b=t9e0j5kVjRL9gaha0IBe8XJpSrSWSdEvBdAKnKRhTogAwSrHfIX6gpAisFNHTSqgWUrpuB41EvMOYEV+cvV2oQLdvDmhqpSRE6+VDhHgNIIhZZlEl7mFHID8l7g+V8UPhaSdIdCptkAcjRN6ddmUToY29GViu40ZnT2pZsgOVC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769565311; c=relaxed/simple;
	bh=dXKnGEzujSmpf6yKp0oEmv8nE6F+hdlYDH7ZMOwVxPM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MUOmv62j5/khP8/gkz59clc6OUH6gmm1U4XLaEE0xHocaEFOwKX6DEvyW+KYcGqcIvsg2SlWKAjsNfswtL+qxWzn3RpQ0Cs1mRSQpVR6gvYlVJX2fBu3RPR8NovXEkDCM0r3tjxZkz5Ds2Psg44mc6UaM1+Qrcvoaapx9JchzXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cPh4g3fG; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cPh4g3fG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769565308; x=1801101308;
  h=date:from:to:cc:subject:message-id;
  bh=dXKnGEzujSmpf6yKp0oEmv8nE6F+hdlYDH7ZMOwVxPM=;
  b=cPh4g3fGjmENGOaGlczCQGtDLUdcr+7UJ/tUelH4SYIbQPynyF/JESly
   3Hq1l2kp2meFKbp5Fjwb60hCDxfkAvTaUkAXMjl2T/q598iZ2Nc1aT58N
   Ku0uSIIIwFlkk+XFh/VdPTT1ku8fEQOoDz7lhu5IIcDJY+f4Hc8NoO0G4
   zGnr09ZgxbAkVnWNwhMqahdgi5HXhgPW5ojgGYLqG/3zJwu51Jnc95OGU
   hZoCB8NtQ6haW+AClZ6AUfRUqprpXg2SD8uCbsPRcKEtn7WvMyxPQIAA6
   gdYib9FmJqF8xbznHIx5V9xd5HVi2G1705JhKSI/QbYbas+3TbGRqLZTK
   A==;
X-CSE-ConnectionGUID: 69S2YiqpTj6L1gMI4T4SIQ==
X-CSE-MsgGUID: dClcIUvyTtqe/XRgq+dZ0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="82202882"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="82202882"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 17:55:07 -0800
X-CSE-ConnectionGUID: uKyjoRI4RxKY0+LqhpE4uA==
X-CSE-MsgGUID: Wgnn2C5pSnSOZoG8eB6Fug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="231088152"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Jan 2026 17:55:05 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkulq-00000000Z7D-32IH;
	Wed, 28 Jan 2026 01:55:02 +0000
Date: Wed, 28 Jan 2026 09:54:53 +0800
From: kernel test robot <lkp@intel.com>
To: Youling Tang <tangyouling@kylinos.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>
Subject: arch/loongarch/kernel/machine_kexec.o: warning: objtool:
 kexec_shutdown_secondary+0x54: stack state mismatch: cfa1=3+0 cfa2=3+16
Message-ID: <202601280935.9DOUzTgi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Youling,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1f97d9dcf53649c41c33227b345a36902cbb08ad
commit: d162feec6b6e7ed97986118450812fdd7e9ba202 LoongArch: Add preparatory infrastructure for kexec_file
date:   4 months ago
config: loongarch-randconfig-r111-20260128 (https://download.01.org/0day-ci/archive/20260128/202601280935.9DOUzTgi-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601280935.9DOUzTgi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601280935.9DOUzTgi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/loongarch/kernel/machine_kexec.o: warning: objtool: kexec_shutdown_secondary+0x54: stack state mismatch: cfa1=3+0 cfa2=3+16

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
