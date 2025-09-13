Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9013D984
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Sep 2025 04:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757738486; cv=none; b=Uhl8LounT+D3wPr97ytqHoVrc3plAKY7wfSsHl+EAWSzRk/VQrT4o41cstjwTQcqPeyxVbsrFnkQqPEfcrQOcr0f+uWgMJt9Zq1cOlec+n8+2W2n5CL1ll1A+vXp6JS5wxpkkdQgQn2f6+s5elbYUKx6JDsr32lHs2ps+kDebVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757738486; c=relaxed/simple;
	bh=NAYB6lnjVTQI6ZcOU+Maae0uv3vAz0siphHJy9q7CZU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LflDOVz+OjfkfTvuUMiRWXxMGGWWIJzY1ytkjPDH+E58ggjjQM8pPHsWlx/+N7fuy2NIL/hOw4HAKzzxcDeAQp8OvDy27ivgj4CuNSy6p6HG7vZsvo3ke866Lh3zQfUG7rt/XjaM8AmOcGKfsytU3x3/tOKCHyumY8d6TIHwZCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gcUBBGkz; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gcUBBGkz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757738484; x=1789274484;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NAYB6lnjVTQI6ZcOU+Maae0uv3vAz0siphHJy9q7CZU=;
  b=gcUBBGkzbElDeyh4BOxTgoHbgoQGQ5zX6RnXQ+QunSiqZ3Lkd0gOXLVt
   +XktgC66xnCAS/VG+Kpa0WBsN6fjfvShmd9nNNCYAhDtdb2Ys/NlwRBhy
   dz9TQBpWzTMydZmcOZD5kfuoqfsjBQLl0SEpZ0mZ3/2tjDXDszehPpCw9
   dGxcr5HG1Tw+keakZeuYWSJuMlVlfnL9EYm88pXXREb94aGUt/AtF2HPO
   X8bP2ezoPY5rIhtXdxNN7nQnKHGJSXUEizZjlykbE2mr3BfHJhNqei/4U
   Pn/Ni8I2o8wpGYTPoOOF3L8zg6ntgoDuVLRP3J3doHzvkDgkgYsGsf7+L
   g==;
X-CSE-ConnectionGUID: BLePhaXETxaHtM+Gbf7OoA==
X-CSE-MsgGUID: PmDLNh3TRy2tNKM8478RvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="59121939"
X-IronPort-AV: E=Sophos;i="6.18,260,1751266800"; 
   d="scan'208";a="59121939"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 21:41:23 -0700
X-CSE-ConnectionGUID: xajm7aUXQrOZOFKWXzEVQA==
X-CSE-MsgGUID: uNFZFIIVRqWyMlYqu3nqsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,260,1751266800"; 
   d="scan'208";a="173695160"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 12 Sep 2025 21:41:22 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxI4d-0001MS-2l;
	Sat, 13 Sep 2025 04:41:19 +0000
Date: Sat, 13 Sep 2025 12:41:05 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:pinctrl 16/19] drivers/pinctrl/pinctrl-mpfs-mssio.c:164
 mpfs_pinctrl_set_pin_func() warn: unsigned 'reg' is never less than zero.
