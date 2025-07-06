Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7F910E3
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Jul 2025 00:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751761073; cv=none; b=NwefXdL2InITrqWUcKuPExDWobS+/tl8F6JxKHlv7MxWpPJRnKrLagKUoo0xwZE1fJ/ZRugMcMwU5lMZoaTGvNXsDNDFHyIOQ74w35zz45o4x4U/r9vckXRp48GpR7sQDPRKWuoSivhqbS1leOiRUtRb/r8j4VrZ804BrbVt01w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751761073; c=relaxed/simple;
	bh=0N293s7Qp2q2xHcBfsnbaXf1OCdH4GW7T8YWuB1WYmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LpwGhjC4J/X+2SAjY6N6VWYwWVGWO9JJW/Nvpn/stj2RCot2M7CZnJxTqvAHlbvgFgbiGaSSQOeP9n0xJmyAxrZZT0vtPZoXlHB6yxSVAZrfU/W3zQh71n54+puUsZD1Czw1EgEbrgzswtsOEvMERwXBvkt6B43c1N+0zitXxHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DJwM0F9a; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DJwM0F9a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751761072; x=1783297072;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0N293s7Qp2q2xHcBfsnbaXf1OCdH4GW7T8YWuB1WYmQ=;
  b=DJwM0F9a7LyJx7h9U471t/aVyQbnnH213RorNqqmeHPcDWqEp9kNK3z/
   jmlqKDUbCz2XpyRgVTjp7zuKdIP16rMs0sBJJjxtdvWH5N3K7nwGzH7Z7
   XhbF3WOTCIhXDAxVUZnbwYj+zoxkN4147nX4m1eJH+QkWtJT2tAHWGyA7
   t1G7g80dnr/G107A9GI/yqYo9YA6nJkNtwj9qvqgZBmOWzIgSB/22/CzM
   YSov/DsI0greizQBz+vdXKA4RwUJc40zehqfEUuE0Nli+2pukbBF7bIEI
   g6Rn6/m2P+zlM8kX8nlzXk2Sh2tdjDw1ncDmIJY+841DgqcZn9wVtqQf9
   Q==;
X-CSE-ConnectionGUID: 7ubq6jlpQ6Kfcgl4DBeaLQ==
X-CSE-MsgGUID: b8ExqevVS/m8GYRAwirxew==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="53904597"
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="53904597"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2025 17:17:52 -0700
X-CSE-ConnectionGUID: PxXPJgSCRa26CtxdYTZPuw==
X-CSE-MsgGUID: Cc+3N7U/QtOKvYUOoB7zeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="178568786"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 05 Jul 2025 17:17:50 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYD4m-0004md-1m;
	Sun, 06 Jul 2025 00:17:48 +0000
Date: Sun, 6 Jul 2025 08:17:15 +0800
From: kernel test robot <lkp@intel.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v1 3/3] mm: Use seprintf() instead of less ergonomic APIs
Message-ID: <202507060719.gDvQGzOA-lkp@intel.com>
References: <be193e1856aaf40f0e6dc44bb2e22ab0688203af.1751747518.git.alx@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be193e1856aaf40f0e6dc44bb2e22ab0688203af.1751747518.git.alx@kernel.org>

Hi Alejandro,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on akpm-mm/mm-nonmm-unstable linus/master v6.16-rc4 next-20250704]
[cannot apply to vbabka-slab/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alejandro-Colomar/vsprintf-Add-v-seprintf-v-stprintf/20250706-043535
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/be193e1856aaf40f0e6dc44bb2e22ab0688203af.1751747518.git.alx%40kernel.org
patch subject: [RFC v1 3/3] mm: Use seprintf() instead of less ergonomic APIs
config: arc-randconfig-002-20250706 (https://download.01.org/0day-ci/archive/20250706/202507060719.gDvQGzOA-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250706/202507060719.gDvQGzOA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507060719.gDvQGzOA-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   mm/page_owner.c: In function 'print_page_owner':
>> mm/page_owner.c:549:13: error: implicit declaration of function 'seprintf'; did you mean 'snprintf'? [-Werror=implicit-function-declaration]
     549 |         p = seprintf(p, e,
         |             ^~~~~~~~
         |             snprintf
>> mm/page_owner.c:549:11: warning: assignment to 'char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     549 |         p = seprintf(p, e,
         |           ^
   mm/page_owner.c:559:11: warning: assignment to 'char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     559 |         p = seprintf(p, e,
         |           ^
   mm/page_owner.c:572:19: warning: assignment to 'char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     572 |                 p = seprintf(p, e,
         |                   ^
   mm/page_owner.c:579:11: warning: assignment to 'char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     579 |         p = seprintf(p, e, "\n");
         |           ^
   cc1: some warnings being treated as errors


vim +549 mm/page_owner.c

   533	
   534	static ssize_t
   535	print_page_owner(char __user *buf, size_t count, unsigned long pfn,
   536			struct page *page, struct page_owner *page_owner,
   537			depot_stack_handle_t handle)
   538	{
   539		int ret, pageblock_mt, page_mt;
   540		char *kbuf, *p, *e;
   541	
   542		count = min_t(size_t, count, PAGE_SIZE);
   543		kbuf = kmalloc(count, GFP_KERNEL);
   544		if (!kbuf)
   545			return -ENOMEM;
   546	
   547		p = kbuf;
   548		e = kbuf + count;
 > 549		p = seprintf(p, e,
   550				"Page allocated via order %u, mask %#x(%pGg), pid %d, tgid %d (%s), ts %llu ns\n",
   551				page_owner->order, page_owner->gfp_mask,
   552				&page_owner->gfp_mask, page_owner->pid,
   553				page_owner->tgid, page_owner->comm,
   554				page_owner->ts_nsec);
   555	
   556		/* Print information relevant to grouping pages by mobility */
   557		pageblock_mt = get_pageblock_migratetype(page);
   558		page_mt  = gfp_migratetype(page_owner->gfp_mask);
   559		p = seprintf(p, e,
   560				"PFN 0x%lx type %s Block %lu type %s Flags %pGp\n",
   561				pfn,
   562				migratetype_names[page_mt],
   563				pfn >> pageblock_order,
   564				migratetype_names[pageblock_mt],
   565				&page->flags);
   566	
   567		p = stack_depot_seprint(handle, p, e, 0);
   568		if (p == NULL)
   569			goto err;  // XXX: Should we remove this error handling?
   570	
   571		if (page_owner->last_migrate_reason != -1) {
   572			p = seprintf(p, e,
   573				"Page has been migrated, last migrate reason: %s\n",
   574				migrate_reason_names[page_owner->last_migrate_reason]);
   575		}
   576	
   577		p = print_page_owner_memcg(p, e, page);
   578	
   579		p = seprintf(p, e, "\n");
   580		if (p == NULL)
   581			goto err;
   582	
   583		ret = p - kbuf;
   584		if (copy_to_user(buf, kbuf, ret))
   585			ret = -EFAULT;
   586	
   587		kfree(kbuf);
   588		return ret;
   589	
   590	err:
   591		kfree(kbuf);
   592		return -ENOMEM;
   593	}
   594	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
