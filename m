Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28CF37A4BC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 07:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768376203; cv=none; b=DFCRdRy2a5p2p2ux+sERbKxUevQ+lqD6rSpVL1Vxx/jCNzPR4yocp/MI3/3Vixzrc/wA2iryKM6SG82BPUUj4Cep6dFcBW6ElLrzjBQBT7QLelhNKdcXileeUk1xX61dUhxeJXsUHvAV+zoPM0NyIYod5bfz5r2lxcKH31hMcDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768376203; c=relaxed/simple;
	bh=+Q/U2lj1GVhemCsmxbfbviVZmBO8wJr8vVWeLfcLj2o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K7BRlvvRG/YDO8VRWotlxOkw2jPWO7eQJDQrCp8TTFvlkitrW8oy9zfUEBFj/JBjqfW1Ti0pRERQdM/mqdFjQUp8q/fmMG5+fg7t2WVTRsaaRaf0xpgMehAwMmznbQ2ZHdE/c9TSJPR25ok01AHATq/SQM2RVvdWo70fmM9vHBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A8XWXyQj; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A8XWXyQj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768376197; x=1799912197;
  h=date:from:to:cc:subject:message-id;
  bh=+Q/U2lj1GVhemCsmxbfbviVZmBO8wJr8vVWeLfcLj2o=;
  b=A8XWXyQjlRjciLzWrMopCk3XxvrlDOSQ2lwsHS+z5cNks2mFbrPufpe8
   yB4J4Uh7Au26DKkX+Ko/upw1cKzS/9WnwJEdideMeN7CDgnz0iAlXA+8f
   JWz3idowNcG5OWjsfAzESQQySaVNEEN0W6OazVQLiTmh6pjAdLL1L1HVA
   FUZAET15F6dniXYoP+UuRLotEudNeKaivHZNBkUUgvAc09wrqt6JTYbpM
   MN1Ll0DKNIZNLR2uB+Hv5KQmDxUKnjxlQHZJF48qEiZ5V6l9CSFMPNUhC
   L3/hnutmLDxVOqu7A/n4bixHMoU3cWwiBPtgRYSjAL+mIoHgrJCVqQUWq
   w==;
X-CSE-ConnectionGUID: QFQOMYM3RVysugAoI4aAyw==
X-CSE-MsgGUID: 2MHi3zvoRcCJbNOIRbzlnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69727492"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="69727492"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 23:36:24 -0800
X-CSE-ConnectionGUID: 6bUAktpVS/25I5OC9l+jpg==
X-CSE-MsgGUID: SPmCu+thRIWjliYCkqF4OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="208761737"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Jan 2026 23:36:23 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfvQS-00000000G0U-22l8;
	Wed, 14 Jan 2026 07:36:20 +0000
Date: Wed, 14 Jan 2026 15:35:48 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-PMT-enhancement-ANBZ27534
 23/23] drivers/crypto/ccp/hygon/hct.c:1333:15: warning: no previous prototype
 for 'hct_pin_memory'
Message-ID: <202601141526.PHtZqm28-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Yabin,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-PMT-enhancement-ANBZ27534
head:   5be39e8fdc241e57f9813026ad199ad5add77ce7
commit: 43213bf1d133202454c0175eb17f6635626045dc [23/23] anolis: Add mediated ccp driver support for hygon crypto technology.
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20260114/202601141526.PHtZqm28-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601141526.PHtZqm28-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601141526.PHtZqm28-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/ccp/hygon/hct.c:1333:15: warning: no previous prototype for 'hct_pin_memory' [-Wmissing-prototypes]
    1333 | struct page **hct_pin_memory(struct hct_private *private, unsigned long uaddr,
         |               ^~~~~~~~~~~~~~
--
   drivers/crypto/ccp/hygon/hct.c:39: warning: Function parameter or member 'fmt' not described in 'pr_fmt'
>> drivers/crypto/ccp/hygon/hct.c:39: warning: expecting prototype for VERSION_STRING modification instructions(). Prototype was for pr_fmt() instead


vim +/hct_pin_memory +1333 drivers/crypto/ccp/hygon/hct.c

  1332	
> 1333	struct page **hct_pin_memory(struct hct_private *private, unsigned long uaddr,
  1334				unsigned long ulen, unsigned long *n)
  1335	{
  1336		unsigned long npages, size;
  1337		int npinned;
  1338		struct page **pages;
  1339		unsigned long first, last;
  1340	
  1341		if (ulen == 0 || uaddr + ulen < uaddr)
  1342			return NULL;
  1343	
  1344		first = (uaddr & PAGE_MASK) >> PAGE_SHIFT;
  1345		last = ((uaddr + ulen - 1) & PAGE_MASK) >> PAGE_SHIFT;
  1346		npages = (last - first + 1);
  1347	
  1348		if (WARN_ON_ONCE(npages > INT_MAX))
  1349			return NULL;
  1350	
  1351		size = npages * sizeof(struct page *);
  1352		if (size > PAGE_SIZE)
  1353			pages = vmalloc(size);
  1354		else
  1355			pages = kmalloc(size, GFP_KERNEL);
  1356	
  1357		if (!pages)
  1358			return NULL;
  1359	
  1360		/* Pin the user virtual address. */
  1361		npinned = pin_user_pages_fast(uaddr, npages, FOLL_WRITE, pages);
  1362		if (npinned != npages)
  1363			goto err;
  1364	
  1365		*n = npages;
  1366		return pages;
  1367	
  1368	err:
  1369		if (npinned > 0)
  1370			unpin_user_pages(pages, npinned);
  1371		kvfree(pages);
  1372		return NULL;
  1373	}
  1374	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
