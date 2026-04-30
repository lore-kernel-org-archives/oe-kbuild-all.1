Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7124A2BDC0F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 21:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777586383; cv=none; b=n1MftX0aD97iUhAQrrIjhTN9AUbUms8l3VWHsBO30HxAtoT0iAp77y9NJ8dXc2OnSNFrLle6+fB/J/nj2lv8C9Gg10nDAjtkG3emLGzwpL/jFJz5kR/0KyC+/Wk7RQRIsONZ+u2FhbapAvrpvQZZ68qBytE11WSEoL96zKNOMG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777586383; c=relaxed/simple;
	bh=UbkBRBH9ZJRQ8+nE8wsszPXmTRb/VfxKY0e1rMgW1ig=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sP37Y39c/Oq9qW8uAAhpAbH7oWcEWNOFLEDcq/3WMX815L6ZIKDoMGFp/3nexik6Lt1vBfuFfb6rP/VK5e83AV4RGeXN8iywKt6KsiOXQ3Mg2cSzslDXeT9quhpFlLC70GQkc0oJQ4tmMIcPl/LdXb+YQns+5v0GZpuwN3Dhj4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mxMQfTTn; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mxMQfTTn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777586382; x=1809122382;
  h=date:from:to:cc:subject:message-id;
  bh=UbkBRBH9ZJRQ8+nE8wsszPXmTRb/VfxKY0e1rMgW1ig=;
  b=mxMQfTTnUSroILYHA1NpzI8CbKCOm4CFjNu1FzKt08+9duxR6LYe31/3
   DWb0ioIFqmqfoV7uX+6tEspyMaKsbcnYMX0TIMQVwGsv5Hiv9G9TG746E
   zLH2gZo5tl2bwxgg5pfgyqoycge/U5InzCQ9Ds0HaWEDKDmnVzuorxeTM
   gPVvst1gNC5s35xv6xvUlUzIrFl9nGCGOwVt7+vf9WHpnJwTpOwsi6iSL
   MZFpYGQBT4TtghDz5L0q2pMaO1M8q3Cvvwz2JwO0s7Z6k1IB2mTjNnfFd
   D64iGisSC+LtSuFDI+RjxicihXHA2ccnq90NAQqZINWehYv4odtrz3Xjv
   A==;
X-CSE-ConnectionGUID: ANUFhUPBSEyjGwGjJVMd5Q==
X-CSE-MsgGUID: qsNTMMopSVaTWscdZWE9Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="78480379"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="78480379"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 14:59:42 -0700
X-CSE-ConnectionGUID: PwQYcOkyTK6UP/0sJUXcYg==
X-CSE-MsgGUID: 6LhBLxgWRlmJ0btKJqc0ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="239713476"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 30 Apr 2026 14:59:41 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIZQ2-000000004th-1t0E;
	Thu, 30 Apr 2026 21:59:38 +0000
Date: Thu, 30 Apr 2026 23:58:47 +0200
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lunn:v7.0.0-net-next-driver-removal-v1 14/18]
 scripts/Makefile.clean:12: drivers/net/ethernet/xircom/Makefile: No such file
 or directory
Message-ID: <202604302323.EdtHPYW5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Andrew,

First bad commit (maybe != root cause):

tree:   https://github.com/lunn/linux.git v7.0.0-net-next-driver-removal-v1
head:   75e17109856eb8e407a19759d3ad750fe3854b63
commit: ec673537eb22468be20a6ef3b1a30f7f45ca1e35 [14/18] drivers: net: xircom: xirc2ps: Remove this driver
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260430/202604302323.EdtHPYW5-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604302323.EdtHPYW5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604302323.EdtHPYW5-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/Makefile.clean:12: drivers/net/ethernet/fujitsu/Makefile: No such file or directory
   make[7]: *** No rule to make target 'drivers/net/ethernet/fujitsu/Makefile'.
   scripts/Makefile.clean:12: Failed to remake makefile 'drivers/net/ethernet/fujitsu/Makefile'.
   make[6]: *** [scripts/Makefile.clean:61: drivers/net/ethernet/fujitsu] Error 2
>> scripts/Makefile.clean:12: drivers/net/ethernet/xircom/Makefile: No such file or directory
>> make[7]: *** No rule to make target 'drivers/net/ethernet/xircom/Makefile'.
   scripts/Makefile.clean:12: Failed to remake makefile 'drivers/net/ethernet/xircom/Makefile'.
   make[6]: *** [scripts/Makefile.clean:61: drivers/net/ethernet/xircom] Error 2
   make[6]: Target '__clean' not remade because of errors.
   make[5]: *** [scripts/Makefile.clean:61: drivers/net/ethernet] Error 2
   make[5]: Target '__clean' not remade because of errors.
   make[4]: *** [scripts/Makefile.clean:61: drivers/net] Error 2
   make[4]: Target '__clean' not remade because of errors.
   make[3]: *** [scripts/Makefile.clean:61: drivers] Error 2
   make[3]: Target '__clean' not remade because of errors.
   make[2]: *** [Makefile:2144: _clean_.] Error 2
   make[2]: Target 'distclean' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'distclean' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'distclean' not remade because of errors.


vim +12 scripts/Makefile.clean

^1da177e4c3f415 Linus Torvalds  2005-04-16   7  
4f1933620f57145 Paul Smith      2006-03-05   8  PHONY := __clean
^1da177e4c3f415 Linus Torvalds  2005-04-16   9  __clean:
^1da177e4c3f415 Linus Torvalds  2005-04-16  10  
3204a7fb98a3bcc Masahiro Yamada 2021-02-28  11  include $(srctree)/scripts/Kbuild.include
a2430b25c31840a Masahiro Yamada 2022-11-19 @12  include $(kbuild-file)
^1da177e4c3f415 Linus Torvalds  2005-04-16  13  

:::::: The code at line 12 was first introduced by commit
:::::: a2430b25c31840a6dcbf95c65415d5fee2984dbc kbuild: add kbuild-file macro

:::::: TO: Masahiro Yamada <masahiroy@kernel.org>
:::::: CC: Masahiro Yamada <masahiroy@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
