Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D1D23AE93
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Oct 2025 18:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760036250; cv=none; b=OR74CYiDABmsJSUHGj5EdI8k2msJCSILEg1qKszTkrCxCLAG1+xcVbdnrLGWPxbWH6TjG4ekbuqkDrOEcyPyiIni6Y/s0ebYapRE/YCG5KJW+4A9ybigT+4aCTPO/I7PBTx9fCiemOJEMhXHymJDzqkER7so+XccD4JNh4yfpDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760036250; c=relaxed/simple;
	bh=z/hRY5UwnUIsDZi/90Kdq5nMnoSNuUScfz8ZpHARnso=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O8Yr+OMRyt5qM+hTPX5YQ4P4ugWPOoynJQgBIST5UJYFL3BBQuElpec7SGtCwZeWx2MpoeZgCAxUoqftaEt2Pb5sgcI1t4AeQxKQdxFnXMDEK2/PJgY6NHY4Paf+by2rnhmGoZcEa6xUBqKwumiK9CIY59XT/X6e4JAhP8Ku77Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cdrWRhQo; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cdrWRhQo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760036249; x=1791572249;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z/hRY5UwnUIsDZi/90Kdq5nMnoSNuUScfz8ZpHARnso=;
  b=cdrWRhQod8yLrNUoL3WxuGGF2N05leLZ4YYDgSW8FpU9tpgVC/SKXR1a
   6JPZ4tOrrJ6V/1zWwdMi045VYB+pKH2DJPjQ+B6VqWzKXO+1RWsfYIVYW
   VY45ebvrPhOny7OgSSBVdfzsxSweuS4hU64PAmaKtOKNAdNGtpQJtMm/0
   Fp8D/gPFVExLd9sWexcyiwBlEoypQ1idFH3zJXzHATZ/CeXmbOUGWVkod
   70CEyaUAA+oU75JxKkDVWQIgqVjouYb6nNOWVm66NiPjVOdC2OlUYittA
   7DgEAbHv2BScSDMtFM32WfCklRgMYIs2Jbx64A5PrzVRhBCiuet578D4h
   A==;
X-CSE-ConnectionGUID: V6WzH9UESpqWMpXiBpODhQ==
X-CSE-MsgGUID: PYC1Is5qTZqPnzckj+FeaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="62141948"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="62141948"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 11:57:28 -0700
X-CSE-ConnectionGUID: XC5Hr1sWTx6A5PRYl6HCQw==
X-CSE-MsgGUID: fadd3hj/STqk1vY3UptDCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="186047590"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Oct 2025 11:57:26 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v6vpM-0001En-0E;
	Thu, 09 Oct 2025 18:57:24 +0000
Date: Fri, 10 Oct 2025 02:57:14 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <chao@kernel.org>
Subject: [chao:bugfix/common 7/8] fs/f2fs/gc.c:1272:17: warning: passing
 argument 1 of 'ERR_PTR' makes integer from pointer without a cast
