Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBB113A884
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Sep 2024 08:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726043983; cv=none; b=PJ30g4b1RKMN1L4FNh/pAv+tIf+K31gQa4UAVAXggQF6/CIp0rIWAO5q9vC21A8QpjeMHaNqDT9zoY2Vgq5aOO1JT60NpBYIBHS8CppOfG8bYZ+F7A1SCeXlC8SUGYQVdO/LbxvishAYyf8Zti8UuPF8orTuxQOPRO17WGI+4gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726043983; c=relaxed/simple;
	bh=5ASc4ku1j2doNKzUBDIyMKTn1neb0G50H1CKgIqozbc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fuR6XJpyTv24SCiTzOOAk1aOVg4ix4LzdrEjdjno7SU7GQgzAkQddgN8jql03uBOPCNqijprouShYK8oGH34E8CmRAP5hfOn8f0C5iUELl+ljYN6NrrCojmO0WFb/+BRSlyKSkiBN39+eoyYt6SAuFzJzVtMY8gYnHIaB656uIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WU5uSrus; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WU5uSrus"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726043982; x=1757579982;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5ASc4ku1j2doNKzUBDIyMKTn1neb0G50H1CKgIqozbc=;
  b=WU5uSrusVRN3M/vXahwsUFQjR0VAR/J15car2XBvlty9K9KbWIDsAKNL
   DyisIU720/bxSZzL/Aw1Hu/MOnvVi3JliO98KEdjw9s2zhrixYHpsyJWS
   +d2pqClGY5kdIbQAEhiCKehBJx3aSc1SraMJ7mu+iFPm9O6bouQJv/F92
   GZ3szAchtI8HcIpkJbvIL6Agu033sHk4UswqnW2EIRbsbQLBsXPdIS+6J
   w0OP49NBrmcex2ObD7bzywKRZepFt8RB10ZH44G/Xq+qBdbBAsm6NjD6p
   RFSymLOFa0z+Y32IeuL3OxS2GKClCDxVqpJSUR/VLl69pU3rgkW+QCdG+
   w==;
X-CSE-ConnectionGUID: E+PofONdSsiuL6WECorm1w==
X-CSE-MsgGUID: 09CYEbkESk2KbL8TbzHg7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24653596"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="24653596"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 01:39:41 -0700
X-CSE-ConnectionGUID: VUHUlzdGTLWcKBV8wH8BTg==
X-CSE-MsgGUID: hwm/VBvXQpiVqSMD2i+aDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="67346544"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 Sep 2024 01:39:40 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soIt0-0003FQ-1h;
	Wed, 11 Sep 2024 08:39:38 +0000
