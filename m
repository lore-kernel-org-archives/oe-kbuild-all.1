Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0775215166
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 08:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733733648; cv=none; b=X2QFpNavHLVScTBblfhDAMlXIqkKhAvR/6bgzwNwNiEJLtyQZoVafm2YhtwsvYgctSG7IxPSiHEuA8BLIYYlqaAdn+XT60T42UA4Xn2r4dOb0ynSNaqqOtL16A0nBwWfHansJQHBbI5irYB0TstzV/HTayR80GU3B2ml9Y5uLiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733733648; c=relaxed/simple;
	bh=u0Pc8QekQ+kW9gZHAdLCyXAGl4jXCC20PrP38+8qTu8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gRnDtOJoRcd3q0fVrlq+HAXh8kPPV8/jb726Uic2GtcwOAcuwH/PnsV1zHpweKXfECtxwRBk3CqnNwbXdRpuWIvnwtRmWt5aMBhrHBvvdRzFlmfFEW92fA4UctXbq0jjBA4Qq/44yRKlK2RwTpTvOtgGZpcY0t5y8iy6YMpjuig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ShPgAoyX; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ShPgAoyX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733733646; x=1765269646;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u0Pc8QekQ+kW9gZHAdLCyXAGl4jXCC20PrP38+8qTu8=;
  b=ShPgAoyXkENH9JHRwa3q/Vc75HhuJL4NIFuohrgnxB0RQxu75oomtLHl
   ZbNusmjlzE1H1Ye83B1rEIANBUvrsqAAk7bik54aMixQl3Q3GLljS3Sei
   7Z8ZM5qQ3YVLmrjZRAQZgQ8bgeLW0jDuixGV5hAw1t13QvwylI6bGvzSi
   1NVJSHu6hg6HbXUnZIYuqI2T+BD16hvTLu62m9nKE/f5XzK6xbQAco7X3
   sNreZTCKdwFbpSKuVTdtkoA0mJpsGkF9vOYzI0u+qiszgRabf27Vnf5YD
   7zoEjf2H320cI18xOWJ1PbAKhtxfQceIs9I5BfGrTrbJxlh+TF0LEpvAH
   w==;
X-CSE-ConnectionGUID: LDTRRxu1QVyHjeQY9cpxnA==
X-CSE-MsgGUID: XBwX0btrTZKNm0ri9MCIzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="33941704"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="33941704"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 00:40:45 -0800
X-CSE-ConnectionGUID: MXGxMUu8QCC7JfPXdj1f8A==
X-CSE-MsgGUID: ITRO+a8ZQ72WJdwYv5nuAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="100035689"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Dec 2024 00:40:44 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKZJp-00045l-35;
	Mon, 09 Dec 2024 08:40:41 +0000
Date: Mon, 9 Dec 2024 16:39:54 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:fs-next 67/417] fs/bcachefs/btree_trans_commit.o:
 warning: objtool: bch2_trans_verify_not_unlocked_or_in_restart+0x16: return
 with modified stack frame
Message-ID: <202412091605.nGDsAkIO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git fs-next
head:   8cc0a7d04f430898beeea84cf5fd4ab9501ae395
commit: 6f056ab64993bfa3fa51bc0f0ab3fc4b41856244 [67/417] bcachefs: bch2_trans_verify_not_unlocked_or_in_restart()
config: x86_64-randconfig-121-20241209 (https://download.01.org/0day-ci/archive/20241209/202412091605.nGDsAkIO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241209/202412091605.nGDsAkIO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412091605.nGDsAkIO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/btree_trans_commit.o: warning: objtool: bch2_trans_verify_not_unlocked_or_in_restart+0x16: return with modified stack frame
--
>> fs/bcachefs/btree_update_interior.o: warning: objtool: bch2_trans_verify_not_unlocked_or_in_restart+0x16: return with modified stack frame

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
