Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9F21509B0
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 May 2024 12:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715083297; cv=none; b=QNQqQ+Kl45QsGMO6tOKJbAf4Ekyc2euaX0qMPTcUKWgTRtrpeZDRW4rfuDaTo6ML/mHHKMQ+8ZoZlpYpIGM4QAhPob8YszUAfiVzZICczOPL1HZjPgUdag/Gkwl3ZMTl2p2Mb+Le1LZNKQqm+Sst8HjUA/2xPHOgVQosSy0lJy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715083297; c=relaxed/simple;
	bh=V2cW3URxPzh0p2KLe8jlRj0pvcX1tghfBkjwBRxs/iw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AWHI5192Z/dxZUr9z/sSYSZ/zb+UE+FJEXXX4clfJjc2ZcWID2ksv0BLWzY2GPsy7xMC/GTU6AYnyMGPQESZAmu9l8cBsobxnI/WagYIfuBy9HcU5C8V7IauE4I06XHThFu6MfiyS4AuQhd2krSbearNt4TIFfnVTxq2eHOhd1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BhbaHA6e; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BhbaHA6e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715083296; x=1746619296;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V2cW3URxPzh0p2KLe8jlRj0pvcX1tghfBkjwBRxs/iw=;
  b=BhbaHA6e+chZ5SEGcq3yYcwnNYAFOij5j17A4mhnIoEoDgxKvj2gY5rR
   QoAmIck6OEKQIB5AJJor36PcGHA1xGHJb+JlZOO3K5RCe3mtotfuWYImb
   9oEz6HuUGtzMNwu8ZjLwG0akgSG/XivTwo9vA0wRhJjdXUGmuJ0kIJQab
   WdMsZPNZhaVhEhJ/KkeE1ohH1X0seLJ5a3B973lnslYuUm7kTZtYehfk6
   k/7TBzyy2rRr9t6J9lK/4vNqiVRHrXh3U4sP3rflBc3FAXDZgJSfkaDjp
   +poFPVHxPqBCmnNSb6I8CisJx963GXHWBIK0zN2OzRGZaC3vHmqXVR0dq
   Q==;
X-CSE-ConnectionGUID: bZ+C4EQwRWeD69kAjVg4Mg==
X-CSE-MsgGUID: QKNa+vWhQGGyPewIqyiyUg==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="10994641"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="10994641"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 05:01:36 -0700
X-CSE-ConnectionGUID: LicQHVcUSAulgGL0PRRnpA==
X-CSE-MsgGUID: ALrNj01VRVK2sKb0yGHzOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="33307851"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 May 2024 05:01:32 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4JVi-0001sd-0a;
	Tue, 07 May 2024 12:01:30 +0000
Date: Tue, 7 May 2024 20:00:36 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 5481/6518] htmldocs: Makefile:83: *** Cannot find
 a vmlinux for VMLINUX_BTF at any of "  ../../vmlinux /sys/kernel/btf/vmlinux
 /boot/vmlinux-5.9.0-2-amd64".  Stop.
Message-ID: <202405071936.9VWl8HC7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   b294718c76ed688d3272e48c431221a8194cd2d3
commit: 4b19dc9296ad0adbeeb0dc91c9bac8feaf384800 [5481/6518] rue/scx/sched_ext: Add scx_simple and scx_example_qmap example schedulers
reproduce: (https://download.01.org/0day-ci/archive/20240507/202405071936.9VWl8HC7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405071936.9VWl8HC7-lkp@intel.com/

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
