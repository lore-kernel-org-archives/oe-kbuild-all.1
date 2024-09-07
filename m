Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E119A4689
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Sep 2024 01:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725671791; cv=none; b=Pi4owiC22uxZ4rY3bkHWNQJKFnWJ8Gh7CsE5HzDNAidTIG4Lioq/uPyBTWlxNTzwJOUlO/r0dgFouvcGyQz3vEhXHVsctxwYXSM8foBiM98PtL4l9+L1vsYtGBBj7FEjW4wtAYHlv6yKsewy2oMyVu8en6HMh/E73nOKWY3LSMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725671791; c=relaxed/simple;
	bh=zZbzJQfq3GNR6Hjr81wQT2rmOTznbLm/yBw1WiFV3SE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hSewBQAZ24KXHoXcoil7UWunDq3yJIFHWhbGK9JadiLcDEOAtc6WjdImMHO9ZKBGzh2+jqKTaLkxdI1SM3FWbExq/35KAobGTnkCeGZrPbiVHN0yUxS2Xk9fW14w1sXBCjad3n6Q+O/PVQzvQPxQfN1a6rp9kElwUmyxPJ1qREg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZZ+a6YEx; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZZ+a6YEx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725671790; x=1757207790;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zZbzJQfq3GNR6Hjr81wQT2rmOTznbLm/yBw1WiFV3SE=;
  b=ZZ+a6YExIG5fMoZCCbHMqesqtvjABbLxCvNdTUmMkrxUQtObkx1dyIux
   4lBQnjvLNIzvA7gOKfmWI+5nKeDI88zwsYeOhkrVYLta/dgtpgW6KKOBA
   SHxeLHqDOIPncZ4z0m0nyOdO2QtwW4FkvGpql67O5SvtVm7CwSomcj+ds
   rVH/qeHtbPteDPn7BOsHbouPLpnLTA21quBXhpKLvuLOsUw9d03e5RUoC
   Rol0MA7fxOd5UL5tx+95V5QrDqCv6hdakAyQJ8D28zwSg0KJYBviVVqf5
   MqHcKgBGlx1hzwa1Ljaz7qj2KYCvCgBTi3WNZ4+IF4+N74v+lzcfR2BFS
   A==;
X-CSE-ConnectionGUID: p5iO2vKjSh6QdJqHF0H4PQ==
X-CSE-MsgGUID: ZXeLkG2qShSnEKOsJyAxQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="23949301"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; 
   d="scan'208";a="23949301"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 18:16:27 -0700
X-CSE-ConnectionGUID: LIlBMxx+QxWDoGeAZI9irQ==
X-CSE-MsgGUID: wfFYbuYTT++ESGOaEcEpRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; 
   d="scan'208";a="89386951"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Sep 2024 18:16:26 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smk3s-000C0T-0l;
	Sat, 07 Sep 2024 01:16:24 +0000
Date: Sat, 7 Sep 2024 09:16:20 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 1/1] open.c:undefined reference to
 `__tracepoint_cros_filp_close_exit'
Message-ID: <202409070952.G1agzPeI-lkp@intel.com>
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
config: arm64-randconfig-001-20240907 (https://download.01.org/0day-ci/archive/20240907/202409070952.G1agzPeI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240907/202409070952.G1agzPeI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409070952.G1agzPeI-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: fs/open.o: in function `trace_cros_filp_close_exit':
>> open.c:(.text+0x106c): undefined reference to `__tracepoint_cros_filp_close_exit'
   aarch64-linux-ld: fs/open.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `__tracepoint_cros_filp_close_exit' which may bind externally can not be used when making a shared object; recompile with -fPIC
