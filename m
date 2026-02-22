Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B491FC0A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Feb 2026 05:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771739316; cv=none; b=WRSDVDPowC9UyNMF+dIQKdTfppNR11hIdZuPSIEZx7zPgJtGGbg12C6Thp8HejIFd2faJcvr+E2j1UOUkU/vcpyf1sfykaksO8RqdldlTtiSBD6xp+Dztz3EH58+QmN/n3sn8454kvp58+mDyonKTA/Ea3coQ6UC6T5TuMlRnyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771739316; c=relaxed/simple;
	bh=kq8mvhHLA69/xxX2bKUdSzRpqimq3t0a5issgB+DfAM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TefcyaLTlB8L9laSMbNtH6XnQ5JqBzvWVfrF4IjXZq1b25jaVX7fKYXM7KAZCkok35fJ1PWfekHvCYJYy/cSRARIgSDU4YCfGF/N8VU/BWn0E2uW/6m/HzHdWhyYJHGr86BRwf1CeC6ZGhTNCrj+1JYDUYP4H4613NeRIm0eSvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OiWrCPaM; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OiWrCPaM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771739314; x=1803275314;
  h=date:from:to:cc:subject:message-id;
  bh=kq8mvhHLA69/xxX2bKUdSzRpqimq3t0a5issgB+DfAM=;
  b=OiWrCPaMQpWUhPAHqVaGpd1lA3moBYBsbpL+SMkuMwNVgxUaZKtzRsc8
   yM3t2MK+4sWdNxOnJf42Q1VKWO676LgglHXUm3xuheFb/JTMwcmgNSDK2
   uYBxNDwxHw9ROQrMPsvnjRPMFXLryClzhFH9J9EeSeakMo6ha5nTSZX96
   NioUxyirS9kihNbm6D7SJFFc866yFBXK2aQxNvLsmHsiEi3nzsgTaiDC8
   Ez5wfWbOIbfrFgvBak839s5VFsAVFUD68lc9IVPqwpaNxzBMxE0nBSP8X
   qe1o4L5qvqosnR3+4adXnKjmBi1pMTeuX8UuTxTu8ph35ILIUSMxqjIqq
   Q==;
X-CSE-ConnectionGUID: IwgTNcxLTjqCNGpFI9OENg==
X-CSE-MsgGUID: 0MiWyz6WSryO0lheXSG3Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11708"; a="84133167"
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="84133167"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2026 21:48:33 -0800
X-CSE-ConnectionGUID: bYTwOjcwTjWFgnCe0voIww==
X-CSE-MsgGUID: 9ewhqo35RZWvXmJuD1nDcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="219774130"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 21 Feb 2026 21:48:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vu2KT-000000015Le-2fj6;
	Sun, 22 Feb 2026 05:48:29 +0000
Date: Sun, 22 Feb 2026 13:48:19 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 30/144] mm/damon/core.c:1693:25: warning:
 zero-length gnu_printf format string
Message-ID: <202602221352.odZW8x1R-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   4ac50a8b182685ab2e9f2ff9411ce5c0ef3af0ac
commit: ebbed03fc342824e63925232c8dc4ea55e54e2a3 [30/144] mm/damon/core: add damon_reset_aggregated() debug_sanity check
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260222/202602221352.odZW8x1R-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260222/202602221352.odZW8x1R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602221352.odZW8x1R-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/m68k/include/asm/bug.h:32,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from arch/m68k/include/asm/processor.h:11,
                    from include/linux/sched.h:13,
                    from include/linux/cgroup.h:12,
                    from include/linux/memcontrol.h:13,
                    from include/linux/damon.h:11,
                    from mm/damon/core.c:10:
   mm/damon/core.c: In function 'damon_verify_reset_aggregated':
>> mm/damon/core.c:1693:25: warning: zero-length gnu_printf format string [-Wformat-zero-length]
    1693 |         WARN_ONCE(true, "");
         |                         ^~
   include/asm-generic/bug.h:142:62: note: in definition of macro '__WARN_printf'
     142 |                 warn_slowpath_fmt(__FILE__, __LINE__, taint, arg);      \
         |                                                              ^~~
   include/linux/once_lite.h:31:25: note: in expansion of macro 'WARN'
      31 |                         func(__VA_ARGS__);                              \
         |                         ^~~~
   include/asm-generic/bug.h:185:9: note: in expansion of macro 'DO_ONCE_LITE_IF'
     185 |         DO_ONCE_LITE_IF(condition, WARN, 1, format)
         |         ^~~~~~~~~~~~~~~
   mm/damon/core.c:1693:9: note: in expansion of macro 'WARN_ONCE'
    1693 |         WARN_ONCE(true, "");
         |         ^~~~~~~~~


vim +1693 mm/damon/core.c

  1680	
  1681	#ifdef CONFIG_DAMON_DEBUG_SANITY
  1682	static void damon_verify_reset_aggregated(struct damon_region *r,
  1683			struct damon_ctx *c)
  1684	{
  1685		if (r->nr_accesses_bp == r->last_nr_accesses * 10000)
  1686			return;
  1687		pr_err("reset time invalid region found!\n");
  1688		pr_err("nr_accesses_bp %u last_nr_acceses %u\n",
  1689				r->nr_accesses_bp, r->last_nr_accesses);
  1690		pr_err("passed_sis %lu next_aggregation_sis %lu\n",
  1691				c->passed_sample_intervals,
  1692				c->next_aggregation_sis);
> 1693		WARN_ONCE(true, "");
  1694	}
  1695	#else
  1696	static void damon_verify_reset_aggregated(struct damon_region *r,
  1697			struct damon_ctx *c)
  1698	{
  1699	}
  1700	#endif
  1701	
  1702	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
