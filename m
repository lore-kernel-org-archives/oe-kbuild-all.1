Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138F61BDE2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 21:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sfwc8gSG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697317878; x=1728853878;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e2Q7LCvqFOKiXXR++WZyZU4MTNTdViahj73tCSgYrPY=;
  b=Sfwc8gSGfx/ZDtXwr/cW2RY7SCs4+itR0v3gomEesDSgHc3r/jj0voHU
   IgDN3NzGeIkM9EjwW+NvqsmcAPJ1Rhxo5muEGAwf883aPlRYMf/cZa5CH
   6pW9++YLq9kK03OmWIMtr7ECy5wCACNkVPeYI2M46ayCgJb6L26Rq1ZkN
   DVkpINRnyoPBhb+6QkX+YK5JwE2WwiHonVGnX6D3w1UOfKAsOyQxL338S
   cD1h3tId+e6xq6/mOWhe9Gfw2/HPcDmv6LiQ+VQk6nVEDT3J7rLCVjKKL
   6nQXYYwE3c7eNwm3bsMIxF3SCWpx7BI0v1jM1pvIY81v+6Oqzaww9B1wb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="382577748"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="382577748"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 14:11:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="731764585"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="731764585"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 14 Oct 2023 14:11:15 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrluj-0006fF-1F;
	Sat, 14 Oct 2023 21:11:13 +0000
Date: Sun, 15 Oct 2023 05:10:17 +0800
From: kernel test robot <lkp@intel.com>
To: David Wei <davidhwei@meta.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zc/veth 1003/1018] arc-elf-ld: zc_rx.c:undefined reference
 to `dev_get_by_index'
Message-ID: <202310150509.MgvhX30W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/veth
head:   cff8a226d561bc0db814b65ca5d2c97894d4d1cd
commit: b75dd3ad68b4b49f885a47a4e5d96bfe723bf8aa [1003/1018] io_uring: setup ZC for an RX queue when registering an ifq
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20231015/202310150509.MgvhX30W-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310150509.MgvhX30W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150509.MgvhX30W-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-elf-ld: io_uring/zc_rx.o: in function `io_register_zc_rx_ifq':
   zc_rx.c:(.text+0x1e6): undefined reference to `init_net'
   arc-elf-ld: zc_rx.c:(.text+0x1e6): undefined reference to `init_net'
>> arc-elf-ld: zc_rx.c:(.text+0x1ea): undefined reference to `dev_get_by_index'
>> arc-elf-ld: zc_rx.c:(.text+0x1ea): undefined reference to `dev_get_by_index'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
