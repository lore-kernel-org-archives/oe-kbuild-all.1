Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B42913A244
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Oct 2024 23:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730071445; cv=none; b=pZ3x4uB+vXRvNjpMc1QGwW0KMKosfYizKP6XsT1CFEL+TVCvq2+WO1ZfCCOOUuthiNRIq8WzpYrE0q42FT/sYG6vOhni077duyjLSpZKdTl4DpTvTQVk8NpFdf2l5Owr3PRssUGBme3+7dg0mZNSneYLIQ1ylFMOIE16GhEz/7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730071445; c=relaxed/simple;
	bh=FAdxUsPycRWAxkGzYkO6ogCm8iQSBUGIeQ9fIkQH3Es=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=upbA44i9BUNA9Kj56PJ47/xOE6xr7Qf9P2HHcYMCcSZDv3FjbZEEiHwmMT1NT6GzVcWqseMvB5Jq4IR1uKFzvtZNYPaLOsw8DP2eEUztB71TmfC8UNn+IRXnyiqAoGAwzTmlJgOpLGDVpmj1qro1FOjRFhTYEMZQrSn7jj3mnoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TzounfCS; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TzounfCS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730071444; x=1761607444;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FAdxUsPycRWAxkGzYkO6ogCm8iQSBUGIeQ9fIkQH3Es=;
  b=TzounfCSDsNe3+uqL58BpHWHNm8CFIcXO13vdSwUCJMB1fgBIVO75II8
   ch41LZ/rFGvJXXZpBx9aXPRwSFUEIgjSISXGlqW6jU8YTCXJ6rGR54J/L
   Fqi3+zXsBqlVj4HXM1nn7Jt5ihRAhvk/LSdiNUt8wWIKE+FtQWBh/wEgY
   K0gCGUrLWXudOmc9fDKK0aR3PRiYvZbdhXZrbSjbXgi4fP8racZBzC7o9
   yT4pFvKs6kou0JeWluV1o1MvWVDeMpSuZExbfcVra9xlK7kc/f6bCk+eN
   9PECGYSBTQWp3C8fJj8X8KbObRZ0JYNOxxtv5O5IbbLPNZNaK5yL7zaar
   w==;
X-CSE-ConnectionGUID: vBw33DWgR82gG3MKUFIQvw==
X-CSE-MsgGUID: CS26qIouQ3KYIrLMFElZ4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="29568673"
X-IronPort-AV: E=Sophos;i="6.11,237,1725346800"; 
   d="scan'208";a="29568673"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 16:24:00 -0700
X-CSE-ConnectionGUID: 3r5cS/oSQqaEbMaeXkkXvA==
X-CSE-MsgGUID: kJJFaj6XTSGxyPDvOTY8Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,237,1725346800"; 
   d="scan'208";a="81349998"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 27 Oct 2024 16:23:58 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5Cc0-000b4g-0I;
	Sun, 27 Oct 2024 23:23:56 +0000
Date: Mon, 28 Oct 2024 07:23:41 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yuchen Tang <tangyuchen5@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2528/15331] fs/proc/etmem_scan.c:1261:45:
 warning: suggest braces around empty body in an 'else' statement
Message-ID: <202410280704.1qI2EjWL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   9d0af12b79bee784902822ddeec2e1a8cfc18524
commit: 5d3b64fd78b80ec49285f2186e7b5ac5850f76e4 [2528/15331] etmem: add etmem scan feature
config: arm64-randconfig-003-20241027 (https://download.01.org/0day-ci/archive/20241028/202410280704.1qI2EjWL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241028/202410280704.1qI2EjWL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410280704.1qI2EjWL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/proc/etmem_scan.c: In function 'mm_idle_walk_range':
   fs/proc/etmem_scan.c:1258:61: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
    1258 |                                          pic->next_hva, end);
         |                                                             ^
>> fs/proc/etmem_scan.c:1261:45: warning: suggest braces around empty body in an 'else' statement [-Wempty-body]
    1261 |                 debug_printk("nothing read");
         |                                             ^


vim +/else +1261 fs/proc/etmem_scan.c

  1216	
  1217	static int mm_idle_walk_range(struct page_idle_ctrl *pic,
  1218					  unsigned long start,
  1219					  unsigned long end,
  1220					  struct mm_walk *walk)
  1221	{
  1222		struct vm_area_struct *vma;
  1223		int ret = 0;
  1224	
  1225		ret = init_page_idle_ctrl_buffer(pic);
  1226		if (ret)
  1227			return ret;
  1228	
  1229		for (; start < end;) {
  1230			mmap_read_lock(walk->mm);
  1231			vma = find_vma(walk->mm, start);
  1232			if (vma) {
  1233				if (end > vma->vm_start) {
  1234					local_irq_disable();
  1235					ret = walk_page_range(walk->mm, start, end,
  1236							walk->ops, walk->private);
  1237					local_irq_enable();
  1238				} else
  1239					set_restart_gpa(vma->vm_start, "VMA-HOLE");
  1240			} else
  1241				set_restart_gpa(TASK_SIZE, "EOF");
  1242			mmap_read_unlock(walk->mm);
  1243			WARN_ONCE(pic->gpa_to_hva, "non-zero gpa_to_hva");
  1244			if (ret != PAGE_IDLE_KBUF_FULL && end > pic->restart_gpa)
  1245				pic->restart_gpa = end;
  1246			start = pic->restart_gpa;
  1247			ret = page_idle_copy_user(pic, start, end);
  1248			if (ret)
  1249				break;
  1250		}
  1251	
  1252		if (start > pic->next_hva)
  1253			set_next_hva(start, "NEXT-START");
  1254	
  1255		if (pic->bytes_copied) {
  1256			if (ret != PAGE_IDLE_BUF_FULL && pic->next_hva < end)
  1257				debug_printk("partial scan: next_hva=%pK end=%pK\n",
> 1258						 pic->next_hva, end);
  1259			ret = 0;
  1260		} else
> 1261			debug_printk("nothing read");
  1262		return ret;
  1263	}
  1264	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
