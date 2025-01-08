Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842E32594BE
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jan 2025 18:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736361790; cv=none; b=D5ucNV99mXxA5fni9Lgl7TMRE/e0AVI+x0jX/R/umHoBVRCSgt+JewDUCNMoXJKEyPjrfxdJUajZq8bcqr3v9tefqPB5a0sfde0iAER70aHXartCaGRbxl3cIN4KqFtMs2FUcHSiGe2jcybzh0nwE4P7dPP/5RH11/7971iP4XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736361790; c=relaxed/simple;
	bh=IiUHGsn3V6DGd5i2FZiJ8TgU87D88keUCB1FIrRpUy0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aKaK7MEAkYB+3VDjbSBWbm9dieGZ1XxuCvSLeVW6/ofblW18K6boYaExxQfFQIW9K6gNQ1P1zLlb7vexJ7PsW6W/i7Ov+yA05qjBI4V2k8bjBtu5exGXrqSAlKyuSrnRonUdPjtUPIf9XwXM432eP21sbfI0xrDeLct+5XGOC/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QIFook82; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QIFook82"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736361789; x=1767897789;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IiUHGsn3V6DGd5i2FZiJ8TgU87D88keUCB1FIrRpUy0=;
  b=QIFook82XUF0qodzs18UEc9q9zATjhutXJruxQrVdvdiBuGzegopsTOi
   wv7LXmeVAFuV4xvUoZmjrP4ZVWbGJeN3xXgssgixk6J5Zy6q0fd7bhA6E
   E0H5AMP6dFPfb2/IEER/cwdGfV0u6vvBCLtuOjWwH8ssb0MIwGwAjf0fe
   41xQzL+Z2sAGmElFyuQ8ngWN7VBinQ3Miq6mcJIIAd7i+xwgrFce1izke
   ZA6YR8fJHTjNLh747wLgCWKYMhqVH/SETSXPYhvVgxoivYe8sexxEexig
   JcdAOWEuNk/Tbqle6Cbb77DgmYcsPyAHLNrLBTnqXocqTQrPbDnXVOO5v
   A==;
X-CSE-ConnectionGUID: Eyj0nr+rR3WdzmKo+2z0JQ==
X-CSE-MsgGUID: rJnMf1SNSZexGj44PzZ75A==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="47960259"
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; 
   d="scan'208";a="47960259"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 10:43:09 -0800
X-CSE-ConnectionGUID: Gv19EWeIRuG6u2lPRDWjpQ==
X-CSE-MsgGUID: sxXOD9GMQQGw3poMieP83w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104048474"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Jan 2025 10:43:06 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVb1E-000GWQ-1Q;
	Wed, 08 Jan 2025 18:43:04 +0000
Date: Thu, 9 Jan 2025 02:42:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1395/1395] net/tipc/.tmp_topsrv.o:
 warning: objtool: missing symbol for section .init.text
Message-ID: <202501090232.iMcOsezA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   ba3cb2368ba01dbe03899a6eadacb91053e1f40e
commit: e373fab80587f72c98463df1f4511d06011f915c [1395/1395] tipc: fix modprobe tipc failed after switch order of device registration
config: x86_64-buildonly-randconfig-001-20250108 (https://download.01.org/0day-ci/archive/20250109/202501090232.iMcOsezA-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250109/202501090232.iMcOsezA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501090232.iMcOsezA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/tipc/topsrv.c:82: warning: Function parameter or member 'awork' not described in 'tipc_topsrv'
   net/tipc/topsrv.c:82: warning: Function parameter or member 'listener' not described in 'tipc_topsrv'
>> net/tipc/.tmp_topsrv.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
