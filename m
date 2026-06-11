Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798B23DA5A5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 12:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781182239; cv=none; b=j1n2MtItHczWmZ5hQ1pIwFNOi8V/Ufc5zK5DgsT9oo0iTv0CO1Ocv3babGPeXN9rsuhcBYrPILTx5emSyXAbIExZzMbXnQiVB8pwGv+le0zroccNOSjQFG7bsQk89w7rppfx09cDWmxVIAy6d8SrOTue56XRdzOCWf3KEet325Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781182239; c=relaxed/simple;
	bh=qxr+KuWyX9bwKvfmeYbYh+uDnsGblyEVTughPlQBtik=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y/7cn/aQ7OVsYceWBFsAvx+B5sDlZWr+4EZyKP4QP5WWOGevoiFb2sdFjyBhYYBx1qL6tya90Ai9rIaoZemBhH9xuuC0cut/pqUAciOFd8fjFZPpJ3DNY/5u1L+nlasLSKDXSB4x32ZMGYZ2CR6ty3cHhS84VwgkT8Cqq9GI/1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RXlc8BSJ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RXlc8BSJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781182239; x=1812718239;
  h=date:from:to:cc:subject:message-id;
  bh=qxr+KuWyX9bwKvfmeYbYh+uDnsGblyEVTughPlQBtik=;
  b=RXlc8BSJuusNY6g1teh7Ku+C+lIXldUgfmIyvOhxCeKfyaApqOtOy0HD
   fgflDbjmmrkdvTVIMLLwglKBHopYqO/vDowQHFeMbFy6uRlF++WYT2N4r
   HzMKJjgiiXIH38h2kqWo3bPhmQQ2G9ArIDxLS+qZr/uflDRyoPouwW7l4
   kXT0QgFlrFEHMRxNNr9X/y0mVoJFRBbPwPZXdVk6iYMkAK1UjSHQW0UT3
   ofU9J/HJRIYUX+LxT1rBjC2tbcYlywTSgsEvnF774+uUB4qsib1WdIQjg
   PjlQaxFfBMCKpu6USvzCGBYxyxRvoQnKWLrpOLd7w5oKf3TOIHS2XdR9z
   Q==;
X-CSE-ConnectionGUID: RM5yOcjfR8SXzxLICtr75g==
X-CSE-MsgGUID: 6suHaIA+QfCCYZnrupwzww==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93100278"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="93100278"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 05:50:37 -0700
X-CSE-ConnectionGUID: cBBbpLSzTSCL0k90Ha9aYQ==
X-CSE-MsgGUID: 5RdYWCxrR5SXeNIqP5mlSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="242324240"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Jun 2026 05:50:35 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXerg-00000000N0O-3eD3;
	Thu, 11 Jun 2026 12:50:32 +0000
Date: Thu, 11 Jun 2026 20:50:11 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:ffclock 9/9] undefined reference to `ntp_get_status'
Message-ID: <202606112023.yU6QquYU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux ffclock
head:   92bc9027a194c5044f82cf2b02f1312b650f8373
commit: 92bc9027a194c5044f82cf2b02f1312b650f8373 [9/9] kernel/time: Add /dev/vmclock_host miscdev
config: microblaze-allnoconfig (https://download.01.org/0day-ci/archive/20260611/202606112023.yU6QquYU-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606112023.yU6QquYU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606112023.yU6QquYU-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: kernel/time/timekeeping.o: in function `timekeeping_adjust.constprop.0':
>> (.text+0x1db0): undefined reference to `ntp_get_status'
   microblaze-linux-ld: (.text+0x1dbc): undefined reference to `ntp_get_time_state'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
