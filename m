Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2D0343D8F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 23:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778197975; cv=none; b=EPRo6LwI8NjlFC4jKGJAYWhio/3U5CwSnVVfjTgsh90AdxIK8fYzCY3vKAafOkFETz1rKRBoAeA9KWujab2pWCwWdZe28yxRSelirZ5rBppAot+FPHnuzsYVLuLjLSqSgPdYSyYGu7bkPkrdL80gX0YNQjg66NWS2q/itKA3UTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778197975; c=relaxed/simple;
	bh=x5dYAu1SakZYcotjGW4ZTDCb381xczPigp2bqidAViA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KxIi+lnT7F0mnBZkWbUBw8Sr0TqQoRCcJnhhnoI/+N8SscHZvn9WInPwlThLMbuxeWqkJ/dlFo2G59nPs0NnzQl7VlLYDb75dXkTDhjDX8Fhac+MxL7roy8iTKNSEm4dZWm2e7ay2OPehTxEXelGotD83Wby87RWHFnWKlE5FRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nKmKC3u3; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nKmKC3u3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778197974; x=1809733974;
  h=date:from:to:cc:subject:message-id;
  bh=x5dYAu1SakZYcotjGW4ZTDCb381xczPigp2bqidAViA=;
  b=nKmKC3u3YkSWUYdxGk1UZjG+IX0purjQopmf+aixGiNi2P49pqs4G0i4
   rFxoFP6+rW8E0vhChxW3IeGc8ckIjYQswumWFhcOdMU07lZICWRJH2gyZ
   GSMTV5m6C8A4qESCleteMaehuqSjtX3RD9EqFrdxbYabpBKpnxC88ECS9
   IWUximQHqkYh/UT4bMLyVt+D4k0PlwJoJLe9VHuUzrAm7iUV4wzdBlS6K
   er4q8WTQX5Jb818mzLSQHmwdBTvCpsbn1TOnU3V8XEKpD5h3dml9oFxt7
   x9dRydPsnJtThEgscBKDgd/7t20GNfvN9+PNVgSX4wsHmzD639DWKMBMW
   Q==;
X-CSE-ConnectionGUID: gyxoTWjvR22AiPoqgBpHAA==
X-CSE-MsgGUID: +4wgRhVnQhu4W8a37BO+Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="82784521"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="82784521"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 16:52:52 -0700
X-CSE-ConnectionGUID: uvRf5lILRg6EQCixLCMEaQ==
X-CSE-MsgGUID: mABVywCLRIOW8oEWlmbMVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="241618046"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 May 2026 16:52:51 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wL8WN-000000000Zx-2zco;
	Thu, 07 May 2026 23:52:47 +0000
Date: Fri, 08 May 2026 07:52:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-07 3/3]
 arch/arm64/kvm/hyp_trace.c:815:37: warning: 'hyp_trace_raw_fops' defined but
 not used
Message-ID: <202605080752.Al61DqS0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-07
head:   3d3e6176e890a478b9c92ca37577752521323df3
commit: 532d6ef155cb6e451fc8dd3e09dc71e56a92c63a [3/3] FROMLIST: KVM: arm64: Add raw interface for hyp tracefs
config: arm64-randconfig-003-20260508 (https://download.01.org/0day-ci/archive/20260508/202605080752.Al61DqS0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605080752.Al61DqS0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605080752.Al61DqS0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp_trace.c:815:37: warning: 'hyp_trace_raw_fops' defined but not used [-Wunused-const-variable=]
     815 | static const struct file_operations hyp_trace_raw_fops = {
         |                                     ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp_trace.c: In function 'hyp_trace_init_tracefs':
   arch/arm64/kvm/hyp_trace.c:865:52: warning: '%ld' directive output may be truncated writing between 1 and 20 bytes into a region of size 13 [-Wformat-truncation=]
     865 |   snprintf(per_cpu_name, sizeof(per_cpu_name), "cpu%ld", cpu);
         |                                                    ^~~
   arch/arm64/kvm/hyp_trace.c:865:48: note: directive argument in the range [-9223372036854775808, 4294967294]
     865 |   snprintf(per_cpu_name, sizeof(per_cpu_name), "cpu%ld", cpu);
         |                                                ^~~~~~~~
   arch/arm64/kvm/hyp_trace.c:865:3: note: 'snprintf' output between 5 and 24 bytes into a destination of size 16
     865 |   snprintf(per_cpu_name, sizeof(per_cpu_name), "cpu%ld", cpu);
         |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DIMLIB
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]


vim +/hyp_trace_raw_fops +815 arch/arm64/kvm/hyp_trace.c

   814	
 > 815	static const struct file_operations hyp_trace_raw_fops = {
   816		.open           = hyp_trace_raw_open,
   817		.read           = hyp_trace_raw_read,
   818		.release        = hyp_trace_raw_release,
   819	};
   820	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
