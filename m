Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F048DDBE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 04:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726288844; cv=none; b=YFfswQc/VOmqx+18aZDfvXwmd7NArxJ2dKGZ93KzYB51muxnkiWn3zqVuiI5dF+J0Ya4gdt4NAc3Lu1DcK6FGKdhjZv7lV02IkVJG+ozjyOG9uLx4+tf2+HJLtUm02bmdNdCKpEZWNU7ifUMlxjwQgSAm5+aLBYPM0TJN8L2W5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726288844; c=relaxed/simple;
	bh=hK/CBqj0M7CWsl+/8h3PwLXyneKcZVT13n5h3q70VNE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RN64W04VT14s5L/jumCo986YXuDoAjmFUnXbnTJfI9FU53c0Le+0YMWAHfoc2xyzeIFke4MPhqBQ1P/o5Yq8B6v3cAbuHSxL0kvN3a5DkFLKA/Qe1gEiPh1ABBHfcSBpLDgIwl4SOhDYsk7jmsbTylifVki1qVbrl9ZNxC5Wfg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qgj4U1wR; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qgj4U1wR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726288842; x=1757824842;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hK/CBqj0M7CWsl+/8h3PwLXyneKcZVT13n5h3q70VNE=;
  b=Qgj4U1wRgsZTJymdfL/IZIB/i9BEUlxkllu141eckkJofeGZLMJXaThU
   g7Yj5Cu36QdezEdXu4U8zkz/jrI0QyoHCWWYssPC5G/EG/80R91SLW5SW
   Tz067ymum71HIlPU56ZemSp0XSYVgLPLQFKQv/1pRGRVa6AJ4ouzxG9zs
   mJiB5qOsAG3VoAaBQLWtIw35hZBgAltF4O7PyFHdnF+gNeJKW5tipyCyV
   hpPyswMnwWZeHkYdXOp3DCvw/jzcshW7XueX04LPP/OsccBfkNGlvsgMK
   ps7nQpFIuzyOD/nctNbrfpx8T8zIxXhn4vWbN+HLphsii/z6R3OIDvvxZ
   g==;
X-CSE-ConnectionGUID: jlAbk4k6R9CqywKurQ730Q==
X-CSE-MsgGUID: dULexkYfTx+acZYAbHI3jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25073331"
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="25073331"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 21:40:41 -0700
X-CSE-ConnectionGUID: u5rgHoyISSKUjyTAK8rcyg==
X-CSE-MsgGUID: mR3HJVSgSzmv7gswjG/fvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="69084360"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Sep 2024 21:40:40 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spKaL-0007N0-1d;
	Sat, 14 Sep 2024 04:40:37 +0000
Date: Sat, 14 Sep 2024 12:40:33 +0800
From: kernel test robot <lkp@intel.com>
To: Mina Almasry <almasrymina@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Pavel Begunkov <asml.silence@gmail.com>
Subject: [linux-next:master 11395/11962] /tmp/ccvwMgQM.s:2182: Error: operand
 out of domain (39 is not a multiple of 4)
Message-ID: <202409141239.Lv3qZK08-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5acd9952f95fb4b7da6d09a3be39195a80845eb6
commit: 8ab79ed50cf10f338465c296012500de1081646f [11395/11962] page_pool: devmem support
config: powerpc64-randconfig-001-20240914 (https://download.01.org/0day-ci/archive/20240914/202409141239.Lv3qZK08-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409141239.Lv3qZK08-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409141239.Lv3qZK08-lkp@intel.com/

Note: the linux-next/master HEAD 5acd9952f95fb4b7da6d09a3be39195a80845eb6 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   /tmp/ccvwMgQM.s: Assembler messages:
>> /tmp/ccvwMgQM.s:2182: Error: operand out of domain (39 is not a multiple of 4)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
