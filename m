Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CDA1388
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Apr 2024 02:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714271948; cv=none; b=sebNpcdtIHwqAPxbz0Z81syYiiwJ1anukid0NwBkuXjo65foJ9At4LHJjiIR6KkdOfKfWarb2JVYblK9mvkOxs5YEGf+tAPKCqWyMH1kaAMcuyCrJJ8J8TzV3crtnciIezeCU1h7XNNx2Fpnc6PCcwcyPLD2r8YOifp7k1biZ6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714271948; c=relaxed/simple;
	bh=pBfn2RCjLU91dPRzBVW6Q1gaxLDkb21l2zsKUc4T0o0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oY4MZ2GggfPpVedsXv1PUrWnGY5NNtQnQHocF2H7FmdBezzRaFNqZUtr0R4XR7xUFCQEuRbuVDl5VJzfDGkfxAk57rDwMERO1NdpEGyiv/VO2yVC9rGwaX+3MhOYhPMLP7v0Mnt8TbnL44eYZSP5/MPzrvFeyZPZz7/iGJp6PNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bUtNvicI; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bUtNvicI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714271947; x=1745807947;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pBfn2RCjLU91dPRzBVW6Q1gaxLDkb21l2zsKUc4T0o0=;
  b=bUtNvicICOYsl0QaAx0RbAMl7JUUsYUAkiQXlQSVXjmG/vPGLiYm90uM
   uZea5hppwDRTVYouaJoVtp7cOncCFXiWOKNG/ckFrx3CI+bzqIlt+RM8E
   qHKFDKdIZlVANLWdJIPlj5ZQeGMdCGfCkM8qBpCbpPJtl65UVAAFhqcbY
   ij86HXtlMVYHeBVUCREelCcWSBHxG3scSICWE25urRHcXe2gJlwmhXL7I
   pmpwbt8hg+ftth4ixYZkhk7U33tYhloLFGgBmeKECsogAIFqzcWXXlnui
   gdyqugrDDHLS+bbFQBOuW52k3oAxXWjj/UKhLBY9RF5tEzh5r6n2xPgOb
   g==;
X-CSE-ConnectionGUID: oAX4nAGSSXWApRXRDU+A5w==
X-CSE-MsgGUID: i2HmWBqhTZyy2tj/QcnBrA==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="10182255"
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="10182255"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 19:39:04 -0700
X-CSE-ConnectionGUID: ci1dx0SFQQmyTs1v12Jj0Q==
X-CSE-MsgGUID: ++qackaxR2apl0AGgDTY0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="30596770"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Apr 2024 19:39:03 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0uRQ-0005lk-2d;
	Sun, 28 Apr 2024 02:39:00 +0000
Date: Sun, 28 Apr 2024 10:38:38 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hverkuil-media-tree:vivid-kthread 36/37]
 drivers/media/test-drivers/vivid/vivid-kthread-cap.c:773:undefined reference
 to `__udivdi3'
Message-ID: <202404281015.gPENjPYW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git vivid-kthread
head:   110b5a0121cf99f034671c91eed3674a652b0e6f
commit: 61319ac7d6157a0f4d6f782749b820988e22fdf2 [36/37] media: vivid: make the timestamps/seq numbers reliable
config: i386-randconfig-141-20240428 (https://download.01.org/0day-ci/archive/20240428/202404281015.gPENjPYW-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404281015.gPENjPYW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404281015.gPENjPYW-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/media/test-drivers/vivid/vivid-kthread-cap.o: in function `vivid_thread_vid_cap':
>> drivers/media/test-drivers/vivid/vivid-kthread-cap.c:773:(.text+0x2d9f): undefined reference to `__udivdi3'
   ld: drivers/media/test-drivers/vivid/vivid-kthread-out.o: in function `vivid_thread_vid_out':
>> drivers/media/test-drivers/vivid/vivid-kthread-out.c:242:(.text+0x76f): undefined reference to `__udivdi3'
   ld: drivers/media/test-drivers/vivid/vivid-sdr-cap.o: in function `vivid_thread_sdr_cap':
   drivers/media/test-drivers/vivid/vivid-sdr-cap.c:225:(.text+0x1515): undefined reference to `__udivdi3'
   ld: drivers/media/test-drivers/vivid/vivid-kthread-touch.o: in function `vivid_thread_touch_cap':
