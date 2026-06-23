Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B573FBA7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jun 2026 02:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782182348; cv=none; b=a5iaYwqgEVY9kbSlYZt0fITGOPDVJU5fuI/TRXo4DQdujTE9YoujvzPXGk86s1+6nvhZBBvDuEng2bR2u81Or41hxbPmRDqBe+NcCpiIcTcdENaQepcf0o3pKnU+m0KhrvO/X9WMhG2erl11B3pEnZw5o6f5sGmpBoYkTtgIphk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782182348; c=relaxed/simple;
	bh=xQanJexZJTQYhhDbbMOFLWcb/FG9cgcsIjLQnEXobd4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=COK+q/awsIaILs3eg9K1dtXy3ka6Q942r/xdy9L9+hI2mIcWg3g5be+vtvcervsCTyUXx4o94FrUMU76eK0vsNtGMc74TAX8Oih3dQZmxQX3dlBUSZxRApE11GnbSPE3R86ofQdh16YG9lLslMVQoffPJNDNDydOLv1zUF+eh3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BIyF2ppF; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BIyF2ppF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782182346; x=1813718346;
  h=date:from:to:cc:subject:message-id;
  bh=xQanJexZJTQYhhDbbMOFLWcb/FG9cgcsIjLQnEXobd4=;
  b=BIyF2ppF2sJJQMdNvU+Pd6XzRXv4YOslMt6MetPp2gPmGqM6BkcEQnck
   nOU/+ZbP35bFyiRzNF4qPsBBNDEk92751nhHfrOCZ2GUUshvJOFHcS65P
   cTecDtjYka2l7ekEcbgeA08j06XX5JI9veT3JyVEsWk5SvqOum/ini+WQ
   QUdSOFOpBxLT+hihqZ8b34bX8Xeg5u4lvTwQuypzp2PV6qzUADZHlKA2K
   CR3Q+QsfXBGlj30m4lr6pKMFv4XKabdRRJQPSPDMtMfBj8Mp+2OG/BlIc
   lXTeKZ6q9iUTjlT0W3UD3HdYcvxXPMcAUwZak/e4LNMRH1oqR131UcAnl
   Q==;
X-CSE-ConnectionGUID: dtzwiJiYQ6e2hMwsACvLRA==
X-CSE-MsgGUID: E9PoVXU0RGmqf1NJmdrh+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="100345540"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="100345540"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 19:39:06 -0700
X-CSE-ConnectionGUID: 2Sb4ROo2QVGexJwJUlJZtw==
X-CSE-MsgGUID: J69djjhlQM2UEB09navFwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="243028457"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 22 Jun 2026 19:39:04 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbr2U-000000002BJ-178y;
	Tue, 23 Jun 2026 02:39:02 +0000
Date: Tue, 23 Jun 2026 10:38:22 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:configfs-ns.v6 26/26] dir.c:(.text+0x1b90):
 dangerous relocation: unsupported relocation
