Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6FA231827
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Sep 2025 17:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756834269; cv=none; b=exJ2d5/mmMlc/Pu1bTkNav/6sRhj2uD86e6Ispt2LePGSCYdpr5sIL7eXue7S6oOmo8vjZCZg8qVYIMY9n56LwDGRNAmCnWS29Ybm6ikFcb9/Bzm+iTjA3V6Y1u+tk1nNbcpjMIELd+eBiW0AsnO1DC5eUHcWf7PkkiwPcxu0Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756834269; c=relaxed/simple;
	bh=kPEmyGzk7JOan62bPq1mkq8RSoXauUy1CfZeQlkrVxM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FS9zpPSInue7Uc8hnfamgCgOolWwib3qGWWg8OHAOqXMXqYo5R+mQdpVpyrFCyg3x0CHYtGftTrMDz/lJ+GsWBDSbJ273D6MPEFTSZR86VggjD2JZbWiD2eI382XyoqUm/8yXmV1U7KUMYahO/YjzZV2OJcv5IhGnIqMQ5amhp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZkB+zrN4; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZkB+zrN4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756834267; x=1788370267;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kPEmyGzk7JOan62bPq1mkq8RSoXauUy1CfZeQlkrVxM=;
  b=ZkB+zrN47IX9t9iqM9HPzy5YkFpjSF0wRUBaomZVhrtPNVsJ01QDBIzu
   aA3lIHuBrWTH++rRBLWrPIS3LaOjj6fnEupWUa1kJIQV44QhafpBKbOOn
   arktTylZaVTsqlOO3Jm42Laxcu5Nz+HFhG3od0FIA4s4Uykp4zVw+yy3R
   8fYqa7ReCmTY2d/prumAJt7rXFQqPnPpOQvFsd9fNNPb7cSgyXgEZ/Oho
   m6oZRqXdlRXJiCBdzB8weDCRnnbEwOiexbNNiNI8XRcR67NQ/Xf6a6umV
   03kDTXGplTJD4pIjO+K+UQSLoBLkkdHHQj7ojW0qFcI5wjltQ8ni9sKSh
   w==;
X-CSE-ConnectionGUID: UpHEBYLnQOSE9sqbQECq/g==
X-CSE-MsgGUID: IcehgKuTRaCq2p1TFwOfDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="58821655"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="58821655"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 10:31:07 -0700
X-CSE-ConnectionGUID: fwjbrePgQLOWpzaivIUBYQ==
X-CSE-MsgGUID: 8Y9CYjwPT7SzUV7Ei9L3xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="202253178"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 02 Sep 2025 10:31:06 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utUqV-0002oS-0N;
	Tue, 02 Sep 2025 17:31:03 +0000
Date: Wed, 3 Sep 2025 01:30:50 +0800
From: kernel test robot <lkp@intel.com>
To: David Ober <dober6023@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>
Subject: [linux-next:master 3839/5641] ld.lld: error:
 vmlinux.a(virt/kvm/eventfd.o):(function kvm_notify_acked_gsi: .text+0x3a8):
 relocation R_LARCH_B26 out of range: 255363640 is not in [-134217728,
 134217727]; references 'lock_is_held_type'
Message-ID: <202509030125.8uFYoFGf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3db46a82d467bd23d9ebc473d872a865785299d8
commit: 79e3197384f1735354132e73e383b9ea9ccd7027 [3839/5641] hwmon: (lenovo-ec-sensors) Update P8 supprt
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20250903/202509030125.8uFYoFGf-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 2e122990391b2ba062e6308a12cfedf7206270ba)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250903/202509030125.8uFYoFGf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509030125.8uFYoFGf-lkp@intel.com/

Note: the linux-next/master HEAD 3db46a82d467bd23d9ebc473d872a865785299d8 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(virt/kvm/eventfd.o):(function kvm_notify_acked_gsi: .text+0x3a8): relocation R_LARCH_B26 out of range: 255363640 is not in [-134217728, 134217727]; references 'lock_is_held_type'
   >>> referenced by eventfd.c
   >>> defined in vmlinux.a(kernel/locking/lockdep.o)
--
>> ld.lld: error: vmlinux.a(virt/kvm/eventfd.o):(function kvm_notify_acked_irq: .text+0x7c8): relocation R_LARCH_B26 out of range: 255411352 is not in [-134217728, 134217727]; references 'dynamic_preempt_schedule_notrace'
   >>> referenced by eventfd.c
   >>> defined in vmlinux.a(kernel/sched/core.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
