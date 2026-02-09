Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2960238A9A3
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Feb 2026 18:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770661736; cv=none; b=WjweiO6+8aGnFOKA1IvdCj7MmWM1LfX2ys129oktDebQEhUJhTjXg4dLzcSwBX7y/1qvVbSEWcmQ3LT1Q45yuLsw8xWfPxLcXBP/mQaNi/Miejg/sB5WWNiWeWFyaR8x0n10vgRJ6Hgj7ocXqPFMPbzgZwnyou2qYCqGcotln0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770661736; c=relaxed/simple;
	bh=6KsoQGANZ0NeP5ApPoxaxhIqFZBlc/Eg1Q9ETRm6n8E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fz1tegmi/2FqlF2jO4+E0H7AhfmILXob3bCMUGHhuW4AgSbhVsprOaWMp5iTTukfD89xPBUiua5muYlCn4Lp4AI8XPXspfdmdTfW0Z/mxiMO78qC9C71GDGgwt+qwMIaMTeeuBti+giVQvkUyiQ5GFbxB4e09ySuPawjnbq0KUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JlhvmzPD; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JlhvmzPD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770661735; x=1802197735;
  h=date:from:to:cc:subject:message-id;
  bh=6KsoQGANZ0NeP5ApPoxaxhIqFZBlc/Eg1Q9ETRm6n8E=;
  b=JlhvmzPDLi8ZX2nkAJSAr87KeOp8m5Dql5htAeVbHM/drROzs9IakU6L
   45ELULEDFjUQjcvCrocHPb7W7o9y/y6LKVlmDkKRpZ5UPcKQJ+48sHJpa
   IdMCeHGKZkv5MoQU0Riyo3ZLSTrysWqGGQOienf6/yu2xS/9o8+fxKwrf
   IQI/wisZpncmV1zER/O3rbV+UeCcs+OMY6kUxXwtSfV1VdN0MywoxxPNI
   4Cye7zEQ8ugGs3ChmljkO39V8acSZapvodyRy7HKznwGU+QNtm3gf9xx0
   sf30lelekw7q9wgryRfM+a01UxPT6CbmuBwyL9upv81m7f7HNkTd+C1uu
   w==;
X-CSE-ConnectionGUID: TngUPIhrRseBUnTyBd9ICQ==
X-CSE-MsgGUID: t0urT4k4Si6vdyEb86MZrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71765189"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="71765189"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 10:28:55 -0800
X-CSE-ConnectionGUID: 6+56yRlcQ5ewNivWsiwV9g==
X-CSE-MsgGUID: mt3EGJGoT6qkuXhfBDCbqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="211670910"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Feb 2026 10:28:54 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpW0B-00000000oEK-0TlL;
	Mon, 09 Feb 2026 18:28:51 +0000
Date: Tue, 10 Feb 2026 02:28:43 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-slaunch 38/41]
 drivers/firmware/efi/libstub/efistub.h:1243:39: warning: 'struct boot_params'
 declared inside parameter list will not be visible outside of this definition
 or declaration
Message-ID: <202602100240.KnnZznEg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-slaunch
head:   68d6a808368b02c2fdfa0ba1e4e59d6b97668c1a
commit: a64c42672d622dc2867904b9857ef64a890610bd [38/41] x86/efistub: EFI stub DRTM launch support for Secure Launch
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20260210/202602100240.KnnZznEg-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602100240.KnnZznEg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602100240.KnnZznEg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/firmware/efi/libstub/alignedmem.c:6:
>> drivers/firmware/efi/libstub/efistub.h:1243:39: warning: 'struct boot_params' declared inside parameter list will not be visible outside of this definition or declaration
    1243 |                                struct boot_params *boot_params,
         |                                       ^~~~~~~~~~~
   drivers/firmware/efi/libstub/efistub.h:1264:47: warning: 'struct boot_params' declared inside parameter list will not be visible outside of this definition or declaration
    1264 | efi_status_t efi_secure_launch_prepare(struct boot_params *boot_params,
         |                                               ^~~~~~~~~~~


vim +1243 drivers/firmware/efi/libstub/efistub.h

  1239	
  1240	struct grub_slaunch_protocol {
  1241		efi_status_t
  1242		(__efiapi *set_image)(struct grub_slaunch_protocol *this,
> 1243				       struct boot_params *boot_params,
  1244				       u64 base, u32 header_offset);
  1245	
  1246		efi_status_t
  1247		(__efiapi *launch)(struct grub_slaunch_protocol *this);
  1248	};
  1249	typedef struct grub_slaunch_protocol grub_slaunch_protocol_t;
  1250	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
