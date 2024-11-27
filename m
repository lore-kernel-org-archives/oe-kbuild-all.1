Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68353200BB3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Nov 2024 16:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732726374; cv=none; b=toMoTb3SkRMMHAwdO+LrfpTtAOKj7nkIae+VRGjxMaGaDPXrxyIcss/GGJ9O5cUQ5xPyr+nM8N1hCGjJ8avDR/nr/hkq9xmQ2E0n+Hq8ZIDt2Wp9ZbPT/8m660HfiwFqm/3Aqf2vE6eTm5cAjFgjBVyYtnwkh1gBfMHaR7+nWLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732726374; c=relaxed/simple;
	bh=tG3Du9WkLxVRWLxqCHOORjzivhWmDRn7fpcFfQYdZyw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q7vy+cnqQEOj6KeHmj9zfUdUqL5LsVOP+UDRsI3X8RNa/0/17BGwqepAiE4I9git08cSF00+yvKcKo5+5e5kvdCFTiyJacDHK11qqqJdeFpkMoryJCaclWOBFZnoIywVWqqFiTFaZUq4zsl+r6cUDrZ++3LyLNnE4uGOT6CwHio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZwwDQNOs; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZwwDQNOs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732726371; x=1764262371;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tG3Du9WkLxVRWLxqCHOORjzivhWmDRn7fpcFfQYdZyw=;
  b=ZwwDQNOsoqwNFXqz7nB1O6teaEVNJmeu9Db3L5ko+GpC3f98dubEByLE
   zOEneXBf6lLcDFpvbdDDp7+vjBdreMd+ofyc0QpYRfN5tCyMSJuH3sno2
   gALkV5sa/FHL9it9wH8eMcJLkqpSIcrHz+RyHT9q0qUJVBeJkPLEtRW9o
   9w3KKRTiZms9BkBup0SSV4K0es14QytbSKP6zMYyFh6O7GDbQAnYAwyG/
   h3+Wupw5gYrkYH3EXp5zeW+dIHO5K/CzbjYh2EAeGX5yXIUgCp61qrnpe
   pCp72Ppz0VEtmWW8mrDfilfams88ZZ7sFJxGb2f9rJnSEmaDcembHEuC8
   A==;
X-CSE-ConnectionGUID: UXa52rRVR8O0yaBkxnXGSw==
X-CSE-MsgGUID: 0ramRvi4QjuBjRtD7JVQ3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="44319674"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="44319674"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 08:52:50 -0800
X-CSE-ConnectionGUID: cnAt4cbnQ5ubMdAHi2ComQ==
X-CSE-MsgGUID: WnibZDVGQee/KaEDdrzBoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="96750877"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Nov 2024 08:52:49 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGLHT-0008As-1F;
	Wed, 27 Nov 2024 16:52:47 +0000
Date: Thu, 28 Nov 2024 00:52:32 +0800
From: kernel test robot <lkp@intel.com>
To: Marcelo Dalmas <marcelo.dalmas@ge.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>
Subject: [tip:timers/urgent 1/1] ntp.c:undefined reference to `__divdi3'
Message-ID: <202411280033.x5N0rMoH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/urgent
head:   299130166e70124956c865a66a3669a61db1c212
commit: 299130166e70124956c865a66a3669a61db1c212 [1/1] ntp: Remove invalid cast in time offset math
config: m68k-m5407c3_defconfig (https://download.01.org/0day-ci/archive/20241128/202411280033.x5N0rMoH-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411280033.x5N0rMoH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411280033.x5N0rMoH-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: kernel/time/ntp.o: in function `__do_adjtimex':
>> ntp.c:(.text+0xda6): undefined reference to `__divdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
