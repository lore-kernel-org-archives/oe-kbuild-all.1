Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5877930E831
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 06:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774335514; cv=none; b=NHOp8SkBkQua9X1vf54E6iAkYdLCZYxyesVxwD4L3XmHU0WUof1FxNYJGqAmvfWB64ho+ns1sC5BAwR1576SJi9h2xoy8JlAEOtxG8/OoKrIBBjBk6GF/MyJPbYR3/SA3djZzUzzk4NrFq2sQ7ux/Fcjj49FXkM/2kHVHSPBOwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774335514; c=relaxed/simple;
	bh=8O0N44eIVM6GvpPPBLWHvWWFZBHm+WZwmcFAn/BLJw8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=eH9lV4Yy3W2sbhaS+yCfFYvWv1d3Cg9aJzvU/b2hCiZwgRdPRuaCItgq3a08RLcVz2cV4/qGMwbxUkdamnZ6hD0HfKMFxoIrXWh6K0v07KAOByaOKQQVSZMbzCl/iiSXvHQQifK5aqXniLIxKsi6LAYbo2KB2dSAt/xDwHbSDbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gxuZ+TYs; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gxuZ+TYs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774335503; x=1805871503;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8O0N44eIVM6GvpPPBLWHvWWFZBHm+WZwmcFAn/BLJw8=;
  b=gxuZ+TYs/CEZjRBaHwJ2qxM4UEN9kaNM1qw8MIxrbLF0V6sA//5/dxEO
   h7ojBo8mLMETgpinGL+BGr8S75suvEVf3Btj4r5+Tpj0rZTLcCTL12vYU
   8Eyj4bu/3j6rcod+VUWPElL39ArtzTpn5ewlzKB1pV6toqXUQIjNLfI80
   P0LijCGuYNRgT5XoeMrUVGtkhy2JEZwaUoBtkcb3lU2ph3ZZYnMSXdiN7
   9VryfeJNS2MCM8GSUvWeiAeQFpQwb5z/t1xBPpeLCpPEMWjCt/0pbAxS7
   /vAZpwEUzWTB2jiJjBVZeIjvCW+rwGsC1JduyQYZ2/UQgZ6rWlLPgPGB0
   A==;
X-CSE-ConnectionGUID: QTQeidgWT2Od78ipvhoFwg==
X-CSE-MsgGUID: HPYVhnElQcebHmEjKLB+VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="97963451"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="97963451"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 23:58:22 -0700
X-CSE-ConnectionGUID: /Tua91K0SuWnCAwClchKTw==
X-CSE-MsgGUID: KXxWBDpdSVSbY+gtY3zvBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="254749342"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 Mar 2026 23:58:23 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4viW-0000000043n-0mlO;
	Tue, 24 Mar 2026 06:58:20 +0000
Date: Tue, 24 Mar 2026 14:57:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-classmap-drm-fancy 45/45] WARNING: modpost: vmlinux
 (.gnu.linkonce.prop.d.__dyndbg_class_users.test_dynamic_debug_submod):
 unexpected non-allocatable section.
Message-ID: <202603241439.lFDVYtFF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dd-classmap-drm-fancy
head:   81f6e1fbd4105eefd6bff844642707c3e3e1db88
commit: 81f6e1fbd4105eefd6bff844642707c3e3e1db88 [45/45] dyndbg: solve the duplicate records problem
config: xtensa-randconfig-002-20260323 (https://download.01.org/0day-ci/archive/20260324/202603241439.lFDVYtFF-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603241439.lFDVYtFF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603241439.lFDVYtFF-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: put_page+0x6c (section: .text.unlikely) -> initcall_level_names (section: .init.data)
>> WARNING: modpost: vmlinux (.gnu.linkonce.prop.d.__dyndbg_class_users.test_dynamic_debug_submod): unexpected non-allocatable section.
Did you forget to use "ax"/"aw" in a .S file?
Note that for example <linux/init.h> contains
section definitions for use in .S files.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
