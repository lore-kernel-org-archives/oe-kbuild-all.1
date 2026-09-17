Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769193DAAC9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Sep 2026 19:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789671915; cv=none; b=ejbNEr/rONkd6bTPv6ME2mXxxaEhiHe/U2Srjc98AeBwhE2IG1AnXMcCsfE+fJ7UlUm2V/Qo8SxTrLEu2KRjft5wycWauEjeVSheIUoWIw4pWfv6xn4OBKlG/iL8pu3hCadOp4kJEA8cQEkODo3MZS70t0rhKvj4t4ttZ+gfsCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789671915; c=relaxed/simple;
	bh=aVe2E1vZB4Lk43QeXjuRYYUpjt55nA4eNN+ClKtPkHk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PHF8AMK3u1LURl7sUk5sNUaeUYTw+OirHhLV81X8VJh/ADPqmPryltP+VkooREUvgKGKu9iFPUzsS1bRpFXjD/d+7MWMjMoJOgYpISutTJZqqqyBjWxp7AN6NLBNl/fp5qQ/4fTV9CFy8qiFe8QKnKdm2sqwe9XemlbD5Jt0bOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eqirypk8; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eqirypk8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789671914; x=1821207914;
  h=date:from:to:cc:subject:message-id;
  bh=aVe2E1vZB4Lk43QeXjuRYYUpjt55nA4eNN+ClKtPkHk=;
  b=eqirypk8BsJfuHyJnrunRXuwjXwzihR3z9qVa2pY9rLxFc7VJTa5ltar
   umFeZUpYE3u75X30zRwP8hhOc/2q/zczzSuc6wXDrfs5QqdvNuY9wlA8R
   K8bJICUg77BnQw7+tSmhjEL9Fbgy9Pe+6SUmTWP/L2PUQBDkXNd8nZXU5
   huvielaSEOtRnUOpcLTrF3VsXA02JWITUIPUreYf18CWRAxgZ/5maAhmk
   n9otGZzJnGoTpoBqsHdvc5kG1DjGi3TpEoMIhGvAXuvZ3d5OsZhE87eBE
   M423EtTxczd9H2H3dxfbhan/h83dZBgdQbGCEWN84TZrMRmvxQB448IPD
   w==;
X-CSE-ConnectionGUID: on8HmQdLTIO0xSof11QzlA==
X-CSE-MsgGUID: b1vgzOSRRZ+He3WpYzb4lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="638630"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="638630"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:05:13 -0700
X-CSE-ConnectionGUID: BWuZHs5NSQKzoIPQwIOYBQ==
X-CSE-MsgGUID: ZmKoGYcjTCmwaEk27LQLjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="275923381"
Received: from igk-lkp-server01.igk.intel.com (HELO fe5626a770c0) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 17 Sep 2026 12:05:11 -0700
Received: from kbuild by fe5626a770c0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7HPx-000000000jN-0pSq;
	Thu, 17 Sep 2026 19:05:09 +0000
Date: Thu, 17 Sep 2026 21:04:39 +0200
From: kernel test robot <lkp@intel.com>
To: Andrew Davis <afd@ti.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Beleswar Padhi <b-padhi@ti.com>
Subject: [linux-next:master 6395/7047] Warning:
 drivers/remoteproc/da8xx_remoteproc.c:102 function parameter 'irq' not
 described in 'da8xx_rproc_callback'
Message-ID: <202609172035.C7lXJWMl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Andrew,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0d9d0dbf2fddcff5859d623e90ca73c4054276e1
commit: 957cf58a19c3687b9af4f81794849e1ab5379d1b [6395/7047] remoteproc: Add compile testing for additional TI drivers
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20260917/202609172035.C7lXJWMl-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260917/202609172035.C7lXJWMl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609172035.C7lXJWMl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/remoteproc/da8xx_remoteproc.c:82 function parameter 'irq' not described in 'handle_event'
   Warning: drivers/remoteproc/da8xx_remoteproc.c:82 function parameter 'p' not described in 'handle_event'
>> Warning: drivers/remoteproc/da8xx_remoteproc.c:102 function parameter 'irq' not described in 'da8xx_rproc_callback'
>> Warning: drivers/remoteproc/da8xx_remoteproc.c:102 function parameter 'p' not described in 'da8xx_rproc_callback'
   Warning: drivers/remoteproc/da8xx_remoteproc.c:82 function parameter 'irq' not described in 'handle_event'
   Warning: drivers/remoteproc/da8xx_remoteproc.c:82 function parameter 'p' not described in 'handle_event'
>> Warning: drivers/remoteproc/da8xx_remoteproc.c:102 function parameter 'irq' not described in 'da8xx_rproc_callback'
>> Warning: drivers/remoteproc/da8xx_remoteproc.c:102 function parameter 'p' not described in 'da8xx_rproc_callback'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
