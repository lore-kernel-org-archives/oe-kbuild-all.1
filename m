Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855476;
	b=hklaMP+AM7ZF6inttCKe0gBNR5myYsqBcGobaYWoY+JmVo1nCfn4peyMx2E72La6U1wI
	 QGNTxo705/QHl4Rv1DbbZSw5yJPNq/0LaApfclEzSJUvk/qNiFzzDK/83VFl+FlQKTOaE
	 2BTau2hRPBAAbd3JvACH9cpi6UrLMUSYMQ4rBc277ysluuH3AV82gvT5FTiA5Xurm7WCn
	 eVVXT9F+r2sITO3y1gKbs9keZH78zgQ1bPh5LDKLGBqBtv/CzTPJDc9lPfZB2fP+stlUd
	 k60gwAixcPCMc+amiJlPfKK9Jjp4vqJSGZi/ODOuwKzOVMtoeFjgK5LE1NN4wv1cugQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855476;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=O4upto3EJKUWhVwZadv8bytCOVjoNu31rt1JKnh0U9w=;
	b=GXQwXu9kAcmubK5Ws41ThJjaW4lCOGw1//30PWmwQiDlAacfA5jk4DxIsK+c6rcxK0cK
	 c30JW3CPrYJL8ufIxgrgwuMdp+PQlo/CiXb0sHzn5QzxKLVVJsahz2BADRUTbTf0aVj4p
	 7ong70tWx5xEugn6OhSGVI8Cxj8TMK7UMVfEyXt+KH4IzUw9T5alPTnqm8tlRk6iHYRiO
	 AR15Al8OxNvYqCy3SWmPw48tCfOQ0cDEAL1+PE8wI0ogXJ8UuscP1ij0RYVlidqEVthdh
	 MSQKoCreWuBw6LnZOMdt743NDjKVDtZeXdkiFyruLuZem/IAucQ6TZmLFWPEYAx06gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BudgLNao;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE14C606A33F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Nov 2026 18:57:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE14C606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BudgLNao
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794855475; x=1826391475;
  h=date:from:to:cc:subject:message-id;
  bh=vqiOPma/BktZodj7GNnVpa7qz/e37dC2ln156ZuwZ/g=;
  b=BudgLNaoWvv9lfLPp4zIzGCMF67OyRR525N56v6TZAf3nNQKTBl1jUXD
   KUlrf4NbTp0W54cVh8CzMEt+1GawbnCHry3SL0g+sDQsgSbFdd66vaq92
   mPEB4z0idYF6gauuI/QcvKTuCb6Uo7F+z843/smt87gCxiY+VAnU5r3rQ
   u59lu3+NCQSy/PfBF7XwVAirWvrjTJiDcZgc6tKYhsmLhNl6ZdIYeAWc2
   2u5qvQjDyX4Di/X/zsLESfcqc3VqNmu6zu4WTg10A0LcbOj/O9ZkAJDTz
   OOQeaokALXGSff8k6P+cAlzTHGh6jsZXEXMJoNRv2c5WpbdIS9XEkFyaA
   A==;
X-CSE-ConnectionGUID: PFEUBzp+QT2f5zZGxSDrFQ==
X-CSE-MsgGUID: +TvqPU7eRby/ZfqqOissUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3633381"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3633381"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 10:57:55 -0800
X-CSE-ConnectionGUID: 44RDtqlPTjy25LooVvichw==
X-CSE-MsgGUID: HnVL2CI2Rr6FSaAwo74jGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="10020024"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 16 Nov 2026 10:57:53 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xT1tm-000000002n3-1NKF;
	Mon, 16 Nov 2026 18:57:50 +0000
Date: Mon, 16 Nov 2026 19:56:48 +0100
From: kernel test robot <lkp@intel.com>
To: Josef Bacik <josef@toxicpanda.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Subject: [linux-next:master 5327/7428] ld.lld: error:
 vmlinux.a(init/main.o):(function set_reset_devices: .init.text+0x14):
 relocation R_RISCV_HI20 out of range: 542226 is not in [-524288, 524287];
 references 'reset_devices'
Message-ID: <202611161914.JydKu5O7-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   84abb955b1015477aa11a96e2f3ac1b938b77f48
commit: 9b432eb4b45e7828530b81fb4c23adf2681572cd [5327/7428] fs: make umount(2) of the root killable on s_umount
config: riscv-randconfig-2200-20261116 (https://download.01.org/0day-ci/archive/20261116/202611161914.JydKu5O7-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d5c981bc431fd5e8ac0bc624472ea081515a1299)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261116/202611161914.JydKu5O7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611161914.JydKu5O7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(init/main.o):(function set_reset_devices: .init.text+0x14): relocation R_RISCV_HI20 out of range: 542226 is not in [-524288, 524287]; references 'reset_devices'
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function debug_kernel: .init.text+0x54): relocation R_RISCV_HI20 out of range: 540969 is not in [-524288, 524287]; references 'console_printk'
   >>> referenced by main.c
   >>> defined in vmlinux.a(kernel/printk/printk.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function quiet_kernel: .init.text+0x94): relocation R_RISCV_HI20 out of range: 540969 is not in [-524288, 524287]; references 'console_printk'
   >>> referenced by main.c
   >>> defined in vmlinux.a(kernel/printk/printk.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function loglevel: .init.text+0xf0): relocation R_RISCV_HI20 out of range: 540969 is not in [-524288, 524287]; references 'console_printk'
   >>> referenced by main.c
   >>> defined in vmlinux.a(kernel/printk/printk.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
