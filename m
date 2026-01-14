Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA6E36E462
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 06:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768372507; cv=none; b=L5sMznihYO3mN86rCmTKBg35qJ7hcuigMIOika/KtwZCNMIXobH2c9o7CNmyoQMkGHW/p83o7m49hpou3KYFEcptUf17iAGjuUr+IFKFnXq3qL0cCfv9y2xFiaRNBszp/mIpyVsYyHGSg/1m0O5siXgubrvMpn73Tn2FROcPCHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768372507; c=relaxed/simple;
	bh=2WpMQ1pUnrd3aThbmYqQMRXHgI7N51CG1wrtuLbq1Sg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Mod4BRiY5MpNzMd0PZQca9ch/+VMC3juL5IwGQeJKzxHcM9RXD0qxOyO4BRWrQ5EU2mB+F409RRX86lj9KAlqsOFEblSMrH5bt1War3h3xCSnTNTHPz6gFjdpZITyfBB6qTexhzDswaSAeGAj1jRw0BSGSOaIhATb0ozCms+YBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AB/hAJEP; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AB/hAJEP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768372500; x=1799908500;
  h=date:from:to:cc:subject:message-id;
  bh=2WpMQ1pUnrd3aThbmYqQMRXHgI7N51CG1wrtuLbq1Sg=;
  b=AB/hAJEPcKIgPR8coSgdRLTj5gG5YXBRpEhMhya38gdmf1dnxdygHn0u
   T5Jt6vqmb69xkQ0NZI3mC6U4SeMOrmrFH6t0c9E16H6SmBFki1oT1enlH
   +h5eSPvYn4hattRH5i8GW24Ghk/oEt1D8Ao/c4Nxaqv3hPlEtmfSFNboL
   a1BWaheE2MfnnWxMj8yciYyCgD0RhBzKHKXcZvcTAM5JgLEFCXAeNQpFT
   xOqKj/CkL483imuSaXVn9UpLKrhmdRBO+c8tRaDajhgrtGN3+7B6Ze4yZ
   ozSQC6/r73Fzfm3KDOpfzIHPU9r+abbZopu58JI0BpTTHwzL5V4cNNvli
   w==;
X-CSE-ConnectionGUID: x9qsg+RrQRedAf/mcXdC4w==
X-CSE-MsgGUID: aPDCohbQSUafQw8UOO0jkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92335677"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="92335677"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 22:34:56 -0800
X-CSE-ConnectionGUID: BOXMWoLJQJaCEUw4OxpuEQ==
X-CSE-MsgGUID: 3rSw7yNvQKyxXeoR1p/VqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="235843990"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jan 2026 22:34:55 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfuSy-000000001LV-2IOq;
	Wed, 14 Jan 2026 06:34:52 +0000
Date: Wed, 14 Jan 2026 07:34:37 +0100
From: kernel test robot <lkp@intel.com>
To: Harry Yoo <harry.yoo@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>
Subject: [linux-next:master 5764/6121] Warning: mm/slub.c:7013
 function parameter 'objp' not described in 'ksize'
Message-ID: <202601140708.nFPkBzAe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b775e489bec70895b7ef6b66927886bbac79598f
commit: 1e8eb4117f27366855b192104098330a2f290f26 [5764/6121] mm/slab: move [__]ksize and slab_ksize() to mm/slub.c
config: x86_64-randconfig-2005-20250721 (https://download.01.org/0day-ci/archive/20260114/202601140708.nFPkBzAe-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601140708.nFPkBzAe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601140708.nFPkBzAe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/slub.c:7013 function parameter 'objp' not described in 'ksize'
>> Warning: mm/slub.c:7013 function parameter 'objp' not described in 'ksize'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
