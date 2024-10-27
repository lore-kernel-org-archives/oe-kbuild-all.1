Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C1ED530
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Oct 2024 04:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730003892; cv=none; b=nDFQOqz91dm2FDHTOgRrwMdfD9CBmfmWom9uZKn0YNt1kq/pmdwW3HIa904YxcaUlmYbmvzBO5JpdqCCwWXAKziDIFlom6AqXO4y5aZR2bsugjN3ghzI8DnLW9/NRGDm2LBcu+8/WahA+B30YIR8hULYb13AboHwMONyeQKQcWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730003892; c=relaxed/simple;
	bh=Bi0NMvvS4oXMZohIuIAvptvJxQnLSVzXh1YoxlfAboU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YukCdwGeO4C0il7/5xyKMhlbKE52dJQaKz4xBlgTzYALJAemHt4w0CLe8RSSMMgyTc822JbfXKI5rsnSDQ2MEzNQ1xBbfDL0UH88hGU6luRSDkWPWX9yUiOog0Ih6yfX9vukeRIZ/1VdTjD6ul/ZA0m87nbvs9LfzTNqq+Z2mFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GBTTcnFi; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GBTTcnFi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730003890; x=1761539890;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Bi0NMvvS4oXMZohIuIAvptvJxQnLSVzXh1YoxlfAboU=;
  b=GBTTcnFiLhPmUyoPi+I9tBU87GUEIp7Lmdbk0zP1aQOARfPGiU6tOigH
   eOZZLKIzEeSfTzHEH1F9YPBzpcObtb4pVxnPxeGOOQKTwHnMpbSITM9uy
   F7Sed7dRcMsw2vzA0bFLXYUFK1WkCOMe2nAHVhv3IzGxUjLrTIhhiD/5j
   ul8swOnuADKSVfjc/wrgrblCAyQHfx8kR7hqL1Odp03A+IM1QvIA9av6y
   nLjPBKLUE5UXkt9GR6hSoB3FSKd30zoBSVnkas7ZL2E+KriIZYMFKX6d0
   JZeBptzobSCfmQNUyZtB5w3/OOjZ9vkTNbNgc8KB2g7Mo93dlZj0kYPjz
   w==;
X-CSE-ConnectionGUID: uj1KJhJgTmC0qxG5RYb/8g==
X-CSE-MsgGUID: n6RVN/cHTZCFUW0gwjJEaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11237"; a="32491944"
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="32491944"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 21:38:09 -0700
X-CSE-ConnectionGUID: 6ZLGAsGjQz2fw6CNGJtKUQ==
X-CSE-MsgGUID: wnnbOXsZQImbcn/c97ZShQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="112140442"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Oct 2024 21:38:08 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4v2U-000aMa-0V;
	Sun, 27 Oct 2024 04:38:06 +0000
Date: Sun, 27 Oct 2024 12:38:03 +0800
From: kernel test robot <lkp@intel.com>
To: Barry Song <21cnbao@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] mm: count zeromap read and set for swapout and swapin
Message-ID: <202410271256.54HHdzzV-lkp@intel.com>
References: <20241027011959.9226-1-21cnbao@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241027011959.9226-1-21cnbao@gmail.com>

Hi Barry,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Barry-Song/mm-count-zeromap-read-and-set-for-swapout-and-swapin/20241027-092054
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20241027011959.9226-1-21cnbao%40gmail.com
patch subject: [PATCH RFC] mm: count zeromap read and set for swapout and swapin
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241027/202410271256.54HHdzzV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410271256.54HHdzzV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410271256.54HHdzzV-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/page_io.c: In function 'swap_read_folio':
>> mm/page_io.c:622:53: error: 'MTHP_STAT_SWPIN' undeclared (first use in this function); did you mean 'MTHP_STAT_SPLIT'?
     622 |                 count_mthp_stat(folio_order(folio), MTHP_STAT_SWPIN);
         |                                                     ^~~~~~~~~~~~~~~
         |                                                     MTHP_STAT_SPLIT
   mm/page_io.c:622:53: note: each undeclared identifier is reported only once for each function it appears in


vim +622 mm/page_io.c

   597	
   598	void swap_read_folio(struct folio *folio, struct swap_iocb **plug)
   599	{
   600		struct swap_info_struct *sis = swp_swap_info(folio->swap);
   601		bool synchronous = sis->flags & SWP_SYNCHRONOUS_IO;
   602		bool workingset = folio_test_workingset(folio);
   603		unsigned long pflags;
   604		bool in_thrashing;
   605	
   606		VM_BUG_ON_FOLIO(!folio_test_swapcache(folio) && !synchronous, folio);
   607		VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
   608		VM_BUG_ON_FOLIO(folio_test_uptodate(folio), folio);
   609	
   610		/*
   611		 * Count submission time as memory stall and delay. When the device
   612		 * is congested, or the submitting cgroup IO-throttled, submission
   613		 * can be a significant part of overall IO time.
   614		 */
   615		if (workingset) {
   616			delayacct_thrashing_start(&in_thrashing);
   617			psi_memstall_enter(&pflags);
   618		}
   619		delayacct_swapin_start();
   620	
   621		if (swap_read_folio_zeromap(folio)) {
 > 622			count_mthp_stat(folio_order(folio), MTHP_STAT_SWPIN);
   623			count_memcg_folio_events(folio, PSWPIN, folio_nr_pages(folio));
   624			count_vm_events(PSWPIN, folio_nr_pages(folio));
   625			folio_unlock(folio);
   626			goto finish;
   627		} else if (zswap_load(folio)) {
   628			folio_unlock(folio);
   629			goto finish;
   630		}
   631	
   632		/* We have to read from slower devices. Increase zswap protection. */
   633		zswap_folio_swapin(folio);
   634	
   635		if (data_race(sis->flags & SWP_FS_OPS)) {
   636			swap_read_folio_fs(folio, plug);
   637		} else if (synchronous) {
   638			swap_read_folio_bdev_sync(folio, sis);
   639		} else {
   640			swap_read_folio_bdev_async(folio, sis);
   641		}
   642	
   643	finish:
   644		if (workingset) {
   645			delayacct_thrashing_end(&in_thrashing);
   646			psi_memstall_leave(&pflags);
   647		}
   648		delayacct_swapin_end();
   649	}
   650	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
