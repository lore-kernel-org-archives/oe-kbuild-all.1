Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC4C45C14
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Feb 2024 11:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708601473; cv=none; b=Tg3xmfG199KIGlBwkPDZOwveRf7nCEW+AWoZ+KdpmgdRst+ltEZ7gLz7CjBn2YqJjMlBw3sO4WFuOZZeHjwyL0JgbKCXjGWQasQVvzhKxUpA3eLMxI9ZCiD4kqoJtGUPmeH+wWJtfwqneMTXWUOtkvVBAIeFutiqmMA8KGdzQtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708601473; c=relaxed/simple;
	bh=95clbNinetvYlYZjcIgcYxUucbqk0kS2pyhpr8wcvVc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pubyv5zsIRh4DN+Yqpf+jLMW4zK2D80O3/MwwMgAmlsb0n/1XgOv75Bn+QcoQARudirXJGlhNpyJLf8f8awJLM3s2T0XN9PKKevu+wzgOdJ1B5Se+nYGHX7yOtvUgrb1IZnyhwoiTmltsTzIfqKKfFbgts9KyZN5/hjZOhm8s1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mAJkrfsm; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mAJkrfsm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708601471; x=1740137471;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=95clbNinetvYlYZjcIgcYxUucbqk0kS2pyhpr8wcvVc=;
  b=mAJkrfsm3QzQDxgl3iQzZOId45+lhU1rIK7OYbxEeNcwYyeAfc7s7f4p
   oCONpJeXBJc1bFk7ieN8LKF0ttsPW8l9ekLvT5lINPQbYnzQVzMXBs+ZS
   66hRHkw706fe7s/OtFhwaWpvQL9ENTNaPiQoVreYtR/QtHNaAIH4AAJFk
   yUMjuiwn0Js6Iw+4it5azae0SpFjfC/4e4c/ULUpnxzeYWF6zCEYWqODa
   9WXyxWVDdhOJS3C/+U+glQhV+mC0+gIo7+fbw4grjn/WLL+wrDC7yaFNB
   CFKEtVwDBz0o6M7U2Ll5OKbFhp/Tt4900U91CZXhsYARfhZNmgKQQhPu3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="14242672"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="14242672"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 03:31:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="10144575"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 22 Feb 2024 03:31:10 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rd7Gd-0006F8-1p;
	Thu, 22 Feb 2024 11:31:07 +0000
Date: Thu, 22 Feb 2024 19:12:01 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:dev/v6.8-rc2/signed-overflow-sanitizer 34/35]
 lib/atomic64.c:184:17: error: implicit declaration of function
 'wrapping_inc'; did you mean 'wrapping_mul'?
Message-ID: <202402221957.NDuecLp6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git dev/v6.8-rc2/signed-overflow-sanitizer
head:   c9be233a2bfbf0ce524d6a2010584ee4b43c7471
commit: 2571b350621fa8ed4c6adb1b798f60a3423b7655 [34/35] locking/atomic: Annotate generic atomics with wrapping
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240222/202402221957.NDuecLp6-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240222/202402221957.NDuecLp6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402221957.NDuecLp6-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/atomic64.c: In function 'generic_atomic64_fetch_add_unless':
>> lib/atomic64.c:184:17: error: implicit declaration of function 'wrapping_inc'; did you mean 'wrapping_mul'? [-Werror=implicit-function-declaration]
     184 |                 wrapping_inc(v->counter, a);
         |                 ^~~~~~~~~~~~
         |                 wrapping_mul
   cc1: some warnings being treated as errors


vim +184 lib/atomic64.c

   174	
   175	s64 generic_atomic64_fetch_add_unless(atomic64_t *v, s64 a, s64 u)
   176	{
   177		unsigned long flags;
   178		raw_spinlock_t *lock = lock_addr(v);
   179		s64 val;
   180	
   181		raw_spin_lock_irqsave(lock, flags);
   182		val = v->counter;
   183		if (val != u)
 > 184			wrapping_inc(v->counter, a);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
