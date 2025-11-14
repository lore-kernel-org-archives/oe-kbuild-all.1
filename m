Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FDF30AAC1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Nov 2025 10:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763116289; cv=none; b=B5HfArLXZ3WqY9hxTGeUtOg9G8muXh/7W/xRte6exzCxS7R1k/IVoyABeiYFY2mwVouRQeOHDvG8dSuNtCErGPsjX+WtziuGIyxjv1WlJ2oUBuBfCGe0hDTYOyB+MDFfDMSNneTaxgn601j5oFnzf/1eBPPBPedgEHc+UHDh6VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763116289; c=relaxed/simple;
	bh=WhGBgjP1CIm0MDBxFVi1oik+AV4Ji9B91X0E8K/EKfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c322rqTa9i1ICArP2RDVCnuV+lalBErSVa2A1bIW4DeckFb4JJbuQG7RMdCWxUsvEh0vaj1Bb1nJN+shD7gUySht0QWADg+fBq6urRMbLRVZgswXLxMqzOkPaQEDFESabeNt1TQfkgkpPXgeJxoMIrNrYloyL/XCTJ2HfIX/IZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Svfj2bBH; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Svfj2bBH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763116287; x=1794652287;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WhGBgjP1CIm0MDBxFVi1oik+AV4Ji9B91X0E8K/EKfk=;
  b=Svfj2bBHYWVAh95S2yO9UU9aGEmIWgVnE1iLm9tS0o5V7LjSZ7b/DN9D
   tIzw/klsd9S9mJLyo+jysz6G0hDLdae7mTfNYbPqfUWd52zccuB4DUxyH
   UtILBFScVZ5lFCxzSjgUM/NGa89pBsXrMplP98nAmcPjn6ukXDz10M00v
   9TbO1x0DCfNLutRGlirBVVLcQ6p5t/WhHSDL4ylqWDmFwQd6FPKXJOkhG
   19z5/La+InyKtoFebh190YmIgKtsqN9iH2pUID6fwsnnAkaXEoGnZegmq
   22s1jHi87uv7nQwlJPt3OqqvGy8lKfM7EYtlFRNlfbxtkMGaT9062tdn2
   w==;
X-CSE-ConnectionGUID: bAmZ0LsIRlWGfFhSyqKNjA==
X-CSE-MsgGUID: gqbK4dTvRUyGk9HmGoYtBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="76555077"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="76555077"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 02:31:23 -0800
X-CSE-ConnectionGUID: KmqffczBSIiH2i3Ex6HGNQ==
X-CSE-MsgGUID: V/Ph3mSfR0CawDaP3OmBEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="189577413"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Nov 2025 02:31:22 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJr5M-0006T9-0g;
	Fri, 14 Nov 2025 10:31:20 +0000
Date: Fri, 14 Nov 2025 18:31:10 +0800
From: kernel test robot <lkp@intel.com>
To: Jian Zhang <zhangjian.3032@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [[RFC PATCH]] jffs2: attempt to fix "Error garbage collecting
 node"
Message-ID: <202511141831.kAqiIqnm-lkp@intel.com>
References: <20251111145609.1917969-1-zhangjian.3032@bytedance.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111145609.1917969-1-zhangjian.3032@bytedance.com>

