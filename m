Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C1E2E3708
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Jul 2025 10:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753958197; cv=none; b=uj4q61JmbhToFpQ7UCgpLXRG0H87q8Db0OUYPgMeuQ+h7V6aqeFi/BEjGf34bP8L1FxcZ2Ig/TUich2e0jWp6MiLUfunVS+sDUK4HHIEdGgFYQrVAzCAk1MZs37iNpSkWp6IPWnef2p7GjaZXFrT1c/EgMJU9rV2gN2GqQUsKM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753958197; c=relaxed/simple;
	bh=fS6bg5jnorZzIJW5yaxEl657Y5TUvapdlxfzsW/F8O8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YYFfmEjMQP3G6hz2xVO0Hl21M3nCjNoDMjavH04KEdQFXhw+UJ3sVm0sKsjPn92kd3BgyJyN8d1EPIibvPQeaV4/D6d0QRpkx1Ho96kVXZ7Qc3qjrHiJV0dfk1EOmypXFfVgcIl979KEGoE/fRVmUGqYYcahGFh2IDL65yo6H10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h3TsOyi4; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h3TsOyi4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753958196; x=1785494196;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fS6bg5jnorZzIJW5yaxEl657Y5TUvapdlxfzsW/F8O8=;
  b=h3TsOyi4ANTKZaFlQ/teLnjicf5e4qpvxJ2x6913/Xtf2jC4Vw25mFzh
   PAy5nzldaBLSXd9giurfrNwdFhBPBXKIW5GjnQ1j9rovRO8DREotrAXS2
   r0YQySTczwhwvp9eT170fDIWUubQVLDN0F9o9CRoGygkvesDTxRHNQiuB
   dF7joofaa7MN6aA0/4/M5iC20HmMMBqWixesJbRhj35ssQcyxePfwuK4r
   R80FuvkF7+EH4bmrxO7Hnat4wXTegeVMon2n9d9l4n8imzKti/klaHhGF
   E8pj5iygnjai2efNBfi+W3VXVCMN0wHfleRFstzRxfVxy/E/av8dw0zlv
   Q==;
X-CSE-ConnectionGUID: cQ+yB7SLRxaMrAhZ6R1UZw==
X-CSE-MsgGUID: O14r5ggRS826b5XUY6812w==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="56240948"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; 
   d="scan'208";a="56240948"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 03:36:35 -0700
X-CSE-ConnectionGUID: cDyAx7pDSl2P8LrmSZnNnA==
X-CSE-MsgGUID: R1cKWP4lR4GRpuzpiQS0CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; 
   d="scan'208";a="167410135"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 31 Jul 2025 03:36:34 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhQeF-0003fy-29;
	Thu, 31 Jul 2025 10:36:31 +0000
