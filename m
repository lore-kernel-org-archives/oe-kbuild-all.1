Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBA46FD1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Sep 2023 21:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695763537; x=1727299537;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=thrL5Q4C4JFlB646oeo4R+1/k0Uvs0kkrwdQ/GIfcG0=;
  b=UnwcOJfxKftaz0xDa9vWvVkedZ1YMr7ufjxMzO/Rj2m5U4P4G72A5gfE
   LxHFgM3iJKnccERN+S1yvpQOguJnTfAzLtp5m1tEUuzVt1J1eE45oS3mo
   zxur1/RoEDTT9s+Dj4k3QSLgbmRqlgBJzaquomvL0J5//GMG4OfCvLPHP
   x2nvIpfc8M4vnUGJ0wLsXPkVq53p+o+eV6xkcsgGvwXlCAvmuWYSYjPS2
   W5XngHcOjtPDKc1T7QvqZKqa3LtDPTlGsdJpY7I70y+JrFftOEiXROdoG
   nqeaZiN785ry4NEVAjWY4QGrZscXdwZzU79ueUzI7PB6YsuwEqvpmO+3W
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="372006412"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="372006412"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 14:25:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="297955"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 26 Sep 2023 14:25:36 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlFYi-0003Ni-2W;
	Tue, 26 Sep 2023 21:25:32 +0000
Date: Wed, 27 Sep 2023 05:25:10 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/btfid_fix 2/2] /tmp/ccJTlfh5.s:37: Error: bad
 relocation fixup type (1)
Message-ID: <202309270514.bWTolBEz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/btfid_fix
head:   b63eff1cec67e54813e52c6ca6975a815cfe9f0e
commit: b63eff1cec67e54813e52c6ca6975a815cfe9f0e [2/2] bpf: Add btf_ids support for new sections
config: arm-randconfig-003-20230926 (https://download.01.org/0day-ci/archive/20230927/202309270514.bWTolBEz-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230927/202309270514.bWTolBEz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309270514.bWTolBEz-lkp@intel.com/

All errors (new ones prefixed by >>):

   /tmp/ccJTlfh5.s: Assembler messages:
>> /tmp/ccJTlfh5.s:37: Error: bad relocation fixup type (1)
   /tmp/ccJTlfh5.s:38: Error: bad relocation fixup type (1)
   /tmp/ccJTlfh5.s:39: Error: bad relocation fixup type (1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
