Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F284B288C3D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Jul 2025 23:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754004769; cv=none; b=JCly6n3mlbhhBw4KKKSyEAJ5OLOcfY3ihP+PoMEiT8Hw3hqTehHl7sYKoIw47Lue45CgEr4aRQmcrZetmYAOg+pVqXy1imcPrWl5hQ8/9RaxGKj5qHWIDjnMqxWIuRCxQna515ExE9EptC6OzlMhmcx4lItcmb1yTlvz4XIKDyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754004769; c=relaxed/simple;
	bh=aQ7y2oHJX/0RJces++h1s26ATrqSKBifXXOyBzyJEqI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BpxZV5upFeUqdR0PlOjFVHK8LG44x1GBwbyhIDHbcii/KUn6DwJpDJUFs/m+WDDyenI4Z5sr7JrmKDzzP3S2doGdKCvN1kcPfChbHlPUYRfr9YUtdDnusNfB1QzzVeAWtNCUDzmXrjVU5HE4i6hvF3dip7HKDXVY+67zVb/Rt+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mAXAFxoT; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mAXAFxoT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754004767; x=1785540767;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aQ7y2oHJX/0RJces++h1s26ATrqSKBifXXOyBzyJEqI=;
  b=mAXAFxoT4Ispmk6KMEVrEUsbFcSaxV2uz2AJh9LNFtX/YMZVY/+3Rcp6
   I8pMOy8JG2N6BoArfZQp0y2CiraUpt/rdHBVn6dmWHuCUCgGsDV7O7M+B
   VPVJN/wiglUXqcxO+36WtevaUPVa4DeMkGtlmY4Lu49zT0OxAsBBfSvuu
   rcAOU0aLL8zqxmETL8McbIIcUU05ZsPmIuWrGfCf4CIs1Sw7faVkdWFuo
   319vI6F+c84Myqe7SsteaDVvH8FX6RhUjI/3VSm0cTcXh27o7ywPqO7Vk
   Z6Ya9ONvkgeRqGN1cOhBHLHAgbD4+8IWu7YT6s6JLzjjj8KrpyiF9J66q
   w==;
X-CSE-ConnectionGUID: ocgRhE2HTPCIKmam11dc8w==
X-CSE-MsgGUID: SdEOhgCaQ9yMw4J3OIa6Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56306064"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="56306064"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 16:32:47 -0700
X-CSE-ConnectionGUID: dLrjf5aqS9GFVnslCvvl6g==
X-CSE-MsgGUID: 1OhVOJ0RQs6I1XRh4yiCPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="162654875"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 31 Jul 2025 16:32:45 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhclO-0004Cy-2a;
	Thu, 31 Jul 2025 23:32:42 +0000
Date: Fri, 1 Aug 2025 07:32:36 +0800
From: kernel test robot <lkp@intel.com>
To: Yu Kuai <yukuai3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mdraid:md-6.17 29/29] drivers/md/md-llbitmap.c:787:6: warning:
 variable 'sb' is used uninitialized whenever 'if' condition is true
