Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5895419D897
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Sep 2024 16:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725552743; cv=none; b=egoq0G6xOEl/+lOQxNuvBpI535ppzgjkmDOgEAGPK1bV5zXrReKQGdIkL9JixixXvHztJoiM7pKHuEJQCeJ1XyBfUPoNakb07vsd4pAbjgL18uFvH4Pe8lgBcNL5PlRvU+Z8T5A7sDk1JALo0mBGMZNjZ3tLvT7WBji/lgfVzZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725552743; c=relaxed/simple;
	bh=mVdIASdbbq5xybfpaOccX9bQFBBEkyg5T7pSKDBbg80=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nshDlJwRvdJXf36CqTFP+6f33KosolEtwN6NO+Z2gzxZa6OPghXPsWzDANCZPFEtslmGLCWBHPYa5MAjxI0gEjtVIj+6gKMRQzLy8XtufyBhuUK1NKgEOBipCH58Mw29fxthbfZLsJ9xIiTgCrq7Uy9sZ/C5ttG0XIZzxDDk4rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kFRJRRLA; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kFRJRRLA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725552741; x=1757088741;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mVdIASdbbq5xybfpaOccX9bQFBBEkyg5T7pSKDBbg80=;
  b=kFRJRRLAypeAB871EWkdxx5dIkxx36Sddv8eDP+J96BmPv9JxLPEGfYQ
   EX+BbaqHDdi4RoqCMGUm0a9XKaI7lXGRMIyMltEHoRtqtMeJqyLz6OMe0
   w5U5PB6Vnvt5zsBW/oo+a9XwnY/bBrUBGV41siSiJwniW25yc15m9un9Q
   yYc6915lKzNijEL/APcoH+NJxTLHutV+xcipwrNehv5Qf/8CcDxQo+OJi
   lgrEAtzMSdlYAC7Lc4lAtoLmGyiV4f5lvLxD6fwXTb/de7wufrDOl0XdP
   G06YRz02nkoyV6nI1zpFwi1lvnARREJvtFJwEop/YH4c3zRCMXeJyK57B
   Q==;
X-CSE-ConnectionGUID: HWdxPhaITlu3Gllr1E88Pw==
X-CSE-MsgGUID: X3rspmwISomj4ClxQsumjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="24473851"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="24473851"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 09:12:16 -0700
X-CSE-ConnectionGUID: JOXf2wI8SjGPHarEXOMy/Q==
X-CSE-MsgGUID: FlYxMvoFSW+gJ3EA4KK1pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="65326966"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Sep 2024 09:12:15 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smF5h-000A6D-2C;
	Thu, 05 Sep 2024 16:12:13 +0000
Date: Fri, 6 Sep 2024 00:11:51 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.11-rc6-esp32 50/53]
 kernel/events/core.c:6702:15: warning: no previous prototype for
 'perf_get_unmapped_area'
Message-ID: <202409060001.zeGzqidT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.11-rc6-esp32
head:   4a9ffb44ce4c24e9dcd4a5f06beeb3dded85319a
commit: 32453b48969a9a1bb7026e6035c13ce6e1245455 [50/53] WIP: perf: support mmapping event on noMMU
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240906/202409060001.zeGzqidT-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240906/202409060001.zeGzqidT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409060001.zeGzqidT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/events/core.c:6702:15: warning: no previous prototype for 'perf_get_unmapped_area' [-Wmissing-prototypes]
    6702 | unsigned long perf_get_unmapped_area(struct file *file,
         |               ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/events/core.c:6758:17: warning: 'perf_mmap_capabilities' defined but not used [-Wunused-function]
    6758 | static unsigned perf_mmap_capabilities(struct file *file)
         |                 ^~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ESP32_IPC
   Depends on [n]: OF [=n] && HAS_IOMEM [=y]
   Selected by [y]:
   - ESP32_WIFI_SHMEM [=y] && NETDEVICES [=y] && WLAN [=y] && WLAN_VENDOR_ESPRESSIF [=y]


vim +/perf_get_unmapped_area +6702 kernel/events/core.c

  6701	
> 6702	unsigned long perf_get_unmapped_area(struct file *file,
  6703					     unsigned long addr, unsigned long len,
  6704					     unsigned long pgoff, unsigned long flags)
  6705	{
  6706		unsigned long ret = -EINVAL;
  6707		struct perf_event *event = file->private_data;
  6708		unsigned long nr_pages = len / PAGE_SIZE;
  6709	
  6710		pr_debug("%s: addr = 0x%lx, len = 0x%lx, pgoff = 0x%lx, flags = 0x%lx, event = %p, event->rb = %p\n",
  6711			 __func__, addr, len, pgoff, flags, event, event->rb);
  6712	
  6713		if (!event->rb) {
  6714			int flags = RING_BUFFER_WRITABLE;
  6715			struct perf_buffer *rb = NULL;
  6716	
  6717			if (pgoff != 0) {
  6718				ret = -EINVAL;
  6719				goto unlock;
  6720			}
  6721			--nr_pages;
  6722			rb = rb_alloc(nr_pages,
  6723				      event->attr.watermark ? event->attr.wakeup_watermark : 0,
  6724				      event->cpu, flags);
  6725	
  6726			if (!rb) {
  6727				ret = -ENOMEM;
  6728				goto unlock;
  6729			}
  6730			atomic_set(&rb->mmap_count, 1);
  6731			rb->mmap_user = get_current_user();
  6732			rb->mmap_locked = 0;
  6733	
  6734			ring_buffer_attach(event, rb);
  6735	
  6736			perf_event_update_time(event);
  6737			perf_event_init_userpage(event);
  6738			perf_event_update_userpage(event);
  6739		}
  6740		if (event->rb) {
  6741			struct perf_buffer *rb = event->rb;
  6742	
  6743			if (!pgoff) {
  6744				ret = (unsigned long)rb->user_page;
  6745			} else {
  6746				ret = rb_alloc_aux(rb, event, pgoff, nr_pages,
  6747						   event->attr.aux_watermark, flags);
  6748				if (ret < 0)
  6749					goto unlock;
  6750				ret = (unsigned long)rb->data_pages[pgoff - 1];
  6751			}
  6752		}
  6753	unlock:
  6754		pr_debug("%s: ret = 0x%lx\n", __func__, ret);
  6755		return ret;
  6756	}
  6757	
> 6758	static unsigned perf_mmap_capabilities(struct file *file)
  6759	{
  6760		return NOMMU_MAP_DIRECT | NOMMU_MAP_READ | NOMMU_MAP_WRITE;
  6761	}
  6762	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
