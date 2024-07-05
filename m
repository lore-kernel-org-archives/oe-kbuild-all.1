Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344F83A8CB
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jul 2024 23:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720222336; cv=none; b=LKPi6nWWT5bAbjW/CVZsrPY+gBnYlvTzALCsjPLXqkEcNVMIGjaw1yAmbaL+2TIU4BgWQzTRuq+OYxuQFHwwBbmMXDOlPI1SKGvettYHC6zvbruB/phm+f9pJfGtfPfuojifkh6WuNW07dREryX/AYqs5FuvEZx4uHfdVobwcjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720222336; c=relaxed/simple;
	bh=FrvzwNnuDeBJUqKjWeH66XJeIuy8owcJUf5tx/fB+Dc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=faoL/0IutSTe/FPdbNAi2g2JZrDOl0+0ls10DWJy7mjwXQDmbHZNL69nqneRWjdvT6advCq4vh2nw9SGl1+Zs8KCbQAcbt/hsJUxZimy/G9ULajTWWcBd4Yt9NzsHb0JDHnMBu5XW+ZKlLzj8nsMElyXU6AsxHaog5pmL7n3Kkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZdfItrwl; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZdfItrwl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720222334; x=1751758334;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FrvzwNnuDeBJUqKjWeH66XJeIuy8owcJUf5tx/fB+Dc=;
  b=ZdfItrwl8nOrsztlHupVq6t2z6CohIQyCML86R4gOI4/tq7bif2FQash
   M/CWW0gjvbeUC3rpT8i2EvnO7a/czerwl1PLFK+PMShRxu8A+IqgEuyMs
   XUph1NxXHvIEY5R2WMKqvihbDNz8e7I085i8y4PuFc6sXhMDsaLa2hqff
   GiL39LB5O87cGeI3JI9MhItJtrpKg3SwQUNmSBG6l/BFU9h8k3O6NtWtW
   lpJlCQcTgbbb2YUCIGELe6vTdWTBi+CF/Kuh2K3nSp9PY5qrZ7ZQHcJix
   fLe46ZkWCJrwNegJxapVEFUS4S1WCFMPWp3NElJYsuIo66s6l59MKvRU4
   A==;
X-CSE-ConnectionGUID: 2DZOEJilR0erSB80fPp4ng==
X-CSE-MsgGUID: udQvDkvtT8ylDcasTiNJBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17617442"
X-IronPort-AV: E=Sophos;i="6.09,186,1716274800"; 
   d="scan'208";a="17617442"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2024 16:32:13 -0700
X-CSE-ConnectionGUID: YAntD/1ESPy8/q98QjaxDw==
X-CSE-MsgGUID: smkyZprjTn+RB6pBHvRnpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,186,1716274800"; 
   d="scan'208";a="46943466"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Jul 2024 16:32:12 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPsPS-000T1M-2P;
	Fri, 05 Jul 2024 23:32:10 +0000
Date: Sat, 6 Jul 2024 07:31:51 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [masahiroy:for-next 23/38] ld.lld: error: relocation R_RISCV_HI20
 cannot be used against symbol 'text_mutex'; recompile with -fPIC
Message-ID: <202407060754.3pf25tgI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
head:   b00a162ad262a06bd6e40b074ad432a0730a2b6c
commit: 92f36521656282918231059b0ce03a52100058c4 [23/38] kconfig: refactor choice value calculation
config: riscv-randconfig-r132-20240705 (https://download.01.org/0day-ci/archive/20240706/202407060754.3pf25tgI-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce: (https://download.01.org/0day-ci/archive/20240706/202407060754.3pf25tgI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407060754.3pf25tgI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol 'text_mutex'; recompile with -fPIC
   >>> defined in vmlinux.a(kernel/extable.o)
   >>> referenced by errata.c:0 (arch/riscv/errata/thead/errata.c:0)
   >>>               arch/riscv/errata/thead/errata.o:(thead_errata_patch_func) in archive vmlinux.a
--
>> ld.lld: error: relocation R_RISCV_LO12_I cannot be used against symbol 'text_mutex'; recompile with -fPIC
   >>> defined in vmlinux.a(kernel/extable.o)
   >>> referenced by errata.c:0 (arch/riscv/errata/thead/errata.c:0)
   >>>               arch/riscv/errata/thead/errata.o:(thead_errata_patch_func) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
