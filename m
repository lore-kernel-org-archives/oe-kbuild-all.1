Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2E9211294
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Feb 2025 22:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738622557; cv=none; b=PU1VMCFbETNtCGmQRqYW6dzAtwv91VtEU9F78ZpECrge1kOZDxNOD20D/Nhx3uNQijATtpJABcTc93CnyIsw1h/USp5ukDhA3AyH1ei4ac0aNWfhc13wT3s22sLGq730RQ62DpLZrktUHT8RqmCdkvWOGt2r8/4K51q3Gqv5rZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738622557; c=relaxed/simple;
	bh=qtHi6v30cpsToowYnjgdN2whCBj5WgWVpPHB3qvt61k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tR2PORGzAMbcEU7LKo2vlncVg1RWZI1aKd7rswWYj1CVVqbmnOBJf8HwGo2WvKWAYqVeUJBR+g6hSAS5h3zGLNG451Z7dgbdb/7ZE5hgJTZQkLZgyw2VdIuiuVUPs1dqWc1+tXkx1UNFq+RBLsGHOYitT7JnvknbwpTEQ3tfNAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AqdQ0NcX; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AqdQ0NcX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738622555; x=1770158555;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qtHi6v30cpsToowYnjgdN2whCBj5WgWVpPHB3qvt61k=;
  b=AqdQ0NcXHVB/QZTWhfMVw0/BpvNSoDID3llYFviODG7PZN8Wd0UNgx8M
   iF7U8oGJvHN7UIv/PwVFmHuqckuAxbU2gefNloZKIZnUDaU/MMx82d7jf
   ofYUWs7ZFyShHiul4B2ySnOn0F3xE88A9iCjR6s+npcbHknoCa/zWeLj4
   04brr3CaaWUVp+sHOfkaVc/Aw9hUvo4MJjVYN8m3YpeWzDDQBfaINGDTc
   yEiJeTWbdQrzAhPGW5VlhNr2fcOqhTZGklbitWN5c/FBFqRiBvDmtydN1
   F4bOwjgIB8DUR2HPSb+sx9USu8rqX9pyrsxfuA1gPVVvHac+wgoWUGxV9
   g==;
X-CSE-ConnectionGUID: myoLEBZaSJSGfZMSg/dD1A==
X-CSE-MsgGUID: Us09XZfgQ5SJcLR51fEsOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="61604878"
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; 
   d="scan'208";a="61604878"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 14:42:34 -0800
X-CSE-ConnectionGUID: d73L3O1QSyGt/jZgllWZVQ==
X-CSE-MsgGUID: uIodteOfQoqN59ct0kGezQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; 
   d="scan'208";a="110308044"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Feb 2025 14:42:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tf59D-000rcj-0k;
	Mon, 03 Feb 2025 22:42:31 +0000
Date: Tue, 4 Feb 2025 06:41:45 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.13-esp32 50/53] kernel/events/core.c:6834
 perf_get_unmapped_area() warn: unsigned 'ret' is never less than zero.
Message-ID: <202502040613.KBokIuOu-lkp@intel.com>
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
config: hexagon-randconfig-r071-20250203 (https://download.01.org/0day-ci/archive/20250204/202502040613.KBokIuOu-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502040613.KBokIuOu-lkp@intel.com/

smatch warnings:
kernel/events/core.c:6834 perf_get_unmapped_area() warn: unsigned 'ret' is never less than zero.

vim +/ret +6834 kernel/events/core.c

  6787	
  6788	unsigned long perf_get_unmapped_area(struct file *file,
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
> 6834				if (ret < 0)
  6835					goto unlock;
  6836				ret = (unsigned long)rb->data_pages[pgoff - 1];
  6837			}
  6838		}
  6839	unlock:
  6840		pr_debug("%s: ret = 0x%lx\n", __func__, ret);
  6841		return ret;
  6842	}
  6843	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
