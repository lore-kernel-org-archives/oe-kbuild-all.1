Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793889011;
	b=zvvcIhowk4VbKdvEzVmSoFnIat81unzjW3xhv2OQa1l6uRE38TLgxRz4YV3/KsJDuT4S
	 kaW6BUu0CiJGao21LuKGDDFFZwWZzTAHXStSYvTcDzZ1AeGfSNdKIuex39IqgBq19mkGs
	 6cAECnIiFwLQbkLYAmuHdNk+FdmCaf+pZ+rEo6jkNHdGMne327mWp9qK76mZZJG8XX8kv
	 oCXf5qtoeIKMXvwl3Z5SpizpFRViUvGNR3jAZakCFd8N6rJb7hKUumxr6FU/PtfrUdAJq
	 gZMBadHZMBb/78SaY11q8Bl08kFFVG6KXmQJYwLZ36YgzZSu/Vw1YT9Py7Z7PRZR9YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793889011;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=uS5maslF+NSEg+gGxTdcbDpYYQEpFvFB0oh8VExIsdc=;
	b=MqnNuV1qyF9rbZj7TSFGEIaA9LPD+2CGsVwwdad+3mlacRchLSLWB/Ytnnup1Z2rR9hM
	 uE6S9inLxsy8DzFIMDKOPZeapWZLuoScl5pRarKuApJ7mhljZTpPfZvlMFbACqBrFyzon
	 OspOFYnNxztcpXmTk51PaJ5AMmgbn3FZdwh5QZab8WKzyzEHtBezskOCsvlYxJdxBVbJP
	 +hNcG9U4rlFBhpoFV1vQaO3b8KMopjUmZHW6M7ApoAcvXWlxZjiry8TDZhDuzgIFCSGzU
	 3+HRd9+mM9nYi3/IrzmUXGL7ikV+Ih6gApCLfXVyvBqwv5BmzfcNQie6oa2cMUDGQ0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NtC7j2Y4;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE509606A331
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Nov 2026 14:30:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE509606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NtC7j2Y4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793889009; x=1825425009;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YpqY7Jc/FufberPpYzqr0pSP+kK5Ii1cJk0BaQt2L3s=;
  b=NtC7j2Y4nwCRbLoriKREzOYOJDJtcE4YofSdWHwZT1TVNpwt+If5YaXz
   gV2ECU7+ukKIFL0yUnGHkgDJ1AR2usGud2kWAYu7iKej9pqj7M05Aut2N
   RmJ7h7PeLyX9nRnPXzRa5su39fMwR01j2FXiLlBSusx/IURsH+pojV6xa
   PWOzbDkkjAw4h5YtxYQDOCycMrTG4iH+9j0jo+9CRqaodLucyhdlljgd7
   XZOpVUghUxnyY93aXMmyPlXF58n//IPUfzBUcZWI1pGRIxSwDZgh+5DFS
   5/Jl6SLTBCBJ174hWI1sdi53FFKvP6aYZyxB8zMUmRdFbJ765ZPHXgoBV
   Q==;
X-CSE-ConnectionGUID: 1zHyoBcfQdK6qCN7SsSfOg==
X-CSE-MsgGUID: NlQcAV0BQv6y849b/BKa7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2777947"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2777947"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 06:30:09 -0800
X-CSE-ConnectionGUID: e4St1aMmSzGKxpplJxRyLQ==
X-CSE-MsgGUID: fAYU5Qq3TVGmBI0Deeiy5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7142953"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 05 Nov 2026 06:30:07 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOyTb-00000000mJz-2yCy;
	Thu, 05 Nov 2026 14:30:03 +0000
Date: Thu, 5 Nov 2026 22:30:03 +0800
From: kernel test robot <lkp@intel.com>
To: Yuehong Wu <wuyuehong@cmss.chinamobile.com>,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, akpm@linux-foundation.org,
	richard120310@gmail.com, handyhandyman.adam@gmail.com,
	tglx@kernel.org
Subject: Re: [PATCH] lib/tests: add KUnit tests for the priority sorted list
 (plist)
Message-ID: <202611052109.GqbzRkv1-lkp@intel.com>
References: <20261103-plist-kunit-1-yuehongwu@cmss.chinamobile.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103-plist-kunit-1-yuehongwu@cmss.chinamobile.com>

Hi Yuehong,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-nonmm-unstable]
[also build test ERROR on akpm-mm/mm-everything linus/master v7.4-rc1 next-20261030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuehong-Wu/lib-tests-add-KUnit-tests-for-the-priority-sorted-list-plist/20261103-193652
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20261103-plist-kunit-1-yuehongwu%40cmss.chinamobile.com
patch subject: [PATCH] lib/tests: add KUnit tests for the priority sorted list (plist)
config: i386-randconfig-1003-20261105 (https://download.01.org/0day-ci/archive/20261105/202611052109.GqbzRkv1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611052109.GqbzRkv1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611052109.GqbzRkv1-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: lib/tests/plist_kunit.ko: symbol 'plist_add' undefined!
>> ERROR: modpost: lib/tests/plist_kunit.ko: symbol 'plist_del' undefined!
>> ERROR: modpost: lib/tests/plist_kunit.ko: symbol 'plist_requeue' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
