Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2A6B673
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Nov 2024 00:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732150143; cv=none; b=CFDw1Le7Z8nF2+Tey/EC3Y9vyb6KaQ82qgC6kgglhevnmU2aALpkc7+iwlK4I10QaY+uc2eQxBR+teGF79WFHA3918B3VwbzfpH8kUM6VBMKkWYrSmDcO/WtDFcTTkOs5YXAdE0LoO8K1M1pDJ4r77z6ZYLLfIEuJayrXkAt1k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732150143; c=relaxed/simple;
	bh=VcQQ+rKhaQ/SIpIN8TaNKgGRcGE2rATebJeh37KBsQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m91sgcccwocr/PnTZAFu8kueLQC3WjLa7ciZFn/7z4ZvILys/MyrwnQVfy1PgjkmcDFl78za0y/Gp6+xwrn8bdGo2udmGL6H0lZqnpG4r6qSLgoIbyw9UchW0KYW+G9kizQ03sP1mNTNf3plP7U+3EcHjAp/CUoP/NbWwrWlpyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M0e2i8Tp; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M0e2i8Tp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732150141; x=1763686141;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VcQQ+rKhaQ/SIpIN8TaNKgGRcGE2rATebJeh37KBsQI=;
  b=M0e2i8TpGpdvh2ALONmq5Nph955T0m3cgnv46rovGKn8kMfWnJ41aIZw
   lO1vAlYxmmxYhi1ioD9UZeaXPQWVh2+u5kBXIfXWVB3mfPl2VyPo7Gsdn
   CWu11t/JocQg+RP09mUO6ehNgRYqs3r+/lmXbBfkSWP1zA8TYAZMaZ05F
   02PIvAFccYKpW+mCW4bmXR3UDsOw3AzcpOjje5BIQB9us+Ncno4iM2tRx
   ZTtebtwy6y67NcTVzAOB/topPE6KBCVyZ5YolayszmJPsSmvg8NQgXmGA
   ZwQCGvBNwXxGVzZKorv1LrkloQyNWdIB/f4e3cQOx7qvkSk3znOfRjw1X
   A==;
X-CSE-ConnectionGUID: iw6ohPcxSBGoNfFGPNk4YA==
X-CSE-MsgGUID: 4zVKOMaKRmaXIYM2ulCIiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="49765104"
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; 
   d="scan'208";a="49765104"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 16:49:00 -0800
X-CSE-ConnectionGUID: T7Tu5eiIRzW2gd5+mTmiZg==
X-CSE-MsgGUID: NVQSp019TS6R5IsPQTsL7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; 
   d="scan'208";a="90485333"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 Nov 2024 16:48:59 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDvNR-0001G7-1Y;
	Thu, 21 Nov 2024 00:48:57 +0000
Date: Thu, 21 Nov 2024 08:48:10 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev, Gregory Price <gourry@gourry.net>
Subject: [gourryinverse:gourry_pagecache 4/4] mm/migrate.c:2725: warning:
 Function parameter or struct member 'folio' not described in
 'promotion_candidate'
Message-ID: <202411210826.ze2oEQok-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gourryinverse/linux gourry_pagecache
head:   22a918e8984faca048ec24295ed20e91b682a03e
commit: 22a918e8984faca048ec24295ed20e91b682a03e [4/4] migrate,sysfs: add pagecache promotion
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20241121/202411210826.ze2oEQok-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241121/202411210826.ze2oEQok-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411210826.ze2oEQok-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/migrate.c:2725: warning: Function parameter or struct member 'folio' not described in 'promotion_candidate'


vim +2725 mm/migrate.c

  2714	
  2715	/**
  2716	 * promotion_candidate: report a promotion candidate folio
  2717	 *
  2718	 * Records folio access time and places the folio on the task promotion list
  2719	 * if access time is less than the threshhold. The folio will be isolated from
  2720	 * LRU if selected, and task_work will putback the folio on promotion failure.
  2721	 *
  2722	 * Takes a folio reference that will be released in task work.
  2723	 */
  2724	void promotion_candidate(struct folio *folio)
> 2725	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
