Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3C63CB57A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Aug 2026 05:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787118340; cv=none; b=dKXYrQoogRFzIb6kMFWDPC0E8vOF9n0nrtbJv2z9Y36ZAbSvpr1uoJpqG/adpQ8tuPOdQTwdExjCZa7p32XNa7j0Y/57Lvqa6+zYEQE9AeVhZRl1DeKwjgd/FJp8sUl0pmMiF6vG0RTfo+0zKmfGQXrXg9NidH3xVeruaUeNRhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787118340; c=relaxed/simple;
	bh=1jPLCv+cNEtg9Juy3wzLR2mx1l6szkjbb2HXCkR56J4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pLl+wY/+VBFqcN2Y5SxJvOlqYNX7ch4kHTeVjKn7RI6b8KTyk8+ucsxIhIf5Rox35W2FF4ZrcpVm/Lsukor8cnq7ua1ktZH3lYOt9azN3B/1VrvW6jTTetUs8in2bwQRhLIMOpvzG3syiSjOKF8He81hExK+zOZacbOl40j/jxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AfDVnRIX; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AfDVnRIX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787118337; x=1818654337;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1jPLCv+cNEtg9Juy3wzLR2mx1l6szkjbb2HXCkR56J4=;
  b=AfDVnRIXLVSEYQzihMQ6yX/FL7TzbMpsg0K7ASU7Z0/3eUaO8q7UkfdD
   8LRK9j8s7TVpul4BnWdWtt39Ru/D9gUgZh9tbHDNYEkS4S/4w+/5OyZpx
   6OBPI7DBn4InIHxzJIdc82AtmZHqmKPz1Y0Y4U5NG+r1p1iHzOW24+xPc
   5xP9GoM3RW0mb5oghS6rSXqrVJZISBIjvasgHNQk73qsu6UxzZeJcMjii
   +2bEM6UYP0Id5+HCQsma1erQxyISiuyL78mExMclK5adIZlCdlaASni9P
   vlKzJEDuaBgpTUQFR5+rnFFi+/otTB31hsmbSt3PlC9yhTlCaonskMvss
   Q==;
X-CSE-ConnectionGUID: OO+4cG7fQLy65Q61fSxhBw==
X-CSE-MsgGUID: /VSyxA9uSfyfVvZRgHIyDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87536646"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="87536646"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 22:45:36 -0700
X-CSE-ConnectionGUID: n65btEETS8i0SCplP3127w==
X-CSE-MsgGUID: mq2DT/v0R++01hstVBNTOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="288950362"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Aug 2026 22:45:33 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwZ7D-00000000eum-1eGt;
	Wed, 19 Aug 2026 05:45:31 +0000
Date: Wed, 19 Aug 2026 13:44:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-cached 61/64] lib/dynamic_debug.c:2166:13:
 warning: 'ddebug_drop_all_cached_prefixes' defined but not used
Message-ID: <202608191321.ayWRylKz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dd-shrink-cached
head:   917ff2e5a74ae1c252ad3a2c9017bd464f9258f9
commit: 2ac93b95f70330b9b6a6e2ff609691c85fa7ceed [61/64] lib/dynamic_debug.c: Cache shared dynamic prefixes eagerly
config: sh-randconfig-r133-20260819 (https://download.01.org/0day-ci/archive/20260819/202608191321.ayWRylKz-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608191321.ayWRylKz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608191321.ayWRylKz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/dynamic_debug.c:2166:13: warning: 'ddebug_drop_all_cached_prefixes' defined but not used [-Wunused-function]
    2166 | static void ddebug_drop_all_cached_prefixes(const struct _ddebug_info *di)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/ddebug_drop_all_cached_prefixes +2166 lib/dynamic_debug.c

  2165	
> 2166	static void ddebug_drop_all_cached_prefixes(const struct _ddebug_info *di)
  2167	{
  2168		int i, f;
  2169		struct _ddebug *dp;
  2170	
  2171		for_subvec(i, dp, di, descs) {
  2172			for (f = 0; f < 16; f++) {
  2173				unsigned long key = ((unsigned long)f << DDEBUG_PREFIX_KEY_FLAGS_SHIFT) |
  2174						    ((unsigned long)dp >> 4);
  2175				char *prefix = mtree_erase(&pr_prefixes, key);
  2176				if (prefix) {
  2177					pr_prefixes_count--;
  2178					v3pr_info("drop cached prefix: %s\n", prefix);
  2179					kfree(prefix);
  2180				}
  2181			}
  2182		}
  2183	}
  2184	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
