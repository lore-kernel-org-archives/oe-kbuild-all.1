Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E263D7D97
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 13:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774963060; cv=none; b=KEavEx+tyIbIolb31lJTK79kLH8mQlZ3p0L+7LqNz91+lyevCXUMomJRExl+HebDoakJbu1CZg8Y2MpUwNDALXR/epkSZ8d2Y4XxXv6GkYpcWaQqiYdjqDoFMVm5OfqO5AaR1PSst3mxzkyUxSb7Z7xFPNsSjMvAKH/AKkJZQ9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774963060; c=relaxed/simple;
	bh=oq6x2ZHpeGyCBw+xEEtyjI7DdDH9vST7eQdsTEwnu3I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IlRypr251/VrxbCq49VIE3LDbVn74YKQVvPjov4ijCcOMme4wjvY1rNDk+Zmn1Re5QAjssquzpgoprocHUY+eN+U5Lrb5fiI9Vo4OVSt7CsoCb1YDVmMBRvcLfLjIT4Y1UJvS4oK9WnvQM1IgHMEWqg9JaMjfp1jZeZl+liYjVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c68lYthY; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c68lYthY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774963057; x=1806499057;
  h=date:from:to:cc:subject:message-id;
  bh=oq6x2ZHpeGyCBw+xEEtyjI7DdDH9vST7eQdsTEwnu3I=;
  b=c68lYthYW2yanVVKuWCYZdMZFQtkB2Nlvmlwn54tUaUOg+s7yrZS4HKh
   Z2AC3sX0s/KgUzFOV6MVzMl/8ValWw0kwRlfO8eRLFtJXXOAIVfMlc8/1
   7FwCTUK+2JGYQKh+pE6WN7VZ1HmQRrJlg6MdEVsVCM9nQNvCuOSQ85tZh
   zCwwkTnQaPWfxt0I+a6iXhXbxyJQkdWCF6m5S3woKvI4N9aehPoDubk7m
   tlq5wfLhnfP/4ar74HdYkcsO5gSsM9krJ6vXpCya1Ju+Qmn9PSUcmCno+
   aLoDsKLXkT91K2TMNuHDaND3Xfsgdzob10/SlRjbitdqiuA9ErvaEC6tN
   A==;
X-CSE-ConnectionGUID: E8/UVfOoS/6qDvJt1d22Gg==
X-CSE-MsgGUID: cLiQx9wNTp+f0x8YEmqEiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75861757"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="75861757"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 06:17:37 -0700
X-CSE-ConnectionGUID: YhK5xgx1QKKz9fkv7jLYSQ==
X-CSE-MsgGUID: siJXq90sQ5a1+A21Bsly4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="223485060"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 31 Mar 2026 06:17:35 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7YyK-000000002fh-3u4c;
	Tue, 31 Mar 2026 13:17:32 +0000
Date: Tue, 31 Mar 2026 21:16:47 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Dmitry Ilvokhin <d@ilvokhin.com>
Subject: [tglx-devel:irq/core 10/15] kernel/irq/manage.c:2069:15:
 warning: unused variable 'ret'
Message-ID: <202603312110.BKMoS9yE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irq/core
head:   441c9c1a006b0553ee042b3bd979e3f004b3292c
commit: 2e6275cf004188e749d79ba9b357ab47a94c4bfd [10/15] genirq: Cache the condition for /proc/interrupts exposure
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260331/202603312110.BKMoS9yE-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603312110.BKMoS9yE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603312110.BKMoS9yE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/irq/manage.c: In function 'free_nmi':
>> kernel/irq/manage.c:2069:15: warning: unused variable 'ret' [-Wunused-variable]
    2069 |         void *ret;
         |               ^~~


vim +/ret +2069 kernel/irq/manage.c

  2065	
  2066	const void *free_nmi(unsigned int irq, void *dev_id)
  2067	{
  2068		struct irq_desc *desc = irq_to_desc(irq);
> 2069		void *ret;
  2070	
  2071		if (!desc || WARN_ON(!irq_is_nmi(desc)))
  2072			return NULL;
  2073	
  2074		if (WARN_ON(irq_settings_is_per_cpu_devid(desc)))
  2075			return NULL;
  2076	
  2077		/* NMI still enabled */
  2078		if (WARN_ON(desc->depth == 0))
  2079			disable_nmi_nosync(irq);
  2080	
  2081		return __cleanup_nmi(irq, desc);
  2082	}
  2083	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
