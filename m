Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0A812F588
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 18:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726251919; cv=none; b=GkA51J3dIn2eWZ55hNyiUGfxAHwlQ4eBlVQ/SoQY5der0/dYUFx82JMy4oU/txH34tsCrN1HdjlxXJBrRf6v7jzmT9t9rGPcOA0IuE2tIhpIlwMbUlIk7EQ5gk2orj1jPvp23YXWLMflUp5RjiE/iT9k2p/sb90T52ZmtEaSPyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726251919; c=relaxed/simple;
	bh=claSdbk5YqMIErniEPVoK1A/Qi8jWup3wZvLEVvO9fw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QIpPZuGO0uiD6n3A5cRo74QFUfPPkoaRxKV2gjeZdAdfd5yJFjbAd7zRMymqgqlcV82CwHPZBwglBTU8bvRpXCPfL4rXo6xy8tE7dhwSv6HjIxzMHEx0afsdv1zQouj5ixIJiYL6TkrA2f67rCekN6dwuRjfQ2oS6Z0fSv7mM+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JZoptkVg; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JZoptkVg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726251918; x=1757787918;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=claSdbk5YqMIErniEPVoK1A/Qi8jWup3wZvLEVvO9fw=;
  b=JZoptkVgnyy1/nT4pmJuP82z/JS+iLBFoi3rQoMhZaVtJNfrGqKdbqgM
   0fNT30x/9LAHTnDb3Mb07Hui8zqeQ3cB/BGWDP9pt0cnHV4VAJXJ+C8/P
   J/rkifjyCwqcKHTZqxYBzFk1wNI56nzsvlegJn3fyYJHFPNzUSwjhiQGL
   sZacye9FdQ0Bo1W7v3QFMDmevydhwYPSsGQ41BIGhRQ95m7M9DHSq1kHq
   Dsh7LaE4VSPsH6npMd83QqfC56oQujT2F0VWbQ4iTDQH5yRd+fCd6YxEv
   GL9G3U9diC/JaLAKdTgW/+z0UWxpftZGCqMRnVLV5Ey+/7KSwelGc2Kt7
   A==;
X-CSE-ConnectionGUID: 5GpWKlTeTuSq6qsSpDS94A==
X-CSE-MsgGUID: uREVfxl+Quqm4ejUEybTMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="24988734"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="24988734"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 11:25:15 -0700
X-CSE-ConnectionGUID: 80/KCXqbRtWDqTc48yOXBw==
X-CSE-MsgGUID: dnsjuI+MQheXs8+C0yZrVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="68088055"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Sep 2024 11:25:14 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spAyl-0006ow-2h;
	Fri, 13 Sep 2024 18:25:11 +0000
Date: Sat, 14 Sep 2024 02:25:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 5448/30000] fs/proc/etmem_scan.c:1247:45:
 warning: suggest braces around empty body in an 'else' statement
Message-ID: <202409140258.tMEI5GEF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi liubo,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   5a1d9701155c6908c76c68951170f10279685143
commit: 79246e864484015e1ef3c7ecec2d18a6b27199ec [5448/30000] etmem: etmem scan module Replace WARN_ONCE() with debug_printk for "nothing read"
config: arm64-randconfig-004-20240914 (https://download.01.org/0day-ci/archive/20240914/202409140258.tMEI5GEF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409140258.tMEI5GEF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409140258.tMEI5GEF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/proc/etmem_scan.c: In function 'mm_idle_walk_range':
   fs/proc/etmem_scan.c:1244:61: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
    1244 |                                          pic->next_hva, end);
         |                                                             ^
>> fs/proc/etmem_scan.c:1247:45: warning: suggest braces around empty body in an 'else' statement [-Wempty-body]
    1247 |                 debug_printk("nothing read");
         |                                             ^


vim +/else +1247 fs/proc/etmem_scan.c

  1201	
  1202	static int mm_idle_walk_range(struct page_idle_ctrl *pic,
  1203					  unsigned long start,
  1204					  unsigned long end,
  1205					  struct mm_walk *walk)
  1206	{
  1207		struct vm_area_struct *vma;
  1208		int ret = 0;
  1209	
  1210		ret = init_page_idle_ctrl_buffer(pic);
  1211		if (ret)
  1212			return ret;
  1213	
  1214		for (; start < end;) {
  1215			down_read(&walk->mm->mmap_lock);
  1216			vma = find_vma(walk->mm, start);
  1217			if (vma) {
  1218				if (end > vma->vm_start) {
  1219					local_irq_disable();
  1220					ret = walk_page_range(walk->mm, start, end,
  1221							walk->ops, walk->private);
  1222					local_irq_enable();
  1223				} else
  1224					set_restart_gpa(vma->vm_start, "VMA-HOLE");
  1225			} else
  1226				set_restart_gpa(TASK_SIZE, "EOF");
  1227			up_read(&walk->mm->mmap_lock);
  1228	
  1229			WARN_ONCE(pic->gpa_to_hva, "non-zero gpa_to_hva");
  1230			if (ret != PAGE_IDLE_KBUF_FULL && end > pic->restart_gpa)
  1231				pic->restart_gpa = end;
  1232			start = pic->restart_gpa;
  1233			ret = page_idle_copy_user(pic, start, end);
  1234			if (ret)
  1235				break;
  1236		}
  1237	
  1238		if (start > pic->next_hva)
  1239			set_next_hva(start, "NEXT-START");
  1240	
  1241		if (pic->bytes_copied) {
  1242			if (ret != PAGE_IDLE_BUF_FULL && pic->next_hva < end)
  1243				debug_printk("partial scan: next_hva=%pK end=%pK\n",
> 1244						 pic->next_hva, end);
  1245			ret = 0;
  1246		} else
> 1247			debug_printk("nothing read");
  1248		return ret;
  1249	}
  1250	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
