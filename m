Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437E91A76B1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Aug 2025 19:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754507375; cv=none; b=UBC52+cmzelxj4p2s8HT/GRBYfJ8qGb76/HJeDm2GA1l9AxvjvYPxYVJSwszrlys16+UqLAwT5/5yryftLysovkkRVCVrQLivZJLZVhC6Jdgsb1PukHD+xwBqLFlZ4EAR+Wvh39uiqIwUjyF94DVx4IqfcgwExVdW/c5Sh11ay4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754507375; c=relaxed/simple;
	bh=Hqy9ZRrPts4ryD/ca6o1mbNFXSFbVT30eYFybHK5JwU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fb8lEe9PW0eFpW6KcnitRWp1zExiA6uLODqnLiCPLnRlPJXde3+3wG+NHmIfAyQjaKMULgGZOpkhfcQmgDyA7mlJuucw0bm2o5ANnKyItG+WwZGrLavczmqqUe309Nkrti9Zpc9mUB09ahdDU/UD/0b/N19TK04BHyGszU2AeYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D/gwSRDS; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D/gwSRDS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754507362; x=1786043362;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hqy9ZRrPts4ryD/ca6o1mbNFXSFbVT30eYFybHK5JwU=;
  b=D/gwSRDSlCGFsz1FTd6+jGpr0owMoozCrSXt+rcHrITgHoCQcjpFeHnT
   UK1WmgD1pQ/I3f/7I5ZbQz2u5Dh1mKcKaIZQKW+EQYBIn0PVAj5qPIdjn
   2xqfqhlR7JoQH5g8TolB/MpS8oAPnTDhulEl4+TgrrPZISgQvuhBna4Ic
   cHcHd1qrsdqHHbok4+UB4O+2WTyjtzwMz2EZpXR2rsPWRQTsQXrtiGRoa
   C9aio8LRTEi4z9u7z03SPCT/WWc/sHxXt6rxwNtZk9pWfXEBrFe2HTjQD
   JK255BbZ915vR2WlDC8UaHUdd+onZKDQHD996s6q4LbT2fo4MvlMxT0/R
   g==;
X-CSE-ConnectionGUID: 3190pVEOQzeu6brptUNsXA==
X-CSE-MsgGUID: gbdp7UNZQNahLBqduG/YQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56753217"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="56753217"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 12:09:19 -0700
X-CSE-ConnectionGUID: HeaDztsRSJ2owpSpxF/aEA==
X-CSE-MsgGUID: 6xYkHaQESSutOvjQWtMbQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="165650177"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa010.fm.intel.com with ESMTP; 06 Aug 2025 12:09:18 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujjVk-0002El-2K;
	Wed, 06 Aug 2025 19:09:16 +0000
Date: Wed, 6 Aug 2025 21:08:18 +0200
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [smfrench-smb3:ksmbd-for-next-next 6/7] Warning:
 fs/smb/server/connection.c:53 function parameter 'inet_addr' not described
 in 'ksmbd_conn_alloc'
Message-ID: <202508062104.gxD7SHZT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/smfrench/smb3-kernel.git ksmbd-for-next-next
head:   e93cacc370af1638851fe447da90438f954b8de5
commit: eebc2ac55b40f0829837e5c986e6d26e7bcd73dd [6/7] ksmbd: replace connection list with xarray
config: i386-buildonly-randconfig-2001-20250806 (https://download.01.org/0day-ci/archive/20250806/202508062104.gxD7SHZT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250806/202508062104.gxD7SHZT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508062104.gxD7SHZT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/smb/server/connection.c:53 function parameter 'inet_addr' not described in 'ksmbd_conn_alloc'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
