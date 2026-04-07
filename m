Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041F1374E79
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 03:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534009; cv=none; b=SdN50jV+z3E7be9B43u6GqKURPeZ2mNg91mJrEPL7V5/LK6dnc8sX+CVLnVY3MrS0HrlK3J6E3+NK1r8prl6/AhdKc+z56Mb5HsgjoFut2QDukHv+18uKaZiiJWOV0ptjx/p6pry3Lq/jjzEzhU4ZKwH7/DDTvCnx1RsTJxkNok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534009; c=relaxed/simple;
	bh=yEmHqojoLepFkN2JZ2cApo/6joJvAjFD67ooV2foNWA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EJpoRfpYWYr1ln9uoyA+XOwpMkPzuHcnPDZDPzglj9+eTwdKYlzjUm6YD3aytBfV0FYmo8JMo26jbcZr3VZEHVh143x6LZT+ybFjpLmW62ewpf6XwlK31dYFXxx0lNH9gUb2DVCSUMATtEUv2owY1Z6WTjjIn96pbNWJs5cpTvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UiII7YHw; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UiII7YHw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534008; x=1807070008;
  h=date:from:to:cc:subject:message-id;
  bh=yEmHqojoLepFkN2JZ2cApo/6joJvAjFD67ooV2foNWA=;
  b=UiII7YHwJ+wp9VSbceoaNL+GKX/aKMb6IhRzvxkPuqmfo3LdYkcXi9tN
   Bvmj3aTzFQOpdaSUefMoV552898KAKvhsR5Y3B4lutIstyc/vQMoDhNOr
   UsxA0Hxnguthea3wxLfrvLo3M4YLxzM3NbLKQZnEMX6tkSmJvcDYZxA4t
   gn1qloOgPCQl+V/TjzzR9fS2/sZSJ/h9ONEOG4/vvhzqmePpbrNpySwoS
   7W7T21eS/6XvBEapfT6LUWzUq8ZTtOQ+xJzv6HDwX4ZXQPcljn94tB7Vp
   wPkU6JkeSd0i5BQCW6Wo3QoakG9AMv6YsWFuPAkr3miw5tUGwBjdZTqWV
   g==;
X-CSE-ConnectionGUID: MOId7lHYSDyWvdOZDrJVgQ==
X-CSE-MsgGUID: V4uCfKSXTjWv2bULSHuEjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="86781614"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="86781614"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:53:25 -0700
X-CSE-ConnectionGUID: 37sMzJIvQOaT6Km+YHeojg==
X-CSE-MsgGUID: IrxGvnEST7OV9otJCu5H4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="225303577"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Apr 2026 20:53:24 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xVB-0000000003H-2rRJ;
	Tue, 07 Apr 2026 03:53:21 +0000
Date: Tue, 07 Apr 2026 11:52:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-poly-aosp-pixel-lajolla-staging 1/1]
 fuse_bpf_backing.c:undefined reference to `fuse_get_bpf_prog'
Message-ID: <202604040930.kadJINyS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common mirror-poly-aosp-pixel-lajolla-staging
head:   861ae8d9b142c1ff23fec0174b471dec9236fbae
commit: be926e6761d28d105ba672242e81e911e0d7e5e0 [1/1] ANDROID: fuse-bpf: fuse-bpf v1.3
config: arm-randconfig-003-20260404 (https://download.01.org/0day-ci/archive/20260404/202604040930.kadJINyS-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260404/202604040930.kadJINyS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604040930.kadJINyS-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: fs/fuse/fuse_bpf_backing.o: in function `fuse_handle_bpf_prog':
>> fuse_bpf_backing.c:(.text+0x2092): undefined reference to `fuse_get_bpf_prog'
   arm-linux-gnueabi-ld: net/socket.o: in function `sock_ioctl':
   socket.c:(.text+0x1a4a): undefined reference to `wext_handle_ioctl'
   arm-linux-gnueabi-ld: net/core/net-procfs.o: in function `dev_proc_net_exit':
   net-procfs.c:(.text+0x384): undefined reference to `wext_proc_exit'
   arm-linux-gnueabi-ld: net/core/net-procfs.o: in function `dev_proc_net_init':
   net-procfs.c:(.text+0x410): undefined reference to `wext_proc_init'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
