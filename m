Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733EA263F45
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Apr 2025 16:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745425408; cv=none; b=JAqSSUIc/VcfVnH81JGzzVQYgCCdDuMDnL4V+pA7LkVyPA/AVaNw/J8wcnXA64A4UqcVdfzd9/QVrAekbp/x0AL00V3Rn2dx/8KGxcNTiHP1KQk4byyOcGDHQwNaRIG7udcrhXKKlVOjSRjIK3b7C1f9LULQlNXqTHRWl++4ZDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745425408; c=relaxed/simple;
	bh=g+sVOFXGnmg+NcF6A1bkLlavJr1553bEAJevwILVCV4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TVcZqkZUkEQ+zj/uHZYDZuQilva93buRcxjXd3vAKaLGMhOzIflbZfgodPZML+OAuwNLppC/YxMXmWzNi7sfwdYBXKpJadow4fne0bP1/ZrSewAbacWZ6t8hgrALYsgsnH0nlv0ZASS/LLbQkvoOhxjcSK3n/ZnHj4woMjkADAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PPn7vhGA; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PPn7vhGA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745425407; x=1776961407;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g+sVOFXGnmg+NcF6A1bkLlavJr1553bEAJevwILVCV4=;
  b=PPn7vhGASInmWlNlRsKCuVj+cW+6YoUY/mfbyWPVVZGyFArfQkIYKjXh
   76ts+4v7KZMzn42ZBeeG2KqGoz0nmaeqyTDw+u7jZOOagva8LCmh6X6Oy
   VC/7sniRHMNVdX456aEBWD6rQzxZYOerArf40TNIRR4Pivwo/vJes7lhy
   5mPt4VkID/nFZmRf3qSxA4441HCAVJok50Fdpe5N89atKcvx+/CFOr8n/
   FpFq0l0AJdR95kgLe+q+H/ticuY/tTh2FdKj2mXRhENK4jJDGkZhLFBfy
   o2/LieczNOFkzZsyCUeaRdD606IWkmpv8c6kTZoxAl5wiBPvm3kjHEnFk
   g==;
X-CSE-ConnectionGUID: 7GGu136eT7qGrA60vcHdEw==
X-CSE-MsgGUID: L2Lo3jnUS4yjpQQosCrVwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="46938261"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="46938261"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 09:23:26 -0700
X-CSE-ConnectionGUID: kH47r162S/q5VLf+eXRgjg==
X-CSE-MsgGUID: F2UkRAByRh+KXS2M19TakQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="136437657"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 Apr 2025 09:23:25 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7csc-0003RF-1Z;
	Wed, 23 Apr 2025 16:23:22 +0000
Date: Thu, 24 Apr 2025 00:22:38 +0800
From: kernel test robot <lkp@intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, renjiaox <jiaojiaox.ren@intel.com>
Subject: [intel-lts:5.15/android_u 1/1] htmldocs: Warning:
 /sys/devices/pci0000:00/<dev>/fw_version is defined 2 times:
  ./Documentation/ABI/testing/sysfs-bus-pci-devices-catpt:0
  ./Documentation/ABI/testing/sysfs-bus-pci-devices-avs:0
Message-ID: <202504240006.1HkBJQpT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 5.15/android_u
head:   f72fcd722e2d0f1cd9bb6fcff7009048d528bec9
commit: 8495cc09f30b19e76ef9d2c6c431cd7c069594e6 [1/1] ANDROID: ASoC: Intel: avs: Expose FW version and modules info with sysfs
reproduce: (https://download.01.org/0day-ci/archive/20250424/202504240006.1HkBJQpT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504240006.1HkBJQpT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: tools/perf/.gitignore references a file that doesn't exist: Documentation/doc.dep
   Warning: tools/testing/selftests/bpf/test_bpftool_synctypes.py references a file that doesn't exist: Documentation/bpftool-prog.rst
   Warning: tools/testing/selftests/bpf/test_bpftool_synctypes.py references a file that doesn't exist: Documentation/bpftool-map.rst
   Warning: tools/testing/selftests/bpf/test_bpftool_synctypes.py references a file that doesn't exist: Documentation/bpftool-cgroup.rst
   Warning: /sys/bus/iio/devices/triggerX/sampling_frequency is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:91  ./Documentation/ABI/testing/sysfs-bus-iio-timer-stm32:92
>> Warning: /sys/devices/pci0000:00/<dev>/fw_version is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-pci-devices-catpt:0  ./Documentation/ABI/testing/sysfs-bus-pci-devices-avs:0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
