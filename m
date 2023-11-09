Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275B9200A0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 14:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iy7Sotqq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699539263; x=1731075263;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gP1H/kxpXsYMuoc9uz4ajilI9Za6TJegzGvCyi2VHAA=;
  b=Iy7Sotqq5Oz0Lp+T6IX28hsNNI0PyBKQl2hZn1YlJYaWhKwbdzSd5e6J
   /Wm3RZe11OPTiX0RDQsC7H3rnPzBg7lASS0hyDlv1rVwvVs4I3SoRfe8m
   0G+HUXtdr4ARkGbejf+8FBujKEszlbTyQ2fmYld2pFb2TpOzqiwRDLiVD
   BgsL1BlX3z6r1SBwcpyBR3AJrCyN5rWf94+C7sxHPPVUZqvuUUn4MEVZV
   lCtT1BCbR/xR+2fLm8UXbh1A5DX65b/U/B9iehj/dgX44WlJHJ+fPG10I
   gTTtHMKw5y3RIuIt4c2dDTViePc5/ZbKYgabmxTU1DQxh/3N3zOOEXsV4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="11538883"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="11538883"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 06:14:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="4549413"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Nov 2023 06:14:21 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r15nW-0008mA-1O;
	Thu, 09 Nov 2023 14:14:18 +0000
Date: Thu, 9 Nov 2023 22:13:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 5610/27787]
 kernel/power/wakeup_reason.c:199:6: sparse: sparse: symbol
 '__log_abort_or_abnormal_wake' was not declared. Should it be static?
Message-ID: <202311092248.ZVoHljIw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   d43ac48de222318c621dccb5b140e46676779736
commit: 189ced91cd7b0e440b0be876406fd36313a11c3f [5610/27787] ANDROID: power: wakeup_reason: wake reason enhancements
config: i386-randconfig-062-20231022 (https://download.01.org/0day-ci/archive/20231109/202311092248.ZVoHljIw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231109/202311092248.ZVoHljIw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311092248.ZVoHljIw-lkp@intel.com/

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
