Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A4736B903
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Aug 2026 03:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785901191; cv=none; b=Le5zjSzAgZNGUZOvBHA3LEXxF9vBipOt7Tz7i/iq5O2pPovVlpAG00waMNthD93EqtG+trr29a+G7vp6XH9/kG69XxprqTC+sx4WBVRdHG8ikulCLQ3eQOUsb2Co2u8G83LK52krs9yrpaFWETFReO2tBCrdcUnTgU/tIEQDX2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785901191; c=relaxed/simple;
	bh=0WvXidHaYkSewizotON07HHHzRUJMbdpoT9iQzP2NiI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ahZP9nD30hnyLGgSUTsTMTT1ZGbkcP8x+9WgZPIsCgl8FabOf7fk2N4wGmeaUek3EwQuPecdDx9sifNaVd82yMWYEl0NxUvKcxLc7UPcweR4roeQo9slMC3Gyq2mMNqcH9F/w/+YjhPM3eUnfcxJlh4DzDr93bHCitoehgRIaxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QQFgYBMS; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QQFgYBMS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785901190; x=1817437190;
  h=date:from:to:cc:subject:message-id;
  bh=0WvXidHaYkSewizotON07HHHzRUJMbdpoT9iQzP2NiI=;
  b=QQFgYBMSEfn3+05TJEf9QZ3iQczCNwyyTnsCX6dJk1IAeEbdT6EDgFeC
   /d/7MNWyQsPj74ZzjkURMhCDG/LoH+kM09niaNwDeL/RVC1PCDmm85atO
   pZwgS5CJK8nstrbKP5BdvjMwS0bO/9SfhojK/OootSE22JggGgVKA5qhM
   5ZMPqpC53lKZVtwYRFJp/rm4SD5dxbljixhQjPu+9h8IiNM5NNthszlWv
   oYV8ND1DPkxtQvBPzqoq4IefiCT086OVs2P13brb2xMqwDnJ1wy52nafV
   VJwWQETIx8Qz4Jc7D0fphgsrMMDSAry22DHMzSROCb9/tk9f31iSCIG1k
   A==;
X-CSE-ConnectionGUID: MnMvC5+wSrimScu0Z6gxQg==
X-CSE-MsgGUID: 5hMw1wn8Qk6cFGW3Y+p2Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="103869224"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="103869224"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 20:39:49 -0700
X-CSE-ConnectionGUID: lO7olPH9QbKm65lXbRZI4Q==
X-CSE-MsgGUID: DF9uz60eQTCzWX7Tvold9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="266810268"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 04 Aug 2026 20:39:48 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrSTp-000000004KM-2Eff;
	Wed, 05 Aug 2026 03:39:45 +0000
Date: Wed, 05 Aug 2026 05:39:12 +0200
From: kernel test robot <lkp@intel.com>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:asoc-7.3 14/29] Warning:
 sound/soc/codecs/tas2781-i2c.c:1018 expecting prototype for
 tasdevice_get_capture_profile_id(). Prototype was for
 tasdevice_set_capture_profile_id() instead
Message-ID: <202608050558.rvtOuYxw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git asoc-7.3
head:   be80e848c15a47805759afd6854dc30be26988f9
commit: 431c15610d017a470e488284c3b8f977f35e3309 [14/29] ASoC: tas2781: add capture_profile_id field and update the tuning_switch function
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260805/202608050558.rvtOuYxw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260805/202608050558.rvtOuYxw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608050558.rvtOuYxw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: sound/soc/codecs/tas2781-i2c.c:1018 expecting prototype for tasdevice_get_capture_profile_id(). Prototype was for tasdevice_set_capture_profile_id() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
