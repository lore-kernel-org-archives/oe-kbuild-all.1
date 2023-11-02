Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2FE1C20
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Nov 2023 04:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U8nt11l+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698901188; x=1730437188;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lIeJO5WSgAgbTCv8oBCMqEb3zs1VDJnqcHdv2hoQDLE=;
  b=U8nt11l+E3R+scLRiUlFO0oslTsMtwmJZizztt5pyPidYXK+sNPdmorf
   TpfFzcccbvbrjzUHAXDZ8lnArCj5zfaNObAZbMYvVqGI46Cj/D3NNjnit
   j0FMBPxh+lsLJ6cPrqZ10YJpwkqeA/tIiDWVD/B+kTGLbWyb1GjvJ8U7m
   FOXgTdYNxkvdlLyeA3fmzug4ZlaZkHLZwZs4byqgFSUi3Bt7geJMMYQRq
   wnSu73xwmra0A8ygoKd3wt7TlygFcx6bTSVmj2mrbnbpaz/c9lAx+xrpG
   XBqhaF0c+9UKz0kDLLMUxywNbrffWOX89DPIB6vny5oSkhfDvyokzcfiK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="392523637"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; 
   d="scan'208";a="392523637"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 21:59:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; 
   d="scan'208";a="2314528"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 01 Nov 2023 21:59:46 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyPo0-00017g-0D;
	Thu, 02 Nov 2023 04:59:44 +0000
Date: Thu, 2 Nov 2023 12:59:26 +0800
From: kernel test robot <lkp@intel.com>
To: Junxiao Bi <junxiao.bi@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] md/raid5: fix hung by MD_SB_CHANGE_PENDING
Message-ID: <202311021202.Dm9g43Zm-lkp@intel.com>
References: <20231101230214.57190-1-junxiao.bi@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231101230214.57190-1-junxiao.bi@oracle.com>

