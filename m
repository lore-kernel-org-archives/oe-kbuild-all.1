Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E906A1ABEB7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 22:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726007497; cv=none; b=Vkio3H0/zJeOcXDPCKEKOYmKXxq775Ze158qqfEhbKKeY++LDrsmKOuDrEHCwMzdzeT2QlWHxFvpla6aeES3XKwgc3JzyInVnJo3+3nd2qzYZzLA70YfMKfM3ZYlO4jbPkZfV+wCSPPNbiD2A7kEWhLAK/cVBnIzPc3FtoF/hyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726007497; c=relaxed/simple;
	bh=ZVX8AKGfzYjH2COOzEYjkU5Nza8UUkj1i3/zPKeF4uQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e3nDPhfl9DRl8VdBDV/C1+Ngd/wnxsIzbXAIIWZ/n4zk2bshl6e5Ht7hgYip1Bax9319+iuTHUPt8hUrymV7Am82MkZvIlDmWUVy2K/GmgbMniYCyYoO6sxjQm8qI2jraQxkMjEtXMEcqEjzdWY8+0USyjlDAXjF80yPrUZHEHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EISKKcbP; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EISKKcbP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726007496; x=1757543496;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZVX8AKGfzYjH2COOzEYjkU5Nza8UUkj1i3/zPKeF4uQ=;
  b=EISKKcbPLVeRkJorHV9KWpfoZEuAuW+ct7dVe2YBubN2YV2BmGpTsMlc
   T0LPj/HD1RvzKSaOwWpt6PRwO5a3lF22oKKX6bfgF4wH9C3BLIj1BdB30
   XDZ1rjaRkAMjoCexyRHafHYmp3/6CXaPEZtarpfb+VwxFm3TinyyvlLFa
   1vN8yRqJGEh2CWqIReiO5NnFSlaQRX/zRl9JapDx09JrDolqKg45YJ/WA
   z8y+sK7HyGDRrAwDOx6kMXY4QvJa3SkhfVIR62lrtybT589eYHyzR/Kov
   bn/0cf5D+bvyWtZ63u4AH/PPj7+CMHy4WiGiNk/xVk1J6bCGh05tTVy02
   g==;
X-CSE-ConnectionGUID: QpMreDCJTXmFrlyVAyP8cA==
X-CSE-MsgGUID: P5Uc+A+NTGqLbmDVfKQ5HA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24603544"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="24603544"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 15:31:18 -0700
X-CSE-ConnectionGUID: oz35Z4ikTeOjRfFWESZXZg==
X-CSE-MsgGUID: VJXLbIBARrG+nCi/3Dpl9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="67184382"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Sep 2024 15:31:13 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1so9OB-0002mc-2D;
	Tue, 10 Sep 2024 22:31:11 +0000
