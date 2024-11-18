Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E7E1BBBD3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 18:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731953652; cv=none; b=BR4fjOYiW6ix8exQ1npNmody7U2/TvYpiSxsX0dPj2mM5+P1w78NFkxZ/S5PbIt8/Kw4a60+ho0W1/w4PqOX4gB70vxPacN8UJrTNJ4zn+QnOHXr51PUXSH80bsPLo2+P1bV4PCXifmQ/FEdnvNr/HChGTLHRaDNIEIxLnMxvYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731953652; c=relaxed/simple;
	bh=OZVTPZOUQCROr8DfyNBPiqsADwTtxGnoepe0oPaeJ10=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h6rqQZ7P3/FL2I3UlK70zVz0kjdc4/Qrimlt7AIA3SNIg8PpifrVThgYVbRAvfCtWoifAnRnWWbaMwbkmD5eZ6L0L2AuLQUiyiLGyLdDdhMSoWAajNNdw2n+kelzmUsN35RaeUgLwnGboSttFIyu3pn3IYvgZdUwNuXZ0oSfQPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lOBAUOIk; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lOBAUOIk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731953651; x=1763489651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OZVTPZOUQCROr8DfyNBPiqsADwTtxGnoepe0oPaeJ10=;
  b=lOBAUOIkAG6vxg7W+Qqu+r2dpLPEefN8kLZpLVUXvyaNdUMGbm4OCNOR
   fIvxQTGe3st2cpRSe5TvdNC60VdKj1QV2Hx7x789agqjhrKd3Fp5D4qlO
   4DietvvYyj4G82dQK1bt0T0YTQN48zeErXUs0eJmO4iUFoV7zRQ7KChyU
   qI4P15lHOKNztIY92Yo8TIIl5jlyBnkrg+YDIR2rbYPex46mKLqAYVG0i
   mAe+QN7JGDfTUmdOnh1Y3b0FGEcxQAj130V8GQKXGWVCqFCi9In1FcXix
   Ld1Qxi78SOxXGbo47e+x/qbVfUlvUBmTPnVe9Xz/W4DqZvQcXghM6U1CV
   w==;
X-CSE-ConnectionGUID: XAUfEwRwTQi5h2pk910f4Q==
X-CSE-MsgGUID: uT6Vw0bPSmuzxgC56KNQAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="57335306"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="57335306"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 10:14:10 -0800
X-CSE-ConnectionGUID: ZDENY+mhRXGAZ/zA7rfsdg==
X-CSE-MsgGUID: no9KEWdPSLGorMkDHuVzeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="93764358"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 Nov 2024 10:14:09 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tD6GE-0002aL-2Y;
	Mon, 18 Nov 2024 18:14:06 +0000
