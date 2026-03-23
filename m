Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C1A3BF671
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Mar 2026 16:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774283272; cv=none; b=isCYpRayA5IC/M/IFjv8V0WyHuLYZagwn6XvJZs/kLNiX7xmyssLNjv3ujP/KwqlmUYN+uuc554wPyF6mEe7TDntryNPy8bHF8foknWj+RLrQQIDs1kg/XrlVcfA7MkZGupkJpaqpO1nVN+gNf0CEjDeu1TynAYdrd6ky8NrTd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774283272; c=relaxed/simple;
	bh=smtmbkNmbudNEnKAC6R5lH/1wLWlAZoqom797Z+27Fc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Nf/v3tGVTDvtPFV43I91QLXhAC7geW+BEfmB2lZK5Sopjw+7praztE8QnuoHEUcwa1nvoS+ZvGd6ezyacOpHZYM4nLgv+VGBjCP2IP/rtdx2b6PkpQ7EWjAt9+g49zpSIq9vsb2IhP9ojWdcobEHFA9qJR7Mt2z5e6a12uIhuVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D47ZojbL; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D47ZojbL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774283269; x=1805819269;
  h=date:from:to:cc:subject:message-id;
  bh=smtmbkNmbudNEnKAC6R5lH/1wLWlAZoqom797Z+27Fc=;
  b=D47ZojbLD6qo7hTRHI/My/qZSD9jJ21//jnRqvSk8c5zZgIZlGhC+Pse
   A5Dl7yFOLwxRI2opHVlAwqXRurBkUv4/fUga+lQpRemHWrJfMavLMp59C
   nKP0QWMrld15aphGM6lYDjXXMFdKRU85C1wnty2T52De/kYaQbfjSkaGl
   GVh0KydVZq/to0UAPCSmSHZStcsfWstxphGWVgkIBExm9enT5Xw/7XdKw
   8J3u/IdcqcwcWmZ+tnqyaopfN3sArILUBXf2AnxiR+kEMmIxan1oSNWqU
   abXtxwF1z/S+g9qUbXziwSo4xJGFnRsi/h03jQRhV/DMCwTjo9qOhMzIm
   g==;
X-CSE-ConnectionGUID: 37HMW0EGSjqbprJPucWWSQ==
X-CSE-MsgGUID: oBG/iY6WT+ObyyTm4sB10Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75174542"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="75174542"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 09:27:49 -0700
X-CSE-ConnectionGUID: A8Pv+UL2QGOCaWqxMBZrSA==
X-CSE-MsgGUID: yvIfxfrVRdO9oeWYjeQO8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="224042402"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 23 Mar 2026 09:27:47 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4i80-000000002KT-0nMB;
	Mon, 23 Mar 2026 16:27:44 +0000
Date: Tue, 24 Mar 2026 00:26:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 7/7]
 drivers/md/dm-bow.c:148:6: warning: no previous prototype for function
 'add_before'
Message-ID: <202603240038.WFGCL1BO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   744b8dcec1ed5c6c8f7fe7eb209c7b0d644dc30f
commit: e8944a38b46967c5dc658d0826779105562334bd [7/7] Revert "ANDROID: dm-bow: remove dm-bow"
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260324/202603240038.WFGCL1BO-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603240038.WFGCL1BO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603240038.WFGCL1BO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/md/dm-bow.c:97:10: warning: no previous prototype for function 'range_top' [-Wmissing-prototypes]
      97 | sector_t range_top(struct bow_range *br)
         |          ^
   drivers/md/dm-bow.c:97:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      97 | sector_t range_top(struct bow_range *br)
         | ^
         | static 
   drivers/md/dm-bow.c:103:5: warning: no previous prototype for function 'range_size' [-Wmissing-prototypes]
     103 | u64 range_size(struct bow_range *br)
         |     ^
   drivers/md/dm-bow.c:103:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     103 | u64 range_size(struct bow_range *br)
         | ^
         | static 
