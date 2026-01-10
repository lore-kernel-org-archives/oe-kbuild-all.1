Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56AD22A4D6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jan 2026 18:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768069697; cv=none; b=jyfU/kNasE9ecvwLZWPg7ncmrWxa8aJ+OxXJFXSuiAVunaVofUbjicG5OzjfBFubPAwCmYn00NlpVDam0H4a5P/7JxSk44IxxZymhqEobbrO2WmXRK9OBes4mMl94rkM4pqmIYhP63N+Zpfc7c+4345i4Tx0RdPLXl3xVWl04eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768069697; c=relaxed/simple;
	bh=UNJG3DVwPCIdKPuwyLC0I17VB4VyFlgQSClE27MSFqI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RcFPHz6Rh7VyTZ5utxcbUrZrP9ZKVg5T3dkkRGY2oCunD8lPDM2YRbM6Kuv8eQIJ03b/+30S6pfG3qwIrQqdSur//hBInf2jyBmLtxgKozWvLNdcckFAGKNqWJ6ntJV0nOk6sb8nk/AGyyJ8wbErxslg6pS81Fb0sqKLSQ/ZGV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=STtSih4+; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="STtSih4+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768069696; x=1799605696;
  h=date:from:to:cc:subject:message-id;
  bh=UNJG3DVwPCIdKPuwyLC0I17VB4VyFlgQSClE27MSFqI=;
  b=STtSih4+xu5+gT4qsAq/xiYMfOkDcST/XQZM1DTyXw4rtmTrNqlC+COj
   SnFiuHBwhTX7FqVoeXaqXSJKdbf5fNermktjHeCf2xEoHRJsBVZqwDY10
   U8F5bHbiFpJ+D4RlmG04VNhBgSxJWBo2nfjUrbDuZCcvWcGzdPRqBinJV
   pxKrrP7fmaxV3IXYAdXdIciGMYhjsoIThmKQYQclINhkD2qmixPLc96si
   ZLxVD8As0CC6GCwMgzkN/yGEI8lLXmqkKiQRY/7k+6F1SL/te43JUa/Yd
   n4Aw60G2ycXQylQzj0cVASCO9ZQk1ArmxUlzXe5yokO38P8EFGj5m6rt+
   Q==;
X-CSE-ConnectionGUID: DMtehY+LQJCYEC1c3LUfZw==
X-CSE-MsgGUID: aWwNhQVJT76TlUIg6rYiDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11667"; a="69462940"
X-IronPort-AV: E=Sophos;i="6.21,217,1763452800"; 
   d="scan'208";a="69462940"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 10:28:15 -0800
X-CSE-ConnectionGUID: /0vJEFrwRyCPWBmlduRBOQ==
X-CSE-MsgGUID: Zzv41JlXQcu4ncpWod9Kwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,217,1763452800"; 
   d="scan'208";a="234424406"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Jan 2026 10:28:14 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vedh5-000000008zw-2NBp;
	Sat, 10 Jan 2026 18:28:11 +0000
Date: Sun, 11 Jan 2026 02:27:20 +0800
From: kernel test robot <lkp@intel.com>
To: chenmiao <chenmiao.ku@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Stafford Horne <shorne@gmail.com>
Subject: WARNING: modpost: vmlinux: section mismatch in reference:
 __set_fixmap+0x58 (section: .text) -> map_page.isra.0 (section: .init.text)
Message-ID: <202601110226.7yBgkamQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi chenmiao,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7893cc12251f6f19e7689a4cf3ba803bddbd8437
commit: 4735037b5d9b0f809c51976c87d737fa2c48fdea openrisc: Add text patching API support
date:   4 months ago
config: openrisc-randconfig-r073-20260110 (https://download.01.org/0day-ci/archive/20260111/202601110226.7yBgkamQ-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 10.5.0
smatch version: v0.5.0-8985-g2614ff1a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260111/202601110226.7yBgkamQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601110226.7yBgkamQ-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: __set_fixmap+0x58 (section: .text) -> map_page.isra.0 (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
