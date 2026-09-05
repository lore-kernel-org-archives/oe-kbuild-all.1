Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573CC318EC7
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Sep 2026 15:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788622500; cv=none; b=CeAGUs1ZPLFg+bpSoUhx0gmb4Uoncx0DH2a+JM63brdfkVNXtRhV6nVevdPt0wBoUkZs8ArKs9zUd9P5vPepNW14e4Lj1veT4S2Xx3FrHsUSoK9eyopdZMZBfjMhX904u6/x0muLqwMbnmrS+/XfjeUdji7ht5nvBFM0/hirKKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788622500; c=relaxed/simple;
	bh=QdfBb4t1c3mvfYatNFpXA4T7HjP217X8Pr52kTf5cis=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A4uGA/F2IC6tirwkJmAXec61Svlbtv49SRySS5ojOf/wv+m2y4vXTM7p4MoHVIynwNl3aSC/jHvFR1Uvueh48ZR5RvQ6PMvcS1lDiz30g4tXKOVrfNNGwX9z6ZizPNeokcm2fP6XjxmY9vJ/b2jV8skpTV9LsSvRjmvA++C1NZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WbFhTEEb; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WbFhTEEb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788622498; x=1820158498;
  h=date:from:to:cc:subject:message-id;
  bh=QdfBb4t1c3mvfYatNFpXA4T7HjP217X8Pr52kTf5cis=;
  b=WbFhTEEbOaBFiUpNZTivsRPspup5ez0A4AvL7mQZyH7YoG5USuI4dxxM
   i2xu6vfAGmzXKZPLaGnIIT1VpdkgCAYDNexUJJcW8hKcdybWfDP2tYdxv
   thA/KmIJS4jWwB11NIvvYyjH4dmo9m1nqcqbeMaVk1QAcbfjyV87cTgq6
   OcZdBGiGP40cRg9kkdddzmKylpfwc2E3GgcVeEFG5Bo0q7p/wPAn11rto
   VKDKTjY8pgxTLbRutOxYXu8XdtgUvPxMdVTYM1EVN3adxRigpxOooV2N0
   quO+Obiz0XnH5seQnPqn5gp0ngPeOIDVkOabHwI9IZYriWn7pSWK6H7N5
   g==;
X-CSE-ConnectionGUID: NRlYKmIsRj2NZfZIpgp/7w==
X-CSE-MsgGUID: tXVWPfkwQy+4iIUgnWVYvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11897"; a="114640284"
X-IronPort-AV: E=Sophos;i="6.25,264,1779174000"; 
   d="scan'208";a="114640284"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 08:34:57 -0700
X-CSE-ConnectionGUID: mkfdGqHcTrC4juHxQqpU5g==
X-CSE-MsgGUID: YAiN2k8XTue5Iv8JE64JKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,264,1779174000"; 
   d="scan'208";a="274122685"
Received: from lkp-server01.sh.intel.com (HELO 73f3364bc37e) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Sep 2026 08:34:57 -0700
Received: from kbuild by 73f3364bc37e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2sPu-000000000ep-0EFY;
	Sat, 05 Sep 2026 15:34:54 +0000
Date: Sat, 05 Sep 2026 23:34:16 +0800
From: kernel test robot <lkp@intel.com>
To: David Timber <dxdt@dev.snart.me>
Cc: oe-kbuild-all@lists.linux.dev, Namjae Jeon <linkinjeon@kernel.org>
Subject: [linux-next:master 3361/4370] super.c:undefined reference to
 `__udivdi3'
Message-ID: <202609052317.DYE687Ur-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
commit: f26dc8d89fc52fe105abb626f39eea3ec226b956 [3361/4370] exfat: update percent_in_use field when updating volume flags
config: powerpc-randconfig-r052-20260905 (https://download.01.org/0day-ci/archive/20260905/202609052317.DYE687Ur-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260905/202609052317.DYE687Ur-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609052317.DYE687Ur-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: fs/exfat/super.o: in function `exfat_set_vol_flags':
>> super.c:(.text+0x1fe4): undefined reference to `__udivdi3'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
