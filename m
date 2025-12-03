Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F197744C8F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 06:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764743242; cv=none; b=HL49klp2Vg/tSKsD/9wVvfI21YnGExM3kHJHoRpjzeZzuPlxKv5mppDYqLAm5E1nIa1v/EpijqyjpH3qU0UQmvhiA0d12UoSD0ALzY8Gr1zuKaddeu19nb0RVOQT/kmir/HULrIp81Pq25hRGCkjqDW81uB8oIGWNtQcizsNhyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764743242; c=relaxed/simple;
	bh=PI8RiqB8hnJjYuHw9NU+wJGYLgIHiKVgdS5CqSg+SqY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qrJRoYaSGxocKu0ajgpEBzdSkj6n1Vt5mEKND6c10ooVqZC1Qf+waUHE4HdAYJd4G7kJOaHr2J+9dCe0YNXaf3RS/SbCGgS14sDxywHA0Fe2gKN2dls5jyzQ/NdEaZtHQEFvm65Zq5QSiao9aX2gdTlF6xdDc9YBBf6aDB8lXvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C//P2Cpm; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C//P2Cpm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764743240; x=1796279240;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PI8RiqB8hnJjYuHw9NU+wJGYLgIHiKVgdS5CqSg+SqY=;
  b=C//P2CpmVSTTNP/Mp4/ape4KlpfJSX2zFTkBUAmS0l5Hdg8++WHS1/oZ
   vVqm1NTqvJP1r4P19/PHGiyaCsqnZ/F17J5kSNLfBBc65jJr/H36z/lb+
   or4jgzm4wvRazJ893h97uCifbMZMxwF3m0Odig0t4oGcNNQjpSJtCML8c
   x8LsDGPmz4ynL3W+nrEvsG/sVlQme8ikJL4JPXm/e5kXgkNQpMgdoI4b1
   R4OI4z0PNTb1p7Clgky3vJhptT/BJcvqw3Bw1OF7UOwk7P4pNPoSk2kms
   5NdAOVWNhioscev18eKVXnlQ/FkOFF0ptBPdo9iyaouZgASHMq7B0xtgC
   g==;
X-CSE-ConnectionGUID: K7SqD8cPQwqrAeKtX+Lyww==
X-CSE-MsgGUID: sB17XoSYS4+IxvPM4q+bnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66688794"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="66688794"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 22:27:20 -0800
X-CSE-ConnectionGUID: lHBOpD2tQeucMpUbpmnSkg==
X-CSE-MsgGUID: paFI+krKQwCBua+yRwXakQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="193870642"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 02 Dec 2025 22:27:19 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQgKa-00000000Aet-1exd;
	Wed, 03 Dec 2025 06:27:16 +0000
Date: Wed, 3 Dec 2025 14:27:11 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 1/1] mm/memcg_zombie_reaper.c:47:6:
 warning: no previous prototype for 'memcg_reap_background_set'
Message-ID: <202512031456.hDWmVDyg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   6e491b9f54ea3245a5c167b19e48c0502cf7169b
commit: 9d805ccab1e8f43af37cb84b5795c7501e772dff [1/1] anolis: mm, memcg: introduce per memcg switch to reap zombie background
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20251203/202512031456.hDWmVDyg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512031456.hDWmVDyg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512031456.hDWmVDyg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memcg_zombie_reaper.c:47:6: warning: no previous prototype for 'memcg_reap_background_set' [-Wmissing-prototypes]
      47 | void memcg_reap_background_set(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/memcg_zombie_reaper.c:53:6: warning: no previous prototype for 'memcg_reap_background_clear' [-Wmissing-prototypes]
      53 | void memcg_reap_background_clear(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/memcg_reap_background_set +47 mm/memcg_zombie_reaper.c

    46	
  > 47	void memcg_reap_background_set(void)
    48	{
    49		reaper_kthread_on |= REAP_BACKGROUND_MEMCG;
    50		wake_up_interruptible(&reaper_waitq);
    51	}
    52	
  > 53	void memcg_reap_background_clear(void)
    54	{
    55		reaper_kthread_on &= ~REAP_BACKGROUND_MEMCG;
    56	}
    57	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
