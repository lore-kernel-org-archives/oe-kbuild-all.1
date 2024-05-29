Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03C516A364
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 May 2024 21:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717017406; cv=none; b=Mc36XHujd6syXsptlczPfPOS/allrMW3elrbmZOyuu0XWmBuExsxukZzgAqADIK+Xei6KrG23jCB4MirIc45aQtNkwuC2aunzx1PH7ob8yu19q6aEaaRbCUzzTK55B1b7FRIrqMlu6JE5qL+5qQOgiuJprOpUgwaS/5Wm8BxGrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717017406; c=relaxed/simple;
	bh=LZ+JiGybD37jt5JZD/zDx7+KsI/AMKPbc2e42zQFx5A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UcY2u8j0drUPpQsfUmS79AM6mXwLR0QpzuXF2vjW1HW8pg+iX9k/+MhKq/gI+dTDQvVJS6eqyHU2qy/cVemJSfVc6gjQs9UwNDUQFl0zT22Xo+30/H+tU0O2BvTsjbRocC7+IHuDUpkFpUv5vX/hz4vzHbyo9ssFWXra3vCS3qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NBWJUEkT; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NBWJUEkT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717017405; x=1748553405;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LZ+JiGybD37jt5JZD/zDx7+KsI/AMKPbc2e42zQFx5A=;
  b=NBWJUEkTAYGds6qx+GvTrU192tu5BvGa9FaAE/Wf1ZpGH3eoX2EdpfpS
   6/L7CAarG0imZNnSBCDVnd8CdYeaH59iKeUBWnLAMAIKsU8CbXDQ7Z1EI
   3P4mUYFpw49EIwWLRZ/x9h3g8OsGJUxB9sG0tgLBWf4sWOb/iQUxKxT3Y
   PNvYsGasZriayh4v95j/xUnr0o8TyEWwQ/E33kivmcnm3F/ZolUcn1iOU
   zOoOLUAkrD4tvgO5uu4kcBqVRkTEtbrbqxXKBT/PXFs0wflvEt1tdSiZH
   38N+Uyz/zRxKUMAayZNjdk7A+5heQA/mlNQD9LgG7xVopJFUClZ0oI7GQ
   g==;
X-CSE-ConnectionGUID: jenqf1EfQ2qx2Are06tecQ==
X-CSE-MsgGUID: ngVnZI/oReidCGFNTd3Zrw==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="24067632"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="24067632"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 14:16:42 -0700
X-CSE-ConnectionGUID: MHrmqk0XSKq3NVlxjHVlQA==
X-CSE-MsgGUID: wTwD+yjiTJKeX6QjNw5IIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="35546959"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 29 May 2024 14:16:41 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCQf0-000EDX-08;
	Wed, 29 May 2024 21:16:38 +0000
Date: Thu, 30 May 2024 05:15:57 +0800
From: kernel test robot <lkp@intel.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [rt-devel:linux-6.10.y-rt-rebase 63/93] kernel/printk/printk.o:
 warning: objtool: __jump_table+0x0: special: can't find orig instruction
Message-ID: <202405300545.mVqyyvyr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-6.10.y-rt-rebase
head:   6d20efa57a896036453f4b061ae22601ef61b494
commit: 127f3e5b794bd6fa90d4649318dd898455efa6d7 [63/93] printk: Provide threadprintk boot argument
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240530/202405300545.mVqyyvyr-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240530/202405300545.mVqyyvyr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405300545.mVqyyvyr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/printk/printk.o: warning: objtool: __jump_table+0x0: special: can't find orig instruction
--
>> kernel/printk/nbcon.o: warning: objtool: __jump_table+0x0: special: can't find orig instruction


objdump-func vmlinux.o __jump_table:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
