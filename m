Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652463C465
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Jun 2025 03:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749095355; cv=none; b=WXvkFcaBhodlgW3brPtnBXgJKnMvHavHBY8boTfkYtY9DTN6wAv9bdopu9Sx3ejTuExkgF0MBkyEtDq4arUKb5UayvFb7r+WCR6B7V1wr7lFX7lFgKoxjQQiWqUTuqtMXE6dCYZ1Pn/kZ2v07cPpeW00lwwALMoyebpAHN+MGbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749095355; c=relaxed/simple;
	bh=uKpOyFEq0AqPxs9lkCZyj83/tLLKBF8mo2fOq/vG5Eg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h4gm1wXe1XtbfNhbJH42t9kDs2ceT9HYoyt8QbA9iu2zKfDZOCFtMcVPBB/N/Kzoj/X3Uc4Pk2S0D7DRDU7xkotO4ihwh/DR3/oYgBL5cVY/dzktmcrpXb7b15WiNTP51cxU+Q2b0rO9pvJeqIiehGlAQ6FEoInbVjBbSSuU0Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lw/IFWCZ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lw/IFWCZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749095354; x=1780631354;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uKpOyFEq0AqPxs9lkCZyj83/tLLKBF8mo2fOq/vG5Eg=;
  b=Lw/IFWCZ01w3857QxMlvEk8IQtDyKjs4963GWhuCn2hL8MfiVqc7Ks7r
   XQlXGvdvjSpqkhMueF5p0smaSjOfkPtd0jU7G6aKFeeoIjsYmtJwSGXdX
   aiiRWSYgcLlvcobXNCaoWC3EaDhpPEOXFGLYxK+e+C8bgBPZ9ZUDymMaY
   ixIUGASJJ2irLX9U3URp/tbbYmCz+kZwPmp/aednF2eok7HLM63wArqkM
   gwp9iOclItKMxidtRZTizp/owbJUGCrhYeMXYcnUUk6fJ+dXJ53oNainu
   amDlH2OB+VcVUI2x4MCvEf8vQs14Q1CQO+nM2qO7CBBqIhU6EQ4846Ohr
   g==;
X-CSE-ConnectionGUID: G83PAC6zSF671Yz9m21Muw==
X-CSE-MsgGUID: jL0WqBnPTRevafvlTxCawQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="68636771"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="68636771"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 20:49:13 -0700
X-CSE-ConnectionGUID: zw0JSWtcRpaKfpFz3qlJBw==
X-CSE-MsgGUID: 4ZbJq5DuS8Sg3nZN/Ko/Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="176256181"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Jun 2025 20:49:09 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uN1bG-0003hR-2V;
	Thu, 05 Jun 2025 03:49:06 +0000
Date: Thu, 5 Jun 2025 11:48:17 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:cpumask_next2 16/24] drivers/net/wireguard/queueing.h:108:24:
 error: 'cpu' undeclared
Message-ID: <202506051116.VaTGLQlK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux cpumask_next2
head:   75aab1f3dc12efa381f38208ada2336898c5fc89
commit: e050789716ae9a0daf3968328b49d6410e1e351d [16/24] wireguard/queueing: simplify wg_cpumask_next_online()
config: i386-buildonly-randconfig-001-20250605 (https://download.01.org/0day-ci/archive/20250605/202506051116.VaTGLQlK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250605/202506051116.VaTGLQlK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506051116.VaTGLQlK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/wireguard/receive.c:6:
   drivers/net/wireguard/queueing.h: In function 'wg_cpumask_choose_online':
>> drivers/net/wireguard/queueing.h:108:24: error: 'cpu' undeclared (first use in this function)
     108 |                 return cpu;
         |                        ^~~
   drivers/net/wireguard/queueing.h:108:24: note: each undeclared identifier is reported only once for each function it appears in


vim +/cpu +108 drivers/net/wireguard/queueing.h

e7096c131e5161 Jason A. Donenfeld 2019-12-09  104  
e7096c131e5161 Jason A. Donenfeld 2019-12-09  105  static inline int wg_cpumask_choose_online(int *stored_cpu, unsigned int id)
e7096c131e5161 Jason A. Donenfeld 2019-12-09  106  {
e050789716ae9a Yury Norov         2025-05-15  107  	if (likely(*stored_cpu <= nr_cpu_ids && cpu_online(*stored_cpu)))
e7096c131e5161 Jason A. Donenfeld 2019-12-09 @108  		return cpu;
e050789716ae9a Yury Norov         2025-05-15  109  
e050789716ae9a Yury Norov         2025-05-15  110  	*stored_cpu = cpumask_nth(id % num_online_cpus(), cpu_online_mask);
e050789716ae9a Yury Norov         2025-05-15  111  	return *stored_cpu;
e7096c131e5161 Jason A. Donenfeld 2019-12-09  112  }
e7096c131e5161 Jason A. Donenfeld 2019-12-09  113  

:::::: The code at line 108 was first introduced by commit
:::::: e7096c131e5161fa3b8e52a650d7719d2857adfd net: WireGuard secure network tunnel

:::::: TO: Jason A. Donenfeld <Jason@zx2c4.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