Date: Wed, 11 Sep 2024 06:30:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 2/3] open.c:undefined reference to
 `__tracepoint_cros_filp_close_exit'
Message-ID: <202409110619.iXGfh5KT-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-003-20240911 (https://download.01.org/0day-ci/archive/20240911/202409110619.iXGfh5KT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409110619.iXGfh5KT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409110619.iXGfh5KT-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/link-vmlinux.sh: 123: is_enabled: not found
   vmlinux.o: warning: objtool: mce_setup()+0x4c: call to cpuid_eax.constprop.0() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_read_aux()+0xdd: call to mca_msr_reg() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check()+0xcb: call to mce_gather_info() leaves .noinstr.text section
   ld: fs/open.o: in function `trace_cros_chmod_common_exit':
   open.c:(.text+0x1181): undefined reference to `__tracepoint_cros_chmod_common_exit'
   ld: open.c:(.text+0x118c): undefined reference to `__tracepoint_cros_chmod_common_exit'
   ld: open.c:(.text+0x1271): undefined reference to `__tracepoint_cros_chmod_common_exit'
   ld: open.c:(.text+0x127d): undefined reference to `__tracepoint_cros_chmod_common_exit'
   ld: open.c:(.text+0x129d): undefined reference to `__SCT__tp_func_cros_chmod_common_exit'
   ld: fs/open.o: in function `chmod_common':
   open.c:(.text+0x2c04): undefined reference to `__tracepoint_cros_chmod_common_enter'
   ld: open.c:(.text+0x2c1c): undefined reference to `__tracepoint_cros_chmod_common_enter'
   ld: open.c:(.text+0x2d56): undefined reference to `__tracepoint_cros_chmod_common_exit'
   ld: open.c:(.text+0x2d61): undefined reference to `__tracepoint_cros_chmod_common_exit'
   ld: open.c:(.text+0x2e84): undefined reference to `__tracepoint_cros_chmod_common_enter'
   ld: open.c:(.text+0x2e90): undefined reference to `__tracepoint_cros_chmod_common_enter'
   ld: open.c:(.text+0x2eae): undefined reference to `__SCT__tp_func_cros_chmod_common_enter'
   ld: open.c:(.text+0x2f38): undefined reference to `__tracepoint_cros_chmod_common_exit'
   ld: open.c:(.text+0x2f44): undefined reference to `__tracepoint_cros_chmod_common_exit'
   ld: open.c:(.text+0x2f66): undefined reference to `__SCT__tp_func_cros_chmod_common_exit'
   ld: fs/open.o: in function `chown_common':
   open.c:(.text+0x3329): undefined reference to `__tracepoint_cros_chown_common_enter'
   ld: open.c:(.text+0x3339): undefined reference to `__tracepoint_cros_chown_common_enter'
   ld: open.c:(.text+0x3517): undefined reference to `__tracepoint_cros_chown_common_exit'
   ld: open.c:(.text+0x3522): undefined reference to `__tracepoint_cros_chown_common_exit'
   ld: open.c:(.text+0x3637): undefined reference to `__tracepoint_cros_chown_common_enter'
   ld: open.c:(.text+0x3643): undefined reference to `__tracepoint_cros_chown_common_enter'
   ld: open.c:(.text+0x3667): undefined reference to `__SCT__tp_func_cros_chown_common_enter'
   ld: open.c:(.text+0x36f1): undefined reference to `__tracepoint_cros_chown_common_exit'
   ld: open.c:(.text+0x36fd): undefined reference to `__tracepoint_cros_chown_common_exit'
   ld: open.c:(.text+0x3724): undefined reference to `__SCT__tp_func_cros_chown_common_exit'
   ld: fs/open.o: in function `filp_close':
   open.c:(.text+0x563c): undefined reference to `__tracepoint_cros_filp_close_exit'
   ld: open.c:(.text+0x5647): undefined reference to `__tracepoint_cros_filp_close_exit'
   ld: open.c:(.text+0x5709): undefined reference to `__tracepoint_cros_filp_close_exit'
   ld: open.c:(.text+0x5715): undefined reference to `__tracepoint_cros_filp_close_exit'
   ld: open.c:(.text+0x5735): undefined reference to `__SCT__tp_func_cros_filp_close_exit'
   ld: fs/open.o: in function `filp_close.cold':
>> open.c:(.text.unlikely+0xf): undefined reference to `__tracepoint_cros_filp_close_exit'
>> ld: open.c:(.text.unlikely+0x1a): undefined reference to `__tracepoint_cros_filp_close_exit'
   ld: open.c:(.text.unlikely+0x81): undefined reference to `__tracepoint_cros_filp_close_exit'
   ld: open.c:(.text.unlikely+0x8d): undefined reference to `__tracepoint_cros_filp_close_exit'
