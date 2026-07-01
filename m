Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169DF429DD5
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jul 2026 19:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782934402; cv=none; b=DjJ5Tqv2JkJIiMyVvkMxa1Qdu6GNaUwb/GV1NxZXj221ZitM1nb59tCDx9VawbOWYYKIYfbHDgactsdaPXqmdWrP9gefvnZ+asyVApdBgN2kOIES61UK86NU8DBGd1CkULJ3XZtwy/D/6I9XQN0h3hkrecH5pCnRA9/mhUC8FhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782934402; c=relaxed/simple;
	bh=aBiKW6LUL2J7qE3XCmu+da3RHYOJORKBUv5TPmHbToA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qGyqjXzZvtgtolHSpWOKda9U+uy4HMsDoEZc5SRunMeKVs/wE5nerA5xv1HDktEMjHNSEqn/DgJsvBAdApehCaxgR/JEOtOlfZyWj7KcJy/sjsX9mMquveuMShOrmWYjA3DeNVX90kq1o0fUERaYsXfFmZ0gk0C99YKf5MweS8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZjOgIwyA; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZjOgIwyA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782934399; x=1814470399;
  h=date:from:to:cc:subject:message-id;
  bh=aBiKW6LUL2J7qE3XCmu+da3RHYOJORKBUv5TPmHbToA=;
  b=ZjOgIwyA3fnKNnjDy+BOE9RXGE/tJqqPiLtLlymv0BNo4DpGwAcm5V9f
   GPwmw56DwKxwaU0BAR4rvgjTJ6j6mu0pV6HTM6g5XY7tCfBdVDwWLl2tR
   Iy6eRwrf2JcvUFsVR4g3VHtGX7pfRERc1/ljmkiF8F5QeshP8OMnuZHc1
   5vp4zEBtKyIgS/pIIhwldavvEJ84YNEHD3BaWiDoz7E2Vuj7FxQ14jlAk
   ZasJpxQDcKcJCLyziAUQKtKG96QWbMrND8ydrct1YL+I/UGDMz5QG3y8G
   V/Kjh+55hao+3ep2f5F5W3LVZuiWc8YH0LjexGKUC+2lQ8oC+iqJlMv44
   w==;
X-CSE-ConnectionGUID: S1r3t1o/QU2WL23pRJJkhA==
X-CSE-MsgGUID: KYKFMu/rQySzTxOo1eXsEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="94331504"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="94331504"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 12:33:18 -0700
X-CSE-ConnectionGUID: JEVcIxZjTTuUVmnLeOADZA==
X-CSE-MsgGUID: FsqRqo1/T0qRrczt4WoPJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="253306921"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 01 Jul 2026 12:33:17 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf0gM-000000000rp-2Qlv;
	Wed, 01 Jul 2026 19:33:14 +0000
Date: Wed, 01 Jul 2026 21:32:56 +0200
From: kernel test robot <lkp@intel.com>
To: NeilBrown <neil@brown.name>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>,
 Christian Brauner <brauner@kernel.org>
Subject: [brauner-github:vfs-7.3.misc 9/9] Warning:
 fs/gfs2/inode.c:972 Excess function parameter 'excl' description in
 'gfs2_create'
Message-ID: <202607012123.dtsd9rT0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/brauner/linux.git vfs-7.3.misc
head:   cfbd57798c634d544659b4f1329b3765e04af5ab
commit: cfbd57798c634d544659b4f1329b3765e04af5ab [9/9] Remove excl arg to ->create inode_operation
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260701/202607012123.dtsd9rT0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260701/202607012123.dtsd9rT0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607012123.dtsd9rT0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/gfs2/inode.c:972 Excess function parameter 'excl' description in 'gfs2_create'
>> Warning: fs/gfs2/inode.c:972 Excess function parameter 'excl' description in 'gfs2_create'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
