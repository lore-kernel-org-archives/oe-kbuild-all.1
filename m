Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838563D34A6
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jun 2026 06:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780556101; cv=none; b=riL43gZNs1+tcgQMQPrmbGXmwdyZvWEhKmGJSoZy/nojLM92uBCqLsNZdJbSnjSCrW4NN0FYOqWIl7DtR2kYi+NmLWyB2i6TMcZNjHdCVbI5mODv61ICAivVp/bpkIJGYLJLPRSaY1J5KT0sbfpRRq15XdIDyxZSZuqbBEe7ggk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780556101; c=relaxed/simple;
	bh=AE+/3B6r2rOobB311+A7CxN9ezYA4fVd2np/hi1kLkU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mkm/ybXoxiGWHBiXOBYcXOaydtfMjtA4Vdudyp3F4FLAINupSccztlUvKmvzf4aZttrceTIePk3aPwrvv4mJjnaxcpA/U4l4oSapWJ4jVw2KLgBKQ/kGQU2Fmod+juCsVZSs5+ubxn9UMSSGT1ZQ9u4qYwhUBqgLojPYY4rd/OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AdulGMVA; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AdulGMVA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780556100; x=1812092100;
  h=date:from:to:cc:subject:message-id;
  bh=AE+/3B6r2rOobB311+A7CxN9ezYA4fVd2np/hi1kLkU=;
  b=AdulGMVAbSKDxwgbkdQmmHEUMahN5yPa+GeJtquzVB6MOBHNqR4AhX9c
   uosuA1XsCwx3y/ijz/VxdTldmjOy0G2WXEM5adjyA6lECuwBDERAxdr7I
   W3hTOuUYcQNaA5V2mEoLzZp2sQMKXqpbFHCOx9s9rGQ91umqVVuiSEFjS
   n4fUnmPlMZMk9Iytnhpdber2Obd+3D+jXcdmd5J8UA+0JtLJ04NRCA9e8
   9gieJAaOlqBphsE2BXhMFXbap9V0gNSXZrW3CZJGEOl/gOTfcl49Lj4ZJ
   bnPO/7Mmoz/LE5jWOn2Lu390uN9bdH7CFBx8jV49TiIDWw/ETB/RuBIL9
   g==;
X-CSE-ConnectionGUID: 8/arIu5QTGagpCZFRBRtcw==
X-CSE-MsgGUID: uk0AhJM6Q1aC25KFCnltqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="85230616"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="85230616"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 23:54:59 -0700
X-CSE-ConnectionGUID: p/wBvoKrSwyaZIiu71r38A==
X-CSE-MsgGUID: lA7A2AlESFSUEkLh5wVg1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="268122906"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 03 Jun 2026 23:54:57 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wV1yh-000000002I5-2nWw;
	Thu, 04 Jun 2026 06:54:55 +0000
Date: Thu, 04 Jun 2026 08:54:30 +0200
From: kernel test robot <lkp@intel.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 10140/10263] Warning: fs/fuse/cuse.c:324
 Excess function parameter 'fm' description in 'cuse_process_init_reply'
Message-ID: <202606040822.eavMjUxU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a225caacc36546a09586e3ece36c0313146e7da9
commit: e93b3ed7435f07951473b0ed148e1322b919857f [10140/10263] Merge branch 'docs-next' of git://git.lwn.net/linux.git
config: x86_64-rhel-9.4-kselftests (https://download.01.org/0day-ci/archive/20260604/202606040822.eavMjUxU-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260604/202606040822.eavMjUxU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606040822.eavMjUxU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/fuse/cuse.c:324 Excess function parameter 'fm' description in 'cuse_process_init_reply'
>> Warning: fs/fuse/cuse.c:324 Excess function parameter 'fm' description in 'cuse_process_init_reply'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
