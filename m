Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFE1224F0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 15:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727624441; cv=none; b=T/wS34UufnrjHspFvAEMEHR2S6ioI/AJxvDFCXHQ5dYzEK2xQR9g6mGMWPtPh0jdjbwyAbi/6uUGIK2BtjHdPTaqYnKWJBKJ6v/5Gj0RawqACCExp6BQByPy9fSq4g8Vuwe0pIUs+Np1JkwxvVbxxkPoCEVw8Ixx1d6Av/jgKz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727624441; c=relaxed/simple;
	bh=w7tB9Plb9jCvwqYNcnG03uixDwrY2WOkHhM52jCN9A4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uvXQp89XTrOakdbfDSMiNeWKMMZHfZQKmfOC01XA/r+HeoD6KiDeL8OngIW3Nq25PCWFpivNIO/6/V0vshVpwwjK2es0BU1mrnyit9jqE07eO7I0ZyqCMRW4YOGKpFYJKHdf7EdUDKP1kmsN7TkkAclvGxm4j7RZNqd6xrZ5xd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lrrwE/B2; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lrrwE/B2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727624438; x=1759160438;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w7tB9Plb9jCvwqYNcnG03uixDwrY2WOkHhM52jCN9A4=;
  b=lrrwE/B2yQnT1NDBpwSiUO01OG1LQoyVZOPKGVW/zFp5tnIml5sDX0ym
   pUb4BxezCEqltwtoxI1YU3QZNAg84o5epwP4NrRiFNNFToFwptH4/pOM/
   y3uo0fUst8Gjv7ueiUoCDSm7E8aLMliIzW+l41BeegHIDEwJSRheb1AVG
   69O47slMD63PO9y0jGVIfIk7dTTSFIQE+HGfdwt9ZSByDMYq9K8Sk76c5
   aAEQIRcM8ljOpr15dASyHHFLxz3sv/DY8A3EXSeEooHgL6xZoJvFBv96B
   f10/HgtEMn6ZlryZUgNHPGhFYp2g21v9OvcUnbAejwPqo7A6mi4mqRiAX
   w==;
X-CSE-ConnectionGUID: SUfXLN/4SymqCrjJBObkwQ==
X-CSE-MsgGUID: YN5DBcP2QiKuNoqMLzCSSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="37387153"
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="37387153"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 08:40:38 -0700
X-CSE-ConnectionGUID: W6TmXSAySsOUFQUYEBP08g==
X-CSE-MsgGUID: I2HmvpRvRxacARxSf60BLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="73451056"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 29 Sep 2024 08:40:33 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suw2B-000OOp-1z;
	Sun, 29 Sep 2024 15:40:31 +0000
Date: Sun, 29 Sep 2024 23:40:04 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 5481/12031] htmldocs: Makefile:83: *** Cannot find
 a vmlinux for VMLINUX_BTF at any of "  ../../vmlinux /sys/kernel/btf/vmlinux
 /boot/vmlinux-5.9.0-2-amd64".  Stop.
Message-ID: <202409292307.bdOx17mS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tejun,

FYI, the error/warning still remains.

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   6c7ba3824d4ec8a20ab384fa7b838eeb7e5b4e5f
commit: 4b19dc9296ad0adbeeb0dc91c9bac8feaf384800 [5481/12031] rue/scx/sched_ext: Add scx_simple and scx_example_qmap example schedulers
reproduce: (https://download.01.org/0day-ci/archive/20240929/202409292307.bdOx17mS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409292307.bdOx17mS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Makefile:83: *** Cannot find a vmlinux for VMLINUX_BTF at any of "  ../../vmlinux /sys/kernel/btf/vmlinux /boot/vmlinux-5.9.0-2-amd64".  Stop.
   make[2]: *** [Makefile:193: sched_ext_clean] Error 2
   make[1]: *** [Makefile:1355: sched_ext] Error 2
   make[1]: Target 'mrproper' not remade because of errors.
   make: *** [Makefile:241: __sub-make] Error 2
   make: Target 'mrproper' not remade because of errors.


vim +83 Makefile

3812b8c5c5d527 Masahiro Yamada 2019-02-22  66  
066b7ed9558087 Michal Marek    2014-07-04  67  # Beautify output
066b7ed9558087 Michal Marek    2014-07-04  68  # ---------------------------------------------------------------------------
066b7ed9558087 Michal Marek    2014-07-04  69  #
8962b6b475bddc Masahiro Yamada 2022-12-23  70  # Most of build commands in Kbuild start with "cmd_". You can optionally define
8962b6b475bddc Masahiro Yamada 2022-12-23  71  # "quiet_cmd_*". If defined, the short log is printed. Otherwise, no log from
8962b6b475bddc Masahiro Yamada 2022-12-23  72  # that command is printed by default.
066b7ed9558087 Michal Marek    2014-07-04  73  #
8962b6b475bddc Masahiro Yamada 2022-12-23  74  # e.g.)
8962b6b475bddc Masahiro Yamada 2022-12-23  75  #    quiet_cmd_depmod = DEPMOD  $(MODLIB)
8962b6b475bddc Masahiro Yamada 2022-12-23  76  #          cmd_depmod = $(srctree)/scripts/depmod.sh $(DEPMOD) $(KERNELRELEASE)
066b7ed9558087 Michal Marek    2014-07-04  77  #
066b7ed9558087 Michal Marek    2014-07-04  78  # A simple variant is to prefix commands with $(Q) - that's useful
066b7ed9558087 Michal Marek    2014-07-04  79  # for commands that shall be hidden in non-verbose mode.
066b7ed9558087 Michal Marek    2014-07-04  80  #
8962b6b475bddc Masahiro Yamada 2022-12-23  81  #    $(Q)$(MAKE) $(build)=scripts/basic
066b7ed9558087 Michal Marek    2014-07-04  82  #
6ae4b9868a8f72 Masahiro Yamada 2022-12-23 @83  # If KBUILD_VERBOSE contains 1, the whole command is echoed.
6ae4b9868a8f72 Masahiro Yamada 2022-12-23  84  # If KBUILD_VERBOSE contains 2, the reason for rebuilding is printed.
066b7ed9558087 Michal Marek    2014-07-04  85  #
^1da177e4c3f41 Linus Torvalds  2005-04-16  86  # To put more focus on warnings, be less verbose as default
^1da177e4c3f41 Linus Torvalds  2005-04-16  87  # Use 'make V=1' to see the full commands
^1da177e4c3f41 Linus Torvalds  2005-04-16  88  

:::::: The code at line 83 was first introduced by commit
:::::: 6ae4b9868a8f723cae2600722eea033fafadd399 kbuild: allow to combine multiple V= levels

:::::: TO: Masahiro Yamada <masahiroy@kernel.org>
:::::: CC: Masahiro Yamada <masahiroy@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
