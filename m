Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313802E7F2C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 15:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778169138; cv=none; b=XeQjVJfPtF4sBVtT2kiz5WShzqDcbRC7yu+L1fhRZn804zgxPvf1+1OOkX8j+3ltvX27OTX/YXN2SSZ81GhrMMRTyJ0iyJnbgcrZlvxN7t9q1phFyaz71eR9pgNRmlHI7x41qm78zhaLtzdGco0pIdHtROwymPFhSSHLWPqYvqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778169138; c=relaxed/simple;
	bh=uTTaRWxRl6NUpUEtdLyiKawHeXilCGjPnCXLaP0L+aU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TMYA2xmIhcDe2YmctDDdQbrnuVUFZ6204iKOq8cp4UyTJyQDz09kyFmzF07AiKakRJ9GpvVGrdEswb9GT1Z9fMZNaE1rSegqz9bCcUpFFY7WX0jejdUoBvXbj9spE8md4SpzkRzZSLnhtKvuLp7zIEiNe8Ay2vC9VJBftZ4Udfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G17SvLDh; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G17SvLDh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778169138; x=1809705138;
  h=date:from:to:cc:subject:message-id;
  bh=uTTaRWxRl6NUpUEtdLyiKawHeXilCGjPnCXLaP0L+aU=;
  b=G17SvLDhVrHJcKuaioFWwoHrmznvo3gKbfNMBbG0Dt8cGewGH30vmznb
   fqAxHmkLyrnF/XX1e6F70npnMdKwdRitKqxA/tpCrkX+cj+hgobrVomzb
   Mn0watSgE+r809sxNe8wZU9QtKcSpGg060XsrS2ug2Hr3y34VqfJig/jd
   VXf9WnATEMcUyQlNnJ7MKRWrjPmHj/G4RnJXIRVUNUGmC3WtyG3gBwbJV
   1cOAMF7uPcdMaoDonkaQaMeAsB0vb5Z952QzXpsxffs3sLj2e6/BuJfTC
   KPixlPgFjSwxxcMJ+ZWmqE4GZwFSNsJe889xXv55YhgZByxfzng/7hVbl
   w==;
X-CSE-ConnectionGUID: WWGdc2XgTCmdAyFjeLQWSw==
X-CSE-MsgGUID: 2ZITexlGSDSiviEc1JJEtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="90224556"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="90224556"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 08:52:17 -0700
X-CSE-ConnectionGUID: xMG6XwezQuCQxMkSujxqXQ==
X-CSE-MsgGUID: pt/pMNyPTvuq30JozlhHbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="238297540"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 May 2026 08:52:15 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wL11J-000000000Ed-09X8;
	Thu, 07 May 2026 15:52:13 +0000
Date: Thu, 07 May 2026 23:51:49 +0800
From: kernel test robot <lkp@intel.com>
To: Sheetal <sheetal@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 3760/4176] ERROR: modpost:
 "__aeabi_uldivmod" [sound/soc/tegra/snd-soc-tegra210-mixer.ko] undefined!
Message-ID: <202605072335.vIeZwrl0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   17c7841d09ee7d33557fd075562d9289b6018c90
commit: 36645381b864b53ae976221854bbfc23da6abba3 [3760/4176] ASoC: tegra: Add per-stream Mixer Fade controls
config: arm-randconfig-001 (https://download.01.org/0day-ci/archive/20260507/202605072335.vIeZwrl0-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605072335.vIeZwrl0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605072335.vIeZwrl0-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__aeabi_uldivmod" [sound/soc/tegra/snd-soc-tegra210-mixer.ko] undefined!
>> ERROR: modpost: "__aeabi_ldivmod" [sound/soc/tegra/snd-soc-tegra210-mixer.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
