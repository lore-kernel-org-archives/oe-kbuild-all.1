Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6F42FF641
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Nov 2025 07:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764054617; cv=none; b=mSnG9NyA1rhWFJDtWRNUvSkuBTVaOQHOlmJnPMst2BxAq/LsiT6sTFvMIXTntg7VNL0knbHNiitZqAS1DSSmvGKoLTB+YLHbnq+sdt/RBvSDn2rOxlazJ5dL/Y4VNBRD0BTFzrHpzsMPfNHHZns7qEUWYs33ldY6vlWKoGVaVJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764054617; c=relaxed/simple;
	bh=FoV6v62IpD3ZLAZhdrqbkawFrYcDbXFEKoPt6G2Y20g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gSiGnln/heW9FqrBDmVuBE9+7Ac2o7pfimub9d6WY++F0IBRH5ZK9MDKWheDKSg6wQVYpfr6cj72cB8uVJQ4WoqMX6sEf6q9zpdI1XNJfnK4k+cEKe1kQn1HJ9mvLTCt4jeg6zpM6173czoD9c2HdROpYDi0/R37JbcMCAIZhLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UdXIDsPr; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UdXIDsPr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764054616; x=1795590616;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FoV6v62IpD3ZLAZhdrqbkawFrYcDbXFEKoPt6G2Y20g=;
  b=UdXIDsPr8FETdPRg8hhK0ZyCeiols/AXOPCCQUHHwv9fK9HrlzXkSIPX
   ULkBAkauebpqEn1R7uroFCLqUVIOfQFbm62Utn9K2V3m+y2MeRf7GQwq6
   qDgs8ZXhWtEa2xD8rLegns4+YAa/bXU+mxcs7yLG0JHFN0xsCkJ9apl9Y
   tEvVhq29IKQxf5GyNxxwxUkkUc+zIkafFZb0G5OgUkQIMqDcVX7b24rPq
   o1TPVyr0BwM+YEoflIPZQTjGCT0H0wKASNp5T3MIWKoI+NMok2YiIzdxt
   sJVbo7IqEtGHP7ThGLf5IH1S32dQf+b8xG5ItWY/F1rn4zaary/CS6q7q
   A==;
X-CSE-ConnectionGUID: xW3fBjTARA+1CPzbqO392g==
X-CSE-MsgGUID: SMuJbF0LS023XZpmn24woQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="77540031"
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="77540031"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 23:10:14 -0800
X-CSE-ConnectionGUID: L58q1Dj5T1GR0wr40u4RZg==
X-CSE-MsgGUID: ks7J4PMLQnu4Q4FALCAbLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="196855438"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Nov 2025 23:10:12 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNnBi-000000001SR-0Ulk;
	Tue, 25 Nov 2025 07:10:10 +0000
Date: Tue, 25 Nov 2025 15:09:55 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:stack_magic 31/31] include/linux/tracing.h:168:8: warning:
 extra tokens at end of #endif directive
Message-ID: <202511251531.jQc5s6TP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux stack_magic
head:   4ebcb9cdc941dc900a8ea9e08e8ad58799a8c5aa
commit: 4ebcb9cdc941dc900a8ea9e08e8ad58799a8c5aa [31/31] add tracing.h
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20251125/202511251531.jQc5s6TP-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511251531.jQc5s6TP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511251531.jQc5s6TP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:34,
                    from include/linux/random.h:7,
                    from include/linux/nodemask.h:94,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:15,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:37,
                    from arch/nios2/kernel/asm-offsets.c:8:
>> include/linux/tracing.h:168:8: warning: extra tokens at end of #endif directive [-Wendif-labels]
     168 | #endif _/* _LINUX_TRACING_H */
         |        ^
--
   In file included from include/linux/kernel.h:34,
                    from include/linux/random.h:7,
                    from include/linux/nodemask.h:94,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:15,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:37,
                    from arch/nios2/kernel/asm-offsets.c:8:
>> include/linux/tracing.h:168:8: warning: extra tokens at end of #endif directive [-Wendif-labels]
     168 | #endif _/* _LINUX_TRACING_H */
         |        ^
   In file included from include/linux/kernel.h:34,
                    from include/linux/random.h:7,
                    from include/linux/nodemask.h:94,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:15,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:37,
                    from include/linux/sched/affinity.h:1,
                    from kernel/sched/sched.h:8,
                    from kernel/sched/rq-offsets.c:5:
>> include/linux/tracing.h:168:8: warning: extra tokens at end of #endif directive [-Wendif-labels]
     168 | #endif _/* _LINUX_TRACING_H */
         |        ^


vim +168 include/linux/tracing.h

   167	
 > 168	#endif _/* _LINUX_TRACING_H */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
