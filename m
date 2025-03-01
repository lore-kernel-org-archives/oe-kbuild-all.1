Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332D65258
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Mar 2025 06:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740810887; cv=none; b=jyKvhtdP+pn8ZTUQ+Y/Wylu+rsHAZlJNJj8amij29s/AvJt0i46dDeIQLAClxbrfcUYC3pg2hiKA8yGRItakH6MQfGv4MJAmYz5L2SgyHnpJ3SGxk88UBn8XuxccjwEudZwYwRVZB2+tSpqhIBKTllTb6kQnhhRYvpYkBCdIj5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740810887; c=relaxed/simple;
	bh=pggspHmEhIKXqZbWKm+0C7IuOfqdUiXlIy4srk7i4Nw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aesn8wjGdVPG3tTzig5dmc+mYPD4QBZXd1NpJdrf8q+JuhZ9nL/VCWFFv6jswwZw3+cYhWfUUjlrGi/OjpSl1yjDofhzuJ2FG+ziLh9gme+WFLnhtaKh/6HvF1Ci3okYtFcb6iBFeVlGSuP674JiMEI58yCwU3mYDVk43aoFxjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h+EVZ2Rs; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h+EVZ2Rs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740810885; x=1772346885;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pggspHmEhIKXqZbWKm+0C7IuOfqdUiXlIy4srk7i4Nw=;
  b=h+EVZ2RswdKIG5OT2VtFs9YIVn3wUOBWva2tAzmkP9K2W73KwHCklU9C
   rouLpL/hhWsv1X8WkncQ8tczBnd7ucJ3EwS2PYmGQlPd4+PZLl2m5Xw1p
   /wYQZPPLfQktZOMic75IPe8AIxRDNez61lS4vR3vH2rv2lMkz1fdNNejx
   tcX71dv0bV0k4Y5uakAngLp9RjiHEzBaSyAKGPaAQOQfT+HUjAziA4krT
   CFs9sjdGZlQk0XAmENHimtcgDF2oYkp0pSELyAyguehw6fBq1xWI4el+B
   2F9xopWH9aXGVncFtyb0fiVVRgyknnrWUAjLLnzPT0+i5MdiQHSMfAQvF
   w==;
X-CSE-ConnectionGUID: e7HETp0WQ0azjsDUykJtlA==
X-CSE-MsgGUID: kLyPuqc4S4qeoZpUdD2mrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="52389722"
X-IronPort-AV: E=Sophos;i="6.13,324,1732608000"; 
   d="scan'208";a="52389722"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 22:34:44 -0800
X-CSE-ConnectionGUID: 7wlyrfc3S4qk5GQXaNMzSA==
X-CSE-MsgGUID: 0vzuER4tSX+eGjgsSGHOSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="148440700"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 28 Feb 2025 22:34:43 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toGQl-000Fxe-1o;
	Sat, 01 Mar 2025 06:34:38 +0000
Date: Sat, 1 Mar 2025 14:34:05 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:futex/scope 18/18] kernel/futex/core.c:1585:23: error:
 too many arguments to function 'futex_hash_allocate'
Message-ID: <202503011454.6N0rX4rJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git futex/scope
head:   50063817f6e71b787d3ba96cca9d2fff7b3ea7ff
commit: 50063817f6e71b787d3ba96cca9d2fff7b3ea7ff [18/18] futex: Rework SET_SLOTS
config: arm-randconfig-001-20250301 (https://download.01.org/0day-ci/archive/20250301/202503011454.6N0rX4rJ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250301/202503011454.6N0rX4rJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503011454.6N0rX4rJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/futex/core.c: In function 'futex_hash':
   kernel/futex/core.c:307:16: error: implicit declaration of function '__futex_hash'; did you mean 'futex_hash'? [-Wimplicit-function-declaration]
     307 |         return __futex_hash(key, NULL);
         |                ^~~~~~~~~~~~
         |                futex_hash
   kernel/futex/core.c:307:16: error: returning 'int' from a function with return type 'struct futex_hash_bucket *' makes pointer from integer without a cast [-Wint-conversion]
     307 |         return __futex_hash(key, NULL);
         |                ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/futex/core.c: At top level:
   kernel/futex/core.c:321:1: error: conflicting types for '__futex_hash'; have 'struct futex_hash_bucket *(union futex_key *, struct futex_private_hash *)'
     321 | __futex_hash(union futex_key *key, struct futex_private_hash *fph)
         | ^~~~~~~~~~~~
   kernel/futex/core.c:307:16: note: previous implicit declaration of '__futex_hash' with type 'int()'
     307 |         return __futex_hash(key, NULL);
         |                ^~~~~~~~~~~~
   kernel/futex/core.c: In function 'futex_hash_prctl':
>> kernel/futex/core.c:1585:23: error: too many arguments to function 'futex_hash_allocate'
    1585 |                 ret = futex_hash_allocate(arg3, true);
         |                       ^~~~~~~~~~~~~~~~~~~
   kernel/futex/core.c:1568:12: note: declared here
    1568 | static int futex_hash_allocate(unsigned int hash_slots)
         |            ^~~~~~~~~~~~~~~~~~~
   kernel/futex/core.c: At top level:
   kernel/futex/core.c:321:1: warning: '__futex_hash' defined but not used [-Wunused-function]
     321 | __futex_hash(union futex_key *key, struct futex_private_hash *fph)
         | ^~~~~~~~~~~~


vim +/futex_hash_allocate +1585 kernel/futex/core.c

  1578	
  1579	int futex_hash_prctl(unsigned long arg2, unsigned long arg3)
  1580	{
  1581		int ret;
  1582	
  1583		switch (arg2) {
  1584		case PR_FUTEX_HASH_SET_SLOTS:
> 1585			ret = futex_hash_allocate(arg3, true);
  1586			break;
  1587	
  1588		case PR_FUTEX_HASH_GET_SLOTS:
  1589			ret = futex_hash_get_slots();
  1590			break;
  1591	
  1592		default:
  1593			ret = -EINVAL;
  1594			break;
  1595		}
  1596		return ret;
  1597	}
  1598	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
