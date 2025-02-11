Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0288820B7E1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 12:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739277489; cv=none; b=cPEg1PkkJz4Kl0DMYrjMEXPXkw7DHeu98D7afmOf3DrhaqLEoe8lRH7faq9pJDMJf105jC6+CBvfXQaB4P4AuHyGXzeR163/FRIFWbpqG9Kf96Bn/SY8WnQPJUQ3gS3JTG0oRm62ZiTgaymdttdQDSW9HaI9TH4Yhyyo/OJsfCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739277489; c=relaxed/simple;
	bh=/1CNJSSJiW3wqD5Z4P9u2rLtyM7O3zTAK0XrMEZaUII=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QN3YeVdolB1Qd/h+Ekat6axTBbAEr395ZJ+fRDKBOf2j3D4jP14xBUzRkHfJeJ/UyMwWbEcsrwpRr1bz2061RITLp9BOM7Wxasgij1iR8NU/yTWfRefptTg/pKlg5ozP2x/JytU16mSLg+YziMWoSzuhRomm8NIOu53P36Ia/Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GwYh2HcK; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GwYh2HcK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739277488; x=1770813488;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/1CNJSSJiW3wqD5Z4P9u2rLtyM7O3zTAK0XrMEZaUII=;
  b=GwYh2HcKXCbqn9Y/t9EHJpncgw71Y5MCN2V8TtfpFuVj9qHYFuGebpMI
   f/01hjpUgxtEI6zJZFnJERiLsTSWvnvsiRaOyZzC6IjnN6aV3w8m8bgIp
   6T6kw8Cj6BNtf1SQcRLx4I8Dr6eBjPrg3HcMb3oU3G5acksq61ql/w1eC
   CVEDSnglLOjsYEZ/zC+7ENRkvFqCXVtEFjhn+xQR7pBmnjyKcMS35paGZ
   a+QvUUDkXJvfwbvp895uP8Ei2Gt+OkiN/PwBD+ZaYsq5UR16v6BnMTmOa
   XQBppPRuNEKf9c+/yGeGTo+vuOABq+wVl6UUuY4x1KNmXMV5TR56Or3HX
   A==;
X-CSE-ConnectionGUID: T7we6l3jRgObpNs5LPOdUg==
X-CSE-MsgGUID: Zz2L+zoTQIqV2pUerd5gtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="40161961"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="40161961"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 04:38:07 -0800
X-CSE-ConnectionGUID: XBT7GEe5RPOUayULh6GusA==
X-CSE-MsgGUID: 8EhHBgtqTryz5KHYCTPHcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="117524701"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Feb 2025 04:38:06 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thpWd-00149x-2J;
	Tue, 11 Feb 2025 12:38:03 +0000
Date: Tue, 11 Feb 2025 20:37:10 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1917/1917] arch/x86/kvm/svm/sev.c:2200:24: error:
 'struct hygon_kvm_hooks_table' has no member named 'false'
Message-ID: <202502112055.WZcBiFz3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi fangbaoshun,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   002103c03aba84e0990a605bc463dcd80bff4235
commit: 1c3b1095a26ed8bc1aa7ac3d4e8dd3e65964a74b [1917/1917] KVM: SVM: Add KVM_CSV_COMMAND_BATCH command for applying CSV RING_BUFFER mode
config: x86_64-randconfig-121-20250211 (https://download.01.org/0day-ci/archive/20250211/202502112055.WZcBiFz3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502112055.WZcBiFz3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502112055.WZcBiFz3-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/svm/sev.c:2198:6: warning: no previous prototype for 'sev_install_hooks' [-Wmissing-prototypes]
    2198 | void sev_install_hooks(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c: In function 'sev_install_hooks':
>> arch/x86/kvm/svm/sev.c:2200:24: error: 'struct hygon_kvm_hooks_table' has no member named 'false'
    2200 |         hygon_kvm_hooks.sev_enabled = &sev_enabled;
         |                        ^
   arch/x86/kvm/svm/sev.c:2200:39: error: lvalue required as unary '&' operand
    2200 |         hygon_kvm_hooks.sev_enabled = &sev_enabled;
         |                                       ^


vim +2200 arch/x86/kvm/svm/sev.c

  2195	
  2196	#ifdef CONFIG_HYGON_CSV
  2197	/* Code to set all of the function and vaiable pointers */
  2198	void sev_install_hooks(void)
  2199	{
> 2200		hygon_kvm_hooks.sev_enabled = &sev_enabled;
  2201		hygon_kvm_hooks.sev_issue_cmd = sev_issue_cmd;
  2202		hygon_kvm_hooks.get_num_contig_pages = get_num_contig_pages;
  2203		hygon_kvm_hooks.sev_pin_memory = sev_pin_memory;
  2204		hygon_kvm_hooks.sev_unpin_memory = sev_unpin_memory;
  2205	
  2206		hygon_kvm_hooks.sev_hooks_installed = true;
  2207	}
  2208	#endif
  2209	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
