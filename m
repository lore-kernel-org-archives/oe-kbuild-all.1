Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D9B21171D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 May 2025 10:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748513640; cv=none; b=Vf2U03EHTrCv55ntDFqmGj5+1hUxfBA9i205lMmsj6+GskPbxnFK2cveaRrqHxr3Itzd++jEd4rhqTkuJBLwf3BPE+yD5sS919u5vPOmHYfLWJXealLHu6A5iORWB2RRvROjf8DHr35aHB1W9NXcIsCe65pLV4T+LDay+9Zj3vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748513640; c=relaxed/simple;
	bh=9Ea6/VZqxvFdYq6CvjL16lI/lsmiLJgHp9nbyokA+mg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RyWigmzZ0TTjFIurWTNmSkII+MzVgYjNnyhw9m+cPHfvOe08VUZZUIMvaW17ntBHzUns05dqlJGo9sCVUzaZO3dZM4Ltg4K4dHWSvuAPFyLFeOycXkZxWsuC7gUVQUvc1mGJqZiq+yCmH8sk8w51EUPoMhyGgg3k8jCrAKnlBIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PBrCnNAW; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PBrCnNAW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748513638; x=1780049638;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9Ea6/VZqxvFdYq6CvjL16lI/lsmiLJgHp9nbyokA+mg=;
  b=PBrCnNAWywWTNLjFA+r9OQrLyhAhEKRHl5BNQ3Nc2Vmgzw03y4aynQBj
   nSIfGg70R3BQVjki4SpBv9xNOhm53FZGC1E7pdkBFNVTw0FXfv3P+GS24
   Fr5UBN3EL8zhivr4GWqukQRMnY6c/l7GgSMzLEcpndS/4LRsdgypAy2vy
   lulZtj4zThsgmEOG9baB2PZHtvRMxvOtL2ZMpkHhghpevNWxso9jCkTGr
   /egEmXqDGQNBjRnYo5QwN0Om5dbDY2Zqv1eFldyPZDpbDLXadcWr/X5Lc
   jlgiK5IfWqJh1rapmsKEdMlxIkchFD6mXv4qTDdWyIfpXAy1U1nGyJUHo
   w==;
X-CSE-ConnectionGUID: FJcFLm+HTX+yFycBe6pvPA==
X-CSE-MsgGUID: Wr7apvIITSuJb+U+vqkokA==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50719704"
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="50719704"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 03:13:57 -0700
X-CSE-ConnectionGUID: pNplxHu3T+WsD2AJiF6u5g==
X-CSE-MsgGUID: haEsYqcgS+uEUs68vZ2xjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="148672931"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 29 May 2025 03:13:56 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKaGo-000WYi-0d;
	Thu, 29 May 2025 10:13:54 +0000
Date: Thu, 29 May 2025 18:13:33 +0800
From: kernel test robot <lkp@intel.com>
To: Anna Schumaker <anna.schumaker@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 13797/13944] Warning: fs/nfsd/filecache.c:381
 function parameter 'pnf' not described in 'nfsd_file_put_local'
Message-ID: <202505291839.0DExyOBY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2a628f951ed54c30a232230b5b58349d2a8dbb11
commit: 5b8513a8771adfda17757d4d7ca526620f6f1867 [13797/13944] Merge branch 'linux-next' of git://git.linux-nfs.org/projects/anna/linux-nfs.git
config: m68k-multi_defconfig (https://download.01.org/0day-ci/archive/20250529/202505291839.0DExyOBY-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250529/202505291839.0DExyOBY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505291839.0DExyOBY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/nfsd/filecache.c:381 function parameter 'pnf' not described in 'nfsd_file_put_local'
   Warning: fs/nfsd/filecache.c:381 Excess function parameter 'nf' description in 'nfsd_file_put_local'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
