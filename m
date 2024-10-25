Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B65E20C324
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 19:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729883068; cv=none; b=ORsaAgZ2T6mzEbJ6/cxF1otnLxeljziZAFElFp29dTRr4Y4fuLDd/tM4RP7JzzdtAj5G+QZZIEi1r86AzFngU5qo9BsYMJ+2d1f+5/tf6qhIpTkSSk0Z5kRp2PgKuieJvg9RAyrrSrXAzu1MtrZvzie6aomGx6elxELAOlbUcsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729883068; c=relaxed/simple;
	bh=5BI3vSaDCSxco9+wl9NXVbA6pfPnuDw/rn5l3uMNHeE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o/t0YJUQfN5QVc/AJOc5neG2mmXqOkzaotqLoin/vq7tQdZKU2m7xPNartueR9OpALXhm4CbkNm12dmon3uldf2TyICixnOBSzAmvJLBM0IfkApyKQ5dJSh03TEoGqsJvsKzfHBpsOLNI19vR8H6y636paGaSJXf65IMQYPNEKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jT18kqWd; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jT18kqWd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729883066; x=1761419066;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5BI3vSaDCSxco9+wl9NXVbA6pfPnuDw/rn5l3uMNHeE=;
  b=jT18kqWdur4b6YkESmJnB6ySHZI4v+9jx3n18O9IlrJLNvHDm69N3arw
   hjODRTso4Kk97vuzXll8CZPavnoLgdBOX2tFJ4JohxPhKjCE+ASU6ehhD
   ceemE33eEatg4CYeEnSVoSSsx2WainQiFqQSBPMtMFSxs864wHzIix5c2
   AVkPIlGann8azdLSHmMJainCK1DfHXvq4lKqhWzto/WkIXGtilhODh0i1
   3i7ZbpN3xwx4HizeUKQ7By6OGi3RSrxEkQ6ptaMwSr42cX8Zj8EeWt5JQ
   eKqssAE+eELglPxoXl7a/Aj3TP058KME5MpT0liM66Yul4yOzuFfTp+ZH
   Q==;
X-CSE-ConnectionGUID: Mfuhp0DETcub5+P2ReOyYw==
X-CSE-MsgGUID: cfhUdJagTrqqwx9WSp92LA==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="17195571"
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; 
   d="scan'208";a="17195571"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 12:04:26 -0700
X-CSE-ConnectionGUID: tSTa9PtFTlmXgJ70sy5qNQ==
X-CSE-MsgGUID: FZKAhNL6RgezzEnPMt6ruw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; 
   d="scan'208";a="81106951"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 25 Oct 2024 12:04:24 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4Pbi-000Ylw-0k;
	Fri, 25 Oct 2024 19:04:22 +0000
Date: Sat, 26 Oct 2024 03:03:50 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 32/45] ERROR: modpost: "__aeabi_uldivmod"
 [fs/xfs/xfs.ko] undefined!
Message-ID: <202410260320.ff8Geiup-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   ce5019907f61fb75342d40fefc17058ac45b76c3
commit: 579e1d3d43db665e6d4e6c24418cf9d2e1f4384d [32/45] xfs: support zoned RT devices
config: arm-randconfig-003-20241025 (https://download.01.org/0day-ci/archive/20241026/202410260320.ff8Geiup-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410260320.ff8Geiup-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410260320.ff8Geiup-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__aeabi_uldivmod" [fs/xfs/xfs.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
