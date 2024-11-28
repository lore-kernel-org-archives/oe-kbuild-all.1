Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148173FD4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 19:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732821315; cv=none; b=YW28TTvR/Q6f0u1EgHvaC2alhll9HoXoG0UObJJ0zHZ1mwFuaajS2baI96PF5eiPVQg4hQygO6IpWOcRFE5E5iX6MTk585b8qoVx3mbdgFSe4JFnF0/cVoS4bIpiJuEFrmetjnzY8JTH2uxQZ6dLb8erASZpGTvvPHInMLIAtwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732821315; c=relaxed/simple;
	bh=9kX8O+jjck4eC7wolrjmSglhoehHP3ic/fiTd6c8jtU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CehtDveM/YckXk2ATbHl2p6vXmhapg6yxgrc3vODRPjvROwRglOHgnsYcQY+mKa9M3sqCfb7nUiYbBsXf4PP4ziWcf0uybeYnYCK+9wY1KG6dwFGkq85WUDDE1OcF4EKU1GfuPAuuerNwy13RNCFhVvpM0jQsCQfOtT6hx/H7dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A6Zg8oat; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A6Zg8oat"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732821313; x=1764357313;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9kX8O+jjck4eC7wolrjmSglhoehHP3ic/fiTd6c8jtU=;
  b=A6Zg8oatMZVhpKOPpBjvsfzry+HnSLoFXwlaZGmKulgR8EQh11Gghvjd
   /hjTOXGjLxikS96k4RqIDus3zkP1p5HCxzvElLfYf2C2elaTsCJv6fQvG
   llaGtFDIuQ7ZcTeSVX/grV652dVS8o4R7fQGoNUk96XA8vV5PjUOYcNH1
   wzQSj/cmnTb0WYaalC6ngjnwgtHuDE3A+0FZj/k5tC4OtXj5Xf5a6ipCr
   wwMrqmLkIAJ5ZoiMhtYn3xOkgGfJl5rLlQEA+Qy7gq2wD09WVqv7qn7iF
   jdS68XUt/qjf5d0yiPC0tukN9WVqq21rb3CszPsOiXbXKr8CbDennfpBO
   g==;
X-CSE-ConnectionGUID: rfofvWPASU2gJj35B5iYfQ==
X-CSE-MsgGUID: 9BX4AtkaR6O/jE3l/WHG6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33004673"
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="33004673"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 11:15:12 -0800
X-CSE-ConnectionGUID: 8arLlV2zTQm2HxdQ2KwqDg==
X-CSE-MsgGUID: ns0DslutR4m6iiZZaez5hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="97066475"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Nov 2024 11:15:11 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGjyn-0009w3-0x;
	Thu, 28 Nov 2024 19:15:09 +0000
Date: Fri, 29 Nov 2024 03:15:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yuchen Tang <tangyuchen5@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1559/1559] fs/proc/etmem_scan.c:1261:45: warning:
 suggest braces around empty body in an 'else' statement
Message-ID: <202411290357.Wpqw01PB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yuchen,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   95bc69473a373c2e578d4fc39734e5811a03ead3
commit: 5d3b64fd78b80ec49285f2186e7b5ac5850f76e4 [1559/1559] etmem: add etmem scan feature
config: arm64-randconfig-004-20241129 (https://download.01.org/0day-ci/archive/20241129/202411290357.Wpqw01PB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411290357.Wpqw01PB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411290357.Wpqw01PB-lkp@intel.com/

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
  1258						 pic->next_hva, end);
  1259			ret = 0;
  1260		} else
> 1261			debug_printk("nothing read");
  1262		return ret;
  1263	}
  1264	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