Message-ID: <202510100226.wSzrD5pI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/common
head:   f413b3ee5d939ae78a851e6451d374f0d4772b15
commit: 61d4bb37555be9c60f096a988d05569095c789f3 [7/8] f2fs: use f2fs_filemap_get_folio() instead of f2fs_pagecache_get_page()
config: riscv-randconfig-002-20251010 (https://download.01.org/0day-ci/archive/20251010/202510100226.wSzrD5pI-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510100226.wSzrD5pI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510100226.wSzrD5pI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/f2fs/gc.c: In function 'ra_data_block':
>> fs/f2fs/gc.c:1272:17: warning: passing argument 1 of 'ERR_PTR' makes integer from pointer without a cast [-Wint-conversion]
    1272 |   err = ERR_PTR(efolio);
         |                 ^~~~~~
         |                 |
         |                 struct folio *
   In file included from include/linux/cleanup.h:6,
                    from include/linux/preempt.h:11,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:7,
                    from fs/f2fs/gc.c:8:
   include/linux/err.h:39:48: note: expected 'long int' but argument is of type 'struct folio *'
      39 | static inline void * __must_check ERR_PTR(long error)
         |                                           ~~~~~^~~~~
>> fs/f2fs/gc.c:1272:7: warning: assignment to 'int' from 'void *' makes integer from pointer without a cast [-Wint-conversion]
    1272 |   err = ERR_PTR(efolio);
         |       ^
   fs/f2fs/gc.c: In function 'move_data_block':
   fs/f2fs/gc.c:1414:17: warning: passing argument 1 of 'ERR_PTR' makes integer from pointer without a cast [-Wint-conversion]
    1414 |   err = ERR_PTR(efolio);
         |                 ^~~~~~
         |                 |
         |                 struct folio *
   In file included from include/linux/cleanup.h:6,
                    from include/linux/preempt.h:11,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:7,
                    from fs/f2fs/gc.c:8:
   include/linux/err.h:39:48: note: expected 'long int' but argument is of type 'struct folio *'
      39 | static inline void * __must_check ERR_PTR(long error)
         |                                           ~~~~~^~~~~
   fs/f2fs/gc.c:1414:7: warning: assignment to 'int' from 'void *' makes integer from pointer without a cast [-Wint-conversion]
    1414 |   err = ERR_PTR(efolio);
         |       ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARCH_HAS_ELF_CORE_EFLAGS
   Depends on [n]: BINFMT_ELF [=n] && ELF_CORE [=y]
   Selected by [y]:
   - RISCV [=y]


vim +/ERR_PTR +1272 fs/f2fs/gc.c

  1207	
  1208	static int ra_data_block(struct inode *inode, pgoff_t index)
  1209	{
  1210		struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
  1211		struct address_space *mapping = f2fs_is_cow_file(inode) ?
  1212					F2FS_I(inode)->atomic_inode->i_mapping : inode->i_mapping;
  1213		struct dnode_of_data dn;
  1214		struct folio *folio, *efolio;
  1215		struct f2fs_io_info fio = {
  1216			.sbi = sbi,
  1217			.ino = inode->i_ino,
  1218			.type = DATA,
  1219			.temp = COLD,
  1220			.op = REQ_OP_READ,
  1221			.op_flags = 0,
  1222			.encrypted_page = NULL,
  1223			.in_list = 0,
  1224		};
  1225		int err;
  1226	
  1227		folio = f2fs_grab_cache_folio(mapping, index, true);
  1228		if (IS_ERR(folio))
  1229			return PTR_ERR(folio);
  1230	
  1231		if (f2fs_lookup_read_extent_cache_block(inode, index,
  1232							&dn.data_blkaddr)) {
  1233			if (unlikely(!f2fs_is_valid_blkaddr(sbi, dn.data_blkaddr,
  1234							DATA_GENERIC_ENHANCE_READ))) {
  1235				err = -EFSCORRUPTED;
  1236				goto put_folio;
  1237			}
  1238			goto got_it;
  1239		}
  1240	
  1241		set_new_dnode(&dn, inode, NULL, NULL, 0);
  1242		err = f2fs_get_dnode_of_data(&dn, index, LOOKUP_NODE);
  1243		if (err)
  1244			goto put_folio;
  1245		f2fs_put_dnode(&dn);
  1246	
  1247		if (!__is_valid_data_blkaddr(dn.data_blkaddr)) {
  1248			err = -ENOENT;
  1249			goto put_folio;
  1250		}
  1251		if (unlikely(!f2fs_is_valid_blkaddr(sbi, dn.data_blkaddr,
  1252							DATA_GENERIC_ENHANCE))) {
  1253			err = -EFSCORRUPTED;
  1254			goto put_folio;
  1255		}
  1256	got_it:
  1257		/* read folio */
  1258		fio.folio = folio;
  1259		fio.new_blkaddr = fio.old_blkaddr = dn.data_blkaddr;
  1260	
  1261		/*
  1262		 * don't cache encrypted data into meta inode until previous dirty
  1263		 * data were writebacked to avoid racing between GC and flush.
  1264		 */
  1265		f2fs_folio_wait_writeback(folio, DATA, true, true);
  1266	
  1267		f2fs_wait_on_block_writeback(inode, dn.data_blkaddr);
  1268	
  1269		efolio = f2fs_filemap_get_folio(META_MAPPING(sbi), dn.data_blkaddr,
  1270						FGP_LOCK | FGP_CREAT, GFP_NOFS);
  1271		if (IS_ERR(efolio)) {
> 1272			err = ERR_PTR(efolio);
  1273			goto put_folio;
  1274		}
  1275	
  1276		fio.encrypted_page = &efolio->page;
  1277	
  1278		err = f2fs_submit_page_bio(&fio);
  1279		if (err)
  1280			goto put_encrypted_page;
  1281		f2fs_put_page(fio.encrypted_page, 0);
  1282		f2fs_folio_put(folio, true);
  1283	
  1284		f2fs_update_iostat(sbi, inode, FS_DATA_READ_IO, F2FS_BLKSIZE);
  1285		f2fs_update_iostat(sbi, NULL, FS_GDATA_READ_IO, F2FS_BLKSIZE);
  1286	
  1287		return 0;
  1288	put_encrypted_page:
  1289		f2fs_put_page(fio.encrypted_page, 1);
  1290	put_folio:
  1291		f2fs_folio_put(folio, true);
  1292		return err;
  1293	}
  1294	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
