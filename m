Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6821B17E907
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jul 2024 16:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720025204; cv=none; b=PPKvwQQdVNW42e+deO2Ei1f1/YSqfbkD5PgDYVpc/Rak8ylpokWC65ksJzHGr7QoDRw7VxV90FVChn95eJxM8JH79qy1qU2wQY9J0MA5ALIxukLFCZhoUf68YBsZl5NSRgvzgXgUHtN2+82iVgI7s7sacrRYJtLfxstS839F/5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720025204; c=relaxed/simple;
	bh=CMVmMJNwEFvF5du6sRle/39+Ihq3LJWrmPPy39aWTWU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o6jSqSC68NKos1f5pbBB36JRlOZNOL54UN1vWwCXgpfZoRoAhK4t7ifvXsoY4fVzTYea2zs2h9juaR85lcrDwkyfnY/SrK0hyn2yCTrji/UCj2em1FXQ/uzaNQdsuVl7UBzccho8hRAgsuzjPeWNDEYfbrQSutyRkMm7W/EOBX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W5xUA76G; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W5xUA76G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720025202; x=1751561202;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CMVmMJNwEFvF5du6sRle/39+Ihq3LJWrmPPy39aWTWU=;
  b=W5xUA76Ga2fSzaV3Bbs3qkyC+2TUcJ2Oj0mFA7FIZ0UnGnp+wZaoyE6L
   9x14Uqid36kLU5zWOXoXKd8m981z95UAZK1o1f/J0who4ZZRm5zTTRVtY
   f4uxaRdrQP3XZJb9k2axoqO7FD32WIL5PUT/Us19HtUYa+POGuDi3w5PY
   yvMilmyaanPqoVnFxnET+zqkMtYd/It+TF4TFb6ruwf/sZK1X/oAvOZiW
   UGnviexE90l8P3c7FgpEcGs6T5LVnViB4hDNlrG5q+akZOJKvT/FyJ7Qv
   cs0ylmRZ+pftFE4RRxDK+a+cXWxGmK+SYW7WkcUlB7YCbI24C/0booBBO
   A==;
X-CSE-ConnectionGUID: L6T/CqVQRk6jVT5YEoO2NA==
X-CSE-MsgGUID: PVKEV1Z2TGGBNMZOjwTlJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="17387566"
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; 
   d="scan'208";a="17387566"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 09:46:42 -0700
X-CSE-ConnectionGUID: vsAW1S8ES0+CvjT9PB+kLQ==
X-CSE-MsgGUID: aYqzj6kxTdmQdgbxJHT+YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; 
   d="scan'208";a="46190799"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Jul 2024 09:46:40 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sP37u-000Q0A-1s;
	Wed, 03 Jul 2024 16:46:38 +0000
Date: Thu, 4 Jul 2024 00:45:47 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 9885/10451] sparc64-linux-ld:
 kernel/rcu/tree_stall.h:797:undefined reference to `csd_lock_is_stuck'
Message-ID: <202407040055.af1kwNa1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0b58e108042b0ed28a71cd7edf5175999955b233
commit: 3be88389f46263f166973e80e528dcc9268e24cb [9885/10451] rcu: Summarize RCU CPU stall warnings during CSD-lock stalls
config: sparc-randconfig-r034-20220519 (https://download.01.org/0day-ci/archive/20240704/202407040055.af1kwNa1-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240704/202407040055.af1kwNa1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407040055.af1kwNa1-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc64-linux-ld: kernel/rcu/tree.o: in function `check_cpu_stall':
   kernel/rcu/tree_stall.h:797:(.text+0x734c): undefined reference to `csd_lock_is_stuck'
>> sparc64-linux-ld: kernel/rcu/tree_stall.h:797:(.text+0x7384): undefined reference to `csd_lock_is_stuck'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
