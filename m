Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C908A34041A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jun 2026 04:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781672265; cv=none; b=RaKjgd8YC5lxUKyTKTsYoMDmZT2zTaUbKpzHAe3RGo+m+xRPshbIrxxbrM9OqSxmwgE9eg4M4kJ2yKakecRgkVolQ0CMDYFz1KwVB9MevEPvGxOy7rMhQ+go/hzqaQulUXcUm89HSAMOi2Hw/GeyJ280Sd49NCj7I8dNG7x1kF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781672265; c=relaxed/simple;
	bh=hQ/gBQBjw2WoDlp8uYpRVlWdh/cnkOXMAh8IWUg+WIM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e4LvUqWGqT9wzzeBn04biIiw/4YoR3QVXz0czt+vcTH1Zr/2DcCUW5bVjotD8vNbDJeCZEBXMnnTRoQqKEDAVayYgmE4Ingr8Cg6JPzMbw7T2KZdnQRX+Fr3PATNgTBcGVq4LW9axjTBiKwv5jIWFr+sGP9nbAlxHBj46xCSG4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dkuxOmG+; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dkuxOmG+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781672256; x=1813208256;
  h=date:from:to:cc:subject:message-id;
  bh=hQ/gBQBjw2WoDlp8uYpRVlWdh/cnkOXMAh8IWUg+WIM=;
  b=dkuxOmG+OISC5Xul4JCGofI2TDRaahsTjjgnrrlCen96z71aBii2jlm+
   gvCNLI3sfRgx2kMyDwANQf7xU+etMZqc98pBvdEm0ecU7d2YVuZE4HVSf
   fcSLSJp5iZWCd8S61wjhgKMTwa3bF9haeWVHRW5rV7BBaUL7QPItT7jcY
   kyBvdjOA5LXHoJOgKNTNgFxCMguhZRcXkTHMqxL+E06gGKruR86sClQTv
   pbHN9zQXCRpM2b4NzOlFHVUikJ4mjKDjqkEfi6E+IYanxdy7VC+8XYsPc
   1zOYNtC8GVZ3yq2YaWeIJuLkj6rKbHOwomTnoiAwh6bswg4cWXwnh4mZZ
   A==;
X-CSE-ConnectionGUID: OKlY5/ByQQqW1SSqSBweIA==
X-CSE-MsgGUID: tA9AGb/xTiqv4pfOqS1lGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="100021240"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="100021240"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 21:57:35 -0700
X-CSE-ConnectionGUID: ZmmoLIlwRnKpaBuoNgsPYg==
X-CSE-MsgGUID: BJE58DZKTOq2IWpWjvj8JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="252275449"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Jun 2026 21:57:33 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZiLD-00000000U8E-12LA;
	Wed, 17 Jun 2026 04:57:31 +0000
Date: Wed, 17 Jun 2026 12:56:54 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-16 326/326] Warning:
 sound/soc/fsl/fsl-asoc-card.c:150 struct member 'card_driver' not described
 in 'fsl_asoc_card_priv'
Message-ID: <202606171231.lU86xqNt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-16
head:   5ce50ac7d0a59c6fb15e1baa7e6824ac096fe092
commit: cc2096e930d99d6d286aea054b9b57207f729193 [326/326] ASoC: fsl: fsl-asoc-card: use snd_soc_card_register()
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260617/202606171231.lU86xqNt-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260617/202606171231.lU86xqNt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606171231.lU86xqNt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: sound/soc/fsl/fsl-asoc-card.c:150 struct member 'card_driver' not described in 'fsl_asoc_card_priv'
>> Warning: sound/soc/fsl/fsl-asoc-card.c:150 struct member 'card_driver' not described in 'fsl_asoc_card_priv'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
