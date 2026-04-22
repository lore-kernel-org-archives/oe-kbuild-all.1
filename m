Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A87627732
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Apr 2026 00:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776816604; cv=none; b=jij+hNEKczXXW9n/PdO3/Np6LGP1Enp/o/ayBQklJwyxcveorSGMNdfWWC5yOPV7gSu57O517ZfcUD/veLNZwsk6ZgGzK8WosgGM8Nj1kibzgyqEfDqDj5QBfN7wRFPum83wwFZ+3tHkXTeWyvPz9FYWPXaMR5aVmCXIVW5movM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776816604; c=relaxed/simple;
	bh=ujmImzH+R4i8SXy2pQttg6PjsGfs4D8wI1dV3OUFk0M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gtT+hdMWaA13mYOGDnTW+3cGCQtzmGZLEoJm2BeBP6vmn8igKic4x+qd5JW1J5sKUVKwfXHGsu6bwQkwTx/Ug5yXepTBwaEF3rotu/dpnGiDAeQo5SaHAeeQqhkvdJ59KZQ5XF8y2TqKuxtPrrSfXx8xoLf9yjS3m7ji00pFz6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VPfNwv5f; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VPfNwv5f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776816601; x=1808352601;
  h=date:from:to:cc:subject:message-id;
  bh=ujmImzH+R4i8SXy2pQttg6PjsGfs4D8wI1dV3OUFk0M=;
  b=VPfNwv5fzCYF/En3QI4URxT2wWzPbWJIdl6QNj+/NV1KQ7VZbE8yeQxn
   yyP5xysLd3jhUztriBFGFRwDQ/bP7Ul0OmY/x/U2giCuWYZAgx03iQu5w
   vpFyAIW1FiTNUu0z4k6BlMFryXMNPckNrRH4B3sjX8ZeuXyLFy0iJbE7H
   LDR5Y7X07XBb22Oj6Hy7/HhR4LNmWf4YhT66purM0bPEQT2+HTV6lSFxY
   j56LUFXbc7KPtoFV6lkGI1wZeJELhXpNMOVzt8T4CR/q9PvRhDc4RPsiI
   ElxvWk3cawc0Oxf4VI92Jjk9CB2d6QBttwxumGpS/VV4ZKkLRP2qzFL38
   Q==;
X-CSE-ConnectionGUID: p7qYvGpiTdaOSG0dp1caTA==
X-CSE-MsgGUID: QBgs7fC4Te+70McZU4U3sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="77742510"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="77742510"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 17:10:00 -0700
X-CSE-ConnectionGUID: 5MXO0YRVSPGoZWCdNmjgDg==
X-CSE-MsgGUID: OR2nN+6sROa6hldOnzW6YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="232050385"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Apr 2026 17:09:59 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFLAC-00000000460-2E0e;
	Wed, 22 Apr 2026 00:09:56 +0000
Date: Wed, 22 Apr 2026 08:09:54 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-04-20 127/127] Warning:
 sound/soc/soc-devres.c:64 expecting prototype for
 devm_snd_soc_register_card(). Prototype was for devm_snd_soc_card_register()
 instead
Message-ID: <202604220833.AyQiHvnF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-04-20
head:   c0eca3aad838fa892c00ca5d3141b136aac51b91
commit: 98c0c18012d8a32d75555746df2d080577334c70 [127/127] ASoC: soc-card: add struct snd_soc_card_driver
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260422/202604220833.AyQiHvnF-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260422/202604220833.AyQiHvnF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604220833.AyQiHvnF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: sound/soc/soc-devres.c:64 expecting prototype for devm_snd_soc_register_card(). Prototype was for devm_snd_soc_card_register() instead
--
   Warning: sound/soc/soc-card.c:1300 function parameter 'card' not described in 'snd_soc_register_card'
>> Warning: sound/soc/soc-card.c:1375 function parameter 'card' not described in 'snd_soc_card_unregister'
   Warning: sound/soc/soc-card.c:1300 function parameter 'card' not described in 'snd_soc_register_card'
>> Warning: sound/soc/soc-card.c:1375 function parameter 'card' not described in 'snd_soc_card_unregister'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
