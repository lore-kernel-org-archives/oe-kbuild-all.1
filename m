Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC02462A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 00:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ELDPIfWj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701823863; x=1733359863;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zRTzqi+4zqwccPmYcAZwEzILj18Je1dgiLQT//z71Zs=;
  b=ELDPIfWj85VWt/nMDV2JDfJzDbC3rZb80AHRWWojmLIxL5inYl8zRuU9
   T1HgoDjddyQx3xtZhnnEgcCAmnRBmVt2EOBGLXvo9k/qa+magtc+Pb8QV
   qCcY8E8V0DfyQV1FkeBnKcD0rsTYOHByGsv9R5V/exJSnCLH3FzR2bGVk
   b45gDqb9Tc0KpNIt2NL6almX7P+2JTEJLuflvvRvSDj/bBf9uavVlOmoF
   o5xNcfhx7+X45glyUiaiNQzmYFaH1tBnVOz2oBlDJcLb8avi7z1Nam2kb
   IyzAAgZMPx3+LmNonS0OE8C0J6IcEkfwPKbHCLDAdmhDbZM+2wqEeLIPG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="12698965"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="12698965"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 16:51:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="841652265"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="841652265"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 05 Dec 2023 16:51:00 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAg7u-0009yk-2W;
	Wed, 06 Dec 2023 00:50:58 +0000
Date: Wed, 6 Dec 2023 08:50:37 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fuse-backing-fd 11/16] inode.c:undefined reference to
 `fuse_backing_put'
Message-ID: <202312060809.Ev8zH2mF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux fuse-backing-fd
head:   908a2beb53709f4b2f65a280af474b8d05962d18
commit: 65d384ef1fca428aab66dffbbd7aa445f181675a [11/16] fuse: introduce FUSE_PASSTHROUGH capability
config: nios2-randconfig-r051-20231202 (https://download.01.org/0day-ci/archive/20231206/202312060809.Ev8zH2mF-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060809.Ev8zH2mF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060809.Ev8zH2mF-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: fs/fuse/inode.o: in function `fuse_free_inode':
>> inode.c:(.text+0xa14): undefined reference to `fuse_backing_put'
   inode.c:(.text+0xa14): relocation truncated to fit: R_NIOS2_CALL26 against `fuse_backing_put'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
