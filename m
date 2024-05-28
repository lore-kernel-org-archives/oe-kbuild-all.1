Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE5413AD3E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 May 2024 15:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716910276; cv=none; b=dPP9vp9wfzHtBfQ3BCrI4+pSLBXv7ZzodUGUEHfGOeQg/c/epVmmXs4xxKuR9Vlyvs9rn3yL3p4TyF9OZcn3cC3/yp4TO0tyvfAK9UmXbjztbLBkHVYUI6M6B32PCxV9LjiYMbgBkXnzlYayRt83k3ycbQfKw3i51VucXZ7yfV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716910276; c=relaxed/simple;
	bh=FwtuM1TFCelqwzt9iXjSqkehJYGOzFRnTcVItM8LDk4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hNS/rOkCxSKa7Rqf5L0cFpW84n8JguCcxIXqKdfQskk4enrIq9QwxcCpHTXpwrcRPzlTkYhN5dbMPNyWWyLIdPbrt/JdU7TY4kq3Bv2FlLu/Wxf8/Ju+6k5wm1okiva3wcLsOd5+6mtXMYxN3IGWzas6Yyj/qcoMx/p3SeBfE+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gQ4LXedf; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gQ4LXedf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716910274; x=1748446274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FwtuM1TFCelqwzt9iXjSqkehJYGOzFRnTcVItM8LDk4=;
  b=gQ4LXedfq4ATCF8zB10TkT65ScTnAiFlEXVj2ml5s0+/ethBd5igFe9R
   l4dZRhKVm/P+6jGOM7sMSIX9Lys1FPLvKMWhhbw0Ipgsxl2+txWixhdEo
   POXULxDa2RYNvZbTf2n1E/CFpqhPEe4vkVMUbJrg1rAxoHiOVuXvg15NL
   /cr5pumkKRxn1cVs1YBZmGNvaFLX85x5LH9wWXnSig7jbCKLL5lDOVUDr
   w5xTW0m5bbXyXXAuZlRLXTn1+FqUyLmAZaxqLJmb/MZjmj8tIwnZl7YyZ
   hM+MwXE2ETDOk4hXUS/nrG0wkhFZd1DQ1O1N2YcTk6NviZ6tMPj+Z6iC9
   A==;
X-CSE-ConnectionGUID: JZj0bHGmTU+qLvWYpKNJ1Q==
X-CSE-MsgGUID: WRmC8ZpRRSS9Vw3B3xG4vQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13034172"
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; 
   d="scan'208";a="13034172"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 08:31:13 -0700
X-CSE-ConnectionGUID: a4vzKj8jTOqW9VIbk6IQVQ==
X-CSE-MsgGUID: klZmLL5vQOeR47Bqigsm4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; 
   d="scan'208";a="35133142"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 28 May 2024 08:31:12 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sByn7-000CNb-2Z;
	Tue, 28 May 2024 15:31:09 +0000
Date: Tue, 28 May 2024 23:31:07 +0800
From: kernel test robot <lkp@intel.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 1549/2075] drivers/dma-buf/udmabuf.c:45:undefined
 reference to `vmf_insert_pfn'
Message-ID: <202405282308.UEzt6hqC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6dc544b66971c7f9909ff038b62149105272d26a
commit: f7254e043ff1cc9ff97b0de83bc23509c8be4b9c [1549/2075] udmabuf: use vmf_insert_pfn and VM_PFNMAP for handling mmap
config: sh-randconfig-r012-20230414 (https://download.01.org/0day-ci/archive/20240528/202405282308.UEzt6hqC-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240528/202405282308.UEzt6hqC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405282308.UEzt6hqC-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: drivers/dma-buf/udmabuf.o: in function `udmabuf_vm_fault':
>> drivers/dma-buf/udmabuf.c:45:(.text+0x140): undefined reference to `vmf_insert_pfn'


vim +45 drivers/dma-buf/udmabuf.c

fbb0de795078190 Gerd Hoffmann    2018-08-27  32  
300133d372b7b54 Souptick Joarder 2019-01-03  33  static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
fbb0de795078190 Gerd Hoffmann    2018-08-27  34  {
fbb0de795078190 Gerd Hoffmann    2018-08-27  35  	struct vm_area_struct *vma = vmf->vma;
fbb0de795078190 Gerd Hoffmann    2018-08-27  36  	struct udmabuf *ubuf = vma->vm_private_data;
05b252cccb2e5c3 Gerd Hoffmann    2022-06-20  37  	pgoff_t pgoff = vmf->pgoff;
f7254e043ff1cc9 Vivek Kasireddy  2024-04-10  38  	unsigned long pfn;
fbb0de795078190 Gerd Hoffmann    2018-08-27  39  
05b252cccb2e5c3 Gerd Hoffmann    2022-06-20  40  	if (pgoff >= ubuf->pagecount)
05b252cccb2e5c3 Gerd Hoffmann    2022-06-20  41  		return VM_FAULT_SIGBUS;
f7254e043ff1cc9 Vivek Kasireddy  2024-04-10  42  
f7254e043ff1cc9 Vivek Kasireddy  2024-04-10  43  	pfn = page_to_pfn(ubuf->pages[pgoff]);
f7254e043ff1cc9 Vivek Kasireddy  2024-04-10  44  	return vmf_insert_pfn(vma, vmf->address, pfn);
fbb0de795078190 Gerd Hoffmann    2018-08-27 @45  }
fbb0de795078190 Gerd Hoffmann    2018-08-27  46  

:::::: The code at line 45 was first introduced by commit
:::::: fbb0de795078190a9834b3409e4b009cfb18a6d4 Add udmabuf misc device

:::::: TO: Gerd Hoffmann <kraxel@redhat.com>
:::::: CC: Gerd Hoffmann <kraxel@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
