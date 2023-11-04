Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E56D1C3D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 03:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NjiGHMxJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699068579; x=1730604579;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Aoo6+FhiWZExDmyK02vSNA27yH4NQsW44C95Ktkkwes=;
  b=NjiGHMxJwc5XNsZW2t2+3Gor8nRYk5kM2++n+KH3KOxuu8F/2lbKxoJq
   BD3vb9dlNYs1ORN8urNAYnCKucfAUAHyf1QWUh51qh2mydB5TAFnTGuFR
   7X8Y1IkEYUPUIuHjsKCuTC3IOS1MdAWm2PjlihZyJH/yJn3/v4Q8aCsU9
   Y4nw6QratcCLjZuQsv9UKj/urr9agvvVFU9XipJ93a7aXRNaixdSvuPZC
   UkmVpQmXimRkrDmNHQndazmlPGKWGCj5glc1Xo8XsH+Oc696qfZ1Rz9b/
   qcbbzg4a9tlokCiH9Q4ry3e0Fy4zZouSEjN8QKMvZufmy9BoUXlLSWZFm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1939517"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="1939517"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 20:29:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="832205377"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="832205377"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 03 Nov 2023 20:29:37 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz7Lq-0003Lg-2s;
	Sat, 04 Nov 2023 03:29:34 +0000
Date: Sat, 4 Nov 2023 11:28:41 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Lynch <nathanl@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: arch/powerpc/platforms/pseries/rtas-work-area.c:189: warning:
 Function parameter or member 'limit' not described in
 'rtas_work_area_reserve_arena'
Message-ID: <202311041118.evjjdof8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nathan,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2c40c1c6adab90ee4660caf03722b3a3ec67767b
commit: 43033bc62d349d8d852855a336c91d046de819bd powerpc/pseries: add RTAS work area allocator
date:   9 months ago
config: powerpc64-randconfig-003-20231101 (https://download.01.org/0day-ci/archive/20231104/202311041118.evjjdof8-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311041118.evjjdof8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311041118.evjjdof8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/platforms/pseries/rtas-work-area.c:189: warning: Function parameter or member 'limit' not described in 'rtas_work_area_reserve_arena'


vim +189 arch/powerpc/platforms/pseries/rtas-work-area.c

   184	
   185	/**
   186	 * rtas_work_area_reserve_arena() - Reserve memory suitable for RTAS work areas.
   187	 */
   188	void __init rtas_work_area_reserve_arena(const phys_addr_t limit)
 > 189	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
