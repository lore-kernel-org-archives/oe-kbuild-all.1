Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32DF18EB0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 20:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727643316; cv=none; b=AcK0OB4fgIKtL581/jIT1eO5y1N2PIYt+52sEqBAgPfOFRRxl0BfW+tOTzjab5SluUJMGfHl4It7pyEpn/IToidWe6031p7EDBL3QEyAmznDEA/ezSm44/9fuhdRs9GyOtVdRB+NrYmYX64Q6HZA4OzwfSEcZoK5TmmJ5NKhDFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727643316; c=relaxed/simple;
	bh=rfNbIg1shpLR+xzkxK/uACEBusKB4s1jJrgxJYcBTRw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SMqrJT4rgbFa/STyOL5n+R0H59cAuirkJesAUdG1uvtm8FN2qTxUvk+Io4HRZdK9qw58L26xewIXiFP11efsff0ft+WBjzZkdvhHNSurgr8Y46hGgMbAD6H9p26NkkXrlwdm0K0EpO7WZtHvDr5kWqbvg+V7BX75l1LBaGHmeQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dhMW7ip9; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dhMW7ip9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727643315; x=1759179315;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rfNbIg1shpLR+xzkxK/uACEBusKB4s1jJrgxJYcBTRw=;
  b=dhMW7ip985EWTqflsNxrlGlFoXJUWwm81xi549Xj5jNNZLLP0WP+qvth
   8TrpyX80xKV/pzFW4BoWZp0o7ocByT/Uaq23odoYwc4OxG5jPgKurxsNc
   9U+nvzyhx/av9g0Gg14dF7o4k+nb+j+Ldof2H2Ij5YKfaGEFPiiXzE2xM
   yJy7XIT4hOJUhP5O7vUdjwFBKoZABRA2PaYTMXOxjNE0eky/uu9LLAnHK
   r0tqrZ1g8zgJBs//CjQNepV3XAy4mDD5kRHeBis8h0/e38gd1Nc95buBo
   ptZAr5EelODXPlgnf0TdYgyHaj95E2ZoIvUkIKwFTLocenqqoUY/AHjjW
   w==;
X-CSE-ConnectionGUID: jG2Giti8RWajDqMSK8FmbQ==
X-CSE-MsgGUID: vy5MhwmVSwyeF4zZFhySLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="26230943"
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="26230943"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 13:55:14 -0700
X-CSE-ConnectionGUID: IDVScdLZREKqc6ZRJwSplQ==
X-CSE-MsgGUID: usaAhCaDT8u8WiJzLwpM9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="73151931"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 Sep 2024 13:55:13 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sv0wh-000OiH-0B;
	Sun, 29 Sep 2024 20:55:11 +0000
Date: Mon, 30 Sep 2024 04:54:35 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 14594/23805]
 arch/arm64/kvm/../../../virt/kvm/arm/arm.c:411:36: error: 'struct
 sched_info' has no member named 'run_delay'
Message-ID: <202409300420.xihEjts7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi chenjiajun,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   983693eea268270a0270335c61b8ed2188ca0017
commit: b94fc31d4e16ff65dc2141f0a1a3af6a3aac5bb2 [14594/23805] kvm: debugfs: aarch64 export cpu time related items to debugfs
config: arm64-randconfig-004-20240929 (https://download.01.org/0day-ci/archive/20240930/202409300420.xihEjts7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409300420.xihEjts7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409300420.xihEjts7-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kvm/../../../virt/kvm/arm/arm.c: In function 'update_steal_time':
>> arch/arm64/kvm/../../../virt/kvm/arm/arm.c:411:36: error: 'struct sched_info' has no member named 'run_delay'
     411 |         delta = current->sched_info.run_delay - vcpu->stat.steal;
         |                                    ^
   arch/arm64/kvm/../../../virt/kvm/arm/arm.c:412:47: error: 'struct sched_info' has no member named 'run_delay'
     412 |         vcpu->stat.steal = current->sched_info.run_delay;
         |                                               ^


vim +411 arch/arm64/kvm/../../../virt/kvm/arm/arm.c

   406	
   407	static void update_steal_time(struct kvm_vcpu *vcpu)
   408	{
   409		u64 delta;
   410	
 > 411		delta = current->sched_info.run_delay - vcpu->stat.steal;
   412		vcpu->stat.steal = current->sched_info.run_delay;
   413		vcpu->stat.st_max = max(vcpu->stat.st_max, delta);
   414	}
   415	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
