Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95541922FB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Aug 2025 04:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755230419; cv=none; b=hIkr/VXjgsTVsAZ7oV7WIlEkrMH7w5QpAHPLGb4RyN5cZEK7lDMf1s3cHWI51DEXiy5qYAjhupuvemzcGwZJsq1ojd+isVol3BOehrxBXw8KiIlzDG5+oFJTByUGKWl/icCBMHFoFMK9PgIwajPa8e4L4/kbADCR0tScBIlzeHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755230419; c=relaxed/simple;
	bh=Wxx5L2dbVxlj+9VvYgIg1CtgSCLKGLMSFDQRhJv3P/0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eqO89reEGpY3hbERfM6iNtWx6mKywyZeqMjbNGnh/ajxvRUgC0r0/7/u1S2KHNVQU5DVhr8WBqHOKVS/ln+W5Xf6gvNiXjGkPebasivUFH9uZvkZOpc3tlR3rEc5NgsNshmUvTmxh1WqMuNS9L2vsRaxCx47AeQLfxTCp/SHWdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lh2d12Yo; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lh2d12Yo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755230418; x=1786766418;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wxx5L2dbVxlj+9VvYgIg1CtgSCLKGLMSFDQRhJv3P/0=;
  b=Lh2d12Yoz8hA2l3cJ4UfStAbuWWAiwjJ3d31x+YXcmPTK5m8ItMSALYT
   X6RZpetzQ/E9zzRbeMtpe6rpOgNTdA9qlLQL7t6tyAUc6DSTtNqBlyi7n
   WUW5Xe3xbFbaIS8hODkoDU3eOFAfo95M/k1IGaMP66G8an+DTTW1mDdFD
   RFaRCh02qdQrpAXZ7TvjJQvZobsd4bPyZjg4pdEyXKtEQ5oZrrUNBeCx9
   PxxVDf5A/Yw3uswLwdjZS9G5vDnCeCiM88H9/LxyVIZMgUcrGHLPZscvq
   n/oawTWZnrEvRUHCW7qB+jj9VV9xneidrjRUSYvP073Dpe4U8KGHieHfP
   w==;
X-CSE-ConnectionGUID: JntWZXWJTfGmUlDhBRyvzQ==
X-CSE-MsgGUID: blxkmGSvTa2oDJc49gIPDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="75124777"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="75124777"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 21:00:17 -0700
X-CSE-ConnectionGUID: KbjBNDQ6THSG+NZHusvvXw==
X-CSE-MsgGUID: X+WpeFpCT+GIWTfqUVnOXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="167186545"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 14 Aug 2025 21:00:16 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umlbs-000BWo-1F;
	Fri, 15 Aug 2025 04:00:09 +0000
Date: Fri, 15 Aug 2025 11:58:44 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:new 4/5] lib/group_cpus.c:24:17: error: implicit declaration
 of function 'for_each_cpu_and_andnot_from'; did you mean
 'for_each_cpu_andnot'?
Message-ID: <202508151130.pQr7nUAl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux new
head:   27da1bc692ded269f7cd2aff5dc30a2d0ecc09e8
commit: 76c06f98eb6ec33fd7bdfb7c08a2a7a9907d23e2 [4/5] group_cpus: simplify inner loop in grp_spread_init_one()
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20250815/202508151130.pQr7nUAl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508151130.pQr7nUAl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508151130.pQr7nUAl-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/group_cpus.c: In function 'grp_spread_init_one':
>> lib/group_cpus.c:24:17: error: implicit declaration of function 'for_each_cpu_and_andnot_from'; did you mean 'for_each_cpu_andnot'? [-Wimplicit-function-declaration]
      24 |                 for_each_cpu_and_andnot_from(sibl, nmsk, siblmsk) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 for_each_cpu_andnot
>> lib/group_cpus.c:24:66: error: expected ';' before '{' token
      24 |                 for_each_cpu_and_andnot_from(sibl, nmsk, siblmsk) {
         |                                                                  ^~
         |                                                                  ;


vim +24 lib/group_cpus.c

    13	
    14	static void grp_spread_init_one(struct cpumask *irqmsk, struct cpumask *nmsk,
    15					unsigned int cpus_per_grp)
    16	{
    17		const struct cpumask *siblmsk;
    18		int cpu, sibl;
    19	
    20		for_each_cpu(cpu, nmsk) {
    21			/* If the cpu has siblings, use them first */
    22			siblmsk = topology_sibling_cpumask(cpu);
    23			sibl = cpu;
  > 24			for_each_cpu_and_andnot_from(sibl, nmsk, siblmsk) {
    25				__cpumask_set_cpu(sibl, irqmsk);
    26				if (--cpus_per_grp)
    27					return;
    28				cpu = sibl + 1;
    29			}
    30		}
    31	}
    32	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
