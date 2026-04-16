Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E7638D6A9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Apr 2026 11:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776337486; cv=none; b=ZNpGXdR41G5Hnmz0ZiLzEUkSANiMt1wDIEAXATtsQ2DtRvNzHpPiWGndLL2ZmzKqbE/oCINhqmISUBtYWi4W+lqQrZw1TahP03ksj0AT7GgUw3Hee4VxUePrzrq63oYKisQ3XPvlj0UrVdhWszmYfgAnISw1b3nGYIl/zMTUawE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776337486; c=relaxed/simple;
	bh=3A7UG/Ou58Y1/v0ATqJDYa05LcALVbck9qGZ74rblx4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Wusz6nACY7/o/oLBXuC1mDuLfWhZupL55N6XODFAh9ZBpfS7N8CV1fk9Bb5V5OvhQfo5pt5MQHO1D+dRwVh03sHkK9pEzsRDw55xrgKQUq7PDpTKbwIBdt2H489z6MGiK18pI6EnUcfAB6N+tj+YrhrRRcA+rx0fjn7EMSPZFBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i63Jq1VZ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i63Jq1VZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776337483; x=1807873483;
  h=date:from:to:cc:subject:message-id;
  bh=3A7UG/Ou58Y1/v0ATqJDYa05LcALVbck9qGZ74rblx4=;
  b=i63Jq1VZFXPmgAVtCMU8iHWDKZjAWTcIIqPzeDKCBtVWYsq/daLETvMm
   bjv72h4kHxd7KFIN93uGmIbQ+OBMkK7HrLOQNJl/cHVcM4AhAMp319lC0
   MSrRFht5X3Un8ZE55la1aGY0IAhgmpiWUYpY7P3+1TzzaO3et/QcapXa9
   XY7809vzZgJwKdepovHA2+bRAa8gNNP04I87H32lHpIBy8UFemyMewOI1
   WzMEbEQl2634SKMNgXcv5Fnygz2Tl0stf8BXoUXjAXvh3TbgKdTUU2mDx
   PqnmvE0eZ3rWAuzRCKNyBuxhoxO17ClzRTes6FAk1Plom8rwDUfkoA9/1
   Q==;
X-CSE-ConnectionGUID: Vsa5SJWkTNiBp2EN7Pev0A==
X-CSE-MsgGUID: nnXugGwhRquhDExinZpOAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="94738379"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="94738379"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 04:04:42 -0700
X-CSE-ConnectionGUID: sX/KnZ3fS0e3zIZuVyQ1jA==
X-CSE-MsgGUID: 05JJEo9XSTWVEenmMxRSIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="232443267"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Apr 2026 04:04:41 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDKWU-000000001VW-38Ix;
	Thu, 16 Apr 2026 11:04:38 +0000
Date: Thu, 16 Apr 2026 19:04:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Anna Schumaker <anna@kernel.org>
Subject: [anna-nfs:dir-delegations/client2 138/155] undefined
 reference to `nfsd_handle_dir_event'
Message-ID: <202604161805.TPBWQK9M-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.linux-nfs.org/projects/anna/linux-nfs.git dir-delegations/client2
head:   3c8c0b59c6a78d787961c27e97a799a2cf869a5c
commit: a1688a35e37412260eb026ae5c907ceff654725c [138/155] nfsd: add notification handlers for dir events
config: parisc-randconfig-002-20260416 (https://download.01.org/0day-ci/archive/20260416/202604161805.TPBWQK9M-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260416/202604161805.TPBWQK9M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604161805.TPBWQK9M-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: fs/nfsd/filecache.o: in function `nfsd_dir_fsnotify_handle_event':
>> (.text+0x11c): undefined reference to `nfsd_handle_dir_event'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
