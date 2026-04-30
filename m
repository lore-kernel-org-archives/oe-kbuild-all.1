Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF90F3B7B6E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 21:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777583924; cv=none; b=tzYKO2+JHBgGKXNPe+Ow/oBiCtG2CbJlzC8/HPszUK8A8e62fpZCELYTNObaoQ0dMoTKcIqw2GfXzCWATSSrlXNJ9rSLK9kZoTuMqdnnN2eNjeeZTjDF8+8qQHO60ESJMLX/rBFRdAsLhxj354Olxbg/m2HRNIbxk7ISKARGBZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777583924; c=relaxed/simple;
	bh=suq17R+ZLHjeIDMYhEotidMAw00BFggcfgCMYFx+4HA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KwkeIt5aoOh+SdfPT9Apur+3sSvoXvDinRvHchruTz8CrAwDmC9AUwj/2wOr/u0yiUKvxUdWpm3FHE4x6icW0xr/LH69F8eOwxHCLlGdRUjAtezYqkrk/KDxg5otSXiqMgMwI7jbxKblaPXp60YO0QXJh2rVptFnWN+450DKm1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IQlPgmv7; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IQlPgmv7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777583922; x=1809119922;
  h=date:from:to:cc:subject:message-id;
  bh=suq17R+ZLHjeIDMYhEotidMAw00BFggcfgCMYFx+4HA=;
  b=IQlPgmv7igW4MsgevgjnOJi7u3v6jg2HbL+eNLt9pUj+TDzotMHZzcZ6
   F5diXqXFCS34fP2PR6VdRpdaxd10o/HRbjQAnhL5MJUEoPVCJT5oTxPYo
   xJiVxuBo7B4I95NrDEUwnsw9q7rnKdmiaxJSItS1UV5ll5kzZW3nF0qz7
   ywB8ApNfNG85oMajefvZO+tdAJ2pUw01YHJxiPlIjWZk19NhgU2CdPYQ2
   DFGnfwYkFEx38htOtsBuyEfxpgg1+c6j147NzAoVx8+UPsTsTRc3rcLAK
   QW/vP5w7krTHLkW6Rwn9AEjNKnnY/S/T+KEoPjZ8kIAIo/tZv8FR8T6TM
   A==;
X-CSE-ConnectionGUID: QIww7Bj8Su+iVeO6PT0X/A==
X-CSE-MsgGUID: UDWm8bPoR4WaYIHFIsddqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="78477560"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="78477560"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 14:18:41 -0700
X-CSE-ConnectionGUID: gg6OjdlfTLGR+2HiolZpwQ==
X-CSE-MsgGUID: psl/lR4DR7uSjLGHXzP8kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="228200352"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 30 Apr 2026 14:18:40 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIYmM-000000004tH-0MSI;
	Thu, 30 Apr 2026 21:18:38 +0000
Date: Thu, 30 Apr 2026 23:17:42 +0200
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lunn:v7.0.0-net-next-driver-removal-v1 13/18]
 scripts/Makefile.clean:12: drivers/net/ethernet/fujitsu/Makefile: No such
 file or directory
Message-ID: <202604302342.feXM62cn-lkp@intel.com>
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
commit: 9b67496f74c3d885af0541d8c378fd73f8ca2f5d [13/18] drivers: net: fujitsu: fmvj18x: Remove this driver
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260430/202604302342.feXM62cn-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604302342.feXM62cn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604302342.feXM62cn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> scripts/Makefile.clean:12: drivers/net/ethernet/fujitsu/Makefile: No such file or directory
>> make[7]: *** No rule to make target 'drivers/net/ethernet/fujitsu/Makefile'.
   scripts/Makefile.clean:12: Failed to remake makefile 'drivers/net/ethernet/fujitsu/Makefile'.
   make[6]: *** [scripts/Makefile.clean:61: drivers/net/ethernet/fujitsu] Error 2
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

^1da177e4c3f41 Linus Torvalds  2005-04-16   7  
4f1933620f5714 Paul Smith      2006-03-05   8  PHONY := __clean
^1da177e4c3f41 Linus Torvalds  2005-04-16   9  __clean:
^1da177e4c3f41 Linus Torvalds  2005-04-16  10  
3204a7fb98a3bc Masahiro Yamada 2021-02-28  11  include $(srctree)/scripts/Kbuild.include
a2430b25c31840 Masahiro Yamada 2022-11-19 @12  include $(kbuild-file)
^1da177e4c3f41 Linus Torvalds  2005-04-16  13  

:::::: The code at line 12 was first introduced by commit
:::::: a2430b25c31840a6dcbf95c65415d5fee2984dbc kbuild: add kbuild-file macro

:::::: TO: Masahiro Yamada <masahiroy@kernel.org>
:::::: CC: Masahiro Yamada <masahiroy@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