Date: Tue, 19 Nov 2024 02:13:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 1/1] namei.c:undefined reference to
 `__tracepoint_cros_vfs_rename_exit'
Message-ID: <202411190251.YesGqXqy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   342e431cb6ced0cca9ccfa36379a356fa32cff78
commit: 5a59c4a312d71512d01842fc40a3dd9fee4a9f1b [1/1] CHROMIUM: add cros file rename tracepoints for bpf
config: arm64-randconfig-002-20241118 (https://download.01.org/0day-ci/archive/20241119/202411190251.YesGqXqy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411190251.YesGqXqy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411190251.YesGqXqy-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: fs/open.o: in function `chmod_common':
   open.c:(.text+0x19f4): undefined reference to `__tracepoint_cros_chmod_common_enter'
   aarch64-linux-ld: fs/open.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `__tracepoint_cros_chmod_common_enter' which may bind externally can not be used when making a shared object; recompile with -fPIC
   open.c:(.text+0x19f4): dangerous relocation: unsupported relocation
   aarch64-linux-ld: open.c:(.text+0x19f8): undefined reference to `__tracepoint_cros_chmod_common_enter'
   aarch64-linux-ld: open.c:(.text+0x1a10): undefined reference to `__traceiter_cros_chmod_common_enter'
   aarch64-linux-ld: open.c:(.text+0x1af0): undefined reference to `__tracepoint_cros_chmod_common_exit'
   aarch64-linux-ld: fs/open.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `__tracepoint_cros_chmod_common_exit' which may bind externally can not be used when making a shared object; recompile with -fPIC
   open.c:(.text+0x1af0): dangerous relocation: unsupported relocation
   aarch64-linux-ld: open.c:(.text+0x1af4): undefined reference to `__tracepoint_cros_chmod_common_exit'
   aarch64-linux-ld: open.c:(.text+0x1b10): undefined reference to `__traceiter_cros_chmod_common_exit'
   aarch64-linux-ld: open.c:(.text+0x1c34): undefined reference to `__tracepoint_cros_chmod_common_exit'
   aarch64-linux-ld: fs/open.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `__tracepoint_cros_chmod_common_exit' which may bind externally can not be used when making a shared object; recompile with -fPIC
   open.c:(.text+0x1c34): dangerous relocation: unsupported relocation
   aarch64-linux-ld: open.c:(.text+0x1c38): undefined reference to `__tracepoint_cros_chmod_common_exit'
   aarch64-linux-ld: open.c:(.text+0x1c54): undefined reference to `__traceiter_cros_chmod_common_exit'
   aarch64-linux-ld: fs/open.o: in function `chown_common':
   open.c:(.text+0x1fc8): undefined reference to `__tracepoint_cros_chown_common_enter'
   aarch64-linux-ld: fs/open.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `__tracepoint_cros_chown_common_enter' which may bind externally can not be used when making a shared object; recompile with -fPIC
   open.c:(.text+0x1fc8): dangerous relocation: unsupported relocation
   aarch64-linux-ld: open.c:(.text+0x1fcc): undefined reference to `__tracepoint_cros_chown_common_enter'
   aarch64-linux-ld: open.c:(.text+0x1fe8): undefined reference to `__traceiter_cros_chown_common_enter'
   aarch64-linux-ld: open.c:(.text+0x2150): undefined reference to `__tracepoint_cros_chown_common_exit'
   aarch64-linux-ld: fs/open.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `__tracepoint_cros_chown_common_exit' which may bind externally can not be used when making a shared object; recompile with -fPIC
   open.c:(.text+0x2150): dangerous relocation: unsupported relocation
   aarch64-linux-ld: open.c:(.text+0x2154): undefined reference to `__tracepoint_cros_chown_common_exit'
   aarch64-linux-ld: open.c:(.text+0x2174): undefined reference to `__traceiter_cros_chown_common_exit'
   aarch64-linux-ld: fs/open.o: in function `filp_close':
   open.c:(.text+0x340c): undefined reference to `__tracepoint_cros_filp_close_exit'
   aarch64-linux-ld: fs/open.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `__tracepoint_cros_filp_close_exit' which may bind externally can not be used when making a shared object; recompile with -fPIC
   open.c:(.text+0x340c): dangerous relocation: unsupported relocation
   aarch64-linux-ld: open.c:(.text+0x3410): undefined reference to `__tracepoint_cros_filp_close_exit'
   aarch64-linux-ld: open.c:(.text+0x342c): undefined reference to `__traceiter_cros_filp_close_exit'
   aarch64-linux-ld: fs/open.o:(__jump_table+0x8): undefined reference to `__tracepoint_cros_chmod_common_enter'
   aarch64-linux-ld: fs/open.o:(__jump_table+0x18): undefined reference to `__tracepoint_cros_chmod_common_exit'
   aarch64-linux-ld: fs/open.o:(__jump_table+0x28): undefined reference to `__tracepoint_cros_chmod_common_exit'
   aarch64-linux-ld: fs/open.o:(__jump_table+0x38): undefined reference to `__tracepoint_cros_chown_common_enter'
   aarch64-linux-ld: fs/open.o:(__jump_table+0x48): undefined reference to `__tracepoint_cros_chown_common_exit'
   aarch64-linux-ld: fs/open.o:(__jump_table+0x68): undefined reference to `__tracepoint_cros_filp_close_exit'
   aarch64-linux-ld: fs/namei.o: in function `trace_cros_vfs_rename_exit':
>> namei.c:(.text+0x13f8): undefined reference to `__tracepoint_cros_vfs_rename_exit'
   aarch64-linux-ld: fs/namei.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `__tracepoint_cros_vfs_rename_exit' which may bind externally can not be used when making a shared object; recompile with -fPIC
>> namei.c:(.text+0x13f8): dangerous relocation: unsupported relocation
>> aarch64-linux-ld: namei.c:(.text+0x13fc): undefined reference to `__tracepoint_cros_vfs_rename_exit'
>> aarch64-linux-ld: namei.c:(.text+0x1414): undefined reference to `__traceiter_cros_vfs_rename_exit'
>> aarch64-linux-ld: fs/namei.o:(__jump_table+0x78): undefined reference to `__tracepoint_cros_vfs_rename_exit'
   aarch64-linux-ld: fs/namespace.o: in function `trace_cros_path_mount_exit':
   namespace.c:(.text+0x1c8c): undefined reference to `__tracepoint_cros_path_mount_exit'
   aarch64-linux-ld: fs/namespace.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `__tracepoint_cros_path_mount_exit' which may bind externally can not be used when making a shared object; recompile with -fPIC
   namespace.c:(.text+0x1c8c): dangerous relocation: unsupported relocation
   aarch64-linux-ld: namespace.c:(.text+0x1c90): undefined reference to `__tracepoint_cros_path_mount_exit'
   aarch64-linux-ld: namespace.c:(.text+0x1cb8): undefined reference to `__traceiter_cros_path_mount_exit'
   aarch64-linux-ld: fs/namespace.o: in function `path_umount':
   namespace.c:(.text+0x471c): undefined reference to `__tracepoint_cros_path_umount_entry'
   aarch64-linux-ld: fs/namespace.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `__tracepoint_cros_path_umount_entry' which may bind externally can not be used when making a shared object; recompile with -fPIC
   namespace.c:(.text+0x471c): dangerous relocation: unsupported relocation
   aarch64-linux-ld: namespace.c:(.text+0x4720): undefined reference to `__tracepoint_cros_path_umount_entry'
   aarch64-linux-ld: namespace.c:(.text+0x4738): undefined reference to `__traceiter_cros_path_umount_entry'
   aarch64-linux-ld: namespace.c:(.text+0x4860): undefined reference to `__tracepoint_cros_path_umount_exit'
   aarch64-linux-ld: fs/namespace.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `__tracepoint_cros_path_umount_exit' which may bind externally can not be used when making a shared object; recompile with -fPIC
   namespace.c:(.text+0x4860): dangerous relocation: unsupported relocation
   aarch64-linux-ld: namespace.c:(.text+0x4864): undefined reference to `__tracepoint_cros_path_umount_exit'
   aarch64-linux-ld: namespace.c:(.text+0x4880): undefined reference to `__traceiter_cros_path_umount_exit'
   aarch64-linux-ld: fs/namespace.o:(__jump_table+0x58): undefined reference to `__tracepoint_cros_path_mount_exit'
   aarch64-linux-ld: fs/namespace.o:(__jump_table+0x78): undefined reference to `__tracepoint_cros_path_umount_entry'
   aarch64-linux-ld: fs/namespace.o:(__jump_table+0x88): undefined reference to `__tracepoint_cros_path_umount_exit'
   aarch64-linux-ld: fs/utimes.o: in function `trace_cros_vfs_utimes_exit':
   utimes.c:(.text+0xb4): undefined reference to `__tracepoint_cros_vfs_utimes_exit'
   aarch64-linux-ld: fs/utimes.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `__tracepoint_cros_vfs_utimes_exit' which may bind externally can not be used when making a shared object; recompile with -fPIC
   utimes.c:(.text+0xb4): dangerous relocation: unsupported relocation
   aarch64-linux-ld: utimes.c:(.text+0xb8): undefined reference to `__tracepoint_cros_vfs_utimes_exit'
   aarch64-linux-ld: utimes.c:(.text+0xd4): undefined reference to `__traceiter_cros_vfs_utimes_exit'
   aarch64-linux-ld: fs/utimes.o: in function `trace_cros_vfs_utimes_enter':
   utimes.c:(.text+0x204): undefined reference to `__tracepoint_cros_vfs_utimes_enter'
   aarch64-linux-ld: fs/utimes.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `__tracepoint_cros_vfs_utimes_enter' which may bind externally can not be used when making a shared object; recompile with -fPIC
   utimes.c:(.text+0x204): dangerous relocation: unsupported relocation
   aarch64-linux-ld: utimes.c:(.text+0x208): undefined reference to `__tracepoint_cros_vfs_utimes_enter'
   aarch64-linux-ld: utimes.c:(.text+0x224): undefined reference to `__traceiter_cros_vfs_utimes_enter'
   aarch64-linux-ld: fs/utimes.o:(__jump_table+0x8): undefined reference to `__tracepoint_cros_vfs_utimes_exit'
   aarch64-linux-ld: fs/utimes.o:(__jump_table+0x18): undefined reference to `__tracepoint_cros_vfs_utimes_enter'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
