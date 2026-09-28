Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E262E3D955D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Sep 2026 19:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790625527; cv=none; b=oB5jly4Q+9cTk3OALYkLp2IDr1ztoJWawfcTBOQZaHIvLkyU/MMHBvy1Ql5Y91tcEMQ8Do5DsIv3EgTc92d3Q8nxjw7KEeNMWLrjmNhtv/io2OAIixzxpkm6L3482/fXf6/3lAKds4A+sEhICwPUn5M36ytME+35gCXT21S5mdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790625527; c=relaxed/simple;
	bh=qPI3YG+uWAjJ5HQxXR6TW6QB4Y6yOxV1MaYSQD8eVGc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NrPtV6EZdXBUktLfbj1vcA83jLEYcMvRkQb7BDs8i5uROyT0FeEUap4NmYbfj5M+VmZJwdBotQwgyYsYEJzkKmQbU9PPiIFjdaiZrBG0GgByb4NQDjK/wdJq9Sz3ygk0s05F3IPtfc9U6T5p09xKCHZs9AgnZH2xxnWVCwz5AWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X8sAUC33; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X8sAUC33"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790625526; x=1822161526;
  h=date:from:to:cc:subject:message-id;
  bh=qPI3YG+uWAjJ5HQxXR6TW6QB4Y6yOxV1MaYSQD8eVGc=;
  b=X8sAUC330DhF+zgaOuYWqnZjsk1OBh6aupkml/vdHGzV7wkvE5m3jtZ/
   knsvxcvzvfuMNWXAm9o5PetnM1T1sTWR1Cn4JNDDHylL7LCZxQJg4UNz5
   gCEN021hjysDkaYIrW1eyZrUsZK6v+zGl/6+QEmiBX1KC6VGbxMG07c5i
   jSEiPV8HI/BQyVsCLQpskL3gUshxYpIDlH2W2UngoHkfxA6njs/UonZzn
   /t7RrCMQWIepeaF6tJzqp6QQ2tfrM1AQbEyqbiUse5PLEIQtmzVDl926C
   G6xAEwwNwKp9/aHkdaG9xUVnbhkCy3u5MAO9eXEP9vbm0EcndP8cwmTkM
   A==;
X-CSE-ConnectionGUID: z9RV0civSuSnDdR0ulUExA==
X-CSE-MsgGUID: nEe6XTYpRuOTmr1JBvfCHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="91356254"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="91356254"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 12:58:45 -0700
X-CSE-ConnectionGUID: onOxZpgxRSaS13m3gXVG5w==
X-CSE-MsgGUID: Tk91/darRU6PxTFPyd8KZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="278357047"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 28 Sep 2026 12:58:44 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBHUn-00000000OPr-1ruG;
	Mon, 28 Sep 2026 19:58:41 +0000
Date: Tue, 29 Sep 2026 03:58:24 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:typed-arena 5/17] verifier.c:undefined reference
 to `bpf_prog_arena'
Message-ID: <202609290349.73opUyti-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux typed-arena
head:   f6fd10fe616e1927b9c398a528edc49c6593c06a
commit: 8888450621df54338133ec7cb64dfa0c4483d06a [5/17] bpf: Add the typed_arena_cast instruction
config: sh-randconfig-1001-20260928 (https://download.01.org/0day-ci/archive/20260929/202609290349.73opUyti-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260929/202609290349.73opUyti-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609290349.73opUyti-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: kernel/bpf/verifier.o: in function `release_maps':
>> verifier.c:(.text+0x6b08): undefined reference to `bpf_prog_arena'
>> sh4-linux-ld: verifier.c:(.text+0x6b14): undefined reference to `bpf_typed_arena_put'
   sh4-linux-ld: kernel/bpf/verifier.o: in function `typed_arena_register':
   verifier.c:(.text+0xc538): undefined reference to `bpf_prog_arena'
>> sh4-linux-ld: verifier.c:(.text+0xc53c): undefined reference to `bpf_typed_arena_get'
   sh4-linux-ld: kernel/bpf/fixups.o: in function `bpf_lower_typed_arena_insns':
>> fixups.c:(.text+0x2020): undefined reference to `bpf_typed_arena_cast_insns'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
