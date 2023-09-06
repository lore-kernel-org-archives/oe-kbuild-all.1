Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E997E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 03:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693969431; x=1725505431;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+0Tpf+GMulaSqOyADgvnPVPWCLZKkhJhyfWfheWHrlI=;
  b=isdcA8vWcseSnwCjGD7u4LHElWGw/0KgHIn92YP4x83z9R1QGaoNTV1L
   un1RhpO0DDkM3PzmnRwBIIaVKl3r5429TIaaat9D8pRZ6EM9iJG3ZcTqx
   nClhRSz1e4qope1gF7//wnGLQTlOcrlh5Ut+kayUC7zoP9leYqsieya9H
   Bc1h+2UUUElrPrpgBx+C1eHeGLk6AZEc0ypTNSfgVuzSL50R6DnpsXsXH
   Vejx2fREqGKgBH95CtKbSV5fprCjQUwtWVMbQdaKrAc5gJhBl6t0i1Y9A
   8ybRaBfdCLnK4o+6Qxg+5MVQ468SxdJWmY5w+fUUUYZvbS/HPSepTWTKb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="376873413"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="376873413"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 20:03:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="856238955"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="856238955"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 05 Sep 2023 20:03:48 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdipW-0002P9-1N;
	Wed, 06 Sep 2023 03:03:46 +0000
Date: Wed, 6 Sep 2023 11:02:56 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fuse-backing-fd 10/14] fs/fuse/dev.c:2295:32-38: ERROR:
 application of sizeof to pointer
Message-ID: <202309061031.Tiw9wUR1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux fuse-backing-fd
head:   563a1dbd5121cbe0239528370c886b990224403f
commit: 753a8c4f0a4433da42966d5583948f093a23ae8c [10/14] fuse: implement ioctls for passthrough
config: x86_64-randconfig-101-20230906 (https://download.01.org/0day-ci/archive/20230906/202309061031.Tiw9wUR1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230906/202309061031.Tiw9wUR1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309061031.Tiw9wUR1-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/fuse/dev.c:2295:32-38: ERROR: application of sizeof to pointer

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
