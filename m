Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34045171BA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 May 2024 16:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716740226; cv=none; b=Molf+KERlY1cwSFUZErfVU7SJAB4XuEyykX8BV8d+JLMALjtuGW+2BmwIsVvxsom2me8rAmEX6PfBDWGMV/0SwIvQe5rQ0ozrOqnToIWlLj6TQDS27lK+g9APFVaGed8LWk88IHArmIFJ2Hi+dOdI65MqeR75Z9yEE5WSFb3ptg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716740226; c=relaxed/simple;
	bh=+i8ZSHXeOaRHb0fV1QiAbSKoO0h91L2lPapc7k+EIpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p4M42T/lVfqASuYBDRYkjOPSZuRCydmxKQ4zChWp/eKge52eDUAl23fAKUtcIrMdYq+VT50aAsyjvzzrIPZal0lms3MMZrTelgPOHTfGtrx5D229tJ0rzYESTWT1ZH2nAtj36UKLT3iPpZpmEy+4OtDaMpsdBSsJxJkak/ixuZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TFdR7yDw; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TFdR7yDw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716740224; x=1748276224;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+i8ZSHXeOaRHb0fV1QiAbSKoO0h91L2lPapc7k+EIpQ=;
  b=TFdR7yDwyirabDz6lwlnK/VzjPCvmxAMq9XZas8JdUMALj0xSsSTkJju
   Ow/5Losne/ni2xxEJ+wE/tVg47GEkvVawIWRihnBpHYURSeclU343RqlC
   r2OuiLIxaEIgyfjznXXsW9MH/NFWsrBrNrCdwEW3nRb/JQWwHj8xjDiNq
   oH31uB9baqrKl8vvCWKglskrbgX+azZ7D57toJFMWPMflgh9+Ij1TYK5X
   W9WPnVS2WTd/5Q+RPMPo+N+HrzGiDIexxCyB7AVYMdWxPM3QbKAUYCmY8
   V+YGg5Qknxy6oJBgV2kByEUphfeXeEl1UcBc9rn7MdtpCgJm8OamIt7XQ
   A==;
X-CSE-ConnectionGUID: hUls14eASfaP4+ThhCRB2A==
X-CSE-MsgGUID: o7GN8+JhQ+yRzIC8qF71UQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="16846259"
X-IronPort-AV: E=Sophos;i="6.08,190,1712646000"; 
   d="scan'208";a="16846259"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2024 09:17:04 -0700
X-CSE-ConnectionGUID: D+rp4jU1QMuUXsYwxSRXgw==
X-CSE-MsgGUID: Lx4AKqXVTxSi89aAZVBjFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,190,1712646000"; 
   d="scan'208";a="34612148"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 26 May 2024 09:17:02 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBGYN-0008BD-0g;
	Sun, 26 May 2024 16:16:59 +0000
Date: Mon, 27 May 2024 00:16:43 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liu Jian <liujian56@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 29976/30000] kismet: WARNING: unmet direct
 dependencies detected for BPF_NET_GLOBAL_PROG when selected by
 SCHED_TASK_RELATIONSHIP
Message-ID: <202405270023.us7gyUyd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   f300accff5478c6324a1c31d0337bc28dda75ba9
commit: 64ba5634c4c60ea966612ab3eca75cbf2d90f9bc [29976/30000] net: add some bpf hooks in tcp stack for network numa relationship
config: arm64-kismet-CONFIG_BPF_NET_GLOBAL_PROG-CONFIG_SCHED_TASK_RELATIONSHIP-0-0 (https://download.01.org/0day-ci/archive/20240527/202405270023.us7gyUyd-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240527/202405270023.us7gyUyd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405270023.us7gyUyd-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for BPF_NET_GLOBAL_PROG when selected by SCHED_TASK_RELATIONSHIP
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
     Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=n]
     Selected by [y]:
     - PGP_PRELOAD_PUBLIC_KEYS [=y] && CRYPTO [=y]
   
   WARNING: unmet direct dependencies detected for BPF_NET_GLOBAL_PROG
     Depends on [n]: NET [=y] && BPF_SYSCALL [=n]
     Selected by [y]:
     - SCHED_TASK_RELATIONSHIP [=y] && CGROUPS [=y] && NUMA_BALANCING [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