Date: Wed, 11 Sep 2024 16:38:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 1/4] open.c:undefined reference to
 `__SCT__tp_func_cros_filp_close_exit'
Message-ID: <202409111607.5MBC5Y2R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   97238f972d8c84cf4396b8748731e912f46a0445
commit: dc731cd8bbfc0e772144f2c2dded2593a030fdd6 [1/4] CHROMIUM: add cros file tracepoints for bpf
config: x86_64-buildonly-randconfig-003-20240911 (https://download.01.org/0day-ci/archive/20240911/202409111607.5MBC5Y2R-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409111607.5MBC5Y2R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409111607.5MBC5Y2R-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/open.o: in function `trace_cros_chmod_common_exit':
   open.c:(.text+0x12eb): undefined reference to `__tracepoint_cros_chmod_common_exit'
   ld: open.c:(.text+0x12f6): undefined reference to `__tracepoint_cros_chmod_common_exit'
   ld: open.c:(.text+0x13e0): undefined reference to `__tracepoint_cros_chmod_common_exit'
   ld: open.c:(.text+0x13ec): undefined reference to `__tracepoint_cros_chmod_common_exit'
   ld: open.c:(.text+0x140c): undefined reference to `__SCT__tp_func_cros_chmod_common_exit'
   ld: fs/open.o: in function `chmod_common':
   open.c:(.text+0x2f35): undefined reference to `__tracepoint_cros_chmod_common_enter'
   ld: open.c:(.text+0x2f45): undefined reference to `__tracepoint_cros_chmod_common_enter'
   ld: open.c:(.text+0x313a): undefined reference to `__tracepoint_cros_chmod_common_enter'
   ld: open.c:(.text+0x3146): undefined reference to `__tracepoint_cros_chmod_common_enter'
   ld: open.c:(.text+0x3163): undefined reference to `__SCT__tp_func_cros_chmod_common_enter'
   ld: fs/open.o: in function `chown_common':
   open.c:(.text+0x35f5): undefined reference to `__tracepoint_cros_chown_common_enter'
   ld: open.c:(.text+0x3605): undefined reference to `__tracepoint_cros_chown_common_enter'
   ld: open.c:(.text+0x3785): undefined reference to `__tracepoint_cros_chown_common_exit'
   ld: open.c:(.text+0x3790): undefined reference to `__tracepoint_cros_chown_common_exit'
   ld: open.c:(.text+0x38bc): undefined reference to `__tracepoint_cros_chown_common_enter'
   ld: open.c:(.text+0x38c8): undefined reference to `__tracepoint_cros_chown_common_enter'
   ld: open.c:(.text+0x38e9): undefined reference to `__SCT__tp_func_cros_chown_common_enter'
   ld: open.c:(.text+0x397c): undefined reference to `__tracepoint_cros_chown_common_exit'
   ld: open.c:(.text+0x3988): undefined reference to `__tracepoint_cros_chown_common_exit'
   ld: open.c:(.text+0x39ac): undefined reference to `__SCT__tp_func_cros_chown_common_exit'
   ld: fs/open.o: in function `filp_close':
   open.c:(.text+0x5a20): undefined reference to `__tracepoint_cros_filp_close_exit'
   ld: open.c:(.text+0x5a2b): undefined reference to `__tracepoint_cros_filp_close_exit'
   ld: open.c:(.text+0x5aa2): undefined reference to `__tracepoint_cros_filp_close_exit'
   ld: open.c:(.text+0x5aad): undefined reference to `__tracepoint_cros_filp_close_exit'
   ld: open.c:(.text+0x5b74): undefined reference to `__tracepoint_cros_filp_close_exit'
   ld: fs/open.o:open.c:(.text+0x5b80): more undefined references to `__tracepoint_cros_filp_close_exit' follow
   ld: fs/open.o: in function `filp_close':
