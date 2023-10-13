Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4A010A05
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 09:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FiUjwxK8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697188801; x=1728724801;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J2j8SEGHogxCKopRg4tRodmbASGLFbk61ZReiqlq1vE=;
  b=FiUjwxK8kxoW/Rv/MeHvjP61/RdeK0pLd++tA6I/X8rCfU8dYwt8yGGV
   9k6FD249kT3e5GUcHhDL3ju1J1q2HZ9VeR+DLRUDkAgPeJTCh8XgjpdHt
   EKPgdT3u42FJ/Ujp+JCZOtWRLzTOBe+npnzIZCxb4M0gDh4VpBYUv3fEz
   GMp8f45Cb08KOoounJU3xh2wbv7CCJ/njTvyUwPgc9Wi8KvenbKqPSMlk
   y/9XRgMaWI03XBNDzOAU5poYuUIzsnMSTRHntxtpL+erpmh6c7Emxk61s
   4Kyw/tC1U4jBR5T9GyrxrE1aPhcrop6dFEJ/8BXPxzGsfOyWSdAbcFkqM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="449328916"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="449328916"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 02:20:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="1086068886"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="1086068886"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 13 Oct 2023 02:20:00 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrEKs-0004ZR-01;
	Fri, 13 Oct 2023 09:19:58 +0000
Date: Fri, 13 Oct 2023 17:19:22 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 2487/30000] {standard input}:921: Error:
 unrecognized opcode: `dc'
Message-ID: <202310131759.NvUCMELH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: 166290c21079e1ae6c20592d3a252df0ece8588e [2487/30000] soc: fsl: dpio: enable qbman CENA portal memory access
config: powerpc64-randconfig-002-20231013 (https://download.01.org/0day-ci/archive/20231013/202310131759.NvUCMELH-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310131759.NvUCMELH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310131759.NvUCMELH-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:921: Error: unrecognized opcode: `dc'
   {standard input}:1011: Error: unrecognized opcode: `dc'
   {standard input}:1445: Error: unrecognized opcode: `dc'
   {standard input}:2114: Error: unrecognized opcode: `dc'
   {standard input}:2303: Error: unrecognized opcode: `dc'
   {standard input}:2365: Error: unrecognized opcode: `dc'
   {standard input}:2461: Error: unrecognized opcode: `dc'
   {standard input}:2970: Error: unrecognized opcode: `dc'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
