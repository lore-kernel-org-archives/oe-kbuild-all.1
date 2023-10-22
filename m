Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3645D10E1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Oct 2023 07:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dBeZU1dK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697958587; x=1729494587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vSXflfjJ+M4tYOoYhXbxHCsCWHy5GbvVa4uC3LQuJGY=;
  b=dBeZU1dKJxynVaaDGSJOEpKRDjAT0wXa6EYqYy2nPzprCu0rwvt+a8ym
   hRgJVriG2AoLBXAKYVf7IVi6uJydvo87bE8RWD5iGfOUOZajmMMoODygQ
   wHBVZFxz/5SJe9+swyuVrlJR24VocGPsHMgHTesn6l/fcQgznjsUj9MLG
   9oG0yif0/C5QyWK/rqWqOQK2/lPi3LeKlaaSn+aw17dGF0engUaTFZfm2
   zZ4ekl0OqCVV1hm/JlF2IasLvuczsHko72F6hfHPSOgho3/RzfMtwkysm
   4jzkk2nLZJn4/8gWxQBDSnSGSw/fkp5SRtKDyn53q7k0K5S6VQcS6mzVG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="472905368"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="472905368"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2023 00:09:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="5486358"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 22 Oct 2023 00:08:31 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quSal-0005gY-0b;
	Sun, 22 Oct 2023 07:09:43 +0000
Date: Sun, 22 Oct 2023 15:08:44 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko.sakkinen@tuni.fi>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-riscv-keystone:keystone 1/1]
 arch/riscv/kernel/keystone/keystone.c:37:14: warning: no previous prototype
 for 'keystone_open'
Message-ID: <202310221555.TaquSQck-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-riscv-keystone.git keystone
head:   28979c68d4b1523ddd3899719a3afb920007a26c
commit: 28979c68d4b1523ddd3899719a3afb920007a26c [1/1] arch/riscv: Keystone
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20231022/202310221555.TaquSQck-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231022/202310221555.TaquSQck-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310221555.TaquSQck-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kernel/keystone/keystone.c:37:14: warning: no previous prototype for 'keystone_open' [-Wmissing-prototypes]
      37 | struct file *keystone_open(void)
         |              ^~~~~~~~~~~~~


vim +/keystone_open +37 arch/riscv/kernel/keystone/keystone.c

    36	
  > 37	struct file *keystone_open(void)
    38	{
    39		return anon_inode_getfile("[keystone]", &keystone_fops, NULL, O_RDWR);
    40	}
    41	EXPORT_SYMBOL_GPL(keystone_open);
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
