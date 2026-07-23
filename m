Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3853DBD44
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jul 2026 07:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784791199; cv=none; b=pGUAPFcSPvqWiNbp7O8KA3vtlfIetCEEitKXxP0DJ80iK5F/aWIkdDOkNhr8o4crUbeJ0qYZKjK9hGjsflemZLJl8o833Tw/PbNsnikdVb66rcC+oQ5R1UW57HDm1YupRtmkxDNWCwptOkeKFY40AZSgZb8srdriwQ6lmTCT0i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784791199; c=relaxed/simple;
	bh=mRf9J113/FYbKCrThM3Od3icURL2htJSQX0pASjZToU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cgTTERCaCG7DWneVvWbtqPAVIE8WxHsG596y7rXy5U+2xpw0+b/Gdkn4DdGC0AD5L0e7nF8KjwaBWl8cY9PF4vBuY4Z31BtUTj+8VuFKcfZuskM9BPnGhaEtli3j96s8gyvJVdcKEhzQ2OGcKJ2v1nbzxPvay6MEvz1xvk7g4uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IYEDMhWs; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IYEDMhWs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784791197; x=1816327197;
  h=date:from:to:cc:subject:message-id;
  bh=mRf9J113/FYbKCrThM3Od3icURL2htJSQX0pASjZToU=;
  b=IYEDMhWsqOfuFba0C4FhNjCtJdSvqaiytmpyQwMAl8Leh7j6cae7nSUd
   8ucP3fyC/0P2KGAN2RkMNpg0MgSDfY851PUhC7dpXQoXxmHdzhDplx4cq
   FlC/uQvDY59WfYS0zebQx5jWvXopwg5JpXw0bYi8hGj6m4mpwmB2rFLSj
   aFvnChvOvDPF0WiR3UOzNG7yUEmeQB12yHeHueie/EqInGib4Sp+BQ373
   +8qtmwBujk/NZJz3XmfmBJs2Pi8viDoJfZLl/Q2Q6lDtXRc2RH/Kzo9LE
   4fKU87ZKf4GW+eU/VWFRywHnfVEgIQJ+iN5GkE+548uomyZdfddXqAkpB
   A==;
X-CSE-ConnectionGUID: RywTxGUOSt2ASKJafKn8kA==
X-CSE-MsgGUID: lyyepJubS3uRC3ysPSsQwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="102985871"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="102985871"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 00:19:56 -0700
X-CSE-ConnectionGUID: mEE8BhT9TZ6sQiQqDcsyfQ==
X-CSE-MsgGUID: E/p998O+S9OuyjawE6kM0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="260289472"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 23 Jul 2026 00:19:54 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmnhp-00000000ZR2-1UcB;
	Thu, 23 Jul 2026 07:19:01 +0000
Date: Thu, 23 Jul 2026 15:15:48 +0800
From: kernel test robot <lkp@intel.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Christian Brauner <brauner@kernel.org>
Subject: fs/pidfs.c:99:1: sparse: sparse: symbol 'pidfs_ino_lock' was
 not declared. Should it be static?
Message-ID: <202607231547.ehCQxi0L-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4539944e515183668109bdf4d0c3d7d228383d88
commit: 87caaeef79950377b616f3ba2265a82742cb9583 pidfs: implement ino allocation without the pidmap lock
date:   5 months ago
config: i386-randconfig-062-20260723 (https://download.01.org/0day-ci/archive/20260723/202607231547.ehCQxi0L-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260723/202607231547.ehCQxi0L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 87caaeef7995 ("pidfs: implement ino allocation without the pidmap lock")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607231547.ehCQxi0L-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/pidfs.c:99:1: sparse: sparse: symbol 'pidfs_ino_lock' was not declared. Should it be static?
   fs/pidfs.c:336:13: sparse: sparse: context imbalance in 'pidfd_info' - different lock contexts for basic block
   fs/pidfs.c:931:5: sparse: sparse: context imbalance in 'pidfs_register_pid' - different lock contexts for basic block

vim +/pidfs_ino_lock +99 fs/pidfs.c

    98	
  > 99	DEFINE_SPINLOCK(pidfs_ino_lock);
   100	static u64 pidfs_ino_nr = 1;
   101	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
