Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AA138422A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 06:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775542860; cv=none; b=JhKZM30VMYA+jilsDCFzp2rOx08HHOTuK2KNGYKczdNILNwa96sq5Wi2qOmznF5zuTXIJmSisS3t5mJ9ffWZyFLKmmGKl8wocdTV6LhFkz/RfhuqxgtjftryRvbYqlZDlx1HNlhN+IDh+VWjEqmHFEr0tjJ2JfoZp265Iq9FEuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775542860; c=relaxed/simple;
	bh=53PP8kJ0+Vt9Iow/7fUYFV7tDALwqz1eCnZ3Jk2Xyvg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=acwrHuKprF27t0ftkbkvdBgK24ksmCW3mu+1xlwHO7EPfWxGTPVriehHnPZ1rKcUrknUAtgVRjoIyHkr1kgQTk3xL/akMGt4ajNcL9TUpjr/4lrkZM0SLWur6qmcJgx1mVpmQlifaSt0ukwYf6N4vVovX4fhUW+V3KgPLABIDOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nq8UQDN5; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nq8UQDN5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775542858; x=1807078858;
  h=date:from:to:cc:subject:message-id;
  bh=53PP8kJ0+Vt9Iow/7fUYFV7tDALwqz1eCnZ3Jk2Xyvg=;
  b=nq8UQDN5tXkPYwm2aT3lamQvaorT42wWYSwYHR0CWuojhaRYNJKHsTdc
   7DdIt70pJXSjDwOUcYk7k/ubewigW/c9ZFDxVhhXvVs9rp5wYuiIpX4Y0
   BrlRYzuN0MM4go4pkElOXWb5x/Fa9nAyFsDGL6v0mQ8V7bpYCVSnoZs0i
   eUe0XVK99AszZchyBfArh/mjGTU8gnIz/Lt8Av9jBQ7bRIlr6EYFhpApr
   lpxteFgWSnPQYjZ3AGbkXT89GyFN4OR1UBzJx4U8Gsv65ndGklLj5t3SH
   IuDCuTnS3DpCokXgV9icJlzm1rduhb6SAzwwNQaDtY5+xWhLepPmsYv7s
   w==;
X-CSE-ConnectionGUID: 5BLKn1uAQPywdGILmqWGuQ==
X-CSE-MsgGUID: XI/LMQZnSVOmryGpDZyT6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76569963"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="76569963"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 23:20:54 -0700
X-CSE-ConnectionGUID: gchDV0xlSU68R2+Xc01lvg==
X-CSE-MsgGUID: pOaz+NPaT8qcjj9yhMWO+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="227983832"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Apr 2026 23:20:53 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9znu-000000000Fv-00Ad;
	Tue, 07 Apr 2026 06:20:50 +0000
Date: Tue, 07 Apr 2026 14:20:01 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:assert 1/6] ERROR: modpost: "cpu_bit_bitmap"
 [arch/riscv/kvm/kvm.ko] undefined!
Message-ID: <202604071418.gpKdiO5O-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/norov/linux assert
head:   5e88fbeeb3c7355139ca86067d68ea8c77534b92
commit: 5907b85d617f853f6f12834b15eeb7b7f78aa1dd [1/6] cpu: move cpumask-related functions from kernel/cpu.h to lib/cpumask.h
config: riscv-randconfig-002-20260407 (https://download.01.org/0day-ci/archive/20260407/202604071418.gpKdiO5O-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260407/202604071418.gpKdiO5O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604071418.gpKdiO5O-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "cpu_bit_bitmap" [arch/riscv/kvm/kvm.ko] undefined!
>> ERROR: modpost: "__cpu_online_mask" [arch/riscv/kvm/kvm.ko] undefined!
>> ERROR: modpost: "__cpu_online_mask" [drivers/infiniband/sw/siw/siw.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
