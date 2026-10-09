Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7C93F1073
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Oct 2026 05:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791525218; cv=none; b=QX7OhvasZ77Ed2hso+NaRNvudOh9eS4IwLi3iMJVGXf2ripe1D3GQa7wskZsK9O1jQEpY259h1ZA5dwl3gbsH+A+ABEfmmEkTeQgOHAmmyN+MgTkK9Rm/xQTUfU3YcVW5TU45GfAj653bBgzg+Os690g3rBgaawwFFmjIFl1bVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791525218; c=relaxed/simple;
	bh=JYf5w1fxY3ah0L9t5/cH1GMgwvk7AJeb+sywMq8Iz4s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=PhkFr/g9EUEWKqCCDmvadMGUNro/pWjcBPaxpS1Xw8ByD3z+Z1DYTZoUpvvxLeLB95FDq7DyjJT741Qvpii4K795MVZ1KvJedi1Gyf03rdAUx6u2koDvjMyalEW/+KaRuxrXr9KNDeKsD4HZcKI/u7Z/982Fconpq8DLSKokuNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=apfhMeuj; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="apfhMeuj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791525216; x=1823061216;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JYf5w1fxY3ah0L9t5/cH1GMgwvk7AJeb+sywMq8Iz4s=;
  b=apfhMeujPKwSz77L5EsWHaMMO7yYA0Q4cBanPpfdMH9lf643AYYaQTaC
   LI9xdQFbtx4fvUlubjsEIvyOJt3M8+dbDilrNF6PpD76k3r7PvF8P75A4
   9zS10IgInFNwyYLiZiVi+XmSCWfBEdrDwO9W/nZAhgji+of2MIOX5U/4A
   4Gya08ltA+MZ/wkHGrLo76GbeIXAcnM9fCIHwOMWWmcmssdC9td0V+fHG
   K5yxsA5F96gJRsjMCKeqPKx2BevlAoZQcyEXZUgQ+JRpgO07DwVCF38CH
   fzZJ6u3GSol8he4Ee6xkFcisZ8DFR7FNSKmd1T0z9bXkQ9mcB7gAWAlOu
   Q==;
X-CSE-ConnectionGUID: LzQVkN2JQEyowvSzV1Cf2A==
X-CSE-MsgGUID: z4yl9fkwSxKodAjRa42fgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="415074"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="415074"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 22:53:35 -0700
X-CSE-ConnectionGUID: +IxFQ4tNSZqErMaFGdftNA==
X-CSE-MsgGUID: cb6wWTjURbmP5q9ADNtRNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="177318"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 Oct 2026 22:53:35 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xF3Xv-000000005NI-3ylB;
	Fri, 09 Oct 2026 05:53:31 +0000
Date: Fri, 09 Oct 2026 13:53:18 +0800
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:dlink 44/142] ERROR: modpost:
 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.ko: symbol 'rtl8192cu_fops'
 undefined!
Message-ID: <202610091307.sBQb9WaR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel dlink
head:   7998b6e929bb20ed66acafa33720d8e3533e1598
commit: 862914e0cbfa81ac3ff98bb46d49e463335d02f3 [44/142] Try to add the wifi card in the dlink device.
config: mips-lemote2f_defconfig (https://download.01.org/0day-ci/archive/20261009/202610091307.sBQb9WaR-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261009/202610091307.sBQb9WaR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610091307.sBQb9WaR-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.ko: symbol 'rtl8192cu_fops' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
