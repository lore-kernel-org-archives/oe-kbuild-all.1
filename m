Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD85737A4B7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 11:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768477264; cv=none; b=eAs6VbcmThyyL0x54xugbIOkjASIfNrcc2wB9lOBb2VdHbMXhPTtf6ik9f2pAzykbox7nR9lMndPEdcTrzOespB5tvzbDMw3UIGGqFmyHFLDMf9Z6xQ2pgTHc2N8xoPAcK8URD+9ww8RaIRazQVkOW9eZqd8aC9rogm+YgjDy+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768477264; c=relaxed/simple;
	bh=svQh6bKc4zZrgy3mp6jGCEa7mNFHbl7b30Tv11Ucrns=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dNWCa80144+MKHoMk/aY4IRaCMn+wfTznimd252XBFk3OLWmF48Nx+fWjhiS528tT0w2I3cDBo3ijZu3fYjQfs5tGaSin/qlccqcs0BPNBks3GEI82CZsnNwm3ML4JQJX3o/DLg4PUp+cYCeJ6mpL606FUE+DDjr/NVlSBGmWqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IHrVzcEb; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IHrVzcEb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768477263; x=1800013263;
  h=date:from:to:cc:subject:message-id;
  bh=svQh6bKc4zZrgy3mp6jGCEa7mNFHbl7b30Tv11Ucrns=;
  b=IHrVzcEb7rs7gwHJiDysrrHuF8/AXlA6L4BTV5bsH1PBoiC2Rcmzam1t
   yZHnRSAv/MWijfddNoww9Vcx+tt9kfBdqXbwwRlS1s7o8YaWTkznxbd1/
   bCPRJeAIZTHPHpQAkkJQzNwUSSQrjHrPw2uH7nUQZWLBMW1wEhk3/Djjl
   Z2tgr/3pD81EAAJmBbRSdBcFdgsB3DRMROgkK3SfoaYYKS1KnmHaD+8Kd
   QNXQgPlfPbjBotKmCILUNgT22sCnQL5gr/RktV+tjsAVQV/V9e7PwWgNR
   Mzcsx4LBZpSGAHO1Z1f1KJ5GHGfpBtX/gZebKYEBpWHQpkPnkXDkuvu3K
   w==;
X-CSE-ConnectionGUID: KZiVLQCkT/K9GcfrpH+5vQ==
X-CSE-MsgGUID: jbePJs03TJm7CLh+B0Xzhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69947130"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="69947130"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 03:41:03 -0800
X-CSE-ConnectionGUID: n5wPtsBhShmawBokvqQUMA==
X-CSE-MsgGUID: DBnjYogzS3Ot77s282N+Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="204812915"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 15 Jan 2026 03:41:00 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgLik-00000000Hu0-2uj2;
	Thu, 15 Jan 2026 11:40:58 +0000
Date: Thu, 15 Jan 2026 19:40:12 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 33/33]
 arch/x86/kernel/cpu/bugs.c:1379:20: warning: this statement may fall through
Message-ID: <202601151910.FPutxmgQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   ff3fd7c43fb0c95eb699767b7b4052b0250c87ce
commit: ff3fd7c43fb0c95eb699767b7b4052b0250c87ce [33/33] anolis: cpu vulnerabilities: support hardware-based mitigation for Retbleed and SRSO via Hygon IBRS to avoid performance degradation caused by software-based mitigation.
config: x86_64-anolis-intel-cloud-devel-5.10 (https://download.01.org/0day-ci/archive/20260115/202601151910.FPutxmgQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601151910.FPutxmgQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601151910.FPutxmgQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/cpu/bugs.c: In function 'spectre_v2_determine_rsb_fill_type_at_vmexit':
>> arch/x86/kernel/cpu/bugs.c:1379:20: warning: this statement may fall through [-Wimplicit-fallthrough=]
    1379 |                 if (boot_cpu_data.x86_vendor == X86_VENDOR_HYGON)
         |                    ^
   arch/x86/kernel/cpu/bugs.c:1381:9: note: here
    1381 |         case SPECTRE_V2_RETPOLINE:
         |         ^~~~


vim +1379 arch/x86/kernel/cpu/bugs.c

  1342	
  1343	static void __init spectre_v2_determine_rsb_fill_type_at_vmexit(enum spectre_v2_mitigation mode)
  1344	{
  1345		/*
  1346		 * Similar to context switches, there are two types of RSB attacks
  1347		 * after VM exit:
  1348		 *
  1349		 * 1) RSB underflow
  1350		 *
  1351		 * 2) Poisoned RSB entry
  1352		 *
  1353		 * When retpoline is enabled, both are mitigated by filling/clearing
  1354		 * the RSB.
  1355		 *
  1356		 * When IBRS is enabled, while #1 would be mitigated by the IBRS branch
  1357		 * prediction isolation protections, RSB still needs to be cleared
  1358		 * because of #2.  Note that SMEP provides no protection here, unlike
  1359		 * user-space-poisoned RSB entries.
  1360		 *
  1361		 * eIBRS should protect against RSB poisoning, but if the EIBRS_PBRSB
  1362		 * bug is present then a LITE version of RSB protection is required,
  1363		 * just a single call needs to retire before a RET is executed.
  1364		 */
  1365		switch (mode) {
  1366		case SPECTRE_V2_NONE:
  1367			return;
  1368	
  1369		case SPECTRE_V2_EIBRS_LFENCE:
  1370		case SPECTRE_V2_EIBRS:
  1371			if (boot_cpu_has_bug(X86_BUG_EIBRS_PBRSB)) {
  1372				setup_force_cpu_cap(X86_FEATURE_RSB_VMEXIT_LITE);
  1373				pr_info("Spectre v2 / PBRSB-eIBRS: Retire a single CALL on VMEXIT\n");
  1374			}
  1375			return;
  1376	
  1377		case SPECTRE_V2_EIBRS_RETPOLINE:
  1378			/* Hygon Enhanced IBRS flushes RAS upon privilege level changes from low to high. */
> 1379			if (boot_cpu_data.x86_vendor == X86_VENDOR_HYGON)
  1380				return;
  1381		case SPECTRE_V2_RETPOLINE:
  1382		case SPECTRE_V2_LFENCE:
  1383		case SPECTRE_V2_IBRS:
  1384			setup_force_cpu_cap(X86_FEATURE_RSB_VMEXIT);
  1385			pr_info("Spectre v2 / SpectreRSB : Filling RSB on VMEXIT\n");
  1386			return;
  1387		}
  1388	
  1389		pr_warn_once("Unknown Spectre v2 mode, disabling RSB mitigation at VM exit");
  1390		dump_stack();
  1391	}
  1392	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
