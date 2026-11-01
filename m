Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793526839;
	b=Af2DjQjRq+ZQm30yucndmit0ghP9ILVjsIx7C108sXtdCGBAfA4whyyj4tkMdEXgcTZ5
	 I6aR7RXnl+bAIorSO6I9Uqi7YbTh+l6qCBUntj8yRygsLj+o9ly77SwTJRE1a8L2pyvoT
	 4FQHCvpPFSLSRysG5wQpqetgxvvvEK4LkZ5JalBjuDJCaVMvBpxNiKQdbIkJFBNXgAj7t
	 IbEyeGVTjaGwakO0VL1KZxqUCFFInzw/nrdqUY3G94VDo9EgLF1OLRHhag4ouTqMGwlPI
	 peuFSFSXJJosYYYfVrhnm/MC5z8ccOlejTHsSUmdP6ZV58vIg7Id56OD+DBkTSpU+7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793526839;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=KnQreaOeU3RpDXSkrGhqIbSkeZIP0nVF/eDbV92R8co=;
	b=SvC2ZSOffsBAgLPOteeDFHi8rVbgd7sPuPqrXSpiaUNdERM89hRGzC6+ZS49y5PUbRQh
	 zAHcm/Yrf4E4josGNoWLfIlKpaO3d9wK6yLES3NXSFvq13Xc24WxaKma/gXAgDVzKpU4B
	 Dq/0zSB5A+dauqI3SnmUN2kbqUzTe6Pdjg8eEL0R5U4QxDmH4TeUHGpjmrvcanAO1CAR6
	 E6PacG9yZQPQY5c6ZZtWW7WJEik7vigRQnqwAs/z3u3ckwAL58aRv2ImhTYlLHTDmrvIg
	 zyYKSlqe3sdeKAH0VP5X2WD/d5FczdvzL8lL2LTv/X9+rvnLXetMM/H6SYdY/vRUZQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VaiXPtZ4;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3920F606A324
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Nov 2026 09:53:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3920F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VaiXPtZ4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793526837; x=1825062837;
  h=date:from:to:cc:subject:message-id;
  bh=vdMvsXnW5DtZBsmMhxBcTKamP3jaUoNSDhTd4pMEmW8=;
  b=VaiXPtZ4bJcfCZaunu2ZptBAGBSLkqGcBhhSyv60vGnohXq8gb9LPCns
   UY+IgznYiex4HkVgpoLDGModVNS+FdWNuPHl3I/cNroqx3gTUbP9v35zm
   LYEnZTFf2M/sVuNbiYcLNcaE3wv74A3fmvAzy1/TX+gUqfkgTgySDsqQZ
   2vRzp/xkRMuRQg4YX1s5Yh/DBLkvAoTmPch5sz1NNCkMNMg6cEpdgG9Jj
   06rjHxhCADdQS349+d9rkR35TsTOPyKBjfbn4FspMzy2/t1rTmWh5XPR9
   CxnqBt+RW7D8pMqEwDfScOe/i9cVqT8ZhQbnilMdOjkQubAGocKvTSBud
   g==;
X-CSE-ConnectionGUID: WkUESnEZTw2H77zARVMlqQ==
X-CSE-MsgGUID: 03BO8bNuSPy/3c7e1+t/tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11952"; a="2246025"
X-IronPort-AV: E=Sophos;i="6.27,189,1787036400"; 
   d="scan'208";a="2246025"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 01:53:57 -0800
X-CSE-ConnectionGUID: nT7Zek5hSziTXEngv9/wjw==
X-CSE-MsgGUID: ZgyjXjVsQBW/LbdQp/O6Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,189,1787036400"; 
   d="scan'208";a="6238689"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 01 Nov 2026 01:53:56 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNSG8-000000006R5-49Zk;
	Sun, 01 Nov 2026 09:53:52 +0000
Date: Sun, 01 Nov 2026 10:53:46 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 842/842] kismet: WARNING:
 unmet direct dependencies detected for VFIO_MDEV when selected by
 CRYPTO_DEV_HCT
Message-ID: <202611011054.YGZHix7l-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   72211702f642336d084c9cb7a986b6c351449c6f
commit: d73bf468fe927f96ef15330377aede9344b031b5 [842/842] anolis: Add mediated ccp driver support for hygon crypto technology.
config: x86_64-kismet-CONFIG_VFIO_MDEV-CONFIG_CRYPTO_DEV_HCT-0-0 (https://download.01.org/0day-ci/archive/20261101/202611011054.YGZHix7l-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20261101/202611011054.YGZHix7l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611011054.YGZHix7l-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for VFIO_MDEV when selected by CRYPTO_DEV_HCT
   WARNING: unmet direct dependencies detected for VFIO_MDEV
     Depends on [n]: VFIO [=n]
     Selected by [y]:
     - CRYPTO_DEV_HCT [=y] && CRYPTO [=y] && CRYPTO_HW [=y] && CRYPTO_DEV_CCP [=y] && X86_64 [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