Date: Thu, 31 Jul 2025 18:36:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 13/13] aarch64-linux-ld:
 include/trace/events/cros_file.h:158: undefined reference to
 `__traceiter_cros_path_mount_exit'
Message-ID: <202507311803.ZdNuQett-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   b833def6ebe23a65a17ddb60a98c29fa95d01bd5
commit: ff1454b93848f1b4ef9116758244b71eb5ebe1a5 [13/13] CHROMIUM: iwl7000: mld: avoid outdated reorder buffer head_sn
config: arm64-randconfig-001-20250731 (https://download.01.org/0day-ci/archive/20250731/202507311803.ZdNuQett-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250731/202507311803.ZdNuQett-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507311803.ZdNuQett-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: ID map text too big or misaligned
   aarch64-linux-ld: fs/open.o: in function `filp_close':
   include/trace/events/cros_file.h:17: undefined reference to `__traceiter_cros_filp_close_exit'
   aarch64-linux-ld: fs/open.o: in function `chmod_common':
   include/trace/events/cros_file.h:227: undefined reference to `__traceiter_cros_chmod_common_enter'
   aarch64-linux-ld: include/trace/events/cros_file.h:268: undefined reference to `__traceiter_cros_chmod_common_exit'
   aarch64-linux-ld: fs/open.o: in function `chown_common':
   include/trace/events/cros_file.h:307: undefined reference to `__traceiter_cros_chown_common_enter'
   aarch64-linux-ld: include/trace/events/cros_file.h:349: undefined reference to `__traceiter_cros_chown_common_exit'
   aarch64-linux-ld: fs/open.o:(__jump_table+0x8): undefined reference to `__tracepoint_cros_filp_close_exit'
   aarch64-linux-ld: fs/open.o:(__jump_table+0x28): undefined reference to `__tracepoint_cros_chmod_common_enter'
   aarch64-linux-ld: fs/open.o:(__jump_table+0x38): undefined reference to `__tracepoint_cros_chmod_common_exit'
   aarch64-linux-ld: fs/open.o:(__jump_table+0x48): undefined reference to `__tracepoint_cros_chown_common_enter'
   aarch64-linux-ld: fs/open.o:(__jump_table+0x58): undefined reference to `__tracepoint_cros_chown_common_exit'
   aarch64-linux-ld: fs/namei.o: in function `vfs_rename':
   include/trace/events/cros_file.h:68: undefined reference to `__traceiter_cros_vfs_rename_exit'
   aarch64-linux-ld: include/trace/events/cros_file.h:68: undefined reference to `__traceiter_cros_vfs_rename_exit'
   aarch64-linux-ld: include/trace/events/cros_file.h:68: undefined reference to `__traceiter_cros_vfs_rename_exit'
   aarch64-linux-ld: include/trace/events/cros_file.h:68: undefined reference to `__traceiter_cros_vfs_rename_exit'
   aarch64-linux-ld: fs/namei.o:(__jump_table+0x188): undefined reference to `__tracepoint_cros_vfs_rename_exit'
   aarch64-linux-ld: fs/namei.o:(__jump_table+0x198): undefined reference to `__tracepoint_cros_vfs_rename_exit'
   aarch64-linux-ld: fs/namei.o:(__jump_table+0x1a8): undefined reference to `__tracepoint_cros_vfs_rename_exit'
   aarch64-linux-ld: fs/namei.o:(__jump_table+0x1b8): undefined reference to `__tracepoint_cros_vfs_rename_exit'
   aarch64-linux-ld: fs/namespace.o: in function `trace_cros_path_mount_exit':
   include/trace/events/cros_file.h:158: undefined reference to `__traceiter_cros_path_mount_exit'
   aarch64-linux-ld: fs/namespace.o: in function `path_umount':
   include/trace/events/cros_file.h:185: undefined reference to `__traceiter_cros_path_umount_entry'
   aarch64-linux-ld: include/trace/events/cros_file.h:206: undefined reference to `__traceiter_cros_path_umount_exit'
   aarch64-linux-ld: fs/namespace.o: in function `path_mount':
   include/trace/events/cros_file.h:158: undefined reference to `__traceiter_cros_path_mount_exit'
>> aarch64-linux-ld: include/trace/events/cros_file.h:158: undefined reference to `__traceiter_cros_path_mount_exit'
   aarch64-linux-ld: fs/namespace.o:(__jump_table+0x8): undefined reference to `__tracepoint_cros_path_mount_exit'
   aarch64-linux-ld: fs/namespace.o:(__jump_table+0x78): undefined reference to `__tracepoint_cros_path_umount_entry'
   aarch64-linux-ld: fs/namespace.o:(__jump_table+0x88): undefined reference to `__tracepoint_cros_path_umount_exit'
   aarch64-linux-ld: fs/namespace.o:(__jump_table+0x98): undefined reference to `__tracepoint_cros_path_mount_exit'
   aarch64-linux-ld: fs/namespace.o:(__jump_table+0xa8): undefined reference to `__tracepoint_cros_path_mount_exit'
   aarch64-linux-ld: fs/utimes.o: in function `vfs_utimes':
   include/trace/events/cros_file.h:391: undefined reference to `__traceiter_cros_vfs_utimes_enter'
   aarch64-linux-ld: include/trace/events/cros_file.h:439: undefined reference to `__traceiter_cros_vfs_utimes_exit'
   aarch64-linux-ld: include/trace/events/cros_file.h:439: undefined reference to `__traceiter_cros_vfs_utimes_exit'
   aarch64-linux-ld: fs/utimes.o:(__jump_table+0x8): undefined reference to `__tracepoint_cros_vfs_utimes_enter'
   aarch64-linux-ld: fs/utimes.o:(__jump_table+0x18): undefined reference to `__tracepoint_cros_vfs_utimes_exit'
   aarch64-linux-ld: fs/utimes.o:(__jump_table+0x28): undefined reference to `__tracepoint_cros_vfs_utimes_exit'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
