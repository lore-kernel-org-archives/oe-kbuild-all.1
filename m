Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A85030498E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Feb 2026 02:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770516604; cv=none; b=inWSLM5Pq35Rf3vEA7b3AlRqxBzMjdbPvDyYtqpaxyvT4Er1Div6QEAlrVM4zY4n8BaLJtnmd51CMaSqiKUMJwDP1B53GeLP5To/phyQwjEr7CFch0n7YbrlbC5qlT5rghnsMfA1IOJWPBFGgesRo3qpH7dbizOjeA57nOFq5cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770516604; c=relaxed/simple;
	bh=cmcytLAFg2mIdBgj5Iy8C6K6SAvGCetpxRW/k4wlhTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FwRUhOxM1J0Nb12H7d5NbBa4dFHhCZPzAe3UepG1Tnx71ceFVJdbEEfUt6QehlD3qlMsScRDWCTI//HMSunrZ5CLn//xjiUq9pkBhCHrJ2k1Cns9dciboQzj6t1vjNmDqeT0Nm8lesGmxVZOWD7u/9Willp/BmbfVtbLAFvpgg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oA5cvCng; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oA5cvCng"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770516604; x=1802052604;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cmcytLAFg2mIdBgj5Iy8C6K6SAvGCetpxRW/k4wlhTw=;
  b=oA5cvCngFjFBeqHvwiyxLc4BUoDSPfy7eiYZvealbyQRAnjyXZZqvE3M
   j5CityUNpyR3GnFW12V15wE/vh9O0mpUce2Olmm8v7R15TRkUhHV6nt3x
   7IpH/rUGJrkk2AsNVfeBbNC30P3no7RX3ixRwldJaKieNB+A68+Jt73RA
   I08Jb3ivqp+bYlIHQbM+SK0pqTq8E4c69Gpusa5GcuXXSwtKZfaKzDgKv
   atza9sU3cyKDXSLhHDIr1GbIFWO+KtX0I9LWYQJtQ//oqr5nOaZ95O7fx
   0g01es9i9niyHQQQrQvwSngRtwqWqq2cy73jCgbIJCMwBy3XZuJcvNT+i
   Q==;
X-CSE-ConnectionGUID: v3aBjMqXTtqD/EVetwEGLw==
X-CSE-MsgGUID: cXVevfEhRWe/CtghZy+TYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11694"; a="70872915"
X-IronPort-AV: E=Sophos;i="6.21,279,1763452800"; 
   d="scan'208";a="70872915"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 18:10:03 -0800
X-CSE-ConnectionGUID: 5Jf8fZSTQBuqztSeAnacDA==
X-CSE-MsgGUID: DlafrMlOSomtDDvzLSUTwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,279,1763452800"; 
   d="scan'208";a="210487889"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 Feb 2026 18:10:02 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vouFM-00000000m0W-1Mgo;
	Sun, 08 Feb 2026 02:10:00 +0000
Date: Sun, 8 Feb 2026 10:09:22 +0800
From: kernel test robot <lkp@intel.com>
To: Qiliang Yuan <realwujing@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 06/12] watchdog: Allow runtime toggle of hardlockup
 detector on CPUs
Message-ID: <202602081041.A1FfJQna-lkp@intel.com>
References: <20260206-feature-dynamic_isolcpus_dhei-v1-6-00a711eb0c74@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206-feature-dynamic_isolcpus_dhei-v1-6-00a711eb0c74@gmail.com>

Hi Qiliang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 1f97d9dcf53649c41c33227b345a36902cbb08ad]

url:    https://github.com/intel-lab-lkp/linux/commits/Qiliang-Yuan/sched-isolation-Remove-__init-restriction-from-housekeeping-cores/20260206-150801
base:   1f97d9dcf53649c41c33227b345a36902cbb08ad
patch link:    https://lore.kernel.org/r/20260206-feature-dynamic_isolcpus_dhei-v1-6-00a711eb0c74%40gmail.com
patch subject: [PATCH RFC 06/12] watchdog: Allow runtime toggle of hardlockup detector on CPUs
config: arc-randconfig-002-20260208 (https://download.01.org/0day-ci/archive/20260208/202602081041.A1FfJQna-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260208/202602081041.A1FfJQna-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602081041.A1FfJQna-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/watchdog.c: In function 'watchdog_housekeeping_reconfigure':
>> kernel/watchdog.c:1373:25: error: implicit declaration of function 'proc_watchdog_update' [-Werror=implicit-function-declaration]
    1373 |                         proc_watchdog_update(false);
         |                         ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/proc_watchdog_update +1373 kernel/watchdog.c

  1362	
  1363	static int watchdog_housekeeping_reconfigure(struct notifier_block *nb,
  1364						    unsigned long action, void *data)
  1365	{
  1366		if (action == HK_UPDATE_MASK) {
  1367			unsigned int type = (unsigned long)data;
  1368	
  1369			if (type == HK_TYPE_TIMER) {
  1370				mutex_lock(&watchdog_mutex);
  1371				cpumask_copy(&watchdog_cpumask,
  1372					     housekeeping_cpumask(HK_TYPE_TIMER));
> 1373				proc_watchdog_update(false);
  1374				mutex_unlock(&watchdog_mutex);
  1375			}
  1376		}
  1377	
  1378		return NOTIFY_OK;
  1379	}
  1380	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