Hi Jian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on brauner-vfs/vfs.all]
[also build test ERROR on linus/master v6.18-rc5 next-20251114]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jian-Zhang/jffs2-attempt-to-fix-Error-garbage-collecting-node/20251111-230509
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20251111145609.1917969-1-zhangjian.3032%40bytedance.com
patch subject: [[RFC PATCH]] jffs2: attempt to fix "Error garbage collecting node"
config: s390-randconfig-001-20251114 (https://download.01.org/0day-ci/archive/20251114/202511141831.kAqiIqnm-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511141831.kAqiIqnm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511141831.kAqiIqnm-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/s390/include/asm/bug.h:69,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from arch/s390/include/asm/cmpxchg.h:11,
                    from arch/s390/include/asm/atomic.h:16,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/s390/include/asm/bitops.h:75,
                    from include/linux/bitops.h:67,
                    from include/linux/kernel.h:23,
                    from fs/jffs2/scan.c:14:
   fs/jffs2/scan.c: In function 'jffs2_pre_scan_eraseblock':
>> include/linux/kern_levels.h:5:18: warning: format '%d' expects a matching 'int' argument [-Wformat=]
    #define KERN_SOH "\001"  /* ASCII Start Of Header */
                     ^~~~~~
   include/linux/printk.h:484:11: note: in definition of macro 'printk_index_wrap'
      _p_func(_fmt, ##__VA_ARGS__);    \
              ^~~~
   include/linux/printk.h:565:2: note: in expansion of macro 'printk'
     printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   include/linux/kern_levels.h:12:22: note: in expansion of macro 'KERN_SOH'
    #define KERN_WARNING KERN_SOH "4" /* warning conditions */
                         ^~~~~~~~
   include/linux/printk.h:565:9: note: in expansion of macro 'KERN_WARNING'
     printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
            ^~~~~~~~~~~~
   fs/jffs2/debug.h:84:2: note: in expansion of macro 'pr_warn'
     pr_warn("warning: (%d) %s: " fmt,    \
     ^~~~~~~
   fs/jffs2/scan.c:587:4: note: in expansion of macro 'JFFS2_WARNING'
       JFFS2_WARNING("Erasing block at 0x%08x error_count %d due to pre-scan errors\n",
       ^~~~~~~~~~~~~
>> fs/jffs2/scan.c:600:60: error: passing argument 4 of 'jffs2_flash_direct_write' from incompatible pointer type [-Werror=incompatible-pointer-types]
       ret = jffs2_flash_direct_write(c, jeb->offset, buf_len, &retlen, buf);
                                                               ^~~~~~~
   In file included from fs/jffs2/nodelist.h:27,
                    from fs/jffs2/scan.c:21:
   fs/jffs2/os-linux.h:193:12: note: expected 'size_t *' {aka 'long unsigned int *'} but argument is of type 'uint32_t *' {aka 'unsigned int *'}
       size_t *retlen, const u_char *buf);
       ~~~~~~~~^~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/asm-generic/bug.h:22,
                    from arch/s390/include/asm/bug.h:69,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from arch/s390/include/asm/cmpxchg.h:11,
                    from arch/s390/include/asm/atomic.h:16,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/s390/include/asm/bitops.h:75,
                    from include/linux/bitops.h:67,
                    from include/linux/kernel.h:23,
                    from scan.c:14:
   scan.c: In function 'jffs2_pre_scan_eraseblock':
>> include/linux/kern_levels.h:5:18: warning: format '%d' expects a matching 'int' argument [-Wformat=]
    #define KERN_SOH "\001"  /* ASCII Start Of Header */
                     ^~~~~~
   include/linux/printk.h:484:11: note: in definition of macro 'printk_index_wrap'
      _p_func(_fmt, ##__VA_ARGS__);    \
              ^~~~
   include/linux/printk.h:565:2: note: in expansion of macro 'printk'
     printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   include/linux/kern_levels.h:12:22: note: in expansion of macro 'KERN_SOH'
    #define KERN_WARNING KERN_SOH "4" /* warning conditions */
                         ^~~~~~~~
   include/linux/printk.h:565:9: note: in expansion of macro 'KERN_WARNING'
     printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
            ^~~~~~~~~~~~
   debug.h:84:2: note: in expansion of macro 'pr_warn'
     pr_warn("warning: (%d) %s: " fmt,    \
     ^~~~~~~
   scan.c:587:4: note: in expansion of macro 'JFFS2_WARNING'
       JFFS2_WARNING("Erasing block at 0x%08x error_count %d due to pre-scan errors\n",
       ^~~~~~~~~~~~~
   scan.c:600:60: error: passing argument 4 of 'jffs2_flash_direct_write' from incompatible pointer type [-Werror=incompatible-pointer-types]
       ret = jffs2_flash_direct_write(c, jeb->offset, buf_len, &retlen, buf);
                                                               ^~~~~~~
   In file included from nodelist.h:27,
                    from scan.c:21:
   os-linux.h:193:12: note: expected 'size_t *' {aka 'long unsigned int *'} but argument is of type 'uint32_t *' {aka 'unsigned int *'}
       size_t *retlen, const u_char *buf);
       ~~~~~~~~^~~~~~
   cc1: some warnings being treated as errors


vim +/jffs2_flash_direct_write +600 fs/jffs2/scan.c

   455	
   456	static int jffs2_pre_scan_eraseblock(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb)
   457	{
   458		int ret;
   459		bool error_found = false;
   460		unsigned char *buf;
   461		uint32_t crc;
   462		struct jffs2_unknown_node *node;
   463		struct jffs2_raw_inode *ri;
   464		struct jffs2_raw_dirent *rd;
   465	
   466		uint32_t ofs = 0, buf_len = c->sector_size;
   467		uint32_t retlen;
   468	
   469		buf = kmalloc(buf_len, GFP_KERNEL);
   470		if (!buf) {
   471			JFFS2_WARNING("Unable to allocate scan buffer of size %u\n", buf_len);
   472			return -ENOMEM;
   473		}
   474	
   475		ret = jffs2_fill_scan_buf(c, buf, jeb->offset, buf_len);
   476		if (ret) {
   477			JFFS2_WARNING("Unable to read eraseblock at 0x%08x\n", jeb->offset);
   478			goto exit;
   479		}
   480	
   481		while (ofs < c->sector_size) {
   482			if (c->sector_size - ofs < sizeof(struct jffs2_unknown_node)) {
   483				/* Not enough space for a node header */
   484				break;
   485			}
   486	
   487			if (*(uint32_t *)(&buf[ofs]) == 0xffffffff) {
   488				/* Reached empty space */
   489				ofs += 4;
   490				continue;
   491			}
   492	
   493			node = (struct jffs2_unknown_node *)&buf[ofs];
   494			if (je16_to_cpu(node->magic) != JFFS2_MAGIC_BITMASK) {
   495				ofs += 4;
   496				continue;
   497			}
   498	
   499			if (jffs2_calc_node_hdr_crc(node) != je32_to_cpu(node->hdr_crc)) {
   500				JFFS2_WARNING("node header CRC failed at %#08x\n",
   501					      jeb->offset + ofs);
   502				ofs += 4;
   503				error_found = true;
   504				goto check;
   505			}
   506	
   507			if (!(je16_to_cpu(node->nodetype) & JFFS2_NODE_ACCURATE)) {
   508				/* This is an obsoleted node */
   509				ofs += PAD(je32_to_cpu(node->totlen));
   510				continue;
   511			}
   512	
   513			switch (je16_to_cpu(node->nodetype)) {
   514			case JFFS2_NODETYPE_INODE:
   515				if (c->sector_size - ofs < sizeof(struct jffs2_raw_inode)) {
   516					/* Not enough space for a full inode node */
   517					ofs += 4;
   518					goto check;
   519				}
   520	
   521				ri = (struct jffs2_raw_inode *)node;
   522				crc = crc32(0, ri, sizeof(*ri) - 8);
   523				if (crc != je32_to_cpu(ri->node_crc)) {
   524					JFFS2_WARNING("inode node CRC failed at %#08x, read=%#08x, calc=%#08x\n",
   525						      jeb->offset + ofs,
   526						      je32_to_cpu(ri->node_crc), crc);
   527					error_found = true;
   528					goto check;
   529				}
   530	
   531				if (je32_to_cpu(ri->dsize)) {
   532					crc = crc32(0, ri->data, je32_to_cpu(ri->csize));
   533					if (je32_to_cpu(ri->data_crc) != crc) {
   534						JFFS2_WARNING("Data CRC failed data node at 0x%08x: Read 0x%08x, calculated 0x%08x\n",
   535							ofs, je32_to_cpu(ri->data_crc), crc);
   536						error_found = true;
   537						goto check;
   538					}
   539				}
   540	
   541				ofs += PAD(je32_to_cpu(node->totlen));
   542				break;
   543			case JFFS2_NODETYPE_DIRENT:
   544				if (c->sector_size - ofs < sizeof(struct jffs2_raw_dirent)) {
   545					/* Not enough space for a full dirent node */
   546					ofs += 4;
   547					goto check;
   548				}
   549	
   550				rd = (struct jffs2_raw_dirent *)node;
   551				crc = crc32(0, rd, sizeof(*rd) - 8);
   552				if (je32_to_cpu(rd->node_crc) != crc) {
   553					JFFS2_WARNING("Node CRC failed dirent node at 0x%08x: Read 0x%08x, calculated 0x%08x\n",
   554						ofs, je32_to_cpu(rd->node_crc), crc);
   555					error_found = true;
   556					goto check;
   557				}
   558	
   559				if (strnlen(rd->name, rd->nsize) != rd->nsize) {
   560					JFFS2_WARNING("Name in dirent node at 0x%08x contains zeroes\n", ofs);
   561					error_found = true;
   562					break;
   563				}
   564	
   565				if (rd->nsize) {
   566					crc = crc32(0, rd->name, rd->nsize);
   567					if (je32_to_cpu(rd->name_crc) != crc) {
   568						JFFS2_WARNING("Name CRC failed dirent node at 0x%08x: Read 0x%08x, calculated 0x%08x\n",
   569							ofs, je32_to_cpu(rd->name_crc), crc);
   570						error_found = true;
   571						goto check;
   572					}
   573				}
   574	
   575				ofs += PAD(je32_to_cpu(node->totlen));
   576				break;
   577			default:
   578				ofs += PAD(je32_to_cpu(node->totlen));
   579				/* Other node types are not pre-checked */
   580				break;
   581			}
   582		}
   583	
   584	check:
   585		// find any error during pre-scan, if found, erase the block, and write back.
   586		if (error_found) {
   587				JFFS2_WARNING("Erasing block at 0x%08x error_count %d due to pre-scan errors\n",
   588					jeb->offset);
   589				struct erase_info instr;
   590	
   591				instr.addr = jeb->offset;
   592				instr.len = c->sector_size;
   593				ret = mtd_erase(c->mtd, &instr);
   594				if (ret) {
   595					JFFS2_ERROR("Erase at 0x%08x failed during pre-scan: errno %d\n",
   596						jeb->offset, ret);
   597					goto exit;
   598				}
   599	
 > 600				ret = jffs2_flash_direct_write(c, jeb->offset, buf_len, &retlen, buf);
   601				if (ret) {
   602					JFFS2_ERROR("Write back at 0x%08x failed during pre-scan: errno %d\n",
   603						jeb->offset, ret);
   604					goto exit;
   605				}
   606		}
   607	exit:
   608	
   609		kfree(buf);
   610		return ret;
   611	}
   612	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