Message-ID: <202508010719.zHvnQVKb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mdraid/linux md-6.17
head:   6ca91f77c23a4d309f3250ddaed8cccd51737f4b
commit: 503d06247170ce76056a403b809097203e615e44 [29/29] md/md-llbitmap: introduce new lockless bitmap
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20250801/202508010719.zHvnQVKb-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 8f09b03aebb71c154f3bbe725c29e3f47d37c26e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250801/202508010719.zHvnQVKb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508010719.zHvnQVKb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/md/md-llbitmap.c:787:6: warning: variable 'sb' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     787 |         if (IS_ERR(sb_page)) {
         |             ^~~~~~~~~~~~~~~
   drivers/md/md-llbitmap.c:869:15: note: uninitialized use occurs here
     869 |         kunmap_local(sb);
         |                      ^~
   drivers/md/md-llbitmap.c:787:2: note: remove the 'if' if its condition is always false
     787 |         if (IS_ERR(sb_page)) {
         |         ^~~~~~~~~~~~~~~~~~~~~~
     788 |                 pr_err("md/llbitmap: %s: read super block failed",
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     789 |                        mdname(mddev));
         |                        ~~~~~~~~~~~~~~~
     790 |                 ret = -EIO;
         |                 ~~~~~~~~~~~
     791 |                 goto out;
         |                 ~~~~~~~~~
     792 |         }
         |         ~
   drivers/md/md-llbitmap.c:778:20: note: initialize the variable 'sb' to silence this warning
     778 |         bitmap_super_t *sb;
         |                           ^
         |                            = NULL
   1 warning generated.


vim +787 drivers/md/md-llbitmap.c

   770	
   771	static int llbitmap_read_sb(struct llbitmap *llbitmap)
   772	{
   773		struct mddev *mddev = llbitmap->mddev;
   774		unsigned long daemon_sleep;
   775		unsigned long chunksize;
   776		unsigned long events;
   777		struct page *sb_page;
   778		bitmap_super_t *sb;
   779		int ret = -EINVAL;
   780	
   781		if (!mddev->bitmap_info.offset) {
   782			pr_err("md/llbitmap: %s: no super block found", mdname(mddev));
   783			return -EINVAL;
   784		}
   785	
   786		sb_page = llbitmap_read_page(llbitmap, 0);
 > 787		if (IS_ERR(sb_page)) {
   788			pr_err("md/llbitmap: %s: read super block failed",
   789			       mdname(mddev));
   790			ret = -EIO;
   791			goto out;
   792		}
   793	
   794		sb = kmap_local_page(sb_page);
   795		if (sb->magic != cpu_to_le32(BITMAP_MAGIC)) {
   796			pr_err("md/llbitmap: %s: invalid super block magic number",
   797			       mdname(mddev));
   798			goto out_put_page;
   799		}
   800	
   801		if (sb->version != cpu_to_le32(BITMAP_MAJOR_LOCKLESS)) {
   802			pr_err("md/llbitmap: %s: invalid super block version",
   803			       mdname(mddev));
   804			goto out_put_page;
   805		}
   806	
   807		if (memcmp(sb->uuid, mddev->uuid, 16)) {
   808			pr_err("md/llbitmap: %s: bitmap superblock UUID mismatch\n",
   809			       mdname(mddev));
   810			goto out_put_page;
   811		}
   812	
   813		if (mddev->bitmap_info.space == 0) {
   814			int room = le32_to_cpu(sb->sectors_reserved);
   815	
   816			if (room)
   817				mddev->bitmap_info.space = room;
   818			else
   819				mddev->bitmap_info.space = mddev->bitmap_info.default_space;
   820		}
   821		llbitmap->flags = le32_to_cpu(sb->state);
   822		if (test_and_clear_bit(BITMAP_FIRST_USE, &llbitmap->flags)) {
   823			ret = llbitmap_init(llbitmap);
   824			goto out_put_page;
   825		}
   826	
   827		chunksize = le32_to_cpu(sb->chunksize);
   828		if (!is_power_of_2(chunksize)) {
   829			pr_err("md/llbitmap: %s: chunksize not a power of 2",
   830			       mdname(mddev));
   831			goto out_put_page;
   832		}
   833	
   834		if (chunksize < DIV_ROUND_UP(mddev->resync_max_sectors,
   835					     mddev->bitmap_info.space << SECTOR_SHIFT)) {
   836			pr_err("md/llbitmap: %s: chunksize too small %lu < %llu / %lu",
   837			       mdname(mddev), chunksize, mddev->resync_max_sectors,
   838			       mddev->bitmap_info.space);
   839			goto out_put_page;
   840		}
   841	
   842		daemon_sleep = le32_to_cpu(sb->daemon_sleep);
   843		if (daemon_sleep < 1 || daemon_sleep > MAX_SCHEDULE_TIMEOUT / HZ) {
   844			pr_err("md/llbitmap: %s: daemon sleep %lu period out of range",
   845			       mdname(mddev), daemon_sleep);
   846			goto out_put_page;
   847		}
   848	
   849		events = le64_to_cpu(sb->events);
   850		if (events < mddev->events) {
   851			pr_warn("md/llbitmap :%s: bitmap file is out of date (%lu < %llu) -- forcing full recovery",
   852				mdname(mddev), events, mddev->events);
   853			set_bit(BITMAP_STALE, &llbitmap->flags);
   854		}
   855	
   856		sb->sync_size = cpu_to_le64(mddev->resync_max_sectors);
   857		mddev->bitmap_info.chunksize = chunksize;
   858		mddev->bitmap_info.daemon_sleep = daemon_sleep;
   859	
   860		llbitmap->barrier_idle = DEFAULT_BARRIER_IDLE;
   861		llbitmap->chunksize = chunksize;
   862		llbitmap->chunks = DIV_ROUND_UP(mddev->resync_max_sectors, chunksize);
   863		llbitmap->chunkshift = ffz(~chunksize);
   864		ret = llbitmap_cache_pages(llbitmap);
   865	
   866	out_put_page:
   867		__free_page(sb_page);
   868	out:
   869		kunmap_local(sb);
   870		return ret;
   871	}
   872	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
