Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98F653816
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jan 2024 18:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LhN9QEVY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704997353; x=1736533353;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FCGKKLdNqV3Z4j5f4d3p8+rk0usZptT/c9gDP1o3z5o=;
  b=LhN9QEVYRbHTy1TZAK5poP91nh1d7iIk4ILvIwA8T155KpfUTPU20/co
   mbFay4nx3BL4Oq34kIf4LcLm3Tl9JAIEIb0zFl69SweheLYIgYw3JOP48
   HoAb1vQk/7HpOo2/5JVn0ruvT9TyLyG7LK8OW5C/7Qv8gv9hOmtFp4Dwl
   ziJrXPMQ4JY/0TwKV32PHZL7AaDq6+QJ0ym7lo6IKmCWi52fnONgFPe4s
   JHyLN9akeJy1VjlKbT2Btms3MkjYa2cYWsnyKWcNdvIOGd/AG7V5T181A
   +MUbm05tuhZzA81VcjAQWCFe6upTQPdC199UD2PULUPwxtkeEwciTXnvm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="389388970"
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; 
   d="scan'208";a="389388970"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2024 10:22:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="816812161"
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; 
   d="scan'208";a="816812161"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 11 Jan 2024 10:22:32 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNzhF-0008b0-2a;
	Thu, 11 Jan 2024 18:22:29 +0000
Date: Fri, 12 Jan 2024 02:22:17 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 722/2356] inet_hashtables.c:undefined reference
 to `sysctl_local_port_allocation'
Message-ID: <202401120237.AIlh5Euv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ea6de9f6732d495c506f9c140b4ec17c957e1b77
commit: 208a72041292a93cb0e383d1e2bb8a9b0cab964d [722/2356] tcp/dccp: Add another way to allocate local ports in connect()
config: arm64-randconfig-001-20240111 (https://download.01.org/0day-ci/archive/20240112/202401120237.AIlh5Euv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240112/202401120237.AIlh5Euv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401120237.AIlh5Euv-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: net/ipv4/inet_hashtables.o: in function `__inet_hash_connect':
>> inet_hashtables.c:(.text+0x3ff0): undefined reference to `sysctl_local_port_allocation'
>> inet_hashtables.c:(.text+0x3ff0): relocation truncated to fit: R_AARCH64_ADR_PREL_PG_HI21 against undefined symbol `sysctl_local_port_allocation'
>> aarch64-linux-ld: inet_hashtables.c:(.text+0x3ff4): undefined reference to `sysctl_local_port_allocation'
   aarch64-linux-ld: inet_hashtables.c:(.text+0x4004): undefined reference to `sysctl_local_port_allocation'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
