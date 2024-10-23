Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F6D198A3F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Oct 2024 09:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729674764; cv=none; b=dfMHMtnybGEBU02XQdviY+TQIuXHf2jKNYyn1LdZUmzMQnhgjzauIo9hzCf32txQA95Q5D5uEADoxALr+kGeDWFgB4t4OLhDhucmoi8pPHKAtOG6XuqeMrGw3033d3lGhVbkLzqDJPLXTNfW11066C5X1MGjweCxKLi/hwY37l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729674764; c=relaxed/simple;
	bh=7FM2BYkIQAhySDlfv+2ahnBmaHT6Q3dgRAqpoi+RjGo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eFjkJfjn3mLqUJj3/hp5V5/vxl8ADLD7IHdqCwa0zRPnmdVn1l3M5dZzBlI9fk4jV+/AiZd3bjEGlwwdRI0FUVpERbzGGjWdOYNc1fMdHWfNKGMv8mHPQnTe4Vy27wADt1vl68IZFV8r2YAkcTVV8OZTB1+TcIXHjUeEkWVc7R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YZVriWS3; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YZVriWS3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729674763; x=1761210763;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7FM2BYkIQAhySDlfv+2ahnBmaHT6Q3dgRAqpoi+RjGo=;
  b=YZVriWS3vhtwJOn75fiSudk8mqTF7TWrsbLf8CLx6ZWrpm+mktruCh03
   Fj09P+b4n0PEWUB6j7CjgW1D963Jf5p+ughh4+Mo9MBeeUlqNRnqVbnRh
   uvc0aBCYfUSll8NHeJKpAQcR669hK0fDdGY1UiWyezGB19Egl2DGapNsg
   HF/v1pMl3krAyjDOuwjq8qCzGVWs5bpIKgh5TsKuiT1SyuqTPe/vzAu9G
   tsbqvpsacZiaf8+JX2WJ4tCXRoxmZGJ4p0ey2n15X/KCukl5q5oJwMnzA
   MHYCHRh4snk2xuWRn1SFzAEYtFi7oLwpZmYFlABXzNRYHME+ZDn9h0OCA
   Q==;
X-CSE-ConnectionGUID: J75+7CncQCCbbB8P9fVmkg==
X-CSE-MsgGUID: VJuuBiwzQQaD0EvcNy9BQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39798748"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39798748"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 02:12:43 -0700
X-CSE-ConnectionGUID: y6H3gXqmST64qyyzFDo9xg==
X-CSE-MsgGUID: 8yMHNI+cRMCkk4WVTvYUhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="110971641"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 Oct 2024 02:12:41 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3XPz-000Uip-0s;
	Wed, 23 Oct 2024 09:12:39 +0000
Date: Wed, 23 Oct 2024 17:12:19 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.11-esp32 50/53]
 kernel/events/core.c:6708:15: warning: no previous prototype for
 'perf_get_unmapped_area'
Message-ID: <202410231737.K8b8wO4B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.11-esp32
head:   3b01ad2a1f71b72b27fefa08e4bf6acbe1de874f
commit: 45c61e979c95928370efa03921af750bcc394f18 [50/53] WIP: perf: support mmapping event on noMMU
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241023/202410231737.K8b8wO4B-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410231737.K8b8wO4B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410231737.K8b8wO4B-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/events/core.c:6708:15: warning: no previous prototype for 'perf_get_unmapped_area' [-Wmissing-prototypes]
    6708 | unsigned long perf_get_unmapped_area(struct file *file,
         |               ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/events/core.c:6764:17: warning: 'perf_mmap_capabilities' defined but not used [-Wunused-function]
    6764 | static unsigned perf_mmap_capabilities(struct file *file)
         |                 ^~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ESP32_IPC
   Depends on [n]: OF [=n] && HAS_IOMEM [=y]
   Selected by [y]:
   - ESP32_WIFI_SHMEM [=y] && NETDEVICES [=y] && WLAN [=y] && WLAN_VENDOR_ESPRESSIF [=y]


vim +/perf_get_unmapped_area +6708 kernel/events/core.c

  6707	
> 6708	unsigned long perf_get_unmapped_area(struct file *file,
  6709					     unsigned long addr, unsigned long len,
  6710					     unsigned long pgoff, unsigned long flags)
  6711	{
  6712		unsigned long ret = -EINVAL;
  6713		struct perf_event *event = file->private_data;
  6714		unsigned long nr_pages = len / PAGE_SIZE;
  6715	
  6716		pr_debug("%s: addr = 0x%lx, len = 0x%lx, pgoff = 0x%lx, flags = 0x%lx, event = %p, event->rb = %p\n",
  6717			 __func__, addr, len, pgoff, flags, event, event->rb);
  6718	
  6719		if (!event->rb) {
  6720			int flags = RING_BUFFER_WRITABLE;
  6721			struct perf_buffer *rb = NULL;
  6722	
  6723			if (pgoff != 0) {
  6724				ret = -EINVAL;
  6725				goto unlock;
  6726			}
  6727			--nr_pages;
  6728			rb = rb_alloc(nr_pages,
  6729				      event->attr.watermark ? event->attr.wakeup_watermark : 0,
  6730				      event->cpu, flags);
  6731	
  6732			if (!rb) {
  6733				ret = -ENOMEM;
  6734				goto unlock;
  6735			}
  6736			atomic_set(&rb->mmap_count, 1);
  6737			rb->mmap_user = get_current_user();
  6738			rb->mmap_locked = 0;
  6739	
  6740			ring_buffer_attach(event, rb);
  6741	
  6742			perf_event_update_time(event);
  6743			perf_event_init_userpage(event);
  6744			perf_event_update_userpage(event);
  6745		}
  6746		if (event->rb) {
  6747			struct perf_buffer *rb = event->rb;
  6748	
  6749			if (!pgoff) {
  6750				ret = (unsigned long)rb->user_page;
  6751			} else {
  6752				ret = rb_alloc_aux(rb, event, pgoff, nr_pages,
  6753						   event->attr.aux_watermark, flags);
  6754				if (ret < 0)
  6755					goto unlock;
  6756				ret = (unsigned long)rb->data_pages[pgoff - 1];
  6757			}
  6758		}
  6759	unlock:
  6760		pr_debug("%s: ret = 0x%lx\n", __func__, ret);
  6761		return ret;
  6762	}
  6763	
> 6764	static unsigned perf_mmap_capabilities(struct file *file)
  6765	{
  6766		return NOMMU_MAP_DIRECT | NOMMU_MAP_READ | NOMMU_MAP_WRITE;
  6767	}
  6768	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
