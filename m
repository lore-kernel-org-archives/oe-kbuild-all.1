Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF57A5D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Oct 2023 01:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dzrbIbE2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696989169; x=1728525169;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KCEdcreh/HF6DZ4WqO2jFJUfTma581oIRBIKEzUEwJo=;
  b=dzrbIbE2JsPp8VCKcpr0ubRNwiTQi2Pnh9UtssvfoSIY6jsbzkuH0xYV
   JtER2HZktArA9DQ0GvZjybzH824BxYSvaKGLuUaamO+k9FG7WLFKHkf+B
   UapJ0PLQpcqa4t9hQrLnm7llkcgbJXM+TUG4hSorc+uCNjJwSbK/mjVu0
   QkBdu3lILXJwNrFRIgPnnLt2+atJKldK/N6v4G+LH27AeCDUD0gaQxYSJ
   a/olV7mt+u0sA2GdcsdeJyD+u8lcJ2apUU4BCcQ1JCEt/+RXJasQ6wsrw
   HxBL7WT1+0fTMXRvsXnmSaj0ZahQYroR+jL8oUjZBH6tdG3rkhbZ2W3x5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="6118476"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="6118476"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 18:52:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="788805376"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="788805376"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 10 Oct 2023 18:52:46 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqOOx-0001X3-32;
	Wed, 11 Oct 2023 01:52:43 +0000
Date: Wed, 11 Oct 2023 09:52:29 +0800
From: kernel test robot <lkp@intel.com>
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: kernel/reboot.c:559: warning: Function parameter or member
 'poweroff_delay_ms' not described in 'hw_failure_emergency_poweroff'
Message-ID: <202310110952.0PSEypq4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Matti,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1c8b86a3799f7e5be903c3f49fcdaee29fd385b5
commit: dfa19b11385d4cf8f0242fd93e2073e25183c331 reboot: Add hardware protection power-off
date:   2 years, 4 months ago
config: csky-allnoconfig (https://download.01.org/0day-ci/archive/20231011/202310110952.0PSEypq4-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231011/202310110952.0PSEypq4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310110952.0PSEypq4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/reboot.c:215: warning: Function parameter or member 'cmd' not described in 'do_kernel_restart'
>> kernel/reboot.c:559: warning: Function parameter or member 'poweroff_delay_ms' not described in 'hw_failure_emergency_poweroff'


vim +559 kernel/reboot.c

   548	
   549	static DECLARE_DELAYED_WORK(hw_failure_emergency_poweroff_work,
   550				    hw_failure_emergency_poweroff_func);
   551	
   552	/**
   553	 * hw_failure_emergency_poweroff - Trigger an emergency system poweroff
   554	 *
   555	 * This may be called from any critical situation to trigger a system shutdown
   556	 * after a given period of time. If time is negative this is not scheduled.
   557	 */
   558	static void hw_failure_emergency_poweroff(int poweroff_delay_ms)
 > 559	{
   560		if (poweroff_delay_ms <= 0)
   561			return;
   562		schedule_delayed_work(&hw_failure_emergency_poweroff_work,
   563				      msecs_to_jiffies(poweroff_delay_ms));
   564	}
   565	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