Message-ID: <202606231015.YXQj7m42-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git configfs-ns.v6
head:   22642e5d1c63efa6b484188105d45886f637d2be
commit: 22642e5d1c63efa6b484188105d45886f637d2be [26/26] Switch to net namespaces
config: arm64-randconfig-004-20260623 (https://download.01.org/0day-ci/archive/20260623/202606231015.YXQj7m42-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606231015.YXQj7m42-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606231015.YXQj7m42-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-ld: Unexpected GOT/PLT entries detected!
>> aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: aarch64-linux-ld: DWARF error: could not find abbrev number 1976829
   fs/configfs/dir.o: in function `configfs_unregister_subsystem':
   dir.c:(.text+0x1b90): undefined reference to `init_net'
   aarch64-linux-ld: fs/configfs/dir.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `init_net' which may bind externally can not be used when making a shared object; recompile with -fPIC
>> dir.c:(.text+0x1b90): dangerous relocation: unsupported relocation
   aarch64-linux-ld: dir.c:(.text+0x1b94): undefined reference to `init_net'
   aarch64-linux-ld: fs/configfs/dir.o: in function `configfs_register_subsystem':
   dir.c:(.text+0x2c90): undefined reference to `init_net'
   aarch64-linux-ld: fs/configfs/dir.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `init_net' which may bind externally can not be used when making a shared object; recompile with -fPIC
   dir.c:(.text+0x2c90): dangerous relocation: unsupported relocation
   aarch64-linux-ld: dir.c:(.text+0x2c94): undefined reference to `init_net'
   aarch64-linux-ld: fs/configfs/dir.o: in function `configfs_link_subsystems':
   dir.c:(.text+0x340c): undefined reference to `init_net'
   aarch64-linux-ld: fs/configfs/dir.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `init_net' which may bind externally can not be used when making a shared object; recompile with -fPIC
   dir.c:(.text+0x340c): dangerous relocation: unsupported relocation
   aarch64-linux-ld: fs/configfs/dir.o:dir.c:(.text+0x3410): more undefined references to `init_net' follow
   aarch64-linux-ld: fs/configfs/mount.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `init_net' which may bind externally can not be used when making a shared object; recompile with -fPIC
   aarch64-linux-ld: DWARF error: could not find abbrev number 59
   fs/configfs/mount.o: in function `configfs_fs_context_free':
>> mount.c:(.text+0x44): dangerous relocation: unsupported relocation
   aarch64-linux-ld: fs/configfs/mount.o: in function `configfs_init_fs_context':
>> mount.c:(.text+0xd8): undefined reference to `get_net_ns_by_pid'
   aarch64-linux-ld: fs/configfs/mount.o: in function `configfs_fill_super':
   mount.c:(.text+0x110): undefined reference to `init_net'
   aarch64-linux-ld: fs/configfs/mount.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `init_net' which may bind externally can not be used when making a shared object; recompile with -fPIC
   mount.c:(.text+0x110): dangerous relocation: unsupported relocation
>> aarch64-linux-ld: mount.c:(.text+0x118): undefined reference to `init_net'
   aarch64-linux-ld: fs/configfs/mount.o: in function `configfs_get_super_info':
   mount.c:(.text+0x358): undefined reference to `init_net'
   aarch64-linux-ld: fs/configfs/mount.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `init_net' which may bind externally can not be used when making a shared object; recompile with -fPIC
   mount.c:(.text+0x358): dangerous relocation: unsupported relocation
   aarch64-linux-ld: mount.c:(.text+0x35c): undefined reference to `init_net'
   aarch64-linux-ld: fs/configfs/mount.o: in function `configfs_put_super_info':
   mount.c:(.text+0x5d0): undefined reference to `init_net'
   aarch64-linux-ld: fs/configfs/mount.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `init_net' which may bind externally can not be used when making a shared object; recompile with -fPIC
   mount.c:(.text+0x5d0): dangerous relocation: unsupported relocation
   aarch64-linux-ld: fs/configfs/mount.o:mount.c:(.text+0x5d4): more undefined references to `init_net' follow
   aarch64-linux-ld: fs/configfs/mount.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `init_net' which may bind externally can not be used when making a shared object; recompile with -fPIC
   fs/configfs/mount.o: in function `configfs_kill_sb':
   mount.c:(.text+0x6d4): dangerous relocation: unsupported relocation
   aarch64-linux-ld: fs/configfs/mount.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `init_net' which may bind externally can not be used when making a shared object; recompile with -fPIC
   fs/configfs/mount.o: in function `configfs_release_fs':
   mount.c:(.text+0x894): dangerous relocation: unsupported relocation
   aarch64-linux-ld: fs/configfs/mount.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `init_net' which may bind externally can not be used when making a shared object; recompile with -fPIC
   fs/configfs/mount.o: in function `configfs_init':
>> mount.c:(.init.text+0x8c): dangerous relocation: unsupported relocation

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