>> open.c:(.text+0x5ba0): undefined reference to `__SCT__tp_func_cros_filp_close_exit'
   ld: open.c:(.text+0x5c1e): undefined reference to `__tracepoint_cros_filp_close_exit'
   ld: open.c:(.text+0x5c2a): undefined reference to `__tracepoint_cros_filp_close_exit'
   ld: open.c:(.text+0x5c4b): undefined reference to `__SCT__tp_func_cros_filp_close_exit'
   ld: fs/open.o:(.static_call_sites+0x4): undefined reference to `__SCK__tp_func_cros_chmod_common_exit'
   ld: fs/open.o:(.static_call_sites+0x44): undefined reference to `__SCK__tp_func_cros_chmod_common_enter'
   ld: fs/open.o:(.static_call_sites+0x54): undefined reference to `__SCK__tp_func_cros_chown_common_enter'
   ld: fs/open.o:(.static_call_sites+0x64): undefined reference to `__SCK__tp_func_cros_chown_common_exit'
   ld: fs/open.o:(.static_call_sites+0x84): undefined reference to `__SCK__tp_func_cros_filp_close_exit'
   ld: fs/open.o:(.static_call_sites+0x94): undefined reference to `__SCK__tp_func_cros_filp_close_exit'
   ld: fs/namespace.o: in function `trace_cros_path_mount_exit':
   namespace.c:(.text+0x2a7d): undefined reference to `__tracepoint_cros_path_mount_exit'
   ld: namespace.c:(.text+0x2a88): undefined reference to `__tracepoint_cros_path_mount_exit'
   ld: namespace.c:(.text+0x2b6c): undefined reference to `__tracepoint_cros_path_mount_exit'
   ld: namespace.c:(.text+0x2b78): undefined reference to `__tracepoint_cros_path_mount_exit'
   ld: namespace.c:(.text+0x2ba8): undefined reference to `__SCT__tp_func_cros_path_mount_exit'
   ld: fs/namespace.o: in function `path_umount':
   namespace.c:(.text+0x77a2): undefined reference to `__tracepoint_cros_path_umount_entry'
   ld: namespace.c:(.text+0x77b1): undefined reference to `__tracepoint_cros_path_umount_entry'
   ld: namespace.c:(.text+0x78c9): undefined reference to `__tracepoint_cros_path_umount_exit'
   ld: namespace.c:(.text+0x78d4): undefined reference to `__tracepoint_cros_path_umount_exit'
   ld: namespace.c:(.text+0x7a14): undefined reference to `__tracepoint_cros_path_umount_exit'
   ld: namespace.c:(.text+0x7a20): undefined reference to `__tracepoint_cros_path_umount_exit'
   ld: namespace.c:(.text+0x7a42): undefined reference to `__SCT__tp_func_cros_path_umount_exit'
   ld: namespace.c:(.text+0x7a67): undefined reference to `__tracepoint_cros_path_umount_entry'
   ld: namespace.c:(.text+0x7a73): undefined reference to `__tracepoint_cros_path_umount_entry'
   ld: namespace.c:(.text+0x7a91): undefined reference to `__SCT__tp_func_cros_path_umount_entry'
   ld: fs/namespace.o:(.static_call_sites+0x4): undefined reference to `__SCK__tp_func_cros_path_mount_exit'
   ld: fs/namespace.o:(.static_call_sites+0x7c): undefined reference to `__SCK__tp_func_cros_path_umount_exit'
   ld: fs/namespace.o:(.static_call_sites+0x8c): undefined reference to `__SCK__tp_func_cros_path_umount_entry'
   ld: fs/utimes.o: in function `trace_cros_vfs_utimes_exit':
   utimes.c:(.text+0x1b): undefined reference to `__tracepoint_cros_vfs_utimes_exit'
   ld: utimes.c:(.text+0x26): undefined reference to `__tracepoint_cros_vfs_utimes_exit'
   ld: utimes.c:(.text+0x11a): undefined reference to `__tracepoint_cros_vfs_utimes_exit'
   ld: utimes.c:(.text+0x126): undefined reference to `__tracepoint_cros_vfs_utimes_exit'
   ld: utimes.c:(.text+0x145): undefined reference to `__SCT__tp_func_cros_vfs_utimes_exit'
   ld: fs/utimes.o: in function `vfs_utimes':
   utimes.c:(.text+0x211): undefined reference to `__tracepoint_cros_vfs_utimes_enter'
   ld: utimes.c:(.text+0x225): undefined reference to `__tracepoint_cros_vfs_utimes_enter'
   ld: utimes.c:(.text+0x617): undefined reference to `__tracepoint_cros_vfs_utimes_enter'
   ld: utimes.c:(.text+0x623): undefined reference to `__tracepoint_cros_vfs_utimes_enter'
   ld: utimes.c:(.text+0x640): undefined reference to `__SCT__tp_func_cros_vfs_utimes_enter'
   ld: fs/utimes.o:(.static_call_sites+0x4): undefined reference to `__SCK__tp_func_cros_vfs_utimes_exit'
   ld: fs/utimes.o:(.static_call_sites+0x14): undefined reference to `__SCK__tp_func_cros_vfs_utimes_enter'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
