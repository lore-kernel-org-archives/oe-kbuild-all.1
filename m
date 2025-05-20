Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B261F4E3B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 May 2025 00:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747701692; cv=none; b=bJ6If5VhcxN5GvMoeQdLIHzk2Lba26EZFQVyk3sa1fJIIJTzOVl/EgJpe/iCBxhulOTvA/b6xH1AUWefHg08Sd83MIgv0lW/OcyxYH5js85JkHBt+kURfRl6kyk0ZT2Iz++nTytpoi0BMO6g6SvRct2ctX2roMveV5shiht3CGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747701692; c=relaxed/simple;
	bh=FzOTZdcsImquz2gKLiBuIlF25lMTszeMAwpfSzVmB+w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dqp/F4xEsLfq4KIpWwhrr6PG6WmqPq+FuhvyUervXHhECtUCSAUYZ+w8kZL8Qf465UGypEFR8khPVRtGmd3e0I+/vmp+3X9QnllsLHPV1lR/IkephbzI3KubmdpPJ9sZoZYklA7wc4FkNVgkebcGpgE88wZj43zIAG0sA9NW/n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FL28iiWy; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FL28iiWy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747701690; x=1779237690;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FzOTZdcsImquz2gKLiBuIlF25lMTszeMAwpfSzVmB+w=;
  b=FL28iiWyia9MI9HST+uFBhX0je2eVImhONkALOAmeuBV5F9tYhDmBP7L
   ShLpSqug1MQPXwCUFDoS40S3BKr1RZ+Ww7u60w3rNPilmp7UTATxIXzUV
   O3V7kFLe4QscrBqf/x44SWkDfw+SD6omS4sAg6s2mTaEQdMU4pbSYjzNh
   Z4E8C6MC4VsV12rjQaDxFGX9jFhfeLZiJZrVunIwkpGLxQj5iXsk6aeSH
   MMY828hMwMRsNsuf97oLQBQrMyBL422LsHIAqjG1g9nSm5JliTVN8s8lG
   YCi5fgMnvJt9yvyCJpgboQCsbFjlFPe1NSGraSzMJVyHG9yEXZMFjSef2
   A==;
X-CSE-ConnectionGUID: 8L0Sy0MSRyqHwg+kgCNG4A==
X-CSE-MsgGUID: 9VhXyadSTEyMEMwJK2eihA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="52249535"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="52249535"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 17:41:29 -0700
X-CSE-ConnectionGUID: 9QP2Y58WSS6bSzzl1xiYXw==
X-CSE-MsgGUID: RPexlzbqTQe8SwBSnkb3NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="144520503"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 19 May 2025 17:41:28 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHB2r-000M1W-22;
	Tue, 20 May 2025 00:41:25 +0000
Date: Tue, 20 May 2025 08:40:47 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 11/11] fs/erofs/data.c:37:7: warning:
 no previous prototype for function '__erofs_bread'
Message-ID: <202505200829.8E4i5RG7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   6bec8a39b9738b7a22c1f607634a05ba0986225a
commit: 37bc6e053254d5fb801367126b6bcc382f63a47e [11/11] anolis: erofs: support passing in struct file * for FUSE
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250520/202505200829.8E4i5RG7-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250520/202505200829.8E4i5RG7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505200829.8E4i5RG7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/erofs/data.c:37:7: warning: no previous prototype for function '__erofs_bread' [-Wmissing-prototypes]
      37 | void *__erofs_bread(struct super_block *sb, struct erofs_buf *buf,
         |       ^
   fs/erofs/data.c:37:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      37 | void *__erofs_bread(struct super_block *sb, struct erofs_buf *buf,
         | ^
         | static 
   fs/erofs/data.c:100:5: warning: no previous prototype for function 'erofs_map_blocks_flatmode' [-Wmissing-prototypes]
     100 | int erofs_map_blocks_flatmode(struct inode *inode, struct erofs_map_blocks *map)
         |     ^
   fs/erofs/data.c:100:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     100 | int erofs_map_blocks_flatmode(struct inode *inode, struct erofs_map_blocks *map)
         | ^
         | static 
   2 warnings generated.


vim +/__erofs_bread +37 fs/erofs/data.c

    32	
    33	/*
    34	 * Derive the block size from inode->i_blkbits to make compatible with
    35	 * anonymous inode in fscache mode.
    36	 */
  > 37	void *__erofs_bread(struct super_block *sb, struct erofs_buf *buf,
    38			    struct inode *inode, erofs_blk_t blkaddr,
    39			    enum erofs_kmap_type type)
    40	{
    41		erofs_off_t offset = (erofs_off_t)blkaddr << inode->i_blkbits;
    42		struct address_space *const mapping = inode->i_mapping;
    43		pgoff_t index = offset >> PAGE_SHIFT;
    44		struct page *page = buf->page;
    45	
    46		if (!page || page->index != index) {
    47			erofs_put_metabuf(buf);
    48			if (EROFS_SB(sb)->bootstrap) {
    49				unsigned int nofs_flag;
    50	
    51				nofs_flag = memalloc_nofs_save();
    52				page = read_cache_page(mapping, index,
    53						       (filler_t *)mapping->a_ops->readpage,
    54						       EROFS_SB(sb)->bootstrap);
    55				memalloc_nofs_restore(nofs_flag);
    56			} else {
    57				page = read_cache_page_gfp(mapping, index,
    58					   mapping_gfp_constraint(mapping, ~__GFP_FS));
    59			}
    60			if (IS_ERR(page))
    61				return page;
    62			/* should already be PageUptodate, no need to lock page */
    63			buf->page = page;
    64		}
    65		if (buf->kmap_type == EROFS_NO_KMAP) {
    66			if (type == EROFS_KMAP)
    67				buf->base = kmap(page);
    68			else if (type == EROFS_KMAP_ATOMIC)
    69				buf->base = kmap_atomic(page);
    70			buf->kmap_type = type;
    71		} else if (buf->kmap_type != type) {
    72			DBG_BUGON(1);
    73			return ERR_PTR(-EFAULT);
    74		}
    75		if (type == EROFS_NO_KMAP)
    76			return NULL;
    77		return buf->base + (offset & ~PAGE_MASK);
    78	}
    79	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
