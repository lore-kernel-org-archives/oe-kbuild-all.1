Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894B65A4C0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Feb 2024 12:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707654541; cv=none; b=ED7a3E8dUgVLzbWJy4fTFIL++7IV3BrzdTNcMTIPTdO3D7i9YjTNlvYBeq3nuJ7QNxxF0umNzrAcGsa7sd1pZkHdKJLvuU3e8aSDZxLo+OyU9dZzThuJ3ZU4AOrOABia/XVadnmX4BzQucSO+vqykYnLENSivggODqI+B1Syzm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707654541; c=relaxed/simple;
	bh=8MxVj0dPLzSuAqnDpsgI6m6+LUmfzq8cqucBSc8uc7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CC7bi7AlzI6/ULQVl5woSmD5+T3ETqN9foO/47ED2HOfDyc+aIR12sXEMzGxeKdi4JZb/ZivberGou6XTROhVn/udOq2zuObn35h5jeno9ikueKUrROTu4VgmSG83pxhemF8wFQmP9QBhHwx7NJaBhW1o0Ka/OEtZHmzAKPoMU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kjev2Vl3; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kjev2Vl3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707654539; x=1739190539;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8MxVj0dPLzSuAqnDpsgI6m6+LUmfzq8cqucBSc8uc7Y=;
  b=Kjev2Vl3i4oGzb580ceVQec71MtQ58NnwwMpQ1UFBGO8O+LRjRuq0Sus
   aVYxmTjMsCgIarTYFrx2pYrIz12Xe3zLoD7xdnOWTBltUkyMxsNGD7Qvh
   zT4jvLz2PT0vpIe1/KJ33IYihFm2oq6iNoxDGHposgPoJp7nq0OTdt6lH
   u8/00NGBtqlAciwzLyFFDg3cbawHjRJIJgFpUX+VsDF2c/yNgebuJU/Tt
   moyOlI0560hLwxdKwxRmD4XXRSiZt1KE8OPQHYsAvQamCX/ZQMv32vvBW
   M2MsG+hdYZaAAJK6SneGdCLzBoQcVihllLI+vkfM5/YyboAV/1fBNkoUa
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10980"; a="27075878"
X-IronPort-AV: E=Sophos;i="6.05,261,1701158400"; 
   d="scan'208";a="27075878"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2024 04:28:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10980"; a="825573614"
X-IronPort-AV: E=Sophos;i="6.05,261,1701158400"; 
   d="scan'208";a="825573614"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 11 Feb 2024 04:28:57 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZ8x4-0006YU-2g;
	Sun, 11 Feb 2024 12:28:54 +0000
Date: Sun, 11 Feb 2024 20:28:45 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, leoliuoc <leoliu-oc@zhaoxin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 20575/21625]
 drivers/char/hw_random/zhaoxin-rng.o: warning: objtool: missing symbol for
 section .init.text
Message-ID: <202402112046.Zh6M8C2r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   7efcac7603953bb58d80041f410b079378b5174c
commit: 050ff2f361bf733d1dde505dea8b0f5ecb23507c [20575/21625] hwrng: Add Zhaoxin rng driver
config: x86_64-buildonly-randconfig-004-20240205 (https://download.01.org/0day-ci/archive/20240211/202402112046.Zh6M8C2r-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240211/202402112046.Zh6M8C2r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402112046.Zh6M8C2r-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/char/hw_random/zhaoxin-rng.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
