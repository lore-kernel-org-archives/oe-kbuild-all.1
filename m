Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E68A1EB37
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jan 2024 13:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705497126; cv=none; b=J56/EYPlkCiGVN7VdXtuzfjLQJdS7jojzxHGyE1LvG0F7xPR8vlk9mD4zk/tQGSCcTJo13jpNMFr5SFy0nuYb7i1nDq9LRLmSpKPEWMvx1ckhMxpAFzlmm7PBg/3oZPNRsddYqX7ARKLpv0BWvE+O6zBBYYAGPG3Kkgq3EhqNZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705497126; c=relaxed/simple;
	bh=IBMbQGOlaDg0S8RijKCaVUrZLTAhnpS5sg6qKib+bD8=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=vDvU+5eDi/m6lUX2afZYDgpygHZ9My6c0sLvbxznTs+x9gjjnIddb4iN2/XmkoPV3mLtj3QchpWq1nluwoLXisZkcnFROh3k8nQDwbkVnZByL8ddx9loLHbxsc5SP2Sm5BMI5S18jX9rOrwKowfPa2ALL2PdAfz3YvVCxy2u3aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gok07WpG; arc=none smtp.client-ip=134.134.136.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gok07WpG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705497124; x=1737033124;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IBMbQGOlaDg0S8RijKCaVUrZLTAhnpS5sg6qKib+bD8=;
  b=gok07WpGXSVRDcl4vn9yXyuNHWq8hQXN7kLDx3WL/vfTHHT9a38TC0ES
   F40uuESfoNX7UXwdwHMF+FjHr3xqvLBRsCQO9i/LJl/X8YojC1IwZdCul
   IVGGn/irp5qdLVWRIcXCXUdoZ9nC98WOD69WGFC9PXr1qqDbAuq2IdJRi
   CX3X0h33HcUS+gjcCF3dzpnvn3R9nFIJy/6CSm/VrHfH/ohQLOctUe8T6
   0Y3WrLYdH06gZLjAM0cNI35wP+ZQGVrH/mx8e6P04qPMngULlXqd8loWJ
   AH/2WmTu7nuS8dIDdUv/Cs1KsMKqd3qzx1cCnqSxPA+u5lPe38bse5n4Y
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="466544089"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="466544089"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2024 05:12:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="1115668884"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="1115668884"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 17 Jan 2024 05:12:02 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQ5i4-00020w-16;
	Wed, 17 Jan 2024 13:12:00 +0000
Date: Wed, 17 Jan 2024 21:11:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 5/5] block: convert struct blk_plug callback list to
 hlists
Message-ID: <202401172119.RSZc6b8P-lkp@intel.com>
References: <20240116165814.236767-6-axboe@kernel.dk>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240116165814.236767-6-axboe@kernel.dk>

Hi Jens,

kernel test robot noticed the following build errors:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on linus/master]
[cannot apply to tip/sched/core v6.7 next-20240117]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jens-Axboe/block-add-blk_time_get_ns-helper/20240117-010320
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20240116165814.236767-6-axboe%40kernel.dk
patch subject: [PATCH 5/5] block: convert struct blk_plug callback list to hlists
config: m68k-multi_defconfig (https://download.01.org/0day-ci/archive/20240117/202401172119.RSZc6b8P-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240117/202401172119.RSZc6b8P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401172119.RSZc6b8P-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/md/raid1.c:53:
   drivers/md/raid1-10.c: In function 'raid1_add_bio_to_plug':
>> drivers/md/raid1-10.c:155:26: error: passing argument 1 of 'list_del' from incompatible pointer type [-Werror=incompatible-pointer-types]
     155 |                 list_del(&cb->list);
         |                          ^~~~~~~~~
         |                          |
         |                          struct hlist_node *
   In file included from include/linux/smp.h:12,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from drivers/md/raid1.c:26:
   include/linux/list.h:227:47: note: expected 'struct list_head *' but argument is of type 'struct hlist_node *'
     227 | static inline void list_del(struct list_head *entry)
         |                             ~~~~~~~~~~~~~~~~~~^~~~~
   cc1: some warnings being treated as errors


vim +/list_del +155 drivers/md/raid1-10.c

8295efbe68c080 Yu Kuai 2023-05-29  132  
5ec6ca140a0346 Yu Kuai 2023-05-29  133  static inline bool raid1_add_bio_to_plug(struct mddev *mddev, struct bio *bio,
460af1f9d9e62a Yu Kuai 2023-05-29  134  				      blk_plug_cb_fn unplug, int copies)
5ec6ca140a0346 Yu Kuai 2023-05-29  135  {
5ec6ca140a0346 Yu Kuai 2023-05-29  136  	struct raid1_plug_cb *plug = NULL;
7db922bae3abdf Yu Kuai 2023-05-29  137  	struct blk_plug_cb *cb;
5ec6ca140a0346 Yu Kuai 2023-05-29  138  
7db922bae3abdf Yu Kuai 2023-05-29  139  	/*
7db922bae3abdf Yu Kuai 2023-05-29  140  	 * If bitmap is not enabled, it's safe to submit the io directly, and
7db922bae3abdf Yu Kuai 2023-05-29  141  	 * this can get optimal performance.
7db922bae3abdf Yu Kuai 2023-05-29  142  	 */
7db922bae3abdf Yu Kuai 2023-05-29  143  	if (!md_bitmap_enabled(mddev->bitmap)) {
7db922bae3abdf Yu Kuai 2023-05-29  144  		raid1_submit_write(bio);
7db922bae3abdf Yu Kuai 2023-05-29  145  		return true;
7db922bae3abdf Yu Kuai 2023-05-29  146  	}
7db922bae3abdf Yu Kuai 2023-05-29  147  
7db922bae3abdf Yu Kuai 2023-05-29  148  	cb = blk_check_plugged(unplug, mddev, sizeof(*plug));
5ec6ca140a0346 Yu Kuai 2023-05-29  149  	if (!cb)
5ec6ca140a0346 Yu Kuai 2023-05-29  150  		return false;
5ec6ca140a0346 Yu Kuai 2023-05-29  151  
5ec6ca140a0346 Yu Kuai 2023-05-29  152  	plug = container_of(cb, struct raid1_plug_cb, cb);
5ec6ca140a0346 Yu Kuai 2023-05-29  153  	bio_list_add(&plug->pending, bio);
460af1f9d9e62a Yu Kuai 2023-05-29  154  	if (++plug->count / MAX_PLUG_BIO >= copies) {
460af1f9d9e62a Yu Kuai 2023-05-29 @155  		list_del(&cb->list);
460af1f9d9e62a Yu Kuai 2023-05-29  156  		cb->callback(cb, false);
460af1f9d9e62a Yu Kuai 2023-05-29  157  	}
460af1f9d9e62a Yu Kuai 2023-05-29  158  
5ec6ca140a0346 Yu Kuai 2023-05-29  159  
5ec6ca140a0346 Yu Kuai 2023-05-29  160  	return true;
5ec6ca140a0346 Yu Kuai 2023-05-29  161  }
9efcc2c3df7612 Yu Kuai 2023-05-29  162  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
