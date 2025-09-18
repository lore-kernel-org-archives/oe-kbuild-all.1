Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE2F30BB98
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Sep 2025 13:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758201370; cv=none; b=H3vZEKn7Og54FAG3GBeMMVZcRd66cnCj2V7OaqKLlq+gxF7fWPKWyDq6hbld3MbBcSMTN+jqbgZgXpPrb4xbpvi/E4y81Qk2ssffs2HDRFL+/kKG6XDyV7f5Nq0gxMH2mjbqxA09n5UtoDf5+ciwCJ6Do/pTfkF86cYMhe0OoMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758201370; c=relaxed/simple;
	bh=uHblzwACZd8AVVnElEz7/K44En902uubojjP7JlJTjg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D6TwTJR9sGLHRyJ+YdgH7FsBjcro3clYxeBukSR42ZpKR2e4X8+QRzUOssZV9Rx60q6Aq6/oYYGxHKlFVX2iw6tTHcZPmYudEj5jfZpf4yeBRZuatzOKfJaDkp7LmjqeGnHdXcgeJ44hVvbmJK3IFxOYBCsJwJunCFIC3Avskb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Thnd5oty; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Thnd5oty"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758201367; x=1789737367;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uHblzwACZd8AVVnElEz7/K44En902uubojjP7JlJTjg=;
  b=Thnd5otyULtZw3fgTziMuRxTmgxWOq3mzuwLoXgkdRaOUuTQdsQCiKac
   nOAZSXV6FCpshyoLz5QixBVhwy+ZKy4aHX11MrJfTMSO+tfAGi+cpN1fU
   lGrS4Jr1pdxs8S+dELOu2cOiQGLPmqBHbfpy19QojGkWoQSoiZwHQM0gC
   1FHPwptvEABlJmyCTKjwnrGsi9Cb1i+wckDytlYbsyHVJw7X5JubAFS8F
   rD0/4OJWky+AIBib9hkNYjZfwWvmIjsWjJdWarE9pmg6x+HnZ4OTHzRM/
   h069ja3viBGrFRwZGdaoXQAchtuCQGoR6LAbo8TwPQn3Kt+poRQ2K6pLW
   Q==;
X-CSE-ConnectionGUID: AP2Ytd0OR428sfjhIuhS/Q==
X-CSE-MsgGUID: IIIfkMtvTLaRcR3OGzc51w==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="60642051"
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; 
   d="scan'208";a="60642051"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 06:16:07 -0700
X-CSE-ConnectionGUID: zNk4sWVnTHOgoCavkP38Vg==
X-CSE-MsgGUID: 1ZFwc34/SMmXrqIPqFbv0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; 
   d="scan'208";a="175983389"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 18 Sep 2025 06:16:06 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzEUW-0003IF-0P;
	Thu, 18 Sep 2025 13:16:04 +0000
Date: Thu, 18 Sep 2025 21:15:39 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 38/38] mm/compaction.c:2761:38:
 warning: variable 'compact' set but not used
Message-ID: <202509182301.PcAQm4C2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   0e924a37aab0e90d37c76f5b1a88d66610e7c954
commit: 0e924a37aab0e90d37c76f5b1a88d66610e7c954 [38/38] anolis: mm: support light compaction
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250918/202509182301.PcAQm4C2-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250918/202509182301.PcAQm4C2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509182301.PcAQm4C2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/compaction.c: In function 'sysfs_compact_node':
>> mm/compaction.c:2761:38: warning: variable 'compact' set but not used [-Wunused-but-set-variable]
    2761 |         char *p, *s, *compact_size, *compact;
         |                                      ^~~~~~~
   In file included from include/linux/rculist.h:10,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:16,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from mm/compaction.c:11:
   In function '__list_cut_position',
       inlined from 'list_cut_position' at include/linux/list.h:407:3,
       inlined from 'move_freelist_tail' at mm/compaction.c:1327:3:
   include/linux/list.h:378:21: warning: storing the address of local variable 'sublist' in '*&freepage_6(D)->D.16675.D.16620.lru.next' [-Wdangling-pointer=]
     378 |         entry->next = list;
         |         ~~~~~~~~~~~~^~~~~~
   mm/compaction.c: In function 'move_freelist_tail':
   mm/compaction.c:1324:19: note: 'sublist' declared here
    1324 |         LIST_HEAD(sublist);
         |                   ^~~~~~~
   include/linux/list.h:24:26: note: in definition of macro 'LIST_HEAD'
      24 |         struct list_head name = LIST_HEAD_INIT(name)
         |                          ^~~~
   mm/compaction.c:1322:61: note: 'freepage' declared here
    1322 | move_freelist_tail(struct list_head *freelist, struct page *freepage)
         |                                                ~~~~~~~~~~~~~^~~~~~~~


vim +/compact +2761 mm/compaction.c

  2752	
  2753	#if defined(CONFIG_SYSFS) && defined(CONFIG_NUMA)
  2754	static ssize_t sysfs_compact_node(struct device *dev,
  2755				struct device_attribute *attr,
  2756				const char *buf, size_t count)
  2757	{
  2758		unsigned long bytes;
  2759		unsigned int nr_pages;
  2760		int nid = dev->id;
> 2761		char *p, *s, *compact_size, *compact;
  2762	
  2763		if (nid >= 0 && nid < nr_node_ids && node_online(nid)) {
  2764			s = kstrdup(buf, GFP_KERNEL);
  2765			if (s == NULL)
  2766				return -ENOMEM;
  2767	
  2768			s = strstrip(s);
  2769			compact = strsep(&s, ",");
  2770			compact_size = strsep(&s, ",");
  2771			if (compact_size != NULL) {
  2772				bytes = memparse(compact_size, &p);
  2773				nr_pages = bytes / PAGE_SIZE;
  2774				if (nr_pages)
  2775					light_compact_node(nid, nr_pages);
  2776	
  2777				kfree(s);
  2778				return count;
  2779			}
  2780			kfree(s);
  2781			/* Flush pending updates to the LRU lists */
  2782			lru_add_drain_all();
  2783	
  2784			compact_node(nid);
  2785		}
  2786	
  2787		return count;
  2788	}
  2789	static DEVICE_ATTR(compact, 0200, NULL, sysfs_compact_node);
  2790	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
