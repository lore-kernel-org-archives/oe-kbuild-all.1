Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B242BCFF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Oct 2024 03:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728788976; cv=none; b=u4RIwc0r9MWkPTd/+P4CvW9ShCAW2Jnokj37ihrU+wdVk3VYwDifeBQXmX0XNV0mEUL3uhdLaAgnqSQnmwRNudsu+Jgp9vsr0FXdrHTv4YUexbpA8ZEKloh62rcSHQba61pv1aYHmK1Xr/PXz+odVIfJ7X+7GycVgyWjhw/QnQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728788976; c=relaxed/simple;
	bh=/AZ1XHsMr1Z4pgy6qof5mEDHiGcYDsie+naWpc8+h8k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s093GsPw0mdHn3GuEuLfLjXNYLbBu26SEVXo974kbMS1Ow96TvNP1ToLScvNyrUjOgHsPSIVFWHSENHwQe3Kex7113Pl74LRlStsZsZ4g3TsQVl6jhxHzvtBVkjSiXxbUK4qbI6FUE7A39VQ/W3bpQjKxMwP+0rSYnRAST0umCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bw0UB4l2; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bw0UB4l2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728788974; x=1760324974;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/AZ1XHsMr1Z4pgy6qof5mEDHiGcYDsie+naWpc8+h8k=;
  b=bw0UB4l2mpmtnY96NBdjPrJH5tX02KDCuB/v+iBs4iMuDsd0BR+MB3qT
   FbFwep5onRJMwjV4eMZs5esSXqAktHXljJaJL1AQUYO4bUGvXqa4/coJv
   F2M04D1oLMW1ngvOubX+VJ4Mtgb05pUuAVUU9qHh6lgKwFYR9W/oO6mRI
   OvBmJz+zZQZPyHeGxuLmeZCGaoyyw6aRRT+JPn6r3gqBsbPO0YDpl0u0q
   L6q+uoUdQDbWX9FGkLuue8lIH1MpfBmGdY+XHcCqPYgJggdyBIg45X+PM
   fnpQjWUSmyjT1OMCSUdbQVYuKuwGNqUi3ebAcoJm883Bu8C0KbZU06Uja
   g==;
X-CSE-ConnectionGUID: dYN0Xo5DQMmEgxTPxgFkbQ==
X-CSE-MsgGUID: +AhZ2lzhSHiaG6ABylD3Uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="50691918"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="50691918"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 20:09:34 -0700
X-CSE-ConnectionGUID: o4YwD7hbTRq5uRyCiMUarg==
X-CSE-MsgGUID: vTiMmkW8RRSQ/hk08XPrZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="82050477"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Oct 2024 20:09:33 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szoz4-000E1V-0X;
	Sun, 13 Oct 2024 03:09:30 +0000
Date: Sun, 13 Oct 2024 11:09:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 4078/30000]
 kernel/power/wakeup_reason.c:199:6: warning: no previous prototype for
 function '__log_abort_or_abnormal_wake'
Message-ID: <202410131137.3nINJGfR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kelly,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   171355878e09938c06396498f584662e3eddcdbc
commit: 189ced91cd7b0e440b0be876406fd36313a11c3f [4078/30000] ANDROID: power: wakeup_reason: wake reason enhancements
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241013/202410131137.3nINJGfR-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241013/202410131137.3nINJGfR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410131137.3nINJGfR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/power/wakeup_reason.c:199:6: warning: no previous prototype for function '__log_abort_or_abnormal_wake' [-Wmissing-prototypes]
     199 | void __log_abort_or_abnormal_wake(bool abort, const char *fmt, va_list args)
         |      ^
   kernel/power/wakeup_reason.c:199:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     199 | void __log_abort_or_abnormal_wake(bool abort, const char *fmt, va_list args)
         | ^
         | static 
   kernel/power/wakeup_reason.c:378:12: warning: no previous prototype for function 'wakeup_reason_init' [-Wmissing-prototypes]
     378 | int __init wakeup_reason_init(void)
         |            ^
   kernel/power/wakeup_reason.c:378:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     378 | int __init wakeup_reason_init(void)
         | ^
         | static 
   2 warnings generated.


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
