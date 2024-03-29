Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B855040863
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Mar 2024 09:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711703627; cv=none; b=uUzoBFzq2PTuwaNKMvJqMIcV4VnOe7pZPDuBvEd+C8ANkikCQVLPemWkSA1HFDjvZX2f5C5lUlKPkEY8mdQQitAzzRRlseHR7+znbfGvjEtSaK8EWEOH3vdYoNZiUEl9XSb8BdwNZ9IRBiV7j3YMy/HdMXC8Tim8Do3zNT7bUH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711703627; c=relaxed/simple;
	bh=ZTKxH5kcw795HXiVc41ybgH7g3lP7CizJYh3xtbBAUY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=shwp/kNryM2A5niFgBAI5no/j+qOvamGeebsXdlozPALyrWi8lGTYUpjNPTaJ34VB/WdRQnHT/um4Dc9oxnRpIl6AsV0F/exFeeFGiwj8s3uK1fYuVMrkcLcW4TmfSbEKsrljXQEh+6k+hox5WEfXImw/njNyJvkXAsyyz0/4HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FR6nDDUE; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FR6nDDUE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711703626; x=1743239626;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZTKxH5kcw795HXiVc41ybgH7g3lP7CizJYh3xtbBAUY=;
  b=FR6nDDUEfK5N3I4MZS9Lai80OLJma8zjs37bnygA2lz4dlPZWWwA+dKZ
   uJ4CLfx6xCbwX5BCYQ9mmwcDpWoLDk5O9ur34qIkFR/IhSWgqlaIcvA52
   sGFTYT8G76hz0MtUrz7P4LyBrYTPMbza21rs1v6PQ7cGFjpD4+vJE2GnW
   96rKuJTL7g9m/Uk6dgJ4nQC+MXPxpTWArLrkUrnoXOq5ml69K7AbSEMSe
   cXzXrOsoO3lBjv+nu/cQioM1LV4gwz65ahaj+RjjzM2MSjjH9Xc59eHBV
   7HtChHtpwTD5TKqLS8wHVTnj45vWv5vKPh4oqvWYqIo1dhsk52xV3Dy9Q
   w==;
X-CSE-ConnectionGUID: UoKSX2JRR++Hqtqy0lOCpQ==
X-CSE-MsgGUID: KNYtmeOOTQ6+mWHHTJY5PQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="6784594"
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; 
   d="scan'208";a="6784594"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2024 02:13:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; 
   d="scan'208";a="16957551"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 29 Mar 2024 02:13:43 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rq8Iu-00032k-2F;
	Fri, 29 Mar 2024 09:13:40 +0000
Date: Fri, 29 Mar 2024 17:12:43 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Kees Cook <keescook@chromium.org>
Subject: [linux-next:master 2059/2532] mm/util.c:128: warning: expecting
 prototype for kmemdup_noprof(). Prototype was for kmemdup() instead
Message-ID: <202403291732.eZTk1pGs-lkp@intel.com>
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
commit: 8060cbdb2821fa59bd04964cc978066d07e13fac [2059/2532] mm/slab: enable slab allocation tagging for kmalloc and friends
config: x86_64-randconfig-r071-20240327 (https://download.01.org/0day-ci/archive/20240329/202403291732.eZTk1pGs-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240329/202403291732.eZTk1pGs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403291732.eZTk1pGs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/util.c:128: warning: expecting prototype for kmemdup_noprof(). Prototype was for kmemdup() instead
>> mm/util.c:613: warning: expecting prototype for kvmalloc_node_noprof(). Prototype was for kvmalloc_node() instead
--
>> mm/slub.c:4042: warning: expecting prototype for kmem_cache_alloc_node_noprof(). Prototype was for kmem_cache_alloc_node() instead


vim +128 mm/util.c

1e66df3ee30120 Jeremy Fitzhardinge 2007-07-17  116  
1a2f67b459bb78 Alexey Dobriyan     2006-09-30  117  /**
8060cbdb2821fa Suren Baghdasaryan  2024-03-21  118   * kmemdup_noprof - duplicate region of memory
1a2f67b459bb78 Alexey Dobriyan     2006-09-30  119   *
1a2f67b459bb78 Alexey Dobriyan     2006-09-30  120   * @src: memory region to duplicate
1a2f67b459bb78 Alexey Dobriyan     2006-09-30  121   * @len: memory region length
1a2f67b459bb78 Alexey Dobriyan     2006-09-30  122   * @gfp: GFP mask to use
a862f68a8b3600 Mike Rapoport       2019-03-05  123   *
0b7b8704ddcee3 Hao Sun             2022-12-21  124   * Return: newly allocated copy of @src or %NULL in case of error,
0b7b8704ddcee3 Hao Sun             2022-12-21  125   * result is physically contiguous. Use kfree() to free.
1a2f67b459bb78 Alexey Dobriyan     2006-09-30  126   */
8060cbdb2821fa Suren Baghdasaryan  2024-03-21  127  void *kmemdup_noprof(const void *src, size_t len, gfp_t gfp)
1a2f67b459bb78 Alexey Dobriyan     2006-09-30 @128  {
1a2f67b459bb78 Alexey Dobriyan     2006-09-30  129  	void *p;
1a2f67b459bb78 Alexey Dobriyan     2006-09-30  130  
8060cbdb2821fa Suren Baghdasaryan  2024-03-21  131  	p = kmalloc_node_track_caller_noprof(len, gfp, NUMA_NO_NODE, _RET_IP_);
1a2f67b459bb78 Alexey Dobriyan     2006-09-30  132  	if (p)
1a2f67b459bb78 Alexey Dobriyan     2006-09-30  133  		memcpy(p, src, len);
1a2f67b459bb78 Alexey Dobriyan     2006-09-30  134  	return p;
1a2f67b459bb78 Alexey Dobriyan     2006-09-30  135  }
8060cbdb2821fa Suren Baghdasaryan  2024-03-21  136  EXPORT_SYMBOL(kmemdup_noprof);
1a2f67b459bb78 Alexey Dobriyan     2006-09-30  137  

:::::: The code at line 128 was first introduced by commit
:::::: 1a2f67b459bb7846d4a15924face63eb2683acc2 [PATCH] kmemdup: introduce

:::::: TO: Alexey Dobriyan <adobriyan@gmail.com>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
