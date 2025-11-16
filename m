Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDFE2F85B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Nov 2025 01:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763256436; cv=none; b=hab4YDrah8TrDdRbtLqaVj9niJuMQsSjVfJ1PhsZcalPk+WBRwtI/LuWPjow6nUjDpaeM88RVhzNGTe7HpH2u3YjNjwk8G/gDtCSNIXdfbIbnk+KCI5/b0EAhKp60bWP43cfEqoNADJyJ5zEqVbvKSXL/NIa7Aw90rjSmziWsJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763256436; c=relaxed/simple;
	bh=crWmQyUIgtaJTExIs/Q3Csqd7GB7/jFsJNoecfrhzgI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sSuNzdJNzuAlLoMcTG5NHJFdaAb/mc+LrgBlyB4vNUQ9VRLIcjctdE+Ea+T5XR3Chm4IlfwHduvY3fQ6tQYoPR4BFoIbqlwFaukSzMXWfNOBw8iVJ4pn4Z3U9js3IOkbVtgJ2vHgPk0PSW+LKVwU2VeBEFDwMv81Vf+m1jpcwCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I8XdQc5q; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I8XdQc5q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763256435; x=1794792435;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=crWmQyUIgtaJTExIs/Q3Csqd7GB7/jFsJNoecfrhzgI=;
  b=I8XdQc5qDT99T+7QeDC+rhIWkMt9lrb1evhsKNNE+2TQbY1EgWbTdsRI
   NCRJeGLYQE1DJ7mPyFvKy1DOZUYlyOB8hSiHtF4FOr0DShGc306+6Db1k
   G3U+B72WI9E2qn3SOlOvYtmQva2jpvruXhtNf/FMC5MHKdUJFDSV3vhHf
   2YN0hCyNfuSdmBcIHNd6pxgcim/hC2Ibhl0tYByGKY3ODNVJW2zZyBJHI
   1dfw+7QVQU2SVAuhOqQsOm8Ez/2ascVV6Ajk9z/cWC6+eDFY/zqlnZUXs
   mYhhgcwTBLcZZzOSMXA9Bcdqmt9VIRvgd1JLqS0g/KnGqtTqeqxOOulY+
   g==;
X-CSE-ConnectionGUID: IwJ6F8jtQNukG3+/opy0cw==
X-CSE-MsgGUID: y7k/JOjBSwWPtUl0lRGpaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11614"; a="76763251"
X-IronPort-AV: E=Sophos;i="6.19,308,1754982000"; 
   d="scan'208";a="76763251"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2025 17:27:14 -0800
X-CSE-ConnectionGUID: VbGPNcu6SLe/IYxxQr0mSg==
X-CSE-MsgGUID: gDqjdNIfR2GyzHouKAJUfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,308,1754982000"; 
   d="scan'208";a="190914050"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 15 Nov 2025 17:27:13 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKRXr-0008Op-05;
	Sun, 16 Nov 2025 01:27:11 +0000
Date: Sun, 16 Nov 2025 09:26:37 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Masashi Ozaki <masashi.ozaki.te@renesas.com>,
	Vinh Nguyen <vinh.nguyen.xz@renesas.com>
Subject: [morimoto:renesas-lts/v6.18-rc5-2025-11-12-x5h-ironhide 28/39]
 drivers/mailbox/rcar-mfis-mailbox.c:252:12: sparse: sparse: symbol
 'mfis_default_direction' was not declared. Should it be static?
Message-ID: <202511160950.afNpgWWq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux renesas-lts/v6.18-rc5-2025-11-12-x5h-ironhide
head:   6aecb5521a24ea1461406564f89f4449840421dc
commit: b5e2040ad820fcafdfe92e964efde15f4e8a625a [28/39] mailbox: renesas: Support MFIS mailbox driver
config: nios2-randconfig-r131-20251116 (https://download.01.org/0day-ci/archive/20251116/202511160950.afNpgWWq-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251116/202511160950.afNpgWWq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511160950.afNpgWWq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mailbox/rcar-mfis-mailbox.c:252:12: sparse: sparse: symbol 'mfis_default_direction' was not declared. Should it be static?

vim +/mfis_default_direction +252 drivers/mailbox/rcar-mfis-mailbox.c

   251	
 > 252	const char *mfis_default_direction[] = { "rx", "tx" };
   253	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
