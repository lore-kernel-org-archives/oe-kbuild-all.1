Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9776337BA5
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Dec 2025 17:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764609627; cv=none; b=Dyawp2x92OED0BotmhD5s28F1PplOS+aKWWTIAEPSWSfdbTAMCYVQeYyOq91YaKI+AWeBpPbm8oLqUAJi14DDMb423/Z9mYOxqK5uxsXQl4cE3Yt91abSS+Kg9ZtIwMr9co5F7TfMnapGEnPxD4jK1lJBuLB3lQg368gzm3eI6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764609627; c=relaxed/simple;
	bh=z3qDDujTGQCEpO/VYMsT8kITEF45F4zVGo795BVD9jA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fXTpWyVzmBRgmoTfns2jAbJZ5J5GMfhvODjWJpd/zMcNs/rIvWE+Cy9ZESsAuMtmxejZi1t9FKD405F+uNZFRn3DkZBw/vqYjA+wuYGHHRz+gV1NtoAQsLm/c4biPOFazgF+exVEOmAZjLChu/350yjtpfEzNYJgjSFlgnSWghQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VZohI1lT; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VZohI1lT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764609625; x=1796145625;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z3qDDujTGQCEpO/VYMsT8kITEF45F4zVGo795BVD9jA=;
  b=VZohI1lTluNX4jQoWlcxR4fgJGZiOFq8AYy1zW0sQIcxBL5EVV4cp/4Q
   ha9MZv54y5hQqz7TOGvlotbMy4fEoCEqDXvOTf5L39Ul2SKAnr8sILq7f
   xH/rLZMqDIT8u4OOM7DMPIdwqro3pplTSoaxlt28yjRw1Fr5mhRP5eSta
   bEu+mmgBFJvu/r3eJ7I/0CL25YUB4ppfs2dnwxfDNV/c3Ti/+FCj4Mkn0
   c/CgiWCwZGpt1F7RvHfGR8f6rnCbKhi20T3AvnYORdiAWALQpxC2zIBaq
   8xQJipoRmjZWKFKpV/h9osUH4RS5JVnkQg/PZjJ04KblBr7NRgn5Z0EBw
   A==;
X-CSE-ConnectionGUID: aLifV+8DTUmvOkOKTWBNsA==
X-CSE-MsgGUID: 5gtFzhgUQPagVtnS50BX7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66450771"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="66450771"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 09:20:22 -0800
X-CSE-ConnectionGUID: jz5CDhrxQwyHKo6Oy/u7Sg==
X-CSE-MsgGUID: VoIoiM9GTEOajq9GkwxpPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="231438719"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 01 Dec 2025 09:20:21 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQ7ZS-000000008yn-2kL5;
	Mon, 01 Dec 2025 17:20:18 +0000
Date: Tue, 2 Dec 2025 01:20:07 +0800
From: kernel test robot <lkp@intel.com>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: [linux-next:master 373/13171]
 panel-visionox-rm69299.c:(.text+0x48c): relocation truncated to fit:
 R_OR1K_INSN_REL_26 against undefined symbol `devm_backlight_device_register'
Message-ID: <202512020154.xVlxrCXE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a
commit: 7911d8cab55453b6bf59cd1f806503c3dbf0e990 [373/13171] drm/panel: visionox-rm69299: Add backlight support
config: openrisc-randconfig-r052-20251201 (https://download.01.org/0day-ci/archive/20251202/202512020154.xVlxrCXE-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020154.xVlxrCXE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512020154.xVlxrCXE-lkp@intel.com/

All errors (new ones prefixed by >>):

   or1k-linux-ld: drivers/gpu/drm/panel/panel-visionox-rm69299.o: in function `visionox_rm69299_probe':
   panel-visionox-rm69299.c:(.text+0x48c): undefined reference to `devm_backlight_device_register'
>> panel-visionox-rm69299.c:(.text+0x48c): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `devm_backlight_device_register'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
