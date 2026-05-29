Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9093C0613
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 May 2026 09:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780048360; cv=none; b=S1yi9YOOvabdeKNAAUl32tNCb7ZCyI3DAE5GzAMRUpZuwHaY5weRLU7HB074BTS+rmwXYwNgOlUP3gT1Cszp5o43C5QPWr25deFN41AVDVX46sqX910s0hQ051bG9+qr11EYqSYp5+EryfmV3pD1LyUr4IKOeAiw2/A6wvcWZTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780048360; c=relaxed/simple;
	bh=ck9JID+OU0b9TcMOwwP8J6YZEgRKtvBtPTyFrEazzV8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z9e4gfPrEe3gminsZBnb6AmdsAYO+3fCJZ7F/VmrIsS89Swfq6rB9ddieoT1gys0bvMnTexo2QQMMN95cSNNWgUPRv05Ctw0xgwP4qx3GPV/kEeE1kpoDr+ceWkkgqfUmg2nGxX3fnGNjIjIAitMN2jtKwbAGR4csvsxhFEjvRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jja+RisP; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jja+RisP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780048358; x=1811584358;
  h=date:from:to:cc:subject:message-id;
  bh=ck9JID+OU0b9TcMOwwP8J6YZEgRKtvBtPTyFrEazzV8=;
  b=jja+RisPSXCBrl5BaPvpCThwbPz9b9ZsbcwYDjs+I5JwMXOt7Hxi3N9C
   CJ+gFnh/m0UfDoyBZTFi6A3+0bjBfm6eNCbEIRV/yuwIEy5Nvsxr0xUvq
   xxQz7le37KFwgKn12up6hz3DaI2uKRZ8dKLAs6d4wsaOdjIp0wdGBmWkw
   y5a/2XgLbqmSV4ibDsHERHYzAZBl09lxoz7UT77vqopRPFYVhu1nVmY1x
   akYVZWjr7CnDgx25iS8JlborfBWMmq082mFYyi4++Rl0rutRQSy475DIK
   AjAVBILbnoKciOE6cDEhQdZogo2cmrkVb4nqqweJ3AJbqNaL4ZRGRFrSh
   g==;
X-CSE-ConnectionGUID: RxTlytg2TtCDIJUr9JF+9A==
X-CSE-MsgGUID: qqdPnEQZTkW10oCogKnXPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="91583907"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="91583907"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 02:52:36 -0700
X-CSE-ConnectionGUID: ndmyYakyTIOQa1vne2FB+g==
X-CSE-MsgGUID: WI0H80itQDyAeQrzCVjqOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="247900339"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 29 May 2026 02:52:34 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSttI-000000000r5-1MJg;
	Fri, 29 May 2026 09:52:32 +0000
Date: Fri, 29 May 2026 11:52:10 +0200
From: kernel test robot <lkp@intel.com>
To: "Guan-Chun Wu" <409411716@gms.tku.edu.tw>
Cc: oe-kbuild-all@lists.linux.dev, linux-ext4@vger.kernel.org,
 "Theodore Ts'o" <tytso@mit.edu>, Chen Hao Yu <edward062254@gmail.com>
Subject: [tytso-ext4:dev 1/5] ERROR: modpost: "ext4fs_dirhash"
 [fs/ext4/ext4-test.ko] undefined!
Message-ID: <202605291142.INrrPtVc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
head:   87280ac61ae6ef27fc6ee78b733689754e425592
commit: a4841d91a7f57d38d3a63c18b4ce68ee5e06829b [1/5] ext4: add Kunit coverage for directory hash computation
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20260529/202605291142.INrrPtVc-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605291142.INrrPtVc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605291142.INrrPtVc-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "ext4fs_dirhash" [fs/ext4/ext4-test.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
