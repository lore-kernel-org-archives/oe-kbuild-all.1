Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85058535C8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 20:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718657346; cv=none; b=o1vqbNuiw609gqquYFt2QIazMFIhs9mt7Ys9rPrGYXKYxQVdi9QDKcaq7vdIN3B/0K4E2vAboH+JoobHwcpN7Qb1aQmlUGYkA0dwEfSpYJV5Kog0O7C7JUVxkIVdKyQ8uPsriiIDbqM4PrHp04GvDStfBYFcb4rHCPSkPJSw6/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718657346; c=relaxed/simple;
	bh=ndD2twqik+Xr25AK4HN/YROEVSogiu/QM2guH89kvK0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aTJU0jG6PZmzLLzd55gUsAtdVM+4XKDX4J5xIxszCzeQ+wb/wnOxWkRbXwdw1bvvrRq0cNudfg+Jtg2pjuYJoFLPJmNglpCicfz29ljKIOztzbeN3vMh0yDC2LRv30n4XO4n44gl9QwfEuwYwox4HOGfHM/idfvvIfLuVcyOzCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CwY0EuoD; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CwY0EuoD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718657344; x=1750193344;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ndD2twqik+Xr25AK4HN/YROEVSogiu/QM2guH89kvK0=;
  b=CwY0EuoDYo5yhDaq8gDMEDZYXcKXykWodjP9c9MtWQEJfUjctGubched
   tlrmAZwczLjTurvQo5LbpBwkHssNQ3F4A2UMgSv1oRJDJYnViozMfQNsy
   0hGv8cd4vaSYTvEw7Sh5zsIkM2MWN7IWYuVy3k0RB9bjSmhqJuwCoOLZT
   XtaJ2cjzWMQu6q2hosdJOkxZ71q2xEwTjhuslrcA9yyOnU0f51iZ8hTOd
   QQ8Jh15P9zN39ojDd3nsi7hmPRQvHlx+uTIfc6vDCp0Im2xsncESLSkBm
   bZ3NkeoauQL3yvyJL9jNaAs5vXq7aon3tMcTpG0WC1ixQ6CeWluBTLqzU
   g==;
X-CSE-ConnectionGUID: 3gVk3wdTTs281JtdXOX+Lg==
X-CSE-MsgGUID: WDvTNTiaRXq9B6c96yYRrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15273196"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; 
   d="scan'208";a="15273196"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 13:49:03 -0700
X-CSE-ConnectionGUID: HAO95jJlRHKwuowmZAhEew==
X-CSE-MsgGUID: FMUGFlV9T8WWaBYnQ0FoUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; 
   d="scan'208";a="45845765"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Jun 2024 13:49:01 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJJHf-0004s9-0E;
	Mon, 17 Jun 2024 20:48:59 +0000
Date: Tue, 18 Jun 2024 04:48:32 +0800
From: kernel test robot <lkp@intel.com>
To: Li Nan <linan122@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Song Liu <song@kernel.org>
Subject: [linux-next:master 4403/5501] drivers/md/md.c:620:21-22: Unneeded
 semicolon
Message-ID: <202406180407.xZHCKGBJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6906a84c482f098d31486df8dc98cead21cce2d0
commit: 611d5cbc0b35a752e657a83eebadf40d814d006b [4403/5501] md: fix deadlock between mddev_suspend and flush bio
config: x86_64-randconfig-101-20240618 (https://download.01.org/0day-ci/archive/20240618/202406180407.xZHCKGBJ-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406180407.xZHCKGBJ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/md/md.c:620:21-22: Unneeded semicolon

vim +620 drivers/md/md.c

   588	
   589	static void md_submit_flush_data(struct work_struct *ws)
   590	{
   591		struct mddev *mddev = container_of(ws, struct mddev, flush_work);
   592		struct bio *bio = mddev->flush_bio;
   593	
   594		/*
   595		 * must reset flush_bio before calling into md_handle_request to avoid a
   596		 * deadlock, because other bios passed md_handle_request suspend check
   597		 * could wait for this and below md_handle_request could wait for those
   598		 * bios because of suspend check
   599		 */
   600		spin_lock_irq(&mddev->lock);
   601		mddev->prev_flush_start = mddev->start_flush;
   602		mddev->flush_bio = NULL;
   603		spin_unlock_irq(&mddev->lock);
   604		wake_up(&mddev->sb_wait);
   605	
   606		if (bio->bi_iter.bi_size == 0) {
   607			/* an empty barrier - all done */
   608			bio_endio(bio);
   609		} else {
   610			bio->bi_opf &= ~REQ_PREFLUSH;
   611	
   612			/*
   613			 * make_requst() will never return error here, it only
   614			 * returns error in raid5_make_request() by dm-raid.
   615			 * Since dm always splits data and flush operation into
   616			 * two separate io, io size of flush submitted by dm
   617			 * always is 0, make_request() will not be called here.
   618			 */
   619			if (WARN_ON_ONCE(!mddev->pers->make_request(mddev, bio)))
 > 620				bio_io_error(bio);;
   621		}
   622	
   623		/* The pair is percpu_ref_get() from md_flush_request() */
   624		percpu_ref_put(&mddev->active_io);
   625	}
   626	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
