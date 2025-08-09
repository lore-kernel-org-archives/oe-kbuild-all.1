Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8031DFF7
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Aug 2025 02:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754708323; cv=none; b=Nhd2tDZeKMijUXhBHNFsvADYhQPm26likgjepMaStNTbTJa0AKcdKc0n+Xs8i9vwVvaJsnpe158FYENKp1GeGSeFYoikzJw5sC+OuC7uxdN5yFYC3+YgGircd0tv/7ShrHnq1+qowJz2DhBjcx1xBz5v7dzRv+uIBXI6GYO8RpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754708323; c=relaxed/simple;
	bh=cSWoPthnADJ3R5U4MWbIkLQnXhIwQowzkyxR7LBYmTo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UpXDrvzPkj8x/L50BoRv71Y3Ze+cRAgvsHdUa4uE4TJ41vYQHJomSWAdh1rtwegJxNTQvFn3v6BvOswjb//Udkw2WCrpHB5LWb3zxtriT2UGSZ1qgkEbiKDUBTHYjEQmRELKNQ9pg7k+y6QbZgPeJpDjUfJw1kKL6ovET4fiJXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g3hZXU1f; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g3hZXU1f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754708320; x=1786244320;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cSWoPthnADJ3R5U4MWbIkLQnXhIwQowzkyxR7LBYmTo=;
  b=g3hZXU1fgqUl/BVd2uggZA6Uzf9vhW6WuQiOWGm0raOAyb2MQfAoXpfd
   xr3AG35M/ZaG1e8+lovqMnQZ7oZjd9Zh/VGT7CDds2cjNME9vvjxvEuGG
   bU94Mq55FNzKm9OJ52Yz7+5AD8Z90Q1LzGE/B2i21CHzSBsbLh7x8ARlU
   m9Kt2CZcBdbYJK3OljRooDaHK66DZ8zc2oOUkbqWyymGR6i/dHVTwmCw8
   lxco1U9fWWHFOwTFc8mREAC2G/igZ1YluHHnhjxJcPivAaJu8mjPauS/i
   EC+sSbxImbtbugH4g6m3bJJW/eDtKkh8cMQhu5JL77PSxmJUeGoS3YGXE
   w==;
X-CSE-ConnectionGUID: P0dBS5++SEeHo/qWJh7lQg==
X-CSE-MsgGUID: M5o513wHRb+iTlCzYJclTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="57182743"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="57182743"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 19:58:40 -0700
X-CSE-ConnectionGUID: iAboQ0tHT1idkCOOGuCL0w==
X-CSE-MsgGUID: DXhF7xIGSfqgUR17cVK1Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="164963865"
Received: from unknown (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa007.fm.intel.com with ESMTP; 08 Aug 2025 19:58:39 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukZn3-0002id-0R;
	Sat, 09 Aug 2025 02:58:37 +0000
Date: Sat, 9 Aug 2025 04:58:27 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1753/1753]
 drivers/staging/erofs/unzip_vle_lz4.o: warning: objtool: missing symbol for
 section .text
Message-ID: <202508090402.PMJhGfxB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   748957057cef2d3b3e35d749c9a1ade66e2b5e73
commit: 2e59f7a6876bfa6adca4ec9180ab3945e6ede7e1 [1753/1753] staging: erofs: compressed_pages should not be accessed again after freed
config: x86_64-buildonly-randconfig-2002-20250806 (https://download.01.org/0day-ci/archive/20250809/202508090402.PMJhGfxB-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250809/202508090402.PMJhGfxB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508090402.PMJhGfxB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/erofs/unzip_vle_lz4.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
