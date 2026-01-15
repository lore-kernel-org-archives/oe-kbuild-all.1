Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70E731A7E4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 21:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768514300; cv=none; b=rHtrvVIUUyP574EFVs9BtyfTJ/tEs4juKYRR4brzOn63TJZ5rXo0NAzCFsWQnBA4buo7ozfUPYvV9xwxlHCymykk1yyTbeV7KxVE9KXVqK/MTY3acRHAnUcsyJpg5GCnZi2oHAiBs9hlsAcEWQXpsNa+anGm8dofORVzF9crAjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768514300; c=relaxed/simple;
	bh=N0iJqCRrZNA2XmdnpiQTX7EWBjuye1aik9LrWP2l7EA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pTxVh16pVaIojNEUINFTGP+vrtAa4FaewLCGnTwToZu3KG/d1Gz/wvmkthrJHJ5xFBDAW7p4laYMD9yKg9TnAo1KEZVqhdF7HFwGwpO+xM8TCabQXTcLAAWwrSkGt41wMHj1isxHfivZHhdbVoMv8/M+UQbO0p1vGSwUxSAKZYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gzCO5SP/; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gzCO5SP/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768514299; x=1800050299;
  h=date:from:to:cc:subject:message-id;
  bh=N0iJqCRrZNA2XmdnpiQTX7EWBjuye1aik9LrWP2l7EA=;
  b=gzCO5SP//hIKWll114qQ31mRezZEmpW1iTaVeRP2PbYtbaOochwbmkUP
   +elnL7TypGt0YBgqaEww1Xe+uQCk1cax6ifcVHMJ+zC1NteiTSrCRgYgG
   GxKnTdl2vkfcLpw/tNfVCLrmsWGfwX5NwFEKSqL8j0Y55mHRf37R3RaQa
   7L7zem8yvyougJ0Ub7uYnZLybCV6a+ktNp6PbOBQ8qLuYL0mZuKxoKCCg
   fVaPZAEadti//mdf+0SHbXMRBdyYdS0ehVR8uUyrAdfxYoUSlYZ+prASG
   1I7RefSSTSxS0W4Hfn8LPk2FzRKR1iMX2sWSMTG/Z5lux2doSLOcxFln7
   w==;
X-CSE-ConnectionGUID: 3uiy2RIESfyhOANaN7avOg==
X-CSE-MsgGUID: PpV8QUBvTx2DuWQP8IdFgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69735547"
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="69735547"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 13:58:18 -0800
X-CSE-ConnectionGUID: P/wy52hRRE+inTI3X2y68A==
X-CSE-MsgGUID: RtdzPXLsSKOVcIN52GIZjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="209930202"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 Jan 2026 13:58:17 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgVM7-00000000K2O-0Vbg;
	Thu, 15 Jan 2026 21:58:15 +0000
Date: Fri, 16 Jan 2026 05:57:26 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:simplify-kallsyms-v2 1/1] Unsupported relocation type:
 unknown type rel type name (248)
Message-ID: <202601160541.s9UkIfFQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git simplify-kallsyms-v2
head:   dc85254e22c3ca4db6f29584d365376dbb72b944
commit: dc85254e22c3ca4db6f29584d365376dbb72b944 [1/1] kallsyms: Get rid of kallsyms relative base
config: mips-randconfig-r062-20260116 (https://download.01.org/0day-ci/archive/20260116/202601160541.s9UkIfFQ-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601160541.s9UkIfFQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601160541.s9UkIfFQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Unsupported relocation type: unknown type rel type name (248)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
