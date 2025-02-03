Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F91E2A1CF
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Feb 2025 11:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738582310; cv=none; b=GeNqCQTRgB8TsVkpkJgGKkOHxOujJx5dUAeUd5EYlxYmnzoxUxfDqyL1VVNXJoWTyoQFTJkssgVTtENUGp3t7rFLyiyDufSLAmp7HMdrXymGZFM6hT2n9exBhhH99NFCj9JtLg3m9OYFvvZ5sCgenLcG0H15BbrzlECD8PT8+MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738582310; c=relaxed/simple;
	bh=FCNij+bU3cl+D143NGLrXPk9oOYtfKIKNvM00CqwQ0s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TGFAfNoDO3tNW0oqdDU8t2t+6OBAUKxgixk+RjT735JgC0l7Y0cXNjT2yw/Gp2AVvCZO+CrvKrJcpJA81bGqCf55M2VOvmWhr9jxnNSrhqga466RWpu+fswczdr83sDDqPX+8Hw/k7IPfgzV0f7OxZ8/VoWv//L777cXue7F+Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UqNb9t8S; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UqNb9t8S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738582308; x=1770118308;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FCNij+bU3cl+D143NGLrXPk9oOYtfKIKNvM00CqwQ0s=;
  b=UqNb9t8SxRxLDyp4NyrQPSoKhSuLPad4Vrt8ooAn7gnqo1f1rjYQ1rFS
   LKo5ylB0Jd9XMsGtkc140K5zt6kU5F1W3VFetIZ7AOPtOvf1s/GB27okm
   mZUYJ73nMtLAJ+8a1Q10cvh6ueJIoQGihk9NMn/tvoBtTAjqhZGovio6O
   EXBj8zTba9YyN8dnOB1zF+ki0qBh5wlNwF6l0A94iK3IXzlU86K8Nsy0Q
   Oj8uEkNugVJPfh60TWcTTddrdTx8SLfKwZvX7Wzt438/Re3QgTu/tal9N
   36vF4DViTazJ9LpkucExN6ZeStPy7vffVy62XYA/QKcMBSIxm83bs4Nd9
   A==;
X-CSE-ConnectionGUID: v/CP0cZpTmmgizhDRXchaw==
X-CSE-MsgGUID: K2JqQM1dQxah2RJUFIS7Xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="42992553"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="42992553"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 03:31:13 -0800
X-CSE-ConnectionGUID: CttpQot/Q9KpjDcNDKIXjw==
X-CSE-MsgGUID: ljLXcN1BRK2scbpDF1gCLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="110092844"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 Feb 2025 03:31:12 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1teufV-000qqX-37;
	Mon, 03 Feb 2025 11:31:09 +0000
Date: Mon, 3 Feb 2025 19:30:57 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.13-esp32 50/53]
 kernel/events/core.c:6788:15: warning: no previous prototype for
 'perf_get_unmapped_area'
Message-ID: <202502031926.CiTDTZ9d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.13-esp32
head:   f4a6cef2509c4e81637b6d5d6f0c27966895985a
commit: 88bd9eae01160b8518176ec8020990780152c0d6 [50/53] WIP: perf: support mmapping event on noMMU
config: i386-buildonly-randconfig-002-20250203 (https://download.01.org/0day-ci/archive/20250203/202502031926.CiTDTZ9d-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250203/202502031926.CiTDTZ9d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502031926.CiTDTZ9d-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/events/core.c:6788:15: warning: no previous prototype for 'perf_get_unmapped_area' [-Wmissing-prototypes]
    6788 | unsigned long perf_get_unmapped_area(struct file *file,
         |               ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/events/core.c:6844:17: warning: 'perf_mmap_capabilities' defined but not used [-Wunused-function]
    6844 | static unsigned perf_mmap_capabilities(struct file *file)
         |                 ^~~~~~~~~~~~~~~~~~~~~~


vim +/perf_get_unmapped_area +6788 kernel/events/core.c

  6787	
> 6788	unsigned long perf_get_unmapped_area(struct file *file,
  6789					     unsigned long addr, unsigned long len,
  6790					     unsigned long pgoff, unsigned long flags)
  6791	{
  6792		unsigned long ret = -EINVAL;
  6793		struct perf_event *event = file->private_data;
  6794		unsigned long nr_pages = len / PAGE_SIZE;
  6795	
  6796		pr_debug("%s: addr = 0x%lx, len = 0x%lx, pgoff = 0x%lx, flags = 0x%lx, event = %p, event->rb = %p\n",
  6797			 __func__, addr, len, pgoff, flags, event, event->rb);
  6798	
  6799		if (!event->rb) {
  6800			int flags = RING_BUFFER_WRITABLE;
  6801			struct perf_buffer *rb = NULL;
  6802	
  6803			if (pgoff != 0) {
  6804				ret = -EINVAL;
  6805				goto unlock;
  6806			}
  6807			--nr_pages;
  6808			rb = rb_alloc(nr_pages,
  6809				      event->attr.watermark ? event->attr.wakeup_watermark : 0,
  6810				      event->cpu, flags);
  6811	
  6812			if (!rb) {
  6813				ret = -ENOMEM;
  6814				goto unlock;
  6815			}
  6816			atomic_set(&rb->mmap_count, 1);
  6817			rb->mmap_user = get_current_user();
  6818			rb->mmap_locked = 0;
  6819	
  6820			ring_buffer_attach(event, rb);
  6821	
  6822			perf_event_update_time(event);
  6823			perf_event_init_userpage(event);
  6824			perf_event_update_userpage(event);
  6825		}
  6826		if (event->rb) {
  6827			struct perf_buffer *rb = event->rb;
  6828	
  6829			if (!pgoff) {
  6830				ret = (unsigned long)rb->user_page;
  6831			} else {
  6832				ret = rb_alloc_aux(rb, event, pgoff, nr_pages,
  6833						   event->attr.aux_watermark, flags);
  6834				if (ret < 0)
  6835					goto unlock;
  6836				ret = (unsigned long)rb->data_pages[pgoff - 1];
  6837			}
  6838		}
  6839	unlock:
  6840		pr_debug("%s: ret = 0x%lx\n", __func__, ret);
  6841		return ret;
  6842	}
  6843	
> 6844	static unsigned perf_mmap_capabilities(struct file *file)
  6845	{
  6846		return NOMMU_MAP_DIRECT | NOMMU_MAP_READ | NOMMU_MAP_WRITE;
  6847	}
  6848	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
