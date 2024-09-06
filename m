Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5FB1B85F7
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Sep 2024 21:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725657181; cv=none; b=EIvJ+QiAYcWp3gm1JKmzthMzOrK81/zgDxIVnOcjxtgVh6ud6TX5s/2bIUdGfA4cL66V24wOFezhPsSajPv4nDxE1m47H8ASvVmVr5gpZidSVHiGtIiESb/mPcfc/JiO0MPExNS1D+N03wv+mn6Y5jVsn7zv2TRx5Oi+E4YmW+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725657181; c=relaxed/simple;
	bh=WVFe5rCVDxVLWSKRpm45H1RTLtZcqPG8TVga5oiDHEk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OXz1C+Qgj9zDiN4zkMbv3cn04oKZtipfGg1OYv4XO4DJRY93blltCMSzL/kIUm/qgvSfkQ47zQnAMWVKZpNxmxusY04WHSM21yoA5GO1N/8Z2DuKQmaTeJ3fQ/sAUhdfFpQVV1d8bRuIZPc/vtgbyibHyV7UyHP0Uui9dEzVpk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZuvWlqI9; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZuvWlqI9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725657180; x=1757193180;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WVFe5rCVDxVLWSKRpm45H1RTLtZcqPG8TVga5oiDHEk=;
  b=ZuvWlqI9HgnkbFRxr5Uevfhti1tqoTXzegRjCfbDe/C/nRxPr809I9vz
   uniRgxe4gZezUckMrXvfCd+cWr6jBaq4szDThQGgBsedIWuRsL/mC4NN1
   5DawO9Ilex1kbaQn4BFwQgMlVSJZybKtAAK55w+iRFmnxVwisoPP67djp
   pzPWGvWzZFQP+qHSDtjgCzWkd3qqggPr9uefXlycRMAptWFhQXIF0jr/o
   fr6SqhspKeh3NZbbZCbpKWz6/OCrpBczB+WD9Hc6O6kc8xYZ1MifHK4R0
   LYFl5CDQZZPA0LYsRk7pNpwzDlJEa7KlR4KFzckB0MZoSfFXmXjY2xoIY
   g==;
X-CSE-ConnectionGUID: NYGCxBR/TsyYPTcR1JvH2w==
X-CSE-MsgGUID: fTgvg0x0Qlept+akcSmezg==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="35004492"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; 
   d="scan'208";a="35004492"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 14:12:59 -0700
X-CSE-ConnectionGUID: jMZ9ekfPTjKfTlyQnIgy/g==
X-CSE-MsgGUID: sZAQgdsnTsmvdGEfW8De3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; 
   d="scan'208";a="65758337"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 Sep 2024 14:12:58 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smgGF-000Bjr-2d;
	Fri, 06 Sep 2024 21:12:55 +0000
Date: Sat, 7 Sep 2024 05:12:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 1/1] ld.lld: error: undefined symbol:
 __tracepoint_cros_vfs_utimes_enter
Message-ID: <202409070552.VjMjR072-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   7a2db0b3dc3443a34101113d7dc52832fb044a17
commit: 7a2db0b3dc3443a34101113d7dc52832fb044a17 [1/1] CHROMIUM: add cros file tracepoints for bpf
config: i386-buildonly-randconfig-003-20240906 (https://download.01.org/0day-ci/archive/20240907/202409070552.VjMjR072-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240907/202409070552.VjMjR072-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409070552.VjMjR072-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __tracepoint_cros_vfs_utimes_enter
   >>> referenced by utimes.c
   >>>               utimes.o:(vfs_utimes) in archive fs/built-in.a
   >>> referenced by utimes.c
   >>>               utimes.o:(__jump_table+0x8) in archive fs/built-in.a
--
>> ld.lld: error: undefined symbol: __SCT__tp_func_cros_vfs_utimes_enter
   >>> referenced by utimes.c
   >>>               utimes.o:(vfs_utimes) in archive fs/built-in.a
--
>> ld.lld: error: undefined symbol: __tracepoint_cros_chmod_common_enter
   >>> referenced by open.c
   >>>               open.o:(chmod_common) in archive fs/built-in.a
   >>> referenced by open.c
   >>>               open.o:(__jump_table+0x8) in archive fs/built-in.a
--
>> ld.lld: error: undefined symbol: __SCT__tp_func_cros_chmod_common_enter
   >>> referenced by open.c
   >>>               open.o:(chmod_common) in archive fs/built-in.a
--
>> ld.lld: error: undefined symbol: __tracepoint_cros_chmod_common_exit
   >>> referenced by open.c
   >>>               open.o:(trace_cros_chmod_common_exit) in archive fs/built-in.a
   >>> referenced by open.c
   >>>               open.o:(__jump_table+0x14) in archive fs/built-in.a
--
>> ld.lld: error: undefined symbol: __SCT__tp_func_cros_chmod_common_exit
   >>> referenced by open.c
   >>>               open.o:(trace_cros_chmod_common_exit) in archive fs/built-in.a
--
>> ld.lld: error: undefined symbol: __tracepoint_cros_chown_common_enter
   >>> referenced by open.c
   >>>               open.o:(chown_common) in archive fs/built-in.a
   >>> referenced by open.c
   >>>               open.o:(__jump_table+0x20) in archive fs/built-in.a
--
>> ld.lld: error: undefined symbol: __SCT__tp_func_cros_chown_common_enter
   >>> referenced by open.c
   >>>               open.o:(chown_common) in archive fs/built-in.a
--
>> ld.lld: error: undefined symbol: __tracepoint_cros_chown_common_exit
   >>> referenced by open.c
   >>>               open.o:(chown_common) in archive fs/built-in.a
   >>> referenced by open.c
   >>>               open.o:(__jump_table+0x2C) in archive fs/built-in.a
--
>> ld.lld: error: undefined symbol: __SCT__tp_func_cros_chown_common_exit
   >>> referenced by open.c
   >>>               open.o:(chown_common) in archive fs/built-in.a
--
>> ld.lld: error: undefined symbol: __tracepoint_cros_filp_close_exit
   >>> referenced by open.c
   >>>               open.o:(filp_close) in archive fs/built-in.a
   >>> referenced by open.c
   >>>               open.o:(__jump_table+0x44) in archive fs/built-in.a
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
