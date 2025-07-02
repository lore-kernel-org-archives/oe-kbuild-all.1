Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FE325A630
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Jul 2025 11:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751456754; cv=none; b=b68h8sSPKKhPh15SRrnUsfi+V7kwfD4UDhqQmM3CgW7h3Ec57t2PhpAV8lAtHg0QUPHPqauG9Lbsae4+hCqGJsUJHaZIbxmu34gbf93K1U/g6uKickVGuzHnd22VYOccUeyJdBkRoWk0ffueRsBZdL1xOZaAFAbbzYzrqIIxQVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751456754; c=relaxed/simple;
	bh=TSXt1HZ9pXT/CNG6NK45D5F4kkYeXsV4GgAAueEcJ4g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=klt3qhywGOR0opfKdvhTioKcmQ7CVex40gwy3aA7oVE1tcm8DOxyqvDE/+dHADS+ztPljnzerIOUzJvYXOgoUANg3istB6YULOT3/YfLKCP5echuuz2JY1GZb98TQni+slYcSEioY/jtniNRMMv7JYBj9NB4cmdwTI3YeFZPmi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ldPSLeSU; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ldPSLeSU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751456752; x=1782992752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TSXt1HZ9pXT/CNG6NK45D5F4kkYeXsV4GgAAueEcJ4g=;
  b=ldPSLeSU6yXIodf6n3LZT7TDOXRQuKuHdVyrivItop0aZ3EU2n0ZqoeK
   WmMoJK8VRIs2GM1L5r65xkCo20Z3BFw7QLWrpOolPEEPFSBiGrTXUre40
   A1L4jtVdspq4b/D2nGivxGwleOeR8v8rvZGk3JlsxfaCQ60V6714vmIwy
   LQmNgB43lTNikOUlmhs687IzQ4dXiDABrQjJrsiqzA81dWqkSdwBjJM7d
   e9koolBHOO0DVzZb9An8t7qq3hQuKJNyWow2WBYKAyNwXeT01/63jLDey
   x6LLx8tnBszXfr3UlMsVSscqhGIt6PEN1Bqn8Jq1+HWfp3yID7m9GfPkg
   A==;
X-CSE-ConnectionGUID: dzZDdBmiTV2rjb98XAb3Rg==
X-CSE-MsgGUID: SusaHCaIRRuPbAhofLDQwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="56367366"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="56367366"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 04:45:51 -0700
X-CSE-ConnectionGUID: F8o41N5iTE6ZOen51lLt8w==
X-CSE-MsgGUID: ZkwFT2HkQD2+7SE3DhzQFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="158314777"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by fmviesa005.fm.intel.com with ESMTP; 02 Jul 2025 04:45:50 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWvuO-0000HV-1e;
	Wed, 02 Jul 2025 11:45:48 +0000
Date: Wed, 2 Jul 2025 13:44:49 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2445/2445] include/linux/psp-hygon.h:219:5:
 warning: no previous prototype for 'psp_register_cmd_notifier'
Message-ID: <202507021332.zHwpOcwr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   bf2df406d75690971b837e37418494e09d8eec02
commit: 518c81d56c055affc71650b1ad1ba7f86e5ee867 [2445/2445] arch/x86/kvm: Support tkm virtualization
config: x86_64-buildonly-randconfig-2002-20250702 (https://download.01.org/0day-ci/archive/20250702/202507021332.zHwpOcwr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507021332.zHwpOcwr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507021332.zHwpOcwr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kvm/psp.c:15:
>> include/linux/psp-hygon.h:219:5: warning: no previous prototype for 'psp_register_cmd_notifier' [-Wmissing-prototypes]
     219 | int psp_register_cmd_notifier(uint32_t cmd_id, p2c_notifier_t notifier) { return -ENODEV; }
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/psp-hygon.h:220:5: warning: no previous prototype for 'psp_unregister_cmd_notifier' [-Wmissing-prototypes]
     220 | int psp_unregister_cmd_notifier(uint32_t cmd_id, p2c_notifier_t notifier) { return -ENODEV; }
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/psp.c:105:21: warning: no previous prototype for 'map_tbl_dump' [-Wmissing-prototypes]
     105 | void __maybe_unused map_tbl_dump(const char *title, struct addr_map_tbls *tbls)
         |                     ^~~~~~~~~~~~
   arch/x86/kvm/psp.c:118:21: warning: no previous prototype for 'g2h_tbl_dump' [-Wmissing-prototypes]
     118 | void __maybe_unused g2h_tbl_dump(const char *title, struct gpa2hva_tbls *tbls)
         |                     ^~~~~~~~~~~~


vim +/psp_register_cmd_notifier +219 include/linux/psp-hygon.h

d0b3a770d8e20d chench00 2024-08-01  218  
d0b3a770d8e20d chench00 2024-08-01 @219  int psp_register_cmd_notifier(uint32_t cmd_id, p2c_notifier_t notifier) { return -ENODEV; }
d0b3a770d8e20d chench00 2024-08-01 @220  int psp_unregister_cmd_notifier(uint32_t cmd_id, p2c_notifier_t notifier) { return -ENODEV; }
d0b3a770d8e20d chench00 2024-08-01  221  

:::::: The code at line 219 was first introduced by commit
:::::: d0b3a770d8e20d953fe2a74ea8c4b5f4767c4add crypto: command co-processor: Add another mailbox interrupt support for PSP sending command to X86

:::::: TO: chench00 <chench@hygon.cn>
:::::: CC: chench00 <chench@hygon.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