Message-ID: <202509131257.HqMfXwyf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pinctrl
head:   127422b6eef0f6155406ac37019332bae8403333
commit: f49c1fded333005467d9480d4cba62dfb8059501 [16/19] more wip wip wip
config: riscv-randconfig-r073-20250913 (https://download.01.org/0day-ci/archive/20250913/202509131257.HqMfXwyf-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 21857ae337e0892a5522b6e7337899caa61de2a6)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509131257.HqMfXwyf-lkp@intel.com/

smatch warnings:
drivers/pinctrl/pinctrl-mpfs-mssio.c:164 mpfs_pinctrl_set_pin_func() warn: unsigned 'reg' is never less than zero.
drivers/pinctrl/pinctrl-mpfs-mssio.c:164 mpfs_pinctrl_set_pin_func() warn: unsigned 'offset' is never less than zero.
drivers/pinctrl/pinctrl-mpfs-mssio.c:164 mpfs_pinctrl_set_pin_func() warn: error code type promoted to positive: 'offset'
drivers/pinctrl/pinctrl-mpfs-mssio.c:402 mpfs_pinctrl_pinconf_group_set() warn: inconsistent indenting

vim +/reg +164 drivers/pinctrl/pinctrl-mpfs-mssio.c

98e3f929041181 drivers/pinctrl/pinctrl-mpfs.c Conor Dooley 2025-09-04  156  
98e3f929041181 drivers/pinctrl/pinctrl-mpfs.c Conor Dooley 2025-09-04  157  static int mpfs_pinctrl_set_pin_func(struct mpfs_pinctrl *pctrl, u8 pin, u32 config)
98e3f929041181 drivers/pinctrl/pinctrl-mpfs.c Conor Dooley 2025-09-04  158  {
98e3f929041181 drivers/pinctrl/pinctrl-mpfs.c Conor Dooley 2025-09-04  159  	struct device *dev = pctrl->dev;
98e3f929041181 drivers/pinctrl/pinctrl-mpfs.c Conor Dooley 2025-09-04  160  	u32 reg, func, offset;
98e3f929041181 drivers/pinctrl/pinctrl-mpfs.c Conor Dooley 2025-09-04  161  
ce0bb0403e273f drivers/pinctrl/pinctrl-mpfs.c Conor Dooley 2025-09-05  162  	reg = mpfs_pinctrl_pin_to_iomux_reg(pin);
ce0bb0403e273f drivers/pinctrl/pinctrl-mpfs.c Conor Dooley 2025-09-05  163  	offset = mpfs_pinctrl_pin_to_iomux_offset(pin);
98e3f929041181 drivers/pinctrl/pinctrl-mpfs.c Conor Dooley 2025-09-04 @164  	if (reg < 0 || offset < 0)
98e3f929041181 drivers/pinctrl/pinctrl-mpfs.c Conor Dooley 2025-09-04  165  		return -EINVAL;
98e3f929041181 drivers/pinctrl/pinctrl-mpfs.c Conor Dooley 2025-09-04  166  
1fa50f0c06db6a drivers/pinctrl/pinctrl-mpfs.c Conor Dooley 2025-09-08  167  	func = config & GENMASK(3, 0); //TODO explain -> dt macro
98e3f929041181 drivers/pinctrl/pinctrl-mpfs.c Conor Dooley 2025-09-04  168  	func <<= offset;
98e3f929041181 drivers/pinctrl/pinctrl-mpfs.c Conor Dooley 2025-09-04  169  
98e3f929041181 drivers/pinctrl/pinctrl-mpfs.c Conor Dooley 2025-09-04  170  	dev_dbg(dev, "Setting pin %u. reg: %x offset %u func %x\n", pin, reg, offset, func);
98e3f929041181 drivers/pinctrl/pinctrl-mpfs.c Conor Dooley 2025-09-04  171  
98e3f929041181 drivers/pinctrl/pinctrl-mpfs.c Conor Dooley 2025-09-04  172  	regmap_write(pctrl->regmap, reg, func);
98e3f929041181 drivers/pinctrl/pinctrl-mpfs.c Conor Dooley 2025-09-04  173  
98e3f929041181 drivers/pinctrl/pinctrl-mpfs.c Conor Dooley 2025-09-04  174  	return 0;
98e3f929041181 drivers/pinctrl/pinctrl-mpfs.c Conor Dooley 2025-09-04  175  }
98e3f929041181 drivers/pinctrl/pinctrl-mpfs.c Conor Dooley 2025-09-04  176  

:::::: The code at line 164 was first introduced by commit
:::::: 98e3f929041181bf82071767b73ba8963ef58d25 progress

:::::: TO: Conor Dooley <conor.dooley@microchip.com>
:::::: CC: Conor Dooley <conor.dooley@microchip.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
