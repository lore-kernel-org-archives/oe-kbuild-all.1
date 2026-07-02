Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1A6412266
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 08:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782980104; cv=none; b=L/pU1pqyehKqDlcB82MsMxyn75VfoGu2YXtxXM+qQ3u8iur0eFsgXCOLWM2g+T9RsOXjTK0a3QgJS5LfCXe/Wz2ZwNEb9/wVpWR7Bi/emYsk2agGFqs5qvkb0vdJklR7tkXlxmlgE3yZGALIc0S7wJov6UGj+LQHDB0DCnDQYpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782980104; c=relaxed/simple;
	bh=krQC1jo0HseU8THdu66GtZ+yXS3T7b5eHfS8Hj7fNJo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=odRfy43hTAnWe5S1AYPz7pNAdult7SjhdX1T2cxF6QJmQ6LG5+4wT0MTVTd7Dmg/fxBjgI8mthnlYUPvsjgmfLRpV0/DBcRV83h9TBXYCDmMrOV/P6bEWv7exdxVfOzg2vM2oG69j2jJZ+0KC+hFTVKT1/IXErkIPlLaT+xTsVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dXZmpkox; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dXZmpkox"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782980102; x=1814516102;
  h=date:from:to:cc:subject:message-id;
  bh=krQC1jo0HseU8THdu66GtZ+yXS3T7b5eHfS8Hj7fNJo=;
  b=dXZmpkoxo0A3pvaSHvmnyb8l+c6wfAP6dVBKNMYL0CU8g/W4nPifxw/j
   Al7qE+rfTN09gyjEnTpQQqYjr6JGiA3aiWN93ChdiwyTw4I4LiEXjt0BK
   JL6hC+R3HFKk54HStZYxCvwC1cYVKenLhU7vKXwKfGmRymWf16CDThq0W
   37hP4fgeok9uBj92aJN8ieiIy06rBod1AsrqxgdzlXSwHyJowhb3+5Tca
   yJZbiB4jpQBq5E2mm1tH6Wd7HtAbsDb5/nqqLYGc3sgVwBTo8/zPWRXts
   h8VWy8/oG19cnYCsmu/dwNZ3Id6Qrb2BvV6+sfrIMPmEaiP7Ql3c08/Fs
   g==;
X-CSE-ConnectionGUID: TsxzXOqFQFS87XGAAtj09Q==
X-CSE-MsgGUID: xzo1+VlMR5+WKrezOUi7jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="71248127"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="71248127"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 01:15:02 -0700
X-CSE-ConnectionGUID: kRSEB/hITbeJaaKZY2Ec7A==
X-CSE-MsgGUID: +0qMMLhmQfOJOWGvi7zFLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="251748289"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 02 Jul 2026 01:15:01 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfCZW-00000000AWN-23lh;
	Thu, 02 Jul 2026 08:14:58 +0000
Date: Thu, 02 Jul 2026 16:14:48 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-extra-2026-07-02 3/9] Warning:
 sound/soc/soc-devres.c:33 function parameter 'name' not described in
 'devm_snd_soc_register_component_with_name6'
Message-ID: <202607021647.l2COrcZP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-extra-2026-07-02
head:   1c9d94cfc97661b6296c22730145ae0113d72ca2
commit: 0e0a684747d1eff369dafac687ca1be79d782827 [3/9] ASoC: soc-component: add .priv
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260702/202607021647.l2COrcZP-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607021647.l2COrcZP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607021647.l2COrcZP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: sound/soc/soc-devres.c:33 function parameter 'name' not described in 'devm_snd_soc_register_component_with_name6'
>> Warning: sound/soc/soc-devres.c:33 function parameter 'name' not described in 'devm_snd_soc_register_component_with_name6'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