>> drivers/media/test-drivers/vivid/vivid-kthread-touch.c:146:(.text+0x381): undefined reference to `__udivdi3'


vim +773 drivers/media/test-drivers/vivid/vivid-kthread-cap.c

   660	
   661	static int vivid_thread_vid_cap(void *data)
   662	{
   663		struct vivid_dev *dev = data;
   664		u64 start_time;
   665		u64 numerators_since_start;
   666		u64 buffers_since_start;
   667		u64 f_time;
   668		u32 seq_offset = 0;
   669		unsigned long next_jiffies;
   670		unsigned long jiffies_since_start;
   671		unsigned long cur_jiffies;
   672		unsigned numerator;
   673		unsigned denominator;
   674		int dropped_bufs;
   675	
   676		dprintk(dev, 1, "Video Capture Thread Start\n");
   677	
   678		set_freezable();
   679	
   680		/*
   681		 * Wait for first buffer to arrive. Without this you can end up with
   682		 * a first buffer that has a sequence counter > 0.
   683		 *
   684		 * Since this driver is also used for regression testing the behavior
   685		 * should be predictable, and so the first buffer definitely should
   686		 * start with sequence == 0.
   687		 */
   688		while (!kthread_should_stop()) {
   689			bool has_buffer;
   690	
   691			spin_lock(&dev->slock);
   692			has_buffer = !list_empty(&dev->vid_cap_active) ||
   693				!list_empty(&dev->vbi_cap_active) ||
   694				!list_empty(&dev->meta_cap_active);
   695			spin_unlock(&dev->slock);
   696			if (has_buffer)
   697				break;
   698			try_to_freeze();
   699			schedule();
   700		}
   701	
   702		/* Resets frame counters */
   703		dev->cap_seq_count = 0;
   704		dev->cap_seq_resync = false;
   705		dev->jiffies_vid_cap = jiffies;
   706		start_time = ktime_get_ns();
   707		if (dev->time_wrap)
   708			dev->time_wrap_offset = dev->time_wrap - start_time;
   709		else
   710			dev->time_wrap_offset = 0;
   711		vivid_cap_update_frame_period(dev);
   712	
   713		for (;;) {
   714			try_to_freeze();
   715			if (kthread_should_stop())
   716				break;
   717	
   718			if (!mutex_trylock(&dev->mutex)) {
   719				schedule();
   720				continue;
   721			}
   722	
   723			cur_jiffies = jiffies;
   724			if (dev->cap_seq_resync) {
   725				dev->jiffies_vid_cap = cur_jiffies;
   726				seq_offset = dev->cap_seq_count + 1;
   727				dev->cap_seq_count = 0;
   728				start_time += dev->cap_frame_period * seq_offset;
   729				vivid_cap_update_frame_period(dev);
   730				dev->cap_seq_resync = false;
   731			}
   732			numerator = dev->timeperframe_vid_cap.numerator;
   733			denominator = dev->timeperframe_vid_cap.denominator;
   734	
   735			if (dev->field_cap == V4L2_FIELD_ALTERNATE)
   736				denominator *= 2;
   737	
   738			/* Calculate the number of jiffies since we started streaming */
   739			jiffies_since_start = cur_jiffies - dev->jiffies_vid_cap;
   740			/* Get the number of buffers streamed since the start */
   741			buffers_since_start = (u64)jiffies_since_start * denominator;
   742			buffers_since_start = div_u64(buffers_since_start, HZ * numerator);
   743			f_time = start_time + dev->time_wrap_offset +
   744				buffers_since_start * dev->cap_frame_period;
   745	
   746			/*
   747			 * After more than 0xf0000000 (rounded down to a multiple of
   748			 * 'jiffies-per-day' to ease jiffies_to_msecs calculation)
   749			 * jiffies have passed since we started streaming reset the
   750			 * counters and keep track of the sequence offset.
   751			 */
   752			if (jiffies_since_start > JIFFIES_RESYNC) {
   753				dev->jiffies_vid_cap = cur_jiffies;
   754				seq_offset = buffers_since_start;
   755				buffers_since_start = 0;
   756			}
   757			dropped_bufs = buffers_since_start + seq_offset - dev->cap_seq_count;
   758			dev->cap_seq_count = buffers_since_start + seq_offset;
   759	
   760			vivid_thread_vid_cap_tick(dev, dropped_bufs, f_time);
   761			mutex_unlock(&dev->mutex);
   762	
   763			/*
   764			 * Calculate the number of 'numerators' streamed since we started,
   765			 * including the current buffer.
   766			 */
   767			numerators_since_start = ++buffers_since_start * numerator;
   768	
   769			/*
   770			 * Calculate when that next buffer is supposed to start
   771			 * in jiffies since we started streaming.
   772			 */
 > 773			next_jiffies = (numerators_since_start * HZ + denominator - 1) /
   774				denominator + dev->jiffies_vid_cap;
   775	
   776			while (time_is_after_jiffies(next_jiffies) &&
   777			       !kthread_should_stop())
   778				schedule();
   779		}
   780		dprintk(dev, 1, "Video Capture Thread End\n");
   781		return 0;
   782	}
   783	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
