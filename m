Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6749815EFA0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Aug 2024 08:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724834993; cv=none; b=ZSvWL9jkbHmIS8X4q8seN5LV9x7S9eLPCCFY87RGnKBpjQdKC/0KvPV+CjrmziJ7nCl0tdtGpb0omqad0cAp3fGxfJGySdOiF/P7m7tajKned2UZlOFkr1xOUwn2nDBkjxQDDKklywhU2jFinBn3f7WbfBkCPSKAGWtpztC+VCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724834993; c=relaxed/simple;
	bh=vXC/ododCmqy0ibR87NGiVfsSp+7nzZ3t6ISOGUC8Es=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FPjgGgvHI0KBkTZW1XnTxJ6JmUKvWL7WJ2jp4YdrqUii4CrLuhikJ1VAj8Mw6FbDZ2w4TK48mrgxEuhmQ1MQYthR8OkT1vcaxShatsVA5PAWoUbQcgfJzT0Ib0Bz4nxpeZauzsmsyChinq//3s1le56ENlfgDYFbB3GAGBjpfZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NYAcm5Bh; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NYAcm5Bh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724834992; x=1756370992;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vXC/ododCmqy0ibR87NGiVfsSp+7nzZ3t6ISOGUC8Es=;
  b=NYAcm5BhtUvhSvz4CssRQtXJeCCHY/us/6EZunhnyuf4J7MOS7nRfXZh
   ZLzRGCbvOwcOpmEquzhokkwCukiE3JwEnJrW+jbA9RiIiXjnG3Z7V+vbr
   nttL730dv+Q1VRUIgqNiZhztRmSmWZDwL1U+wCKV/HenHBrFYOZ9v/fhu
   30fG/VlOnXF9yvF/iV8ggada06mp8Bt4FSS6Olr+NiN4e2EPisGWvsye0
   rfrLOpL80DXxOzTq9nKTJbb2/QtUEN6xgGm+6Q7zxiCYRKraYX//UvMVA
   WyQvWZFhXC52y8r7UblGYwmptcleths2BCrpROBgFrfY6u+KAsW+U0h0J
   w==;
X-CSE-ConnectionGUID: /CbFhkzJRb6etIBiZ/XO1A==
X-CSE-MsgGUID: 4JgK5WSRTRCj7A9aWX2UPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="34509680"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="34509680"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 01:49:51 -0700
X-CSE-ConnectionGUID: ps1goRlbSWuC9F4ERN79kQ==
X-CSE-MsgGUID: hQsZcik3RWamdFVChpN84Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="63493129"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Aug 2024 01:49:48 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjEN7-000Kgy-0h;
	Wed, 28 Aug 2024 08:49:45 +0000
Date: Wed, 28 Aug 2024 16:49:08 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 9880/10950] undefined reference to `sock_info_flag'
Message-ID: <202408281608.pQHUjrgE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   c99409f7fe0f14dae19af75e7e896e7a17b92946
commit: 62b6061f5714aa71e2d5fdb14db9d1341bb82dd4 [9880/10950] [PATCH] security: add security hook point
config: x86_64-buildonly-randconfig-006-20240828 (https://download.01.org/0day-ci/archive/20240828/202408281608.pQHUjrgE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240828/202408281608.pQHUjrgE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408281608.pQHUjrgE-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `sock_hook_check':
>> (.text+0x3796bc): undefined reference to `sock_info_flag'
>> ld: (.text+0x3796c8): undefined reference to `sock_info_flag'
   ld: vmlinux.o: in function `execve_hook_check':
>> (.text+0x37974f): undefined reference to `execve_info_flag'
>> ld: (.text+0x37975b): undefined reference to `execve_info_flag'
   ld: vmlinux.o: in function `accept_hook_check':
>> (.text+0x3797e6): undefined reference to `accept_info_flag'
>> ld: (.text+0x3797f2): undefined reference to `accept_info_flag'
   ld: vmlinux.o: in function `connect_hook_check':
>> (.text+0x37987b): undefined reference to `connect_info_flag'
>> ld: (.text+0x379887): undefined reference to `connect_info_flag'
   ld: vmlinux.o: in function `sendto_hook_check':
>> (.text+0x379917): undefined reference to `sendto_info_flag'
>> ld: (.text+0x379926): undefined reference to `sendto_info_flag'
   ld: vmlinux.o: in function `recvfrom_hook_check':
>> (.text+0x3799b7): undefined reference to `recvfrom_info_flag'
>> ld: (.text+0x3799c6): undefined reference to `recvfrom_info_flag'
   ld: vmlinux.o: in function `fork_hook_check':
>> (.text+0x379a51): undefined reference to `fork_info_flag'
>> ld: (.text+0x379a5d): undefined reference to `fork_info_flag'
   ld: vmlinux.o: in function `exit_hook_check':
>> (.text+0x379ae1): undefined reference to `exit_info_flag'
>> ld: (.text+0x379aed): undefined reference to `exit_info_flag'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
