Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837E363B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Mar 2023 04:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679112273; x=1710648273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mps8J5Ka0iPrd7rY1nDNY3+tb07JGzLIpe8We57NPk0=;
  b=n4dTdFXFCpQLPlz+jWKQs0aAn7cuiLQHspxZKqNK+GR/RfU4PciUg9lq
   C0kxrnZmUU48PlJCBbP+lKmS4NiT/zsqYF/x1eM2+1ghUX3QzpxKSAnOk
   by8ysZTVycL/V2VLc+vSyznTVQiWonmT1NkFUEO4BgUPLTKszOIrsKN9N
   2PFikVvvL0x077HRRKSJCo/0ibK+6Xm2YEjvW7E/V5hu64VBR11Tpy2qi
   0a3I/AVwq8OLM1kyDmF94ML1KYKdrzpk0hJV6cMojJidbx4iwYRHaT+YO
   6aaDxiT4lhxTI/7fbiGEFwB4DRoTgvJWx2vScCBHrSciRn5CAReZZ2Hm0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="335901113"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="335901113"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 21:04:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="712981673"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="712981673"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 17 Mar 2023 21:04:31 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdNny-0009nW-2i;
	Sat, 18 Mar 2023 04:04:30 +0000
Date: Sat, 18 Mar 2023 12:03:35 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-noreturn 27/39] fs/btrfs/tree-log.c:6216:23:
 warning: 'last_range_start' may be used uninitialized in this function
Message-ID: <202303181133.EDAXPMD0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-noreturn
head:   1a9145211975418e41e0dbe38726975a06f14b1d
commit: 420c3420d18ffbf0c08720f41f60987162846e9c [27/39] btrfs: Mark btrfs_assertfail() __noreturn
config: x86_64-randconfig-a003-20230313 (https://download.01.org/0day-ci/archive/20230318/202303181133.EDAXPMD0-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=420c3420d18ffbf0c08720f41f60987162846e9c
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe objtool-noreturn
        git checkout 420c3420d18ffbf0c08720f41f60987162846e9c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/btrfs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303181133.EDAXPMD0-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   fs/btrfs/tree-log.c: In function 'log_delayed_deletions_incremental.isra':
>> fs/btrfs/tree-log.c:6216:23: warning: 'last_range_start' may be used uninitialized in this function [-Wmaybe-uninitialized]
    6216 |                 ret = insert_dir_log_key(trans, log, path, key.objectid,
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    6217 |                                          first_dir_index, last_dir_index);
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/last_range_start +6216 fs/btrfs/tree-log.c

30b80f3ce0f9d5 Filipe Manana 2022-08-22  6157  
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6158  static int log_delayed_deletions_incremental(struct btrfs_trans_handle *trans,
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6159  					     struct btrfs_inode *inode,
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6160  					     struct btrfs_path *path,
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6161  					     const struct list_head *delayed_del_list,
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6162  					     struct btrfs_log_ctx *ctx)
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6163  {
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6164  	struct btrfs_root *log = inode->root->log_root;
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6165  	const struct btrfs_delayed_item *curr;
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6166  	u64 last_range_start;
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6167  	u64 last_range_end = 0;
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6168  	struct btrfs_key key;
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6169  
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6170  	key.objectid = btrfs_ino(inode);
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6171  	key.type = BTRFS_DIR_INDEX_KEY;
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6172  	curr = list_first_entry(delayed_del_list, struct btrfs_delayed_item,
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6173  				log_list);
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6174  
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6175  	while (!list_entry_is_head(curr, delayed_del_list, log_list)) {
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6176  		const struct btrfs_delayed_item *last = curr;
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6177  		u64 first_dir_index = curr->index;
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6178  		u64 last_dir_index;
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6179  		bool deleted_items = false;
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6180  		int ret;
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6181  
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6182  		key.offset = curr->index;
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6183  		ret = btrfs_search_slot(trans, log, &key, path, -1, 1);
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6184  		if (ret < 0) {
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6185  			return ret;
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6186  		} else if (ret == 0) {
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6187  			ret = batch_delete_dir_index_items(trans, inode, path, ctx,
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6188  							   delayed_del_list, curr,
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6189  							   &last);
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6190  			if (ret)
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6191  				return ret;
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6192  			deleted_items = true;
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6193  		}
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6194  
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6195  		btrfs_release_path(path);
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6196  
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6197  		/*
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6198  		 * If we deleted items from the leaf, it means we have a range
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6199  		 * item logging their range, so no need to add one or update an
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6200  		 * existing one. Otherwise we have to log a dir range item.
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6201  		 */
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6202  		if (deleted_items)
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6203  			goto next_batch;
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6204  
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6205  		last_dir_index = last->index;
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6206  		ASSERT(last_dir_index >= first_dir_index);
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6207  		/*
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6208  		 * If this range starts right after where the previous one ends,
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6209  		 * then we want to reuse the previous range item and change its
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6210  		 * end offset to the end of this range. This is just to minimize
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6211  		 * leaf space usage, by avoiding adding a new range item.
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6212  		 */
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6213  		if (last_range_end != 0 && first_dir_index == last_range_end + 1)
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6214  			first_dir_index = last_range_start;
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6215  
30b80f3ce0f9d5 Filipe Manana 2022-08-22 @6216  		ret = insert_dir_log_key(trans, log, path, key.objectid,
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6217  					 first_dir_index, last_dir_index);
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6218  		if (ret)
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6219  			return ret;
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6220  
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6221  		last_range_start = first_dir_index;
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6222  		last_range_end = last_dir_index;
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6223  next_batch:
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6224  		curr = list_next_entry(last, log_list);
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6225  	}
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6226  
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6227  	return 0;
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6228  }
30b80f3ce0f9d5 Filipe Manana 2022-08-22  6229  

:::::: The code at line 6216 was first introduced by commit
:::::: 30b80f3ce0f9d58ab8a2094922f3d54d2fd4f92e btrfs: use delayed items when logging a directory

:::::: TO: Filipe Manana <fdmanana@suse.com>
:::::: CC: David Sterba <dsterba@suse.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
