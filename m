Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6F521CA03
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Sep 2026 10:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788605022; cv=none; b=dXTEkygYoQICwaKqAtotv5XCHY0j2e3Fxvwahw2P32L4iq37KvYPTPp6p4RiuPBFiDpEGeNpxkw0wvJXa2w3n/lVnt5+KngXev8Rehbod58h5wWVo8nDRaZ7oOGCq4vSccMH0doPg2bceofdt0lZu0fceRl9PZDsHuS+tyxOkP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788605022; c=relaxed/simple;
	bh=jXA5L2zxEez3mHF5vZ9USQlGkY+x4/8JgRcRVlPqSnY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kUbat5asASuRCy+QpFgCTAsll01u2Nd0oywvtTugdaDnUikqSoBIk7vZgbn3rAAiaSKfqDO1BxrnUuqcbllbnjzt6TkJhk0XVMU7tPH1ZXLLfeJXPfcD0VZaXDw5DMkGL+F2Kk/IQYpdOagY6Vzu11gogUDOdS+0IcBCf1RtkSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lV7dmYWw; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lV7dmYWw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788605018; x=1820141018;
  h=date:from:to:cc:subject:message-id;
  bh=jXA5L2zxEez3mHF5vZ9USQlGkY+x4/8JgRcRVlPqSnY=;
  b=lV7dmYWwxbsZKltRBMfa/6b8Mb+8g4m76L2JBJl4FbYnA1Eik++GJ/VS
   eKuhicnjv3P44nY78KDuq9cQG7u7nA0WB0peZ7j+KOYuF6ECxTQ7go3aA
   GCmdtiAD/G4dlXeo9V4fIO6GnaoZ/I1M9IE4dyX+ks+Dco6hx7+mFW0zA
   fW7TcEU7ut0gDw9eUwakKRu4hnDBD1VPTGTBDcCB27U7wBpVqtvx7E0C+
   am8qISGnuHHHhBUjSZ+cTwK5LU72IQisbex23i42l5vECvJx+lu1IljhJ
   6ckRB3h/wyB7ooAVVvTciKVf2jg+g1vLbr5wOgq8dsoAbs5O8WuO5Q9Iy
   Q==;
X-CSE-ConnectionGUID: 1E2j4JBuTPWlY2ZWMGGnzA==
X-CSE-MsgGUID: fvf6hDxjTja+aVsu7GLVYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="88234783"
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="88234783"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 03:43:35 -0700
X-CSE-ConnectionGUID: GdktXUjYRe+jSCVX/eOsxA==
X-CSE-MsgGUID: 0ZO6q4icTr625Hk5MLUqkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="269761874"
Received: from lkp-server01.sh.intel.com (HELO 73f3364bc37e) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Sep 2026 03:43:33 -0700
Received: from kbuild by 73f3364bc37e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2nrv-000000000Q3-1Itw;
	Sat, 05 Sep 2026 10:43:31 +0000
Date: Sat, 05 Sep 2026 18:42:35 +0800
From: kernel test robot <lkp@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [linux-next:master 3968/4370]
 drivers/gpu/drm/xe/xe_debugfs.c:48:1: sparse: sparse: symbol
 'inject_mempage_offline' was not declared. Should it be static?
Message-ID: <202609051831.TerdjESg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
commit: 6ef3eb10aea4260f752c06489a5369c2b67848b0 [3968/4370] drm/xe: Add fault-inject based VRAM page offline injection
config: i386-randconfig-063-20260904 (https://download.01.org/0day-ci/archive/20260905/202609051831.TerdjESg-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260905/202609051831.TerdjESg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609051831.TerdjESg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/xe/xe_debugfs.c:47:1: sparse: sparse: symbol 'wedge_cold_reset' was not declared. Should it be static?
>> drivers/gpu/drm/xe/xe_debugfs.c:48:1: sparse: sparse: symbol 'inject_mempage_offline' was not declared. Should it be static?

vim +/inject_mempage_offline +48 drivers/gpu/drm/xe/xe_debugfs.c

    44	
    45	DECLARE_FAULT_ATTR(gt_reset_failure);
    46	DECLARE_FAULT_ATTR(inject_csc_hw_error);
    47	DECLARE_FAULT_ATTR(wedge_cold_reset);
  > 48	DECLARE_FAULT_ATTR(inject_mempage_offline);
    49	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
