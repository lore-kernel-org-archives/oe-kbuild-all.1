Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447B635E55D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Aug 2026 21:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787347032; cv=none; b=FHMO/XqISFMz3w9jt2czM6p2ZqhL4+skNcVBkueR43M1sb/Y5d6JQttnrhloUnnJAXPvatQtwXTnAdJVHt6v9Ci/XKiv0JWsFynwl545+SZlyPut/qJt/EjkhKlhHJlncZzLXRvup+Lg3mOTkfNLjP+ZcQ+Xc4CN8cgd328fJXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787347032; c=relaxed/simple;
	bh=L7XEc2f2YilHQODmsQ8cDYc9MOcu7Iaxjkq0GDehZsY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZbkyMJbzCT5PvqlybqmflPzUOx7IHTap8Ht8iD1j18A2UlBWxjE4wz/EbO6BOv8TheBCAoG6hGk+ZD36fYPUZFMy8TpyFA0f489v/EUEXXPzs9H4wjUAkyu6/w3BRdzKIc+20GGr/FxLNGDEAVQW7ZcnJl/HrwX/S9UgUY5br4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GmKTXaUk; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GmKTXaUk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787347031; x=1818883031;
  h=date:from:to:cc:subject:message-id;
  bh=L7XEc2f2YilHQODmsQ8cDYc9MOcu7Iaxjkq0GDehZsY=;
  b=GmKTXaUk4yaM14RSR7a3kD5sz0z0mtVxZmbPJPFCG9Wnz/hdQibeI5Hy
   OrvS1FMNyhCYpT5aevIERZgy05HdyfMSe9+RoSVItZ7c6+D1kkzCA505i
   tcfUuTed9MvfWs78pL7LIqTcD5umL1tiE2LkNYjSGHw3zTtnfRzEMzb/H
   nLdPjs5b5gnpWIb0h/jQRQI9Qberub4fB+eexoeO21HpK+ll9Je29f94i
   Dz2pPZl9wtBZXfA9fPrnWCgKfcW4SCm9yp0He2xnnMhMIncOQ/qC5CtGm
   U6tsW0CnKW7k8J1hjKKGeguhhatTYymQzTKEsUIQJ3hL73Ea7TKZshcr+
   w==;
X-CSE-ConnectionGUID: OAvIu+bcQRirHGj2UEkqxA==
X-CSE-MsgGUID: g90WqCrYQ3qME30H+gs/uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="91775309"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="91775309"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 14:17:10 -0700
X-CSE-ConnectionGUID: t1Lz5bWKSD2jWZakaw45aw==
X-CSE-MsgGUID: RK1pLmhxTpmHLWSXr4748Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="262728785"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 Aug 2026 14:17:09 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxWbq-00000000qTr-4Azb;
	Fri, 21 Aug 2026 21:17:06 +0000
Date: Sat, 22 Aug 2026 05:16:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 1/1]
 kernel/gki_module.c:31:6: warning: no previous prototype for
 'gki_is_module_unprotected_symbol'
Message-ID: <202608220529.9f5jWHu2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Ramji,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   65cae2a31acde46e949fffddac8903d3f6d11240
commit: e7451150cb701de01d6b836c496e1bd012d885cd [1/1] ANDROID: GKI: Add module load time symbol protection
config: arm64-randconfig-004-20260822 (https://download.01.org/0day-ci/archive/20260822/202608220529.9f5jWHu2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260822/202608220529.9f5jWHu2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608220529.9f5jWHu2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/gki_module.c:31:6: warning: no previous prototype for 'gki_is_module_unprotected_symbol' [-Wmissing-prototypes]
      31 | bool gki_is_module_unprotected_symbol(const char *name)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]


vim +/gki_is_module_unprotected_symbol +31 kernel/gki_module.c

    25	
    26	/**
    27	 * gki_is_module_unprotected_symbol - Is a symbol unprotected for unsigned module?
    28	 *
    29	 * @name:	Symbol being checked in list of unprotected symbols
    30	 */
  > 31	bool gki_is_module_unprotected_symbol(const char *name)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
