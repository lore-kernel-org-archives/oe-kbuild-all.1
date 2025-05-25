Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E386218DB35
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 May 2025 23:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748215958; cv=none; b=dBMuDrcZNCRSuh6eNb/qTYcnQ+88W6fKHGeUWakXNusDfb8Ko9ymXWvXw64M+dhBqmvhPHpuDKPGS6aq/rgyljBELtHYGydmoA6/UFAmt21L75S+/iO9H0IZlWnWB0up49q7UrMOCEkIQ3YqnosenqTTCi0EgFWkLSR/sq9Q6FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748215958; c=relaxed/simple;
	bh=pj9XRbqknKu3RL1c3Sv1Z6fj/Sa8fwnW6wgCyfVRTKc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fbv0PFhnMFCZTJGN1zzAbI0UYS2xaRt4LBvns8spMb8Z+o9YehBBiH7yPD2OjMNp3eEl9Tnlmdz+AS6n6CJ8MxaP6HrI+5/LFZrlLVZ3xDKnpuLrnf3WadKbv4Z5SsCtRS8wyv0YHjVp/hrC3ipsgFjx8GgtyOy5u7mVlboFkbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YDI/eomD; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YDI/eomD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748215957; x=1779751957;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pj9XRbqknKu3RL1c3Sv1Z6fj/Sa8fwnW6wgCyfVRTKc=;
  b=YDI/eomD8mwliEyvaG8hoPbBbE2vhtSSOalRsKsSUoxQbT1XNyJbNBi5
   L/zQnSwB8QIGlj7GWx9/OutAL0inehSakhrlmXSUhJ3u6VpUC3GH6OTiL
   V7LlIuoVsSLQVwCLDv2hNhboeYpwcnQpWsPprQTVYu1+kYU61hNAnfBYD
   eFppZY9+M0V54IMVzHEvuWW2g3V0voawWx/MmqQcKa92VVaSFORaoY7Yt
   Ida4ag8pyqMgt+zpJxIFGkathl+TLbXoOLwvRGc9I3TGoIo9AcDjl8H7w
   Z/QZ/5RZmIMdtZZBrq26Cd0IPBbrstDlOopfW7l7N/Ezqtv1V0u7siWtW
   w==;
X-CSE-ConnectionGUID: ZHKJYx27Rtiy6/J5LZG5YA==
X-CSE-MsgGUID: JUl0lYWHT0eCpnJLNB/Dbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="50342864"
X-IronPort-AV: E=Sophos;i="6.15,314,1739865600"; 
   d="scan'208";a="50342864"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2025 16:32:36 -0700
X-CSE-ConnectionGUID: LFVrXrT5Qg2Fm5xiSsbc9A==
X-CSE-MsgGUID: 6br22I1UTlCQDnHz0kMSRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,314,1739865600"; 
   d="scan'208";a="142687923"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 May 2025 16:32:35 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJKpU-000S2O-2o;
	Sun, 25 May 2025 23:32:32 +0000
Date: Mon, 26 May 2025 07:32:00 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 47/47] mm/damon/core.c:2879: warning: expecting
 prototype for damos_search(). Prototype was for damon_search() instead
Message-ID: <202505260758.TBfbD1ZO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   ff796229bc1b623eff338946ff601056f56cd1d7
commit: c8e4f18c4ecc01bebf1f805ac58943ed9cfdd06d [47/47] mm/damon/core: add an hacking idea concept interface prototype
config: arc-randconfig-002-20250526 (https://download.01.org/0day-ci/archive/20250526/202505260758.TBfbD1ZO-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250526/202505260758.TBfbD1ZO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505260758.TBfbD1ZO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/damon/core.c:2879: warning: expecting prototype for damos_search(). Prototype was for damon_search() instead


vim +2879 mm/damon/core.c

  2864	
  2865	#ifdef DAMON_HACK_IDEA
  2866	/**
  2867	 * damos_search() - Return damon_region of a given address and type.
  2868	 * @addr:	the address of the region to search for.
  2869	 * @pid:	PID of the address space.
  2870	 *
  2871	 * Search and return damon_region of a given address in a given address space.
  2872	 * The caller could read returned damon_region to get its address pattern.
  2873	 *
  2874	 * If @pid is NULL, the physical address space will be searched.
  2875	 *
  2876	 * Return: damon_region covering the memory of the given address.
  2877	 */
  2878	struct damon_region *damon_search(unsigned long addr)
> 2879	{
  2880		return NULL;
  2881	}
  2882	#endif
  2883	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
