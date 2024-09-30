Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C554F1A2623
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Sep 2024 23:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727739646; cv=none; b=YWCQderUpqiNx+OOUsNE5mOY5bGY8yO8T3djT4kbNMksZ/rUH4DyrEZJoDdMMR/zNB6NNNO2JHLQXO86PyLvGX1Wta5j9vI4CtbX6mme8iQHknSI1ZYYhIa/lWkgBHydebRS6LeeKfUEth3l4mROvSTKDCMW3lhvcVYyim/eNfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727739646; c=relaxed/simple;
	bh=dpuKg/Y5TyfPQD/1HxnYGGHcHJ8+pERHQWt+d7wQAv0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MXRXwJrlpDlsU7sTMLZATmkTn5+DCzK4GNRdKeyTk8QmdfzU5YKqEwOvJ4OWRHHSndcqklIOfMyP7gjLxXfMzaWOYg2eMBtG+dgGdgA1JQERQtKMP755Dp3Z8KPFGkrdGuPRGCPXriap4NIvGUtxCIxSvuWAItSM9KzYLxQ4biQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LCFxqjP/; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LCFxqjP/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727739645; x=1759275645;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dpuKg/Y5TyfPQD/1HxnYGGHcHJ8+pERHQWt+d7wQAv0=;
  b=LCFxqjP/DZQdqU41+WF2b6l6xwzxkuD0UTFnDAPAR4tctZeEdI3upJbR
   Qrvz6aqkWf2dlQtmUnC0eXQSBKHe7EEmT+tYZwniZbersa8iC3FAS62Aj
   SaxDyNGgooetsLiiczaXXKWI+FbT4bBfGB1dON2K9Yndcn17fXCdP+hZ8
   sG440MICc64GaVAp90o7lhgA79DMyD88o4hyhlf4BWpU0jEfrUF6iqEJN
   0vRqGmlaq5f1icSiF5kpcHQgktPuatqjtUbb30MffEk2Kigr2SJxkqjzG
   U55pOGSBpGIOztp8k95g5cEB/0cis04TA334yoop6YCbIyoEXbHNmz2Bu
   A==;
X-CSE-ConnectionGUID: 496c25bhS1SPuQXNHdrh7A==
X-CSE-MsgGUID: Oif0ojbSRM+s9WEk3/zVsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="38244799"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="38244799"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 16:40:45 -0700
X-CSE-ConnectionGUID: ReELr9IqQq+8/P+ib/UdAg==
X-CSE-MsgGUID: y+fKNh5SSCqAXhg2fRRmwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="110950896"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Sep 2024 16:40:43 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svQ0P-000Q2k-0F;
	Mon, 30 Sep 2024 23:40:41 +0000
Date: Tue, 1 Oct 2024 07:39:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 3688/30000]
 kernel/power/wakeup_reason.c:199:6: sparse: sparse: symbol
 '__log_abort_or_abnormal_wake' was not declared. Should it be static?
Message-ID: <202410010719.jo1hYV1y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   1dd4a498c91aa13a5f4e61fd40a88aebb5bca367
commit: 189ced91cd7b0e440b0be876406fd36313a11c3f [3688/30000] ANDROID: power: wakeup_reason: wake reason enhancements
config: x86_64-randconfig-122-20241001 (https://download.01.org/0day-ci/archive/20241001/202410010719.jo1hYV1y-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241001/202410010719.jo1hYV1y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410010719.jo1hYV1y-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/power/wakeup_reason.c:199:6: sparse: sparse: symbol '__log_abort_or_abnormal_wake' was not declared. Should it be static?
   kernel/power/wakeup_reason.c:378:12: sparse: sparse: symbol 'wakeup_reason_init' was not declared. Should it be static?

vim +/__log_abort_or_abnormal_wake +199 kernel/power/wakeup_reason.c

   198	
 > 199	void __log_abort_or_abnormal_wake(bool abort, const char *fmt, va_list args)
   200	{
   201		unsigned long flags;
   202	
   203		spin_lock_irqsave(&wakeup_reason_lock, flags);
   204	
   205		/* Suspend abort or abnormal wake reason has already been logged. */
   206		if (suspend_abort || abnormal_wake) {
   207			spin_unlock_irqrestore(&wakeup_reason_lock, flags);
   208			return;
   209		}
   210	
   211		suspend_abort = abort;
   212		abnormal_wake = !abort;
   213		vsnprintf(non_irq_wake_reason, MAX_SUSPEND_ABORT_LEN, fmt, args);
   214	
   215		spin_unlock_irqrestore(&wakeup_reason_lock, flags);
   216	}
   217	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
