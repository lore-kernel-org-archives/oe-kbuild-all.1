Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154B429AAFD
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 May 2026 18:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778007210; cv=none; b=NBiY6M9Gu7RQNlZg079uNKgVQsJfTd1WHx/UB8TA4dmjZFy44L8ZmyyVWNMckQ8btp9Hf7kXHGgsxfG5MJDmpJHEVTY7Rem2MA1i2WuyfLoqFa7cBlVVcAImdi009RHd4Fpks2HKulNU5l/Myyfx2CDq0vXAeTAIumlZzr0oV6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778007210; c=relaxed/simple;
	bh=ivTzLIQSZNO8oveIjr6NbIHu8t3Tqjds9AoHYp6DT3U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Bx3qjd9SAFwKbA3S1W4tc29ISkOiqQ8mUD16vIlSl1ki88j+U+SQAslnCJ5sNj3jiYFVzBI6f+RJwqTD3rB+YaMU4i6aPfZsDufP/YOz6MrsG/jAJG1596Ggbey9iA6tCIPXf7CYhn33OF2Z6q9e7/k0YxWoavOHr79PMt4wUzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FmlvNne7; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FmlvNne7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778007209; x=1809543209;
  h=date:from:to:cc:subject:message-id;
  bh=ivTzLIQSZNO8oveIjr6NbIHu8t3Tqjds9AoHYp6DT3U=;
  b=FmlvNne7fQgpNVBeQ5qBKJ5H3GinaS2ra9fAyA3/LE4CLw4YBJRn5hLr
   jqCB1nCOTBXda2KPVMtCdHdyLH0xKExXxSQr/Pm2a1em9f/yppBjVQus/
   ikTFDDDSjLthQKGr0k8WbGAtDIDQwlASNGVTbTeuQzWKA5HuiitedUxx9
   QhZN6B6hqY4vZ0tT0tG/Jx5xy7NoR3zclV+sGG335wj25pjAZvNWsQV/e
   qLfLnF7UyvpSjwiGf2vRvYLklkMW2/6Jcf+YLkzu2uBRsAr5Kr5YdEHRI
   pnGvo/dak3JrN77kwxNjsl8oBDSmnBrP14Kk1YHLcown+Zjrb1WMkwCkW
   Q==;
X-CSE-ConnectionGUID: V2+rq/4rQs6WOGcg0Oti0A==
X-CSE-MsgGUID: MrJ6d/+CSlKnO7sFYqKzBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78750841"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="78750841"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 11:53:28 -0700
X-CSE-ConnectionGUID: aIA2QJ4ZQ7yfH6C/Kexd2g==
X-CSE-MsgGUID: nM/flgclQ++gstFc5i4Mag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="236142829"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 05 May 2026 11:53:27 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKKtY-000000000Mv-2vPc;
	Tue, 05 May 2026 18:53:24 +0000
Date: Wed, 06 May 2026 02:52:48 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:block-thread-safety 18/27] Error:
 drivers/block/loop.c: CMatch: Unexpected token '@' on pos 164:
Message-ID: <202605060228.2E0I2nzN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/bvanassche/linux block-thread-safety
head:   10259f322f6fbd9089c9e695daed50e886455b9c
commit: a7ef3bd0a35d3e0476cf41e21c11614fd8bda149 [18/27] loop: Add lock context annotations
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20260506/202605060228.2E0I2nzN-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260506/202605060228.2E0I2nzN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605060228.2E0I2nzN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: drivers/block/loop.c: CMatch: Unexpected token '@' on pos 164:
   	'static int loop_global_lock_killable(struct loop_device *lo, bool global)         __cond_acquires(0, &lo->lo_mutex)         __context_unsafe(conditional locking on @global)'
   Error: drivers/block/loop.c: CMatch: Unexpected token '@' on pos 152:
   	'static void loop_global_unlock(struct loop_device *lo, bool global)         __releases(&lo->lo_mutex)         __context_unsafe(conditional unlocking on @global)'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