>> ld: open.c:(.text.unlikely+0x107): undefined reference to `__SCT__tp_func_cros_filp_close_exit'
   ld: fs/open.o:(.static_call_sites+0x4): undefined reference to `__SCK__tp_func_cros_chmod_common_exit'
   ld: fs/open.o:(.static_call_sites+0xc): undefined reference to `__SCK__tp_func_cros_chmod_common_enter'
   ld: fs/open.o:(.static_call_sites+0x14): undefined reference to `__SCK__tp_func_cros_chmod_common_exit'
   ld: fs/open.o:(.static_call_sites+0x1c): undefined reference to `__SCK__tp_func_cros_chown_common_enter'
   ld: fs/open.o:(.static_call_sites+0x24): undefined reference to `__SCK__tp_func_cros_chown_common_exit'
   ld: fs/open.o:(.static_call_sites+0x34): undefined reference to `__SCK__tp_func_cros_filp_close_exit'
   ld: fs/open.o:(.static_call_sites+0x3c): undefined reference to `__SCK__tp_func_cros_filp_close_exit'
   ld: fs/namespace.o: in function `trace_cros_path_mount_exit':
   namespace.c:(.text+0x28a7): undefined reference to `__tracepoint_cros_path_mount_exit'
   ld: namespace.c:(.text+0x28be): undefined reference to `__tracepoint_cros_path_mount_exit'
   ld: namespace.c:(.text+0x299d): undefined reference to `__tracepoint_cros_path_mount_exit'
   ld: namespace.c:(.text+0x29a9): undefined reference to `__tracepoint_cros_path_mount_exit'
   ld: namespace.c:(.text+0x29d9): undefined reference to `__SCT__tp_func_cros_path_mount_exit'
   ld: fs/namespace.o: in function `path_umount':
   namespace.c:(.text+0x7409): undefined reference to `__tracepoint_cros_path_umount_entry'
   ld: namespace.c:(.text+0x7418): undefined reference to `__tracepoint_cros_path_umount_entry'
   ld: namespace.c:(.text+0x752c): undefined reference to `__tracepoint_cros_path_umount_exit'
   ld: namespace.c:(.text+0x7537): undefined reference to `__tracepoint_cros_path_umount_exit'
   ld: namespace.c:(.text+0x760e): undefined reference to `__tracepoint_cros_path_umount_entry'
   ld: namespace.c:(.text+0x761a): undefined reference to `__tracepoint_cros_path_umount_entry'
   ld: namespace.c:(.text+0x7638): undefined reference to `__SCT__tp_func_cros_path_umount_entry'
   ld: namespace.c:(.text+0x76aa): undefined reference to `__tracepoint_cros_path_umount_exit'
   ld: namespace.c:(.text+0x76b6): undefined reference to `__tracepoint_cros_path_umount_exit'
   ld: namespace.c:(.text+0x76d8): undefined reference to `__SCT__tp_func_cros_path_umount_exit'
   ld: fs/namespace.o:(.static_call_sites+0x4): undefined reference to `__SCK__tp_func_cros_path_mount_exit'
   ld: fs/namespace.o:(.static_call_sites+0xc): undefined reference to `__SCK__tp_func_cros_path_umount_entry'
   ld: fs/namespace.o:(.static_call_sites+0x14): undefined reference to `__SCK__tp_func_cros_path_umount_exit'
   ld: fs/utimes.o: in function `trace_cros_vfs_utimes_exit':
   utimes.c:(.text+0x11): undefined reference to `__tracepoint_cros_vfs_utimes_exit'
   ld: utimes.c:(.text+0x1c): undefined reference to `__tracepoint_cros_vfs_utimes_exit'
   ld: utimes.c:(.text+0x10b): undefined reference to `__tracepoint_cros_vfs_utimes_exit'
   ld: utimes.c:(.text+0x117): undefined reference to `__tracepoint_cros_vfs_utimes_exit'
   ld: utimes.c:(.text+0x136): undefined reference to `__SCT__tp_func_cros_vfs_utimes_exit'
   ld: fs/utimes.o: in function `vfs_utimes':
   utimes.c:(.text+0x1f6): undefined reference to `__tracepoint_cros_vfs_utimes_enter'
   ld: utimes.c:(.text+0x20a): undefined reference to `__tracepoint_cros_vfs_utimes_enter'
   ld: utimes.c:(.text+0x5f7): undefined reference to `__tracepoint_cros_vfs_utimes_enter'
   ld: utimes.c:(.text+0x603): undefined reference to `__tracepoint_cros_vfs_utimes_enter'
   ld: utimes.c:(.text+0x620): undefined reference to `__SCT__tp_func_cros_vfs_utimes_enter'
   ld: fs/utimes.o:(.static_call_sites+0x4): undefined reference to `__SCK__tp_func_cros_vfs_utimes_exit'
   ld: fs/utimes.o:(.static_call_sites+0xc): undefined reference to `__SCK__tp_func_cros_vfs_utimes_enter'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
