Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843111E5205
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Jul 2025 08:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753001505; cv=none; b=rzheeZ94a6RRj7M4b+M8WzW2Elta+4lwHFpo8RzZzsTGSgqA7E4KiK2zGOb23MUnrE3v5Q3izUjL0UoXTNpwfCRdOTSvXUfgTzMBRNsPcY//rtc4GbIb7MNHRaKlx0XL8CMahOs6d0nw1vejPrVZsAatzjXmBxd7QrPZpYYuMIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753001505; c=relaxed/simple;
	bh=abDbiYcw+lmn6h6BoZuNNZBEUlRZJ9AWNI1g7Xr+bKc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LLTt+owBABiPWmntCOM18Zz5DNthoV8t9UCuoPhdoNqCRHgFHDz+qKYBX6qLyfoHba01hnjzv/wf2D2S6p9UyalMhC3RPF7A67KlLCslEQc+Vk7fQqm9lKIKK19YbpQSP3zClnNAqVjsLgV0G2UXegAWdo4iEOv6oWGvXJa9j30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kk0tE4/7; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kk0tE4/7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753001503; x=1784537503;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=abDbiYcw+lmn6h6BoZuNNZBEUlRZJ9AWNI1g7Xr+bKc=;
  b=kk0tE4/7/3qX/cU1K3Cy0pPMZMJ3TIYFmFh0vVha00Vgpkel6WxECfL9
   xC+jnYMaypXozSmH1tDl1uuQSTd4Hjubs+EsJWOrdid74K6GZBTwgjvw5
   vH1+6hq7RuTrSckwwvzc8E9ipvh7saZxKrAP+gzhUjNPpqS5TlpInHPg0
   oXs4kcmcaWN9VlbYmu+18N57fBxWxrWF4fiTm+vhSkdkIqlEQh3JVRyLL
   8oIJGHNNpRb1QbnW3cucUnA5ohCJzoqJcDA3JUhs/HqKZ8kgBPSV37bMi
   0VL59KZtRLE7QNIiji54hRxUxvOTSGZpoEtdLdFTf7Lf6xZQhdSFZspyK
   Q==;
X-CSE-ConnectionGUID: AU2o2uahTAaDvEj+giWI7A==
X-CSE-MsgGUID: rQJqm15mQq2BJXf2QuImAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11497"; a="55198120"
X-IronPort-AV: E=Sophos;i="6.16,326,1744095600"; 
   d="scan'208";a="55198120"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2025 01:51:43 -0700
X-CSE-ConnectionGUID: CDFkIEXlRpCuHpX8VOs7XQ==
X-CSE-MsgGUID: JnWLNyWeT8KIZlSbt9wJzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,326,1744095600"; 
   d="scan'208";a="159117788"
Received: from igk-lkp-server01.igk.intel.com (HELO 8b57277650df) ([10.91.175.65])
  by fmviesa008.fm.intel.com with ESMTP; 20 Jul 2025 01:51:42 -0700
Received: from kbuild by 8b57277650df with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udPlk-0001FV-0C;
	Sun, 20 Jul 2025 08:51:40 +0000
Date: Sun, 20 Jul 2025 10:51:33 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-5.10-CWF-SST-ANBZ22493 0/1]
 mm/memcg_zombie_reaper.c:47:6: warning: no previous prototype for function
 'memcg_reap_background_set'
Message-ID: <202507201016.QXru0QjP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-5.10-CWF-SST-ANBZ22493
head:   4d8e1d27db152f18e8e9064c37d1fa993f4d7e77
commit: 33bbe281782b11cc34512292d2957e86a0b2cc21 [0/1] ck: mm, memcg: introduce per memcg switch to reap zombie background
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250720/202507201016.QXru0QjP-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 61529d9e36fa86782a2458e6bdeedf7f376ef4b5)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250720/202507201016.QXru0QjP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507201016.QXru0QjP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memcg_zombie_reaper.c:47:6: warning: no previous prototype for function 'memcg_reap_background_set' [-Wmissing-prototypes]
      47 | void memcg_reap_background_set(void)
         |      ^
   mm/memcg_zombie_reaper.c:47:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      47 | void memcg_reap_background_set(void)
         | ^
         | static 
>> mm/memcg_zombie_reaper.c:53:6: warning: no previous prototype for function 'memcg_reap_background_clear' [-Wmissing-prototypes]
      53 | void memcg_reap_background_clear(void)
         |      ^
   mm/memcg_zombie_reaper.c:53:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      53 | void memcg_reap_background_clear(void)
         | ^
         | static 
   2 warnings generated.


vim +/memcg_reap_background_set +47 mm/memcg_zombie_reaper.c

    46	
  > 47	void memcg_reap_background_set(void)
    48	{
    49		reaper_kthread_on |= REAP_BACKGROUND_MEMCG;
    50		wake_up_interruptible(&reaper_waitq);
    51	}
    52	
  > 53	void memcg_reap_background_clear(void)
    54	{
    55		reaper_kthread_on &= ~REAP_BACKGROUND_MEMCG;
    56	}
    57	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
