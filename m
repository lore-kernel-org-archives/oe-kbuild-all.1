Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE65E4176F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 11:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VotlFw5G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697540968; x=1729076968;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SDpiSFYOv6n3J7eMlVjdbdrTNl4FN6Qdgb19N7wCk2Q=;
  b=VotlFw5G/CbI+QS7ghGBqguPM+hEUe0j7FhxsVW1WxBshYDqWlqkjUlL
   G9vSpPaa8ohDF5/SX+h0oPxxuX8jPF5VkAz810sRt65ExIy3pd+iFpGCQ
   yPLapgP8nzPCHLB8JgZftViv3kcuZ60IAw4qrcZLbCbqFSvRhCocNJWHh
   OImd60UD7S7Tqezw4Oo+JtAaBYjTSFuzbnAtZ19Syy+cJ4LTbqKMkIx6F
   C4ttmiywcI2aOpCvOMY4qpVolxTe5FDNsI65xPWp5U9gpL175znTFI3g+
   0bdiweHkPMIT+woW9W81QWLUPZXj246jgDlPFG5NcLrRtYIbIfgPIJPFn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="388617160"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="388617160"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 04:09:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="3886053"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 17 Oct 2023 04:08:21 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qshwx-0009Un-0N;
	Tue, 17 Oct 2023 11:09:23 +0000
Date: Tue, 17 Oct 2023 19:09:09 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.6-rc5-esp32 33/39]
 kernel/events/core.c:6629 perf_get_unmapped_area() warn: unsigned 'ret' is
 never less than zero.
Message-ID: <202310171931.bTVv3KqS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.6-rc5-esp32
head:   d94696313abafc65336b758151c83fa2fa33e092
commit: 028231d5f2c4db12a43a4c54c45622bb547975be [33/39] WIP: perf: support mmapping event on noMMU
config: x86_64-randconfig-161-20231017 (https://download.01.org/0day-ci/archive/20231017/202310171931.bTVv3KqS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231017/202310171931.bTVv3KqS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310171931.bTVv3KqS-lkp@intel.com/

smatch warnings:
kernel/events/core.c:6629 perf_get_unmapped_area() warn: unsigned 'ret' is never less than zero.

vim +/ret +6629 kernel/events/core.c

  6582	
  6583	unsigned long perf_get_unmapped_area(struct file *file,
  6584					     unsigned long addr, unsigned long len,
  6585					     unsigned long pgoff, unsigned long flags)
  6586	{
  6587		unsigned long ret = -EINVAL;
  6588		struct perf_event *event = file->private_data;
  6589		unsigned long nr_pages = len / PAGE_SIZE;
  6590	
  6591		pr_debug("%s: addr = 0x%lx, len = 0x%lx, pgoff = 0x%lx, flags = 0x%lx, event = %p, event->rb = %p\n",
  6592			 __func__, addr, len, pgoff, flags, event, event->rb);
  6593	
  6594		if (!event->rb) {
  6595			int flags = RING_BUFFER_WRITABLE;
  6596			struct perf_buffer *rb = NULL;
  6597	
  6598			if (pgoff != 0) {
  6599				ret = -EINVAL;
  6600				goto unlock;
  6601			}
  6602			--nr_pages;
  6603			rb = rb_alloc(nr_pages,
  6604				      event->attr.watermark ? event->attr.wakeup_watermark : 0,
  6605				      event->cpu, flags);
  6606	
  6607			if (!rb) {
  6608				ret = -ENOMEM;
  6609				goto unlock;
  6610			}
  6611			atomic_set(&rb->mmap_count, 1);
  6612			rb->mmap_user = get_current_user();
  6613			rb->mmap_locked = 0;
  6614	
  6615			ring_buffer_attach(event, rb);
  6616	
  6617			perf_event_update_time(event);
  6618			perf_event_init_userpage(event);
  6619			perf_event_update_userpage(event);
  6620		}
  6621		if (event->rb) {
  6622			struct perf_buffer *rb = event->rb;
  6623	
  6624			if (!pgoff) {
  6625				ret = (unsigned long)rb->user_page;
  6626			} else {
  6627				ret = rb_alloc_aux(rb, event, pgoff, nr_pages,
  6628						   event->attr.aux_watermark, flags);
> 6629				if (ret < 0)
  6630					goto unlock;
  6631				ret = (unsigned long)rb->data_pages[pgoff - 1];
  6632			}
  6633		}
  6634	unlock:
  6635		pr_debug("%s: ret = 0x%lx\n", __func__, ret);
  6636		return ret;
  6637	}
  6638	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
