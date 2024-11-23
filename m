Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1800BA53
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Nov 2024 06:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732344559; cv=none; b=MpSyoyORYR6oJTh1D9d+2ELvR72dsW7JLGwhxqryBe1WflbQwQlJ2f9c8plzY3O/5fHh4bJiP8V3RQXkAR0hY3fGXbrzrgVqSJxINSB7wkgua2/Ms3s8xfc6p+uOOVSYpPhcejQV+KJfQaWVt8buNVkV9qRyIolFu3ZzqGcsKm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732344559; c=relaxed/simple;
	bh=/6MU1OKqPWY2SxX1EPhmunkrCqSy/mO1Z6zlrTx5ct0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nCPurMgs2hHomYZHrGAAH5cZGRQ6XJon3lrQ8XC/1LnjdVQeHuaH7rOxgFxkDTmuuE2l59W8ZVKR0HMQnxqN6dIbzQ3ZGsf5tSJit0hkxqa36m87n28rj1obNbv3Z6e9EeTRua8MXMnlfVYcnUMyv5Ao626ddXThVW2F2Fx2Xqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qzj8w2h5; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qzj8w2h5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732344558; x=1763880558;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/6MU1OKqPWY2SxX1EPhmunkrCqSy/mO1Z6zlrTx5ct0=;
  b=Qzj8w2h5VdNZLyihPFmjgaMWCWziqWrAq6/+W1TsEt9jyYn4w0RGReu8
   bty2sjWlqIgOEwzXsfFBawVq2rxV+gn//q1YqLrO49ieLmRH7CHiwsOrq
   L69bN/oBRj13w7df4GRohSyo1z/gUsuMl00iQ15YjfHFBaRBNKHlCqD6f
   3I3TrZxDAmKytrTPvE+yFUsaQp/XtREXc1QVPOae3CHwglrNtcj5hOBYF
   yTXHhzyUY60AAd6Xrhqd/Fbeg06wTVo0WLrhslvzbfLosY8fveTayucXV
   GC/RnAOmwwPrg52OpDXvXR5O0bpXfveAAjmZQ6LUcWpDp3xNjES12mYNy
   g==;
X-CSE-ConnectionGUID: 8k60BZiuSmyzLFWfC/p6Bg==
X-CSE-MsgGUID: Am2lhHmdSVq7Gd0BCUfHRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="43881141"
X-IronPort-AV: E=Sophos;i="6.12,178,1728975600"; 
   d="scan'208";a="43881141"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 22:49:17 -0800
X-CSE-ConnectionGUID: w6+VuvA4SUCByM3TFbjWeA==
X-CSE-MsgGUID: wDHpQzC6SAazdD9pG0n/bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,178,1728975600"; 
   d="scan'208";a="91210465"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 22 Nov 2024 22:49:16 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEjxC-0004Tn-0f;
	Sat, 23 Nov 2024 06:49:14 +0000
Date: Sat, 23 Nov 2024 14:48:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:v4l2-loopback 6/7]
 drivers/media/v4l2-core/v4l2-loopback.c:1894:4: warning: variable 'index' is
 uninitialized when used here
Message-ID: <202411231424.sk8EXVaS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git v4l2-loopback
head:   285d0494d6dea4507f6e858963168f87e786241a
commit: 955003e2ca1b7565d111c3741d0c562152835aed [6/7] media: v4l2-loopback
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241123/202411231424.sk8EXVaS-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411231424.sk8EXVaS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411231424.sk8EXVaS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/v4l2-core/v4l2-loopback.c:18:
   In file included from include/linux/mm.h:2225:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/v4l2-core/v4l2-loopback.c:1894:4: warning: variable 'index' is uninitialized when used here [-Wuninitialized]
    1894 |                         index, buf->index, buf, buf->type, buf->bytesused,
         |                         ^~~~~
   drivers/media/v4l2-core/v4l2-loopback.c:95:35: note: expanded from macro 'dprintkrw'
      95 |                                task_pid_nr(current), ##args);          \
         |                                                        ^~~~
   include/linux/printk.h:501:60: note: expanded from macro 'printk'
     501 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:473:19: note: expanded from macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-loopback.c:1849:11: note: initialize the variable 'index' to silence this warning
    1849 |         int index;
         |                  ^
         |                   = 0
   5 warnings generated.


vim +/index +1894 drivers/media/v4l2-core/v4l2-loopback.c

  1841	
  1842	/* put buffer to dequeue
  1843	 * called on VIDIOC_DQBUF
  1844	 */
  1845	static int vidioc_dqbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
  1846	{
  1847		struct v4l2_loopback_device *dev;
  1848		struct v4l2_loopback_opener *opener;
  1849		int index;
  1850		struct v4l2l_buffer *b;
  1851	
  1852		dev = v4l2loopback_getdevice(file);
  1853		opener = fh_to_opener(fh);
  1854		if (opener->timeout_image_io) {
  1855			*buf = dev->timeout_image_buffer.buffer;
  1856			return 0;
  1857		}
  1858	
  1859		switch (buf->type) {
  1860		case V4L2_BUF_TYPE_VIDEO_CAPTURE:
  1861			index = get_capture_buffer(file);
  1862			if (index < 0)
  1863				return index;
  1864			dprintkrw("capture DQBUF pos: %lld index: %d\n",
  1865				  (long long)(opener->read_position - 1), index);
  1866			if (!(dev->buffers[index].buffer.flags &
  1867			      V4L2_BUF_FLAG_MAPPED)) {
  1868				dprintk("trying to return not mapped buf[%d]\n", index);
  1869				return -EINVAL;
  1870			}
  1871			unset_flags(&dev->buffers[index]);
  1872			*buf = dev->buffers[index].buffer;
  1873			dprintkrw(
  1874				"dqbuf(CAPTURE)#%d: buffer#%d @ %p type=%d bytesused=%d length=%d flags=%x field=%d timestamp=%lld.%06ld sequence=%d\n",
  1875				index, buf->index, buf, buf->type, buf->bytesused,
  1876				buf->length, buf->flags, buf->field,
  1877				(long long)buf->timestamp.tv_sec,
  1878				(long int)buf->timestamp.tv_usec, buf->sequence);
  1879			return 0;
  1880		case V4L2_BUF_TYPE_VIDEO_OUTPUT:
  1881			spin_lock_bh(&dev->list_lock);
  1882	
  1883			b = list_entry(dev->outbufs_list.prev, struct v4l2l_buffer,
  1884				       list_head);
  1885			list_move_tail(&b->list_head, &dev->outbufs_list);
  1886	
  1887			spin_unlock_bh(&dev->list_lock);
  1888			dprintkrw("output DQBUF index: %d\n", b->buffer.index);
  1889			unset_flags(b);
  1890			*buf = b->buffer;
  1891			buf->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
  1892			dprintkrw(
  1893				"dqbuf(OUTPUT)#%d: buffer#%d @ %p type=%d bytesused=%d length=%d flags=%x field=%d timestamp=%lld.%06ld sequence=%d\n",
> 1894				index, buf->index, buf, buf->type, buf->bytesused,
  1895				buf->length, buf->flags, buf->field,
  1896				(long long)buf->timestamp.tv_sec,
  1897				(long int)buf->timestamp.tv_usec, buf->sequence);
  1898			return 0;
  1899		default:
  1900			return -EINVAL;
  1901		}
  1902	}
  1903	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
