Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB51316F8F5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Dec 2024 23:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734218978; cv=none; b=lfpl+wcjf16xgKBmhB/63Q4ehkjbskj1O1UZFr/PduFYrykeObjnKXDdHSeODTo/M6QmpvND3grpnaPeAkSaV+7aZaim1eDxiuGDTTbTziyU/jtvd0GZHWMw4vBf7DdkGTyULc8QAxugINjgpK+eLlETjQBEUj3J3y/6bRZIKh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734218978; c=relaxed/simple;
	bh=iHr9Jp+V+52xHmpOyEqBWJb0t7f6nJzqg1/u5yI4zD4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rF/Fq2iOQm0cItVB9oZt5Cw2jlIszqhan1jBgmlLNSKwSU3doVCms/k2i5zmS9pdUsCaB3WAKDeCNerTIA1Vz2Aq4572Pu9zst6sAm4sI/3uPqWaztSnCrRdrjRJJb7+iE5byXWyEZ5y2KieGfgIcXmT0DFcn7rNP7Bn5THOVik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M8gEryLy; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M8gEryLy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734218976; x=1765754976;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iHr9Jp+V+52xHmpOyEqBWJb0t7f6nJzqg1/u5yI4zD4=;
  b=M8gEryLy4oV78oxIcBJBbgON9nO0rL9ukTo0KBMasCaanbaCFfLWzcMQ
   loK35caCg7n5SZ2InmFXBOIpAiu6kcJw6/a707s0ut3pAh/ESZhljo2tA
   0Zc263N6IbE5tYtufIwBGyBmy+6TdQau+drDqi5G2f0rZN1zHVeNOTRwX
   K38PDoAOAMHl3l7XYdrxhAMnpTQ3xI7hz6gkIbaxoo43deSUXQq5qGAeL
   VnJdakthdXIP/WY+vOBTmnrwyImMtadavBm+eV2HnYP2/XG0J3341eU/j
   BRf4AMWsUB7zan0VcLbycrRyDGUi2kPEU4Q46X2mNbMBO+NCFqwOCKc2Y
   w==;
X-CSE-ConnectionGUID: niV413HWRgaUFdx8VTlRaA==
X-CSE-MsgGUID: NefUiZUFT2y5f28Ek1W7ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="52061450"
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="52061450"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 15:29:36 -0800
X-CSE-ConnectionGUID: yB4TsbcWQFyKZ4KXp6XzKA==
X-CSE-MsgGUID: NT6BDuO7SFCus+2kz4V1/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="97092678"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Dec 2024 15:29:35 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMbZk-000DJm-0x;
	Sat, 14 Dec 2024 23:29:32 +0000
Date: Sun, 15 Dec 2024 07:28:51 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 3567/3764] fs/bcachefs/btree_cache.o: warning:
 objtool: __bch2_btree_node_get+0xc54: return with modified stack frame
Message-ID: <202412150712.ckXXrLim-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4176cf5c5651c33769de83bb61b0287f4ec7719f
commit: 14e92fcec614df0f1b58d6d9012cce58640c1391 [3567/3764] Merge branch 'for-next' of git://evilpiepirate.org/bcachefs.git
config: loongarch-randconfig-002-20241215 (https://download.01.org/0day-ci/archive/20241215/202412150712.ckXXrLim-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241215/202412150712.ckXXrLim-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412150712.ckXXrLim-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/btree_cache.o: warning: objtool: __bch2_btree_node_get+0xc54: return with modified stack frame
   fs/bcachefs/btree_cache.o: warning: objtool: bch2_btree_node_get+0x69c: stack state mismatch: reg1[22]=-1+0 reg2[22]=-2-16

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
