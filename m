Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EB27C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Mar 2023 09:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678266703; x=1709802703;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QAkCW9c0TjjtjLgELCOM1fqTGIy237JSXaQJdZjD0Nw=;
  b=OegSC5UXVeHmrJa6mMOyKP2w0aIkgLKFH8pzaxAXOEnmfgXA3X9xR/z7
   EYFYsccyq2PrMfuk+JsLgx1qWRdmw0DxMdY7lJ8fgPmhNF1gqYDTi/d6s
   WQ2bS4UvLeBqocXzBuMVJmlqS92udACwx1BcAPvYmogXAPbgDDcgSldEx
   KmLvQ3Vzz9+kgkdHnDGXUupWn7C8mfI7OPltCj9tUu0J1nqomvo9zSTbP
   UFImfM+fWMc+PrKKja2XKAYavZgpRjeTLpvEY7SPubHWdT02Hhq1eIQD8
   Cw+C2yBPMVWgtVZwKNX9LGaQO1ERh1ED3hyBGwI5fO69A3+LwwxpSwmMj
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="319937637"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; 
   d="scan'208";a="319937637"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 01:11:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="787046764"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; 
   d="scan'208";a="787046764"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 08 Mar 2023 01:11:41 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZppk-00020F-0a;
	Wed, 08 Mar 2023 09:11:40 +0000
Date: Wed, 8 Mar 2023 17:10:40 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Chinner <dchinner@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Luis Chamberlain <mcgrof@kernel.org>
Subject: [mcgrof:20230307-larger-bs-then-ps-xfs 7/11]
 fs/iomap/buffered-io.c:1424:22: warning: variable 'status' set but not used
Message-ID: <202303081740.RJYdJ9MG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git 20230307-larger-bs-then-ps-xfs
head:   e42ac7981c9cbcd80d1ffa2ad03c96574a320a62
commit: 89e0dbe34eb365d865a0b459668e5abe17cf95c8 [7/11] iomap: zero-around in iomap_page_mkwrite
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230308/202303081740.RJYdJ9MG-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/commit/?id=89e0dbe34eb365d865a0b459668e5abe17cf95c8
        git remote add mcgrof https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git
        git fetch --no-tags mcgrof 20230307-larger-bs-then-ps-xfs
        git checkout 89e0dbe34eb365d865a0b459668e5abe17cf95c8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash fs/iomap/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303081740.RJYdJ9MG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/iomap/buffered-io.c: In function 'iomap_folio_mkwrite_iter':
>> fs/iomap/buffered-io.c:1424:22: warning: variable 'status' set but not used [-Wunused-but-set-variable]
    1424 |                 long status;
         |                      ^~~~~~


vim +/status +1424 fs/iomap/buffered-io.c

  1411	
  1412	static loff_t iomap_folio_mkwrite_iter(struct iomap_iter *iter,
  1413			struct folio *folio, const struct iomap_ops *ops)
  1414	{
  1415		loff_t length = iomap_length(iter);
  1416		loff_t ret;
  1417	
  1418		/*
  1419		 * if we need to zero-around, we have to unlock the page we were given.
  1420		 * No big deal, we just have to repeat the "is this page ours" checks
  1421		 * after relocking it
  1422		 */
  1423		if (iomap_need_zero_around(iter)) {
> 1424			long status;
  1425			loff_t size;
  1426	
  1427			/*
  1428			 * This only happens for block size > page size, so the file
  1429			 * offset of a page fault should always be page aligned.
  1430			 */
  1431			WARN_ON(offset_in_folio(folio, iter->pos));
  1432	
  1433			folio_unlock(folio);
  1434			status = iomap_zero_around(iter, iter->pos, length, ops);
  1435			folio_lock(folio);
  1436			size = i_size_read(iter->inode);
  1437			if ((folio->mapping != iter->inode->i_mapping) ||
  1438			    (folio_pos(folio) > size)) {
  1439				/* We overload EFAULT to mean page got truncated */
  1440				return -EFAULT;
  1441			}
  1442	
  1443			if (folio_pos(folio) != iter->pos) {
  1444				/* it moved in the file! */
  1445				return -EFAULT;
  1446			}
  1447	
  1448			/* return failure now if zeroing had an error */
  1449			if (ret)
  1450				return ret;
  1451	
  1452			/* trim down the length is we straddle EOF. */
  1453			if (((folio->index + 1) << PAGE_SHIFT) > size)
  1454				length = offset_in_folio(folio, size);
  1455	
  1456		}
  1457	
  1458		if (iter->iomap.flags & IOMAP_F_BUFFER_HEAD) {
  1459			ret = __block_write_begin_int(folio, iter->pos, length, NULL,
  1460						      &iter->iomap);
  1461			if (ret)
  1462				return ret;
  1463			block_commit_write(&folio->page, 0, length);
  1464		} else {
  1465			WARN_ON_ONCE(!folio_test_uptodate(folio));
  1466			folio_mark_dirty(folio);
  1467		}
  1468	
  1469		return length;
  1470	}
  1471	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
