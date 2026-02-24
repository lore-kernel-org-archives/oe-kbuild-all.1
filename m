Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19CC13B5AE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Feb 2026 17:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771953803; cv=none; b=JyKzXVL5McMriAB1Hz0pdKzmDp4tj6Ga446HYX7t6yuToIh+M2t5mF1fS6queLhxosoV7GhghWTbfu4g587gaQtloz5cMzMyH8lUdjZk6atBFgXBnievOhYa8GuDjBAYkiPDlrqdUxI53kIztj33/qiNIhm3yzr4ZtloIbLTVdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771953803; c=relaxed/simple;
	bh=1GsVQFCsbI/5fYLXUf+7IuiWTDojz/uG1qjanRv6SbI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HNWE0uZHEyPcDKUP8FUlphl11UEF3jNlhCzryVvexdLrFr+sM3G1YymzA/ng5cYQ7YP4UtgXrPSBdDbH8cH5CNY4Z+8w/sIvKiAF1Fu/srgiqB95FNnNLW0nwGxPSvzuarLvjClMsxrOjBi4BrFpt03Bc21jb1UqseresJ7Kq78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IZqmPLcp; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IZqmPLcp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771953802; x=1803489802;
  h=date:from:to:cc:subject:message-id;
  bh=1GsVQFCsbI/5fYLXUf+7IuiWTDojz/uG1qjanRv6SbI=;
  b=IZqmPLcpWPE7bFOYLObHE4OasJQiXPB208jL0mzv7QAI53198z/TSexJ
   +uUGOE4XmDULlTSCL/QBVYbIXdxJ65aSFrFvFUOiA/sL33RZ2itZ3y2Vr
   v9/mfCB8YjDoaZnGnTfSPb/90oRsZniDN/MI6O70FjbQ2rfzrwbyBSRyI
   wzkeuVP/NMV51YzeSIVDqT/gr6Jn963led9TzsgnsMfxOB1ermhiXipIn
   MGSQD1RNscjiu61+u54syyaYxXVzDrGOyMlMkaO5BE9PRpGntt6l1dxbd
   3nPEx7l8OBfHdZj4S5D8LeUnmySsfuYgQr1NX/W/KllV7A9mTW4Ax2Pce
   g==;
X-CSE-ConnectionGUID: NcipvWVBSSy8Kn7P3unZZQ==
X-CSE-MsgGUID: KdZGoUodQkmnySs/Imd9ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="83689508"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="83689508"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 09:23:21 -0800
X-CSE-ConnectionGUID: CAlFQOJ+QdKMfqpLexoQ7A==
X-CSE-MsgGUID: 78dNOz/hRJuXJLFFihXTkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="214180305"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 24 Feb 2026 09:23:20 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuw7e-000000002H7-36tF;
	Tue, 24 Feb 2026 17:23:03 +0000
Date: Wed, 25 Feb 2026 01:20:28 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Coddington <bcodding@hammerspace.com>
Cc: oe-kbuild-all@lists.linux.dev, Chuck Lever <chuck.lever@oracle.com>,
 Jeff Layton <jlayton@kernel.org>
Subject: [cel:nfsd-testing 29/69] ERROR: modpost: "__crypto_memneq"
 [fs/nfsd/nfsd.ko] undefined!
Message-ID: <202602250104.IwFsHK6w-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-testing
head:   70a2007855af80c48aa0cc86ad2a1c50b907e37b
commit: 35a0423a2954050da493296010d5c57e0d76f8bb [29/69] NFSD: Sign filehandles
config: sh-landisk_defconfig (https://download.01.org/0day-ci/archive/20260225/202602250104.IwFsHK6w-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260225/202602250104.IwFsHK6w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602250104.IwFsHK6w-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__crypto_memneq" [fs/nfsd/nfsd.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
