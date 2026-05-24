Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726124317D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 May 2026 14:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779633130; cv=none; b=uTtICH3UydZe0JYcgwPVmTC8FH2dmLHcr/q1wNQNi4zsi175h3Cj0o32/zcpVsC+SVH4MwJMssbSo5d+avpchlXzB/VV+ZVy4zS1DdUru5cGn00u0vbA5AivA5qXQ3qgh/uriJq5ukgLT7gRvdVXzF9Xng/T6K5PGUUwVgbvH8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779633130; c=relaxed/simple;
	bh=2OqlpOF8Vprkts9Z5PMEJch1/HdO4wJAoREYs2a907g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZCyPOmIYdSsU9q1Za6XqAso5KsPU720yov9OnUlc+jwMHWvx5DKv8/UcEv9rKKdGNOpUaUzkZwbNRqyht9WZgst6rrE4s84DeADSvEmtYJ+V5aio23RdWfzWVLmS2h29+UsODbkL9rAl1Ij5p4lQbqfpD/xeqZ2mVddve8xSqp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HqW0l5hy; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HqW0l5hy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779633128; x=1811169128;
  h=date:from:to:cc:subject:message-id;
  bh=2OqlpOF8Vprkts9Z5PMEJch1/HdO4wJAoREYs2a907g=;
  b=HqW0l5hyvKrtfOLEy4wIaQUc+z1F1wIobJPDD5GoBuJjRN88Su7NLmY1
   LdzMoVuL0QAEDT+QVuB6askbqV0AtVz2CKMMoghqyTJgPB6KXjCFFuVum
   n7jIqFbE7pZi/YWMBbwKUL5NZPQaIStQZMZf+FbyCIX8xj8EY6Yy2HcdH
   yPBiPMAMuCODh42/RD9Cb9ZyA6wbiUwZHci9uNFcD2J5eD/oFRIiyxEeq
   7ik05TGpH6ZmEAaG+UPsQiZqvDj1En0fpIhY5p+xSZ+zNEdJadBNCZznX
   3r/eF5TBfyzge3neI7B8tNWxOixARv+r+KOl61ZC6mASwRkmHlFl7F6ZE
   Q==;
X-CSE-ConnectionGUID: q5+bHs69SuaDyqw5uu3PKA==
X-CSE-MsgGUID: VNrwTVJrSYWevA2aKpFXfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="84364628"
X-IronPort-AV: E=Sophos;i="6.24,166,1774335600"; 
   d="scan'208";a="84364628"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2026 07:32:08 -0700
X-CSE-ConnectionGUID: lwGOm6BEQAe3dEVQ79K1YA==
X-CSE-MsgGUID: xm0c8QDaRgSTfcF8I5z0+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,166,1774335600"; 
   d="scan'208";a="265219635"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 24 May 2026 07:32:06 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wR9s4-000000000Ix-1URh;
	Sun, 24 May 2026 14:32:04 +0000
Date: Sun, 24 May 2026 22:31:46 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-05-22-2 254/254] Warning:
 sound/soc/soc-card.c:1381 function parameter 'card' not described in
 'snd_soc_card_unregister'
Message-ID: <202605242217.dC22O5ce-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-05-22-2
head:   7f5e6579901e0a1f3ff8bb45002dc226961a56ce
commit: fa5b7385059d8b563e4033269e16221aafb407a9 [254/254] ASoC: soc-card: add struct snd_soc_card_driver
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260524/202605242217.dC22O5ce-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605242217.dC22O5ce-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605242217.dC22O5ce-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: sound/soc/soc-card.c:1305 function parameter 'card' not described in 'snd_soc_register_card'
>> Warning: sound/soc/soc-card.c:1381 function parameter 'card' not described in 'snd_soc_card_unregister'
   Warning: sound/soc/soc-card.c:1305 function parameter 'card' not described in 'snd_soc_register_card'
>> Warning: sound/soc/soc-card.c:1381 function parameter 'card' not described in 'snd_soc_card_unregister'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
