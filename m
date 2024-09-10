Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6051A2567
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 19:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725996484; cv=none; b=cv6YDob6FTSq/2/5c/67fhpms2gutU6pRw2r/v6wWeqUVbKXxqUICeXtk2Jj8N1WGnzwOhl8VEvRSFbP9+Xn4Gc9JcffbHsgv3l/tmb3fABib8u45exT3OgiGuMfedvSykB+fUILgIocUTttyMxJCx/BfrlGUq+TOeord3i4KCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725996484; c=relaxed/simple;
	bh=oNlAskCQrcXNVkARxIxu6Lqq6+jL3iW9nuTBKcLYT4c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IPzq8I5IPLhlfI8Ymj0tfdAcS12aA7N0Jng4hzcvTwH8M43Rz+q2FJQmGwJRWcGxaU9+ktaNDLJCayzzZ0lR3cGiLG8qinB7iTLqF3mMNgn8EDDSyP2sbzDJPgjUUL+IdwWOa0NvHzChAvuwj2he48/xTxXdMWjdggrHOrnUGjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JnuCqYa3; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JnuCqYa3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725996482; x=1757532482;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oNlAskCQrcXNVkARxIxu6Lqq6+jL3iW9nuTBKcLYT4c=;
  b=JnuCqYa3txLObBry6A4YA/tn5dkDoBzIUfvGbUMIqE21ba5HBmlFF0aE
   wI9NvhA02mJvET82PV6sPWqyOmpJmsWZicnZ5vleLjdmfAAQzq3mj6Qdt
   70EsXYA2nU4k7cA2MBf1l0G+ZRhBMl0uqNdRwlh4a/4fj3D5BK6bQL0dF
   zvza2l8LxH6R6zSysFEx27VRypyPzFeKgjS4InMaM9q/U8b1zAYoGpEKa
   GCK45zDjCelFLjmepk/neI0/n6+P/XYx8GLdU/UaKMOezsL9sLmynzMgI
   SLhOI1JEZgdVDLLnqx/fGajxMxsqc8tuT9srehY6hllv0XBaajeEo0SSI
   Q==;
X-CSE-ConnectionGUID: TzEw3r1JTdO52Ejjd/Qo9g==
X-CSE-MsgGUID: V5i8Yx1hStyIS3bdnULbbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24589011"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="24589011"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 12:28:02 -0700
X-CSE-ConnectionGUID: Cahg67OaRbmnKjJOasYVwQ==
X-CSE-MsgGUID: xnCaw6ffSrWXPZM4TC0r4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="67424142"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 10 Sep 2024 12:28:01 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1so6Ws-0002X1-36;
	Tue, 10 Sep 2024 19:27:58 +0000
Date: Wed, 11 Sep 2024 03:27:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 2/3] open.c:undefined reference to
 `__traceiter_cros_chmod_common_enter'
Message-ID: <202409110301.IrjbrSeO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   b409e2357562c5e8ed351597fddb38b7e8920fdd
commit: bc1704f468b153e8b6edd27e720a4d143297e394 [2/3] CHROMIUM: add cros file tracepoints for bpf
config: arm64-randconfig-001-20240910 (https://download.01.org/0day-ci/archive/20240911/202409110301.IrjbrSeO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409110301.IrjbrSeO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409110301.IrjbrSeO-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: fs/open.o: in function `trace_cros_filp_close_exit':
   open.c:(.text+0x21fc): undefined reference to `__traceiter_cros_filp_close_exit'
   aarch64-linux-ld: fs/open.o: in function `trace_cros_chmod_common_enter':
>> open.c:(.text+0x23b8): undefined reference to `__traceiter_cros_chmod_common_enter'
   aarch64-linux-ld: fs/open.o: in function `trace_cros_chmod_common_exit':
>> open.c:(.text+0x2584): undefined reference to `__traceiter_cros_chmod_common_exit'
   aarch64-linux-ld: fs/open.o: in function `trace_cros_chown_common_enter':
>> open.c:(.text+0x2784): undefined reference to `__traceiter_cros_chown_common_enter'
   aarch64-linux-ld: fs/open.o: in function `trace_cros_chown_common_exit':
>> open.c:(.text+0x298c): undefined reference to `__traceiter_cros_chown_common_exit'
   aarch64-linux-ld: fs/open.o:(__jump_table+0xd8): undefined reference to `__tracepoint_cros_filp_close_exit'
   aarch64-linux-ld: fs/open.o:(__jump_table+0xe8): undefined reference to `__tracepoint_cros_chmod_common_enter'
   aarch64-linux-ld: fs/open.o:(__jump_table+0xf8): undefined reference to `__tracepoint_cros_chmod_common_exit'
   aarch64-linux-ld: fs/open.o:(__jump_table+0x108): undefined reference to `__tracepoint_cros_chown_common_enter'
   aarch64-linux-ld: fs/open.o:(__jump_table+0x118): undefined reference to `__tracepoint_cros_chown_common_exit'
   aarch64-linux-ld: fs/namespace.o: in function `trace_cros_path_umount_entry':
>> namespace.c:(.text+0x4530): undefined reference to `__traceiter_cros_path_umount_entry'
   aarch64-linux-ld: fs/namespace.o: in function `trace_cros_path_umount_exit':
>> namespace.c:(.text+0x46fc): undefined reference to `__traceiter_cros_path_umount_exit'
   aarch64-linux-ld: fs/namespace.o: in function `trace_cros_path_mount_exit':
>> namespace.c:(.text+0x5154): undefined reference to `__traceiter_cros_path_mount_exit'
   aarch64-linux-ld: fs/namespace.o:(__jump_table+0x88): undefined reference to `__tracepoint_cros_path_umount_entry'
   aarch64-linux-ld: fs/namespace.o:(__jump_table+0x98): undefined reference to `__tracepoint_cros_path_umount_exit'
   aarch64-linux-ld: fs/namespace.o:(__jump_table+0xc8): undefined reference to `__tracepoint_cros_path_mount_exit'
   aarch64-linux-ld: fs/utimes.o: in function `trace_cros_vfs_utimes_exit':
>> utimes.c:(.text+0x14c): undefined reference to `__traceiter_cros_vfs_utimes_exit'
   aarch64-linux-ld: fs/utimes.o: in function `trace_cros_vfs_utimes_enter':
   utimes.c:(.text+0x344): undefined reference to `__traceiter_cros_vfs_utimes_enter'
   aarch64-linux-ld: fs/utimes.o:(__jump_table+0x8): undefined reference to `__tracepoint_cros_vfs_utimes_exit'
   aarch64-linux-ld: fs/utimes.o:(__jump_table+0x18): undefined reference to `__tracepoint_cros_vfs_utimes_enter'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