>> open.c:(.text+0x106c): dangerous relocation: unsupported relocation
>> aarch64-linux-ld: open.c:(.text+0x1070): undefined reference to `__tracepoint_cros_filp_close_exit'
>> aarch64-linux-ld: open.c:(.text+0x108c): undefined reference to `__traceiter_cros_filp_close_exit'
   aarch64-linux-ld: fs/open.o: in function `trace_cros_chmod_common_enter':
>> open.c:(.text+0x11a8): undefined reference to `__tracepoint_cros_chmod_common_enter'
   aarch64-linux-ld: fs/open.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `__tracepoint_cros_chmod_common_enter' which may bind externally can not be used when making a shared object; recompile with -fPIC
   open.c:(.text+0x11a8): dangerous relocation: unsupported relocation
>> aarch64-linux-ld: open.c:(.text+0x11ac): undefined reference to `__tracepoint_cros_chmod_common_enter'
>> aarch64-linux-ld: open.c:(.text+0x11c8): undefined reference to `__traceiter_cros_chmod_common_enter'
   aarch64-linux-ld: fs/open.o: in function `trace_cros_chmod_common_exit':
>> open.c:(.text+0x12e8): undefined reference to `__tracepoint_cros_chmod_common_exit'
   aarch64-linux-ld: fs/open.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `__tracepoint_cros_chmod_common_exit' which may bind externally can not be used when making a shared object; recompile with -fPIC
   open.c:(.text+0x12e8): dangerous relocation: unsupported relocation
>> aarch64-linux-ld: open.c:(.text+0x12ec): undefined reference to `__tracepoint_cros_chmod_common_exit'
>> aarch64-linux-ld: open.c:(.text+0x130c): undefined reference to `__traceiter_cros_chmod_common_exit'
   aarch64-linux-ld: fs/open.o: in function `trace_cros_chown_common_enter':
>> open.c:(.text+0x142c): undefined reference to `__tracepoint_cros_chown_common_enter'
   aarch64-linux-ld: fs/open.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `__tracepoint_cros_chown_common_enter' which may bind externally can not be used when making a shared object; recompile with -fPIC
   open.c:(.text+0x142c): dangerous relocation: unsupported relocation
>> aarch64-linux-ld: open.c:(.text+0x1430): undefined reference to `__tracepoint_cros_chown_common_enter'
>> aarch64-linux-ld: open.c:(.text+0x144c): undefined reference to `__traceiter_cros_chown_common_enter'
   aarch64-linux-ld: fs/open.o: in function `chown_common':
>> open.c:(.text+0x2850): undefined reference to `__tracepoint_cros_chown_common_exit'
   aarch64-linux-ld: fs/open.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `__tracepoint_cros_chown_common_exit' which may bind externally can not be used when making a shared object; recompile with -fPIC
   open.c:(.text+0x2850): dangerous relocation: unsupported relocation
