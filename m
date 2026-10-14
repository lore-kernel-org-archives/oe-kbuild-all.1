Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BED14772BF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Oct 2026 22:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792015922; cv=none; b=c2Woi16X2UVTnQ2Wiv5wyuJmcFdWKo8N3YbwZ4zLpdk7vrJ2AY9KRuBYl4YIPZhxho7GE4UlXtU60wcnfGIDSVBY+RyI8a6nQMZyyuFOJADj1Imi3tygKflukkz/TqXXYJT6/9DfYhpbsLoLd2lT337rAf5p0uNSc7Ka02sWjmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792015922; c=relaxed/simple;
	bh=QSez6l4Hc5lZW3KD5GZheae2W1OulgT+bcwy+bsGo1o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RXVldFVZ1XC0HEAwCcnjdS7cY5ZOHtkaWjDcrSvlQG8NOhayMvVC/Vk3K4Mbhnbv6KEGV9EUPWjbNZy8Ej+Mr0u8yFy+T26mDfGCrDIYw23JH3QMDUermcOt6ND4jT+yv2g9DS8JQ5HETWdrKWMgTWPF7iE6LmFLqBcLI6NxZsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B9kFlxDK; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B9kFlxDK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792015917; x=1823551917;
  h=date:from:to:cc:subject:message-id;
  bh=QSez6l4Hc5lZW3KD5GZheae2W1OulgT+bcwy+bsGo1o=;
  b=B9kFlxDKoBA1s+cPUoJmnnjpstuNbf4p7dn2Fv05a0N+W8S7PVqm5hIY
   0Zyvc4jTlrFn3e+4HCiXC95AD2PaIkiMlpPe4M9r5sOr/ZTSRM4FZPb4Y
   z9/ncawjDOwXJkXDvwOzHBdJSb43Yx1wN8w6HauCvrCBJsXmrhDkj9xaa
   dmM9K2aqF+U4bnNnNv/AZj/0VWD4a1dFOSqkM3lu7Z1NYEa4r7x8g31+X
   XY3AomvnuXY0A3ov7CWHsafVms+Zzz7UY4AewCBOOnfMmSyjnk7KLEsuR
   1Ge8G8YzmjLqXu7SV66OHrt/3Tj98XYGplVx/Dzpp+4HJzywY8fPoHUUD
   A==;
X-CSE-ConnectionGUID: urvQk9P/Rx+NZYTq70KrSA==
X-CSE-MsgGUID: /44A4KTsQvOVBqQqDjHwhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="780214"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="780214"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 15:11:57 -0700
X-CSE-ConnectionGUID: 7oiH7aJxRlmtLc/lV+tzTQ==
X-CSE-MsgGUID: vtq5lRs5QVW344wXuxviTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1445474"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Oct 2026 15:11:56 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xH7CT-00000000FFL-0oYP;
	Wed, 14 Oct 2026 22:11:53 +0000
Date: Thu, 15 Oct 2026 06:11:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/1] fs/fs-writeback.c:138:6:
 warning: no previous prototype for function 'wb_wakeup'
Message-ID: <202610150620.rWPaTERy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Bo,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   c82b35cb007f01c9aef84e93febc8961486d59ec
commit: 55cf94258af72fd493779ab2b7a4278d5c8d1d21 [0/1] ANDROID: writeback: export symbols to do a hierarchical writeback control
config: i386-randconfig-1001-20261014 (https://download.01.org/0day-ci/archive/20261015/202610150620.rWPaTERy-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261015/202610150620.rWPaTERy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610150620.rWPaTERy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/fs-writeback.c:138:6: warning: no previous prototype for function 'wb_wakeup' [-Wmissing-prototypes]
     138 | void wb_wakeup(struct bdi_writeback *wb)
         |      ^
   fs/fs-writeback.c:138:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     138 | void wb_wakeup(struct bdi_writeback *wb)
         | ^
         | static 
>> fs/fs-writeback.c:1349:6: warning: no previous prototype for function 'redirty_tail_locked' [-Wmissing-prototypes]
    1349 | void redirty_tail_locked(struct inode *inode, struct bdi_writeback *wb)
         |      ^
   fs/fs-writeback.c:1349:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1349 | void redirty_tail_locked(struct inode *inode, struct bdi_writeback *wb)
         | ^
         | static 
   2 warnings generated.


vim +/wb_wakeup +138 fs/fs-writeback.c

   137	
 > 138	void wb_wakeup(struct bdi_writeback *wb)
   139	{
   140		spin_lock_irq(&wb->work_lock);
   141		if (test_bit(WB_registered, &wb->state))
   142			mod_delayed_work(bdi_wq, &wb->dwork, 0);
   143		spin_unlock_irq(&wb->work_lock);
   144	}
   145	EXPORT_SYMBOL_GPL(wb_wakeup);
   146	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
