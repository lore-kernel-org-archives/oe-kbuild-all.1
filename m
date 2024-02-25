Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312DC17BB3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Feb 2024 06:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708844067; cv=none; b=a5kpF5As0p4BAm8Uz5I5hjx0cti8g6cjEHuZO1veNUXi9hGMscrQjsNtOcdIxGaCc0a+DqbnEiKQuNntL2S+CO648ezU2HVAUNuvNG+YfI0XjeUgoNglGu2H9fbBG+sZ42ZhuB70KSlHV6e/3iRCqoHKnqaBfzVEMhmJStsmEZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708844067; c=relaxed/simple;
	bh=M+IXnKwLwifO3H24V42Iopvkthh+Lx+h7amy8APy7OI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rDN5fNfwhAUCbpemfCJs9V1jPIbO20vj85d63RtQ/MGIcisXORIxpHxcBBsLbvzFh4oZlwjyyGEnh8cZArFmxXrvh79WZBupE2a6Qulxg3zZqWWoLcXuo41phVFo3e6o56izDTT7jzoTrFi6KDNNA/KlhiJpcj/L+J2Ddd8oPvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MpRWrOe5; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MpRWrOe5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708844065; x=1740380065;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M+IXnKwLwifO3H24V42Iopvkthh+Lx+h7amy8APy7OI=;
  b=MpRWrOe5YWWaM2SXcyYsOhQJJRRCtln0zmEnGXTBDUOXT66CqhmFiz9m
   Xp1HSbi9ZCOhZJI5+9ZKcj1k3UOHLXs9FgoWqPAaHABYVtM2mbQ8d+8Bp
   iQSMb9avIJKfLU27EFsjMdG+MRPLkDi5a2oi1IUCOBNs1+y2MCRlq/cmE
   Kl+pJ23AMXhNC9B0wKpmolcDQCN/ZicO8GKNnnjuZmp/0exTd39FPebyW
   Z47Jeae6bAZCmY6xjbt7oTrKpk8MHhujUGGjjyXxcGkUEsO+bO1RNR6Fv
   4tbgqQYB4e5O4L/2r9IAyKCDg8OguqQPB3fx4pziy45EPQnS1FalZ2HPC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10994"; a="3291640"
X-IronPort-AV: E=Sophos;i="6.06,183,1705392000"; 
   d="scan'208";a="3291640"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2024 22:54:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,183,1705392000"; 
   d="scan'208";a="11007239"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 24 Feb 2024 22:54:23 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1re8Oz-0009Ni-03;
	Sun, 25 Feb 2024 06:54:21 +0000
Date: Sun, 25 Feb 2024 14:54:14 +0800
From: kernel test robot <lkp@intel.com>
To: Zhang Yi <yi.zhang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [riteshharjani:ext4-iomap-v3 33/40] ld: fs/ext4/inode.c:3621:
 undefined reference to `__divdi3'
Message-ID: <202402251437.VwsNPlaF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/riteshharjani/linux ext4-iomap-v3
head:   9e716d325090913e86881adce749ee351757232e
commit: 0270bb5b6bb6e0a43a4edd72e6e0087cba6ed650 [33/40] ext4: implement writeback iomap path
config: i386-randconfig-004-20240224 (https://download.01.org/0day-ci/archive/20240225/202402251437.VwsNPlaF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240225/202402251437.VwsNPlaF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402251437.VwsNPlaF-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/ext4/inode.o: in function `ext4_iomap_punch_delalloc':
   fs/ext4/inode.c:3621: undefined reference to `__divdi3'
>> ld: fs/ext4/inode.c:3621: undefined reference to `__divdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