>> aarch64-linux-ld: open.c:(.text+0x2854): undefined reference to `__tracepoint_cros_chown_common_exit'
>> aarch64-linux-ld: open.c:(.text+0x2874): undefined reference to `__traceiter_cros_chown_common_exit'
>> aarch64-linux-ld: fs/open.o:(__jump_table+0x148): undefined reference to `__tracepoint_cros_filp_close_exit'
>> aarch64-linux-ld: fs/open.o:(__jump_table+0x158): undefined reference to `__tracepoint_cros_chmod_common_enter'
>> aarch64-linux-ld: fs/open.o:(__jump_table+0x168): undefined reference to `__tracepoint_cros_chmod_common_exit'
>> aarch64-linux-ld: fs/open.o:(__jump_table+0x178): undefined reference to `__tracepoint_cros_chown_common_enter'
   aarch64-linux-ld: fs/open.o:(__jump_table+0x1d8): undefined reference to `__tracepoint_cros_chown_common_exit'
   aarch64-linux-ld: fs/namespace.o: in function `trace_cros_path_umount_entry':
   namespace.c:(.text+0x1da0): undefined reference to `__tracepoint_cros_path_umount_entry'
   aarch64-linux-ld: fs/namespace.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `__tracepoint_cros_path_umount_entry' which may bind externally can not be used when making a shared object; recompile with -fPIC
   namespace.c:(.text+0x1da0): dangerous relocation: unsupported relocation
   aarch64-linux-ld: namespace.c:(.text+0x1da4): undefined reference to `__tracepoint_cros_path_umount_entry'
   aarch64-linux-ld: namespace.c:(.text+0x1dbc): undefined reference to `__traceiter_cros_path_umount_entry'
   aarch64-linux-ld: fs/namespace.o: in function `trace_cros_path_umount_exit':
   namespace.c:(.text+0x1ecc): undefined reference to `__tracepoint_cros_path_umount_exit'
   aarch64-linux-ld: fs/namespace.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `__tracepoint_cros_path_umount_exit' which may bind externally can not be used when making a shared object; recompile with -fPIC
   namespace.c:(.text+0x1ecc): dangerous relocation: unsupported relocation
   aarch64-linux-ld: namespace.c:(.text+0x1ed0): undefined reference to `__tracepoint_cros_path_umount_exit'
   aarch64-linux-ld: namespace.c:(.text+0x1eec): undefined reference to `__traceiter_cros_path_umount_exit'
   aarch64-linux-ld: fs/namespace.o: in function `trace_cros_path_mount_exit':
   namespace.c:(.text+0x2028): undefined reference to `__tracepoint_cros_path_mount_exit'
   aarch64-linux-ld: fs/namespace.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `__tracepoint_cros_path_mount_exit' which may bind externally can not be used when making a shared object; recompile with -fPIC
   namespace.c:(.text+0x2028): dangerous relocation: unsupported relocation
   aarch64-linux-ld: namespace.c:(.text+0x202c): undefined reference to `__tracepoint_cros_path_mount_exit'
   aarch64-linux-ld: namespace.c:(.text+0x2054): undefined reference to `__traceiter_cros_path_mount_exit'
   aarch64-linux-ld: fs/namespace.o:(__jump_table+0xc8): undefined reference to `__tracepoint_cros_path_umount_entry'
   aarch64-linux-ld: fs/namespace.o:(__jump_table+0xd8): undefined reference to `__tracepoint_cros_path_umount_exit'
   aarch64-linux-ld: fs/namespace.o:(__jump_table+0xe8): undefined reference to `__tracepoint_cros_path_mount_exit'
   aarch64-linux-ld: fs/utimes.o: in function `trace_cros_vfs_utimes_exit':
   utimes.c:(.text+0x154): undefined reference to `__tracepoint_cros_vfs_utimes_exit'
   aarch64-linux-ld: fs/utimes.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `__tracepoint_cros_vfs_utimes_exit' which may bind externally can not be used when making a shared object; recompile with -fPIC
   utimes.c:(.text+0x154): dangerous relocation: unsupported relocation
   aarch64-linux-ld: utimes.c:(.text+0x158): undefined reference to `__tracepoint_cros_vfs_utimes_exit'
   aarch64-linux-ld: utimes.c:(.text+0x174): undefined reference to `__traceiter_cros_vfs_utimes_exit'
   aarch64-linux-ld: fs/utimes.o: in function `trace_cros_vfs_utimes_enter':
   utimes.c:(.text+0x2b0): undefined reference to `__tracepoint_cros_vfs_utimes_enter'
   aarch64-linux-ld: fs/utimes.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `__tracepoint_cros_vfs_utimes_enter' which may bind externally can not be used when making a shared object; recompile with -fPIC
   utimes.c:(.text+0x2b0): dangerous relocation: unsupported relocation
   aarch64-linux-ld: utimes.c:(.text+0x2b4): undefined reference to `__tracepoint_cros_vfs_utimes_enter'
   aarch64-linux-ld: utimes.c:(.text+0x2d0): undefined reference to `__traceiter_cros_vfs_utimes_enter'
   aarch64-linux-ld: fs/utimes.o:(__jump_table+0x48): undefined reference to `__tracepoint_cros_vfs_utimes_exit'
   aarch64-linux-ld: fs/utimes.o:(__jump_table+0x58): undefined reference to `__tracepoint_cros_vfs_utimes_enter'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
