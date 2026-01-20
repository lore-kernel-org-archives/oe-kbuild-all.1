Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1F83491F4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jan 2026 04:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768883448; cv=none; b=uq3Rug47/pqONVjgWCqwhURbZPx4wbpRIRproYVEmMwYgci+yARXp2rK8pPfF0riedNDobClnvEr15saVEEOAhlIQTuCJPPJEbGtIK0pX7LzSFtax86mpsEf1FrliuIXp8yfUmroEL5Bcu6juZ2JPOnv36fyWuEgX3Xn39Kzt5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768883448; c=relaxed/simple;
	bh=bnRrjS8L9XDHdJbNZcmXtK0C52oP4D5RBWCLxdbnX0A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qN32v/fRZT1Lll6iPDtQs37FDwaVC371+uyFM1avbQUTKYAjJ10omGUbGugUszbdVXFK2Hb9/D3QbaqD1j+unmzJicXCXscu8+42aZ6lb2RFZcDzNXDZLQeuDUemu+pupCs0rl3ltjVEpKZDwRCs6cXEQT6HxpF69D3lE/gAvqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BishuYzf; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BishuYzf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768883440; x=1800419440;
  h=date:from:to:cc:subject:message-id;
  bh=bnRrjS8L9XDHdJbNZcmXtK0C52oP4D5RBWCLxdbnX0A=;
  b=BishuYzfBME93nEqEJm4wvTiGcVh7gqdeNd+h44I29JTo0zFeb5vx0+E
   cpZA2q9Q71uwQqFSTF5JDlfEd56SGtNgQqXxRS0trcYYLyOAxdOD+hxga
   Cyz4s/F2nA/rin6xLqcpru0Y3ZPTbHIlcI+TNnS4qI0PCX5KI2Ex2i7Lc
   tquwml4nlalXDarVixV8VhKAZPBeXHqr1nhbXMcaWKaXeUE0Hzyp/L/+P
   vBrvP1+kIAxa9NicycLklMYz8VwcOZl0knPVl67QkDZ67VxU4m1sy5To/
   zFyK/LWQbU/7v3YgOCKoL+Lk0srMpvGh+DvNRTsI6cR/m4j7EWvf8Qkfg
   w==;
X-CSE-ConnectionGUID: NJbLNYShR0yJH3H5316V2A==
X-CSE-MsgGUID: zxOI8/60SLa8vdnd/s8DJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="87665237"
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; 
   d="scan'208";a="87665237"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 20:30:37 -0800
X-CSE-ConnectionGUID: Tp7iMNLSSKelQdRZ/sjSag==
X-CSE-MsgGUID: MfUQDXIxTPunFB4oteBn4A==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 19 Jan 2026 20:30:35 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vi3Nx-00000000OYb-1cIN;
	Tue, 20 Jan 2026 04:30:33 +0000
Date: Tue, 20 Jan 2026 12:30:12 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-new 417/421] fs/ext4/file.c:825:36: error:
 incompatible type for argument 1 of 'daxdev_mapping_supported'
Message-ID: <202601201215.7iVpmWIM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Lorenzo,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   e4348a62bb1acacafcdeb149c9363291fae08c0c
commit: e3900da1b37f861133669d26ae02415f18fa71b9 [417/421] mm: update all remaining mmap_prepare users to use vma_flags_t
config: sparc-randconfig-002-20260120 (https://download.01.org/0day-ci/archive/20260120/202601201215.7iVpmWIM-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601201215.7iVpmWIM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601201215.7iVpmWIM-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/ext4/file.c: In function 'ext4_file_mmap_prepare':
>> fs/ext4/file.c:825:36: error: incompatible type for argument 1 of 'daxdev_mapping_supported'
     if (!daxdev_mapping_supported(desc->vma_flags, file_inode(file), dax_dev))
                                   ~~~~^~~~~~~~~~~
   In file included from fs/ext4/file.c:27:
   include/linux/dax.h:114:56: note: expected 'vm_flags_t' {aka 'long unsigned int'} but argument is of type 'vma_flags_t' {aka 'struct <anonymous>'}
    static inline bool daxdev_mapping_supported(vm_flags_t vm_flags,
                                                ~~~~~~~~~~~^~~~~~~~


vim +/daxdev_mapping_supported +825 fs/ext4/file.c

   806	
   807	static int ext4_file_mmap_prepare(struct vm_area_desc *desc)
   808	{
   809		int ret;
   810		struct file *file = desc->file;
   811		struct inode *inode = file->f_mapping->host;
   812		struct dax_device *dax_dev = EXT4_SB(inode->i_sb)->s_daxdev;
   813	
   814		if (file->f_mode & FMODE_WRITE)
   815			ret = ext4_emergency_state(inode->i_sb);
   816		else
   817			ret = ext4_forced_shutdown(inode->i_sb) ? -EIO : 0;
   818		if (unlikely(ret))
   819			return ret;
   820	
   821		/*
   822		 * We don't support synchronous mappings for non-DAX files and
   823		 * for DAX files if underneath dax_device is not synchronous.
   824		 */
 > 825		if (!daxdev_mapping_supported(desc->vma_flags, file_inode(file), dax_dev))
   826			return -EOPNOTSUPP;
   827	
   828		file_accessed(file);
   829		if (IS_DAX(file_inode(file))) {
   830			desc->vm_ops = &ext4_dax_vm_ops;
   831			vma_desc_set_flags(desc, VMA_HUGEPAGE_BIT);
   832		} else {
   833			desc->vm_ops = &ext4_file_vm_ops;
   834		}
   835		return 0;
   836	}
   837	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