>> drivers/md/dm-bow.c:148:6: warning: no previous prototype for function 'add_before' [-Wmissing-prototypes]
     148 | void add_before(struct rb_root *ranges, struct bow_range *new_br,
         |      ^
   drivers/md/dm-bow.c:148:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     148 | void add_before(struct rb_root *ranges, struct bow_range *new_br,
         | ^
         | static 
   drivers/md/dm-bow.c:592:3: error: field designator 'default_attrs' does not refer to any field in type 'struct kobj_type'
     592 |         .default_attrs = bow_attrs,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-bow.c:712:6: error: no member named 'num_write_same_bios' in 'struct dm_target'; did you mean 'num_write_zeroes_bios'?
     712 |         ti->num_write_same_bios = 1;
         |             ^~~~~~~~~~~~~~~~~~~
         |             num_write_zeroes_bios
   include/linux/device-mapper.h:338:15: note: 'num_write_zeroes_bios' declared here
     338 |         unsigned int num_write_zeroes_bios;
         |                      ^
   drivers/md/dm-bow.c:749:19: error: too few arguments to function call, expected 7, have 6
     748 |         bc->bufio = dm_bufio_client_create(bc->dev->bdev, bc->block_size, 1, 0,
         |                     ~~~~~~~~~~~~~~~~~~~~~~
     749 |                                            NULL, NULL);
         |                                                      ^
   include/linux/dm-bufio.h:29:1: note: 'dm_bufio_client_create' declared here
      29 | dm_bufio_client_create(struct block_device *bdev, unsigned int block_size,
         | ^                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      30 |                        unsigned int reserved_buffers, unsigned int aux_size,
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      31 |                        void (*alloc_callback)(struct dm_buffer *),
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      32 |                        void (*write_callback)(struct dm_buffer *),
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      33 |                        unsigned int flags);
         |                        ~~~~~~~~~~~~~~~~~~
   drivers/md/dm-bow.c:1096:5: warning: no previous prototype for function 'remap_unless_illegal_trim' [-Wmissing-prototypes]
    1096 | int remap_unless_illegal_trim(struct bow_context *bc, struct bio *bio)
         |     ^
   drivers/md/dm-bow.c:1096:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1096 | int remap_unless_illegal_trim(struct bow_context *bc, struct bio *bio)
         | ^
         | static 
   drivers/md/dm-bow.c:1252:5: warning: no previous prototype for function 'dm_bow_prepare_ioctl' [-Wmissing-prototypes]
    1252 | int dm_bow_prepare_ioctl(struct dm_target *ti, struct block_device **bdev)
         |     ^
   drivers/md/dm-bow.c:1252:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1252 | int dm_bow_prepare_ioctl(struct dm_target *ti, struct block_device **bdev)
         | ^
         | static 
   drivers/md/dm-bow.c:1284:12: warning: no previous prototype for function 'dm_bow_init' [-Wmissing-prototypes]
    1284 | int __init dm_bow_init(void)
         |            ^
   drivers/md/dm-bow.c:1284:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1284 | int __init dm_bow_init(void)
         | ^
         | static 
   drivers/md/dm-bow.c:1293:6: warning: no previous prototype for function 'dm_bow_exit' [-Wmissing-prototypes]
    1293 | void dm_bow_exit(void)
         |      ^
   drivers/md/dm-bow.c:1293:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1293 | void dm_bow_exit(void)
         | ^
         | static 
   7 warnings and 3 errors generated.


vim +/add_before +148 drivers/md/dm-bow.c

   147	
 > 148	void add_before(struct rb_root *ranges, struct bow_range *new_br,
   149			struct bow_range *existing)
   150	{
   151		struct rb_node *parent = &(existing->node);
   152		struct rb_node **link = &(parent->rb_left);
   153	
   154		while (*link) {
   155			parent = *link;
   156			link = &((*link)->rb_right);
   157		}
   158	
   159		rb_link_node(&new_br->node, parent, link);
   160		rb_insert_color(&new_br->node, ranges);
   161	}
   162	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
