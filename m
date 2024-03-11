Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A1740C09
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Mar 2024 14:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710168556; cv=none; b=s0nZqiqj8xOvMtBkegQTXknZhxoK+IE2Dq1RSuag6lvn+L8GEPfbmUJHbqnOWqDat2fbSsFvtk10VR3++5Txxil6QVDKEVRfEhpwrl8tS3gqJHmZYMWt7IyhnR9Hb3xwXbN41o4oQT4vWBybIhVFu2YIRPlNbnC8ydAOKCcF7RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710168556; c=relaxed/simple;
	bh=aTN4uZyLzf4zZJvl0/jpXiEVwu/xCZXo7rw+0VpWliY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NO4DymQFDLAfFnRpkj/h0+Ro2J/pv2uZc86mAbWVeV2ytM1MOWT+w/heS4FUKsjrEMMFt1ZiUZF3L9tM1NMDlSEsJqIOtVM0PSsNUV007GqO4AtnF6bz5+2TfEAaKWjj+8XuiLHLLZL6c9f4xFeTsaOWqHnnpO0uRctbOUTsc8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MzOhkqXw; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MzOhkqXw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710168554; x=1741704554;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aTN4uZyLzf4zZJvl0/jpXiEVwu/xCZXo7rw+0VpWliY=;
  b=MzOhkqXwENwiPGMw08TpdiuffgX1+/0E+unjURtDPaYDmKTK97r07iq6
   sQcEo3YJcy/tVVimsklUhnwL/xZNzKl92AhOIh8S35d4Ggdh0tiXZcorE
   lKJeOOhk8X1G+hi/R2GRXR0V/gFt+RKTK4mJTmXNzInRmWZe3tGnRQXQJ
   ZcVkJF1tUZV6ZilgJUZppyRUmuNiWqshDorBc96ZTE49NRiu1MWEu7VPD
   wxgTb/WmtSSDFIpezyOAHIdyxSwXPwGmVHYLLPCh7ErDdr2YlgGk6ytvn
   2K8IvIHh/1WX3X+FkuY+EzCBPdlXUK+VZaYQP/1Z77//bJAj61WTTS6tq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="15972756"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="15972756"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 07:49:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="42105231"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Mar 2024 07:48:46 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjgxH-0009BP-0S;
	Mon, 11 Mar 2024 14:48:43 +0000
Date: Mon, 11 Mar 2024 22:48:29 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 26390/27506] mm/workingset.c:338:6:
 warning: no previous prototype for 'workingset_age_nonresident'
Message-ID: <202403112257.O5nziWbb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   3ba333344123321f5f312e69966bbc8e5533561f
commit: 21ede7b1285afcc0c41335fa3a834f118e4753b7 [26390/27506] workingset: simplify and use a more intuitive model
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240311/202403112257.O5nziWbb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240311/202403112257.O5nziWbb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403112257.O5nziWbb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/workingset.c: In function 'unpack_shadow':
   mm/workingset.c:203:22: warning: variable 'nid' set but not used [-Wunused-but-set-variable]
     203 |         int memcgid, nid;
         |                      ^~~
   mm/workingset.c: At top level:
>> mm/workingset.c:338:6: warning: no previous prototype for 'workingset_age_nonresident' [-Wmissing-prototypes]
     338 | void workingset_age_nonresident(struct lruvec *lruvec, unsigned long nr_pages)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/workingset_age_nonresident +338 mm/workingset.c

217288be44c1f3 Yu Zhao         2022-09-18  327  
f6c5971925af4f Johannes Weiner 2020-06-25  328  /**
f6c5971925af4f Johannes Weiner 2020-06-25  329   * workingset_age_nonresident - age non-resident entries as LRU ages
f6c5971925af4f Johannes Weiner 2020-06-25  330   * @memcg: the lruvec that was aged
f6c5971925af4f Johannes Weiner 2020-06-25  331   * @nr_pages: the number of pages to count
f6c5971925af4f Johannes Weiner 2020-06-25  332   *
f6c5971925af4f Johannes Weiner 2020-06-25  333   * As in-memory pages are aged, non-resident pages need to be aged as
f6c5971925af4f Johannes Weiner 2020-06-25  334   * well, in order for the refault distances later on to be comparable
f6c5971925af4f Johannes Weiner 2020-06-25  335   * to the in-memory dimensions. This function allows reclaim and LRU
f6c5971925af4f Johannes Weiner 2020-06-25  336   * operations to drive the non-resident aging along in parallel.
f6c5971925af4f Johannes Weiner 2020-06-25  337   */
f6c5971925af4f Johannes Weiner 2020-06-25 @338  void workingset_age_nonresident(struct lruvec *lruvec, unsigned long nr_pages)
f90f0482078330 Johannes Weiner 2019-11-30  339  {
f90f0482078330 Johannes Weiner 2019-11-30  340  	/*
f90f0482078330 Johannes Weiner 2019-11-30  341  	 * Reclaiming a cgroup means reclaiming all its children in a
f90f0482078330 Johannes Weiner 2019-11-30  342  	 * round-robin fashion. That means that each cgroup has an LRU
f90f0482078330 Johannes Weiner 2019-11-30  343  	 * order that is composed of the LRU orders of its child
f90f0482078330 Johannes Weiner 2019-11-30  344  	 * cgroups; and every page has an LRU position not just in the
f90f0482078330 Johannes Weiner 2019-11-30  345  	 * cgroup that owns it, but in all of that group's ancestors.
f90f0482078330 Johannes Weiner 2019-11-30  346  	 *
f90f0482078330 Johannes Weiner 2019-11-30  347  	 * So when the physical inactive list of a leaf cgroup ages,
f90f0482078330 Johannes Weiner 2019-11-30  348  	 * the virtual inactive lists of all its parents, including
f90f0482078330 Johannes Weiner 2019-11-30  349  	 * the root cgroup's, age as well.
f90f0482078330 Johannes Weiner 2019-11-30  350  	 */
f90f0482078330 Johannes Weiner 2019-11-30  351  	do {
f6c5971925af4f Johannes Weiner 2020-06-25  352  		atomic_long_add(nr_pages, &lruvec->nonresident_age);
f6c5971925af4f Johannes Weiner 2020-06-25  353  	} while ((lruvec = parent_lruvec(lruvec)));
f90f0482078330 Johannes Weiner 2019-11-30  354  }
f90f0482078330 Johannes Weiner 2019-11-30  355  

:::::: The code at line 338 was first introduced by commit
:::::: f6c5971925af4f5aa7f337fa42a77347a0504248 mm: workingset: age nonresident information alongside anonymous pages

:::::: TO: Johannes Weiner <hannes@cmpxchg.org>
:::::: CC: Kairui Song <kasong@tencent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
