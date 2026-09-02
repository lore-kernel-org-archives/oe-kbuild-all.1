Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C3E377A8F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Sep 2026 07:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788334218; cv=none; b=Nc1lMz7H6DA7rjUVC9TZW3Pe0zOE7wWXF5ldr2zMNVDq50a0GTdLDkhLYFmZT5l6ZkRD887uf1IhmlAK+B8qabH9mOQlQvqrigolQf2G9lxQ55MInPeg9jv5ag9sIzuVMp3nEpOKCFgmqwEkftBQPMl0jtln55eQskIHqTY9jI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788334218; c=relaxed/simple;
	bh=N6HTuFD2NOKW3KSVMbH3q+QMoNTfMS81QKRNCthAxxM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IHyGAc6haN8uMCJfV8qaE6AIsJ0SjnH1jJmLSBFx9Pz6Po1x8Gw2hQJUKV2X3AYJE1O37y+HYiyvEGUlDhSr88MWUDMjglY2DpETXkXdZph93ra0TUWbUkEco09NNKAsuhPohf5RFxARgpWKVVmt6VjcyhicZzI4202gFC+Xy9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mywqTOtm; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mywqTOtm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788334216; x=1819870216;
  h=date:from:to:cc:subject:message-id;
  bh=N6HTuFD2NOKW3KSVMbH3q+QMoNTfMS81QKRNCthAxxM=;
  b=mywqTOtm5RxXKTue5W9p1hcjNbuWttt5JlwmHib8SKfpYzmO4gZZjK4P
   maDdbb5CxhkV78s1B1o9JdG93RR1bKnUrnGrvaGEEeK++cVkbJditcRNx
   xIVegIyx7JfZLaeCzK5K5S37Ud3+0QBUbKGv3twih31PtkZupt3QLz6xW
   Ad9ix+cKxLPlRN0wFc0Xi/E9gXFGbM85gDOsR3fTW+H2YZhMfnyBDeVyD
   QFQ2vSiv+mTOWxnWSYJG5OfGi4yIAi4Hj4qTX3d8gHXO6oXnW54BUAXF7
   n8KNOWULNRqt7E/WV6bBG2P+VNqF0DgVxaZMpf9PikAZ9A9HSqBNkzfwI
   Q==;
X-CSE-ConnectionGUID: LpLAoOggQ6GqZW5ZOvMWRA==
X-CSE-MsgGUID: V6L5IHdkRIqh3MqVX5Xg9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="111552576"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="111552576"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 00:30:16 -0700
X-CSE-ConnectionGUID: TNtHMhAGQluuAJ/ZuflWew==
X-CSE-MsgGUID: qTinIBwwTvODwnBQlFCZsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="269350789"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Sep 2026 00:30:16 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1fQB-0000000029K-4Al5;
	Wed, 02 Sep 2026 07:30:11 +0000
Date: Wed, 02 Sep 2026 15:29:25 +0800
From: kernel test robot <lkp@intel.com>
To: Neo Chang <YLCHANG2@nuvoton.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
 linux-doc@vger.kernel.org
Subject: [broonie-sound:for-next 20/61] Warning:
 sound/soc/codecs/nau8360-dsp.c:42 This comment starts with '/**', but isn't a
 kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
Message-ID: <202609021537.D6X4Dz93-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
head:   27a50351cbc82e9f0811df417c5e7d2a72f60ef5
commit: be88847a8bb1a14194cf50116f8909d127861318 [20/61] ASoC: codecs: nau8360: Add support for NAU83G60 amplifier
config: sh-randconfig-r062-20260901 (https://download.01.org/0day-ci/archive/20260902/202609021537.D6X4Dz93-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260902/202609021537.D6X4Dz93-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609021537.D6X4Dz93-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: sound/soc/codecs/nau8360-dsp.c:42 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Preamble Fragment Masks:
   Warning: sound/soc/codecs/nau8360-dsp.c:56 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Payload Fragment Masks:
   Warning: sound/soc/codecs/nau8360-dsp.c:66 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Trailing Fragment Masks:
   Warning: sound/soc/codecs/nau8360-dsp.c:79 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Reply Preamble Masks:
>> Warning: sound/soc/codecs/nau8360-dsp.c:384 function parameter 'cp' not described in 'nau8360_send_dsp_command'
>> Warning: sound/soc/codecs/nau8360-dsp.c:384 Excess function parameter 'component' description in 'nau8360_send_dsp_command'
>> Warning: sound/soc/codecs/nau8360-dsp.c:469 function parameter 'cp' not described in 'nau8360_dsp_kcs_setup'
>> Warning: sound/soc/codecs/nau8360-dsp.c:469 Excess function parameter 'component' description in 'nau8360_dsp_kcs_setup'
>> Warning: sound/soc/codecs/nau8360-dsp.c:384 function parameter 'cp' not described in 'nau8360_send_dsp_command'
>> Warning: sound/soc/codecs/nau8360-dsp.c:384 Excess function parameter 'component' description in 'nau8360_send_dsp_command'
>> Warning: sound/soc/codecs/nau8360-dsp.c:469 function parameter 'cp' not described in 'nau8360_dsp_kcs_setup'
>> Warning: sound/soc/codecs/nau8360-dsp.c:469 Excess function parameter 'component' description in 'nau8360_dsp_kcs_setup'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
