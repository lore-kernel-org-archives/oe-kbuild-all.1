Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9E63A1DC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Mar 2024 04:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711685858; cv=none; b=cgsnHFeQNJVYVkO3QEso3IfiwA+WtYdJ9nsKHkrtOYaJXX/XPB2nehNLeadkGOQY5l9PUOfREDE9evdZ9wHhOKK8JwhxgHWkM/HghsV7Ak8eSDO5xj5tJmzQEL23jh/v7LRAYGUSWRPqcsEzl7qMWxlMvzmR/lv6hsAZKEj7Guo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711685858; c=relaxed/simple;
	bh=ZB/A9OCko22Tbel5HvsRfCM086RW04sjmoXs8u3adKc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=puY+RxNwjLkhw1ujMtplJHFeztglHFLkcy6tP17BfXryIxCrYSMJ0X9Rwv/pICg5b5bRk0jivWDAZ0rTU687Le2DS4XOn6HrK6dPd3qj2Ksw7T4VOTDJFeht7bFQ6vN0HL4AZPJUJbBjp9cYcEbxxJdiZznrGAVgG6oENbIoQA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JSNzPuPg; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JSNzPuPg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711685857; x=1743221857;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZB/A9OCko22Tbel5HvsRfCM086RW04sjmoXs8u3adKc=;
  b=JSNzPuPgxcQ1RRiZ2zDG4bKM59h2KyBFgnm5Rrdr01G4qSO4FhA9n04U
   l6Loz1Gr5NcJO/zRoRCWUEDtTvjWkhfDa65tN+NEuyL8A5okAdWKuojJ9
   WaAneTu3V4HppCFVpFURWLbpCJEsBziNw7eHZJmCaT9Q0hqgfZVl06lqa
   6LB+Ma4Pe4YNfTakKCcvhsGMr3ZdykBuISSr9eE4cYcu92/W/mQyMacB5
   H+QPX1iCunXnB8YWU9IRjEem9SjCv0V5xaEP2YUj1XW7hzxUgXCntcm28
   4H2NjljRGQVGl0elCg9dGQj4v0Qatm0P5aR3zi7TGNaFUjvQC82X50qeD
   w==;
X-CSE-ConnectionGUID: YwWQe0kQTNORgbzmGIJUWQ==
X-CSE-MsgGUID: xa8KVwQ3SSmTPQxqb/zhgA==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="18019110"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="18019110"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 21:17:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="21533984"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Mar 2024 21:17:34 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rq3gJ-0002q2-2t;
	Fri, 29 Mar 2024 04:17:31 +0000
Date: Fri, 29 Mar 2024 12:16:49 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Kees Cook <keescook@chromium.org>
Subject: [linux-next:master 1591/2169]
 drivers/net/dsa/sja1105/sja1105_main.o: warning: objtool: sja1105_fast_age()
 falls through to next function sja1105_init_l2_forwarding.cold()
Message-ID: <202403291213.sNx1eoog-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a6bd6c9333397f5a0e2667d4d82fef8c970108f2
commit: bc7b83f5e4bf702f399675ae6362c0e5aa176d21 [1591/2169] mm/slab: enable slab allocation tagging for kmalloc and friends
config: x86_64-randconfig-161-20240328 (https://download.01.org/0day-ci/archive/20240329/202403291213.sNx1eoog-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240329/202403291213.sNx1eoog-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403291213.sNx1eoog-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/dsa/sja1105/sja1105_main.o: warning: objtool: sja1105_fast_age() falls through to next function sja1105_init_l2_forwarding.cold()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
