Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B0439FD9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jan 2025 03:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737172280; cv=none; b=bwMIx8iVTMRTmtTqFtnzEcQpMZM5BcrtXrrofjPbYaKdqLvwpApnDrF8RBOic3kbmBRwRroSS0hHq1VfGwCQsXw1Ni21cts/WxgCuzlGlwacrY7dAwOm0zSj/jW4ItIfpJ7iUteu1UySiQfIniN8s6nQ4nw/+XYmVAMQctpDeNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737172280; c=relaxed/simple;
	bh=6wwAxtatMwfrT8ibD7qX8wqoZX69L1Oan72/A1jRKMU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bvpzn6UpXTinx2zEK6I/cnHgQ0wjiPV+bXvOGp2fKpSPE3z5amTXk4Hk5XLgwWXAdRldTQuqChecz/LNZhc7wTOgq5OmnqU54VS0khZyqjFhGThDOxjIeKnaC3/XM5m45m/p7iQXUrDTcVnbTiPGbcMJHEG4j2np82xlMB4matc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EcZ/Ero3; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EcZ/Ero3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737172279; x=1768708279;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6wwAxtatMwfrT8ibD7qX8wqoZX69L1Oan72/A1jRKMU=;
  b=EcZ/Ero34MEU/LfcL7iturQuwmDRxvngXbAoQuQndDIidL4+PJSn+HiM
   TBw3571ScI8Xxh63F8w+NQcRWuhuvmWauu9TXe5Rno/gFvY8Gr0I+CuFX
   6k7HF13Y7G35oT0HOfr6RmsQu9x11LOEWOl6l+ohW7weU8zVjXd8deIIq
   ys5LzPC+cGG2s9SYpVF8doueF1qEHVYjs8L/NAEtNu6VLJmdHxD05Hj0l
   UQoSrsywInEd8M6BEnkSzXfX1NLskgS+EC4rZxvXwp4gELcPBliXRKCgf
   T1BHa6RHsdcROObx4GdHBU3rtKC99IYe4iTgqPdWG1Hkw7SOMd1XrhFw8
   w==;
X-CSE-ConnectionGUID: vl2FT4CyS6m+/OB8iaaJ/g==
X-CSE-MsgGUID: w41cBs5SQFWB+JwuK4DLbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37770581"
X-IronPort-AV: E=Sophos;i="6.13,214,1732608000"; 
   d="scan'208";a="37770581"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 19:51:17 -0800
X-CSE-ConnectionGUID: FV18xZ7sR4eafweQACBYWQ==
X-CSE-MsgGUID: bvSCt0w+ToKGjFq3Z2yeRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,214,1732608000"; 
   d="scan'208";a="110972799"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Jan 2025 19:51:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYzre-000U43-0M;
	Sat, 18 Jan 2025 03:51:14 +0000
Date: Sat, 18 Jan 2025 11:50:46 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:sframe 34/38] target_core_fabric_configfs.c:(.text+0xfb4):
 multiple definition of `unwind_deferred_cancel';
 drivers/target/target_core_configfs.o:target_core_configfs.c:(.text+0x39e0):
 first defined here
Message-ID: <202501181143.HV2nEZTq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git sframe
head:   948ab489fae86f8e78722ba0668e9f100b5eb313
commit: d9da8a8d507bc447b93d9783e6335e16abdad3f2 [34/38] perf: Support deferred user callchains
config: csky-randconfig-002-20250118 (https://download.01.org/0day-ci/archive/20250118/202501181143.HV2nEZTq-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501181143.HV2nEZTq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501181143.HV2nEZTq-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: drivers/target/target_core_fabric_configfs.o: in function `unwind_deferred_cancel':
>> target_core_fabric_configfs.c:(.text+0xfb4): multiple definition of `unwind_deferred_cancel'; drivers/target/target_core_configfs.o:target_core_configfs.c:(.text+0x39e0): first defined here
   csky-linux-ld: drivers/target/target_core_transport.o: in function `unwind_deferred_cancel':
   target_core_transport.c:(.text+0x34f8): multiple definition of `unwind_deferred_cancel'; drivers/target/target_core_configfs.o:target_core_configfs.c:(.text+0x39e0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
