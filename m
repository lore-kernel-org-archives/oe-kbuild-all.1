Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026C54A3B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Nov 2023 04:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O8pK678k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700367061; x=1731903061;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PWSC7wGrwL5e16wIBjFpA5ikAsF9CLQfZ0HQlkbkZtc=;
  b=O8pK678k7H09fWB5gcBIizr7e+bpNHGP+fyR75OAcqGP9F6WaJ8GUdFt
   /ERP+fCEhLIMn/yzLJmJXcUbaYpHnl1YLr8aEwzOjXhTCFusBeEpsvIXX
   TNYh7+P3/PSjIEotxVqU740+80BQuK1okOKnVT0jD0h/RrWeYTuSI9w8Z
   /ho2xa1XfSzlQvEPtrzo+BY1FuyjHJRTrrrXqnAE7jY8ayJjpZz+G4x9C
   ZuoqTmTZXw1x5XxtY0g/yRdqlGV1RknkMmvOw2ibq4QLCw/0RjTBr4OD6
   KjmSGbkm/auhXbX2JDhuTIRYGDU9qVQ8R0OH/3uSwamoJlC6x3mxefYl0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="10131959"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="10131959"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2023 20:11:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="795166791"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="795166791"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 18 Nov 2023 20:10:58 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4Z96-0004dG-12;
	Sun, 19 Nov 2023 04:10:56 +0000
Date: Sun, 19 Nov 2023 12:09:06 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Joyce <gjoyce@linux.vnet.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>,
	Jonathan Derrick <jonathan.derrick@linux.dev>
Subject: arch/powerpc/platforms/pseries/plpks_sed_ops.c:89:15: sparse:
 sparse: cast to restricted __be32
Message-ID: <202311191142.ZOdOE2vT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b8f1fa2419c19c81bc386a6b350879ba54a573e1
commit: ec8cf230ceccfcc2bd29990c2902be168a92dee4 powerpc/pseries: PLPKS SED Opal keystore support
date:   5 weeks ago
config: powerpc64-randconfig-r131-20231119 (https://download.01.org/0day-ci/archive/20231119/202311191142.ZOdOE2vT-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231119/202311191142.ZOdOE2vT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311191142.ZOdOE2vT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/powerpc/platforms/pseries/plpks_sed_ops.c:89:15: sparse: sparse: cast to restricted __be32
>> arch/powerpc/platforms/pseries/plpks_sed_ops.c:89:15: sparse: sparse: cast to restricted __be32
>> arch/powerpc/platforms/pseries/plpks_sed_ops.c:89:15: sparse: sparse: cast to restricted __be32
>> arch/powerpc/platforms/pseries/plpks_sed_ops.c:89:15: sparse: sparse: cast to restricted __be32
>> arch/powerpc/platforms/pseries/plpks_sed_ops.c:89:15: sparse: sparse: cast to restricted __be32
>> arch/powerpc/platforms/pseries/plpks_sed_ops.c:89:15: sparse: sparse: cast to restricted __be32
>> arch/powerpc/platforms/pseries/plpks_sed_ops.c:116:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long [addressable] [assigned] [usertype] authority @@     got restricted __be64 [usertype] @@
   arch/powerpc/platforms/pseries/plpks_sed_ops.c:116:24: sparse:     expected unsigned long [addressable] [assigned] [usertype] authority
   arch/powerpc/platforms/pseries/plpks_sed_ops.c:116:24: sparse:     got restricted __be64 [usertype]
>> arch/powerpc/platforms/pseries/plpks_sed_ops.c:117:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long [addressable] [assigned] [usertype] range @@     got restricted __be64 [usertype] @@
   arch/powerpc/platforms/pseries/plpks_sed_ops.c:117:20: sparse:     expected unsigned long [addressable] [assigned] [usertype] range
   arch/powerpc/platforms/pseries/plpks_sed_ops.c:117:20: sparse:     got restricted __be64 [usertype]
>> arch/powerpc/platforms/pseries/plpks_sed_ops.c:119:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [assigned] [usertype] key_len @@     got restricted __be32 [usertype] @@
   arch/powerpc/platforms/pseries/plpks_sed_ops.c:119:22: sparse:     expected unsigned int [addressable] [assigned] [usertype] key_len
   arch/powerpc/platforms/pseries/plpks_sed_ops.c:119:22: sparse:     got restricted __be32 [usertype]

vim +89 arch/powerpc/platforms/pseries/plpks_sed_ops.c

    66	
    67	/*
    68	 * Read the SED Opal key from PLPKS given the label
    69	 */
    70	int sed_read_key(char *keyname, char *key, u_int *keylen)
    71	{
    72		struct plpks_var var;
    73		struct plpks_sed_object_data data;
    74		int ret;
    75		u_int len;
    76	
    77		plpks_init_var(&var, keyname);
    78	
    79		if (!plpks_sed_available)
    80			return -EOPNOTSUPP;
    81	
    82		var.data = (u8 *)&data;
    83		var.datalen = sizeof(data);
    84	
    85		ret = plpks_read_os_var(&var);
    86		if (ret != 0)
    87			return ret;
    88	
  > 89		len = min_t(u16, be32_to_cpu(data.key_len), var.datalen);
    90		memcpy(key, data.key, len);
    91		key[len] = '\0';
    92		*keylen = len;
    93	
    94		return 0;
    95	}
    96	
    97	/*
    98	 * Write the SED Opal key to PLPKS given the label
    99	 */
   100	int sed_write_key(char *keyname, char *key, u_int keylen)
   101	{
   102		struct plpks_var var;
   103		struct plpks_sed_object_data data;
   104		struct plpks_var_name vname;
   105	
   106		plpks_init_var(&var, keyname);
   107	
   108		if (!plpks_sed_available)
   109			return -EOPNOTSUPP;
   110	
   111		var.datalen = sizeof(struct plpks_sed_object_data);
   112		var.data = (u8 *)&data;
   113	
   114		/* initialize SED object */
   115		data.version = PLPKS_SED_OBJECT_DATA_V0;
 > 116		data.authority = cpu_to_be64(PLPKS_SED_AUTHORITY);
 > 117		data.range = cpu_to_be64(PLPKS_SED_RANGE);
   118		memset(&data.pad1, '\0', sizeof(data.pad1));
 > 119		data.key_len = cpu_to_be32(keylen);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