Hi Junxiao,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on song-md/md-next]
[also build test ERROR on axboe-block/for-next linus/master v6.6 next-20231102]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Junxiao-Bi/md-raid5-fix-hung-by-MD_SB_CHANGE_PENDING/20231102-070925
base:   git://git.kernel.org/pub/scm/linux/kernel/git/song/md.git md-next
patch link:    https://lore.kernel.org/r/20231101230214.57190-1-junxiao.bi%40oracle.com
patch subject: [RFC] md/raid5: fix hung by MD_SB_CHANGE_PENDING
config: sparc64-defconfig (https://download.01.org/0day-ci/archive/20231102/202311021202.Dm9g43Zm-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231102/202311021202.Dm9g43Zm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311021202.Dm9g43Zm-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/md/raid5.c: In function 'raid5d':
>> drivers/md/raid5.c:6825:40: error: passing argument 1 of 'blk_flush_plug' from incompatible pointer type [-Werror=incompatible-pointer-types]
    6825 |                         blk_flush_plug(current);
         |                                        ^~~~~~~
         |                                        |
         |                                        struct task_struct *
   In file included from drivers/md/raid5.c:38:
   include/linux/blkdev.h:992:52: note: expected 'struct blk_plug *' but argument is of type 'struct task_struct *'
     992 | static inline void blk_flush_plug(struct blk_plug *plug, bool async)
         |                                   ~~~~~~~~~~~~~~~~~^~~~
>> drivers/md/raid5.c:6825:25: error: too few arguments to function 'blk_flush_plug'
    6825 |                         blk_flush_plug(current);
         |                         ^~~~~~~~~~~~~~
   include/linux/blkdev.h:992:20: note: declared here
     992 | static inline void blk_flush_plug(struct blk_plug *plug, bool async)
         |                    ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/blk_flush_plug +6825 drivers/md/raid5.c

  6753	
  6754	/*
  6755	 * This is our raid5 kernel thread.
  6756	 *
  6757	 * We scan the hash table for stripes which can be handled now.
  6758	 * During the scan, completed stripes are saved for us by the interrupt
  6759	 * handler, so that they will not have to wait for our next wakeup.
  6760	 */
  6761	static void raid5d(struct md_thread *thread)
  6762	{
  6763		struct mddev *mddev = thread->mddev;
  6764		struct r5conf *conf = mddev->private;
  6765		int handled;
  6766		struct blk_plug plug;
  6767	
  6768		pr_debug("+++ raid5d active\n");
  6769	
  6770		md_check_recovery(mddev);
  6771	
  6772		blk_start_plug(&plug);
  6773		handled = 0;
  6774		spin_lock_irq(&conf->device_lock);
  6775		while (1) {
  6776			struct bio *bio;
  6777			int batch_size, released;
  6778			unsigned int offset;
  6779	
  6780			released = release_stripe_list(conf, conf->temp_inactive_list);
  6781			if (released)
  6782				clear_bit(R5_DID_ALLOC, &conf->cache_state);
  6783	
  6784			if (
  6785			    !list_empty(&conf->bitmap_list)) {
  6786				/* Now is a good time to flush some bitmap updates */
  6787				conf->seq_flush++;
  6788				spin_unlock_irq(&conf->device_lock);
  6789				md_bitmap_unplug(mddev->bitmap);
  6790				spin_lock_irq(&conf->device_lock);
  6791				conf->seq_write = conf->seq_flush;
  6792				activate_bit_delay(conf, conf->temp_inactive_list);
  6793			}
  6794			raid5_activate_delayed(conf);
  6795	
  6796			while ((bio = remove_bio_from_retry(conf, &offset))) {
  6797				int ok;
  6798				spin_unlock_irq(&conf->device_lock);
  6799				ok = retry_aligned_read(conf, bio, offset);
  6800				spin_lock_irq(&conf->device_lock);
  6801				if (!ok)
  6802					break;
  6803				handled++;
  6804			}
  6805	
  6806			batch_size = handle_active_stripes(conf, ANY_GROUP, NULL,
  6807							   conf->temp_inactive_list);
  6808			if (!batch_size && !released)
  6809				break;
  6810			handled += batch_size;
  6811	
  6812			if (mddev->sb_flags & ~(1 << MD_SB_CHANGE_PENDING)) {
  6813				spin_unlock_irq(&conf->device_lock);
  6814				md_check_recovery(mddev);
  6815				spin_lock_irq(&conf->device_lock);
  6816	
  6817				/*
  6818				 * Waiting on MD_SB_CHANGE_PENDING below may deadlock
  6819				 * seeing md_check_recovery() is needed to clear
  6820				 * the flag when using mdmon.
  6821				 */
  6822				continue;
  6823			} else {
  6824				spin_unlock_irq(&conf->device_lock);
> 6825				blk_flush_plug(current);
  6826				cond_resched();
  6827				spin_lock_irq(&conf->device_lock);
  6828			}
  6829		}
  6830		pr_debug("%d stripes handled\n", handled);
  6831	
  6832		spin_unlock_irq(&conf->device_lock);
  6833		if (test_and_clear_bit(R5_ALLOC_MORE, &conf->cache_state) &&
  6834		    mutex_trylock(&conf->cache_size_mutex)) {
  6835			grow_one_stripe(conf, __GFP_NOWARN);
  6836			/* Set flag even if allocation failed.  This helps
  6837			 * slow down allocation requests when mem is short
  6838			 */
  6839			set_bit(R5_DID_ALLOC, &conf->cache_state);
  6840			mutex_unlock(&conf->cache_size_mutex);
  6841		}
  6842	
  6843		flush_deferred_bios(conf);
  6844	
  6845		r5l_flush_stripe_to_raid(conf->log);
  6846	
  6847		async_tx_issue_pending_all();
  6848		blk_finish_plug(&plug);
  6849	
  6850		pr_debug("--- raid5d inactive\n");
  6851	}
  6852	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
