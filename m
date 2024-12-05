Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCFB1B219E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Dec 2024 20:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733431181; cv=none; b=FmV6rKG2rWcjOpwMe8dqBsm0ayUD3oh+PkI7kjvxgvlwAsXLkV7phbl0GdTj6sRkZH99muZjbQ+xizFhcU9vqSdy1/UjPYB6BpQrtxscViqFAb7kGiZNMs6CiAY40THvYC66+wxs7H8DXlwCCpFlOY+2pf8ZkVUWgqBtSvK4Szk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733431181; c=relaxed/simple;
	bh=0I7tduK3vVs4hx7YmYD8vI5LXRslkBT9u+OXLVg+YOA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fswOgHJ9OmdDOkAnI//wMHzwNhdnWj1omTBweUlPig3vZb6bmNxpVfgm6SQXkhuqLamSYyVM/ouAZ5Nrfy5xBIEBF5hT0hldbcQp8vAN9+PxBlk1Ez/C2rjPgbo5boynEwt+3D1NYIDvdMFnOhDaN1lQS8opKXYGl7nGOsTvmbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RxT/6jcQ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RxT/6jcQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733431179; x=1764967179;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0I7tduK3vVs4hx7YmYD8vI5LXRslkBT9u+OXLVg+YOA=;
  b=RxT/6jcQJSjNNyAGjYFPHV9Nk6QWuRBC1yun6ufV10ojdgMIYeIixVCP
   sWb1xEHx0BwQF3CW9E0WjsON1HyETMOi5CvuRRVUVorRJA1C0w9+U22EA
   svryyvBxqE2U8/PSzUNhGCqFYc0QplIXfF9u3xyFPih83XFwyUz6X6Ahz
   gGoehCnzs0dHOqhOjAZc2jeC04nnt5wgulrt7XlCeLQJolZYjpdF4EixC
   vonL1xSuS4SX5kDz79V7g0x10ugWtDp1o0iprupc249Mfw65yRH44G4/R
   jl/4k/SLyR45NRqyqPKowNFwW+3a5CuEsDHUCJWHXx7jmwQTJRAju8ova
   g==;
X-CSE-ConnectionGUID: 41p1cPgiQgmJhf9Qz9clFA==
X-CSE-MsgGUID: BFX6HDufTAypcvX6pvtRww==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="34015216"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; 
   d="scan'208";a="34015216"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 12:39:38 -0800
X-CSE-ConnectionGUID: GKJayni4QMGxKYng6mzk5A==
X-CSE-MsgGUID: pTsEDYDYSD25p4Cq7O5/Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; 
   d="scan'208";a="94686466"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Dec 2024 12:39:37 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJIdL-0000NP-0I;
	Thu, 05 Dec 2024 20:39:35 +0000
Date: Fri, 6 Dec 2024 04:39:00 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2563/2563] fs/ntfs3/frecord.o: warning: objtool:
 .text.unlikely: unexpected end of section
Message-ID: <202412060424.x2PkbEbU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   220bfa0ea761db9406a3cfde3064aa029e829221
commit: c213d417e466b7a7d9e02939bb67fcf5d82a3f2f [2563/2563] fs/ntfs3: Add NTFS3 in fs/Kconfig and fs/Makefile
config: x86_64-buildonly-randconfig-005-20241206 (https://download.01.org/0day-ci/archive/20241206/202412060424.x2PkbEbU-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241206/202412060424.x2PkbEbU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412060424.x2PkbEbU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ntfs3/frecord.o: warning: objtool: .text.unlikely: unexpected end of section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
