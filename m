Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B56317FF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Feb 2023 07:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677311246; x=1708847246;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LajkxKD52UDYCPlURmj9aABx66ZNJ0EofhdLtaFwvqA=;
  b=FSPFvY16PtUdoLZiT/Bp+0q8MyhKWUh4GQqNbbmnEEhb82UCKLJX0yGA
   YTplvfRrnx4j/qcxLietu4qOfF0a7t3q75sYDQLDGR9OEUo2MTYOwjNUu
   DltmjhtHvPiFzLZ4ueHBWnxHpaKHnbmGjo2AoQYes8WxW6Ko7RXNS3kaZ
   mUJI8F59PA3F8x2R+DykAYUwayjvDBQtCWRU3xAQQMZTTxXlM32mAFd6i
   fQjkP/gOQTGGKxgl9VOXXDApWMLniOCLu6MSwdHX1Vs7fibHF0Lp6xHR1
   bKe2i0BFw6AtvsR065Mc++/wCVIHRr4MBV9IDcb+vqulg7Y1nEw3GHSw+
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="313279024"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="313279024"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 23:47:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="673144660"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="673144660"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 24 Feb 2023 23:47:22 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVpH7-00032G-3A;
	Sat, 25 Feb 2023 07:47:21 +0000
Date: Sat, 25 Feb 2023 15:47:07 +0800
From: kernel test robot <lkp@intel.com>
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 76/76] introduce SSDFS file system
Message-ID: <202302251513.sYhK90z5-lkp@intel.com>
References: <20230225010927.813929-77-slava@dubeyko.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230225010927.813929-77-slava@dubeyko.com>

Hi Viacheslav,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on linus/master]
[also build test ERROR on v6.2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Viacheslav-Dubeyko/ssdfs-introduce-SSDFS-on-disk-layout/20230225-092342
patch link:    https://lore.kernel.org/r/20230225010927.813929-77-slava%40dubeyko.com
patch subject: [RFC PATCH 76/76] introduce SSDFS file system
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230225/202302251513.sYhK90z5-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/4ed2db3c5668303523fa05657971eae13929a755
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Viacheslav-Dubeyko/ssdfs-introduce-SSDFS-on-disk-layout/20230225-092342
        git checkout 4ed2db3c5668303523fa05657971eae13929a755
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash M=fs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302251513.sYhK90z5-lkp@intel.com/

All errors (new ones prefixed by >>):

   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/page_vector.o] Error 1
   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/recovery_fast_search.o] Error 1
   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/recovery.o] Error 1
   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/dynamic_array.o] Error 1
   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/recovery_thread.o] Error 1
   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/volume_header.o] Error 1
   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/options.o] Error 1
   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/fs_error.o] Error 1
   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/super.o] Error 1
   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/log_footer.o] Error 1
   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/page_array.o] Error 1
   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/block_bitmap.o] Error 1
   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/recovery_slow_search.o] Error 1
   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/peb_block_bitmap.o] Error 1
   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/offset_translation_table.o] Error 1
   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/segment_block_bitmap.o] Error 1
   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/sequence_array.o] Error 1
   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/request_queue.o] Error 1
   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/peb.o] Error 1
   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/readwrite.o] Error 1
   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/peb_read_thread.o] Error 1
   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/peb_gc_thread.o] Error 1
   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/peb_container.o] Error 1
   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/peb_flush_thread.o] Error 1
   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/segment_tree.o] Error 1
   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/segment.o] Error 1
   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/segment_bitmap.o] Error 1
   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/current_segment.o] Error 1
   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/peb_mapping_queue.o] Error 1
   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/peb_mapping_table.o] Error 1
   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/peb_mapping_table_cache.o] Error 1
   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/peb_mapping_table_thread.o] Error 1
   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/peb_migration_scheme.o] Error 1
   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/btree_search.o] Error 1
   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/btree_node.o] Error 1
>> make[3]: *** No rule to make target 'fs/ssdfs/shared_extents_tree.o', needed by 'fs/ssdfs/ssdfs.o'.
>> make[3]: *** No rule to make target 'fs/ssdfs/shared_extents_tree_thread.o', needed by 'fs/ssdfs/ssdfs.o'.
   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/extents_queue.o] Error 1
   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/extents_tree.o] Error 1
>> make[3]: *** No rule to make target 'fs/ssdfs/shared_dictionary.o', needed by 'fs/ssdfs/ssdfs.o'.
>> make[3]: *** No rule to make target 'fs/ssdfs/shared_dictionary_thread.o', needed by 'fs/ssdfs/ssdfs.o'.
>> make[3]: *** No rule to make target 'fs/ssdfs/xattr_tree.o', needed by 'fs/ssdfs/ssdfs.o'.
>> make[3]: *** No rule to make target 'fs/ssdfs/snapshot_requests_queue.o', needed by 'fs/ssdfs/ssdfs.o'.
>> make[3]: *** No rule to make target 'fs/ssdfs/snapshot_rules.o', needed by 'fs/ssdfs/ssdfs.o'.
>> make[3]: *** No rule to make target 'fs/ssdfs/snapshot.o', needed by 'fs/ssdfs/ssdfs.o'.
>> make[3]: *** No rule to make target 'fs/ssdfs/snapshots_tree.o', needed by 'fs/ssdfs/ssdfs.o'.
>> make[3]: *** No rule to make target 'fs/ssdfs/snapshots_tree_thread.o', needed by 'fs/ssdfs/ssdfs.o'.
   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/btree.o] Error 1
   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/btree_hierarchy.o] Error 1
   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/inodes_tree.o] Error 1
   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/invalidated_extents_tree.o] Error 1
   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/dentries_tree.o] Error 1
>> make[3]: *** No rule to make target 'fs/ssdfs/ioctl.o', needed by 'fs/ssdfs/ssdfs.o'.
>> make[3]: *** No rule to make target 'fs/ssdfs/sysfs.o', needed by 'fs/ssdfs/ssdfs.o'.
>> make[3]: *** No rule to make target 'fs/ssdfs/xattr.o', needed by 'fs/ssdfs/ssdfs.o'.
>> make[3]: *** No rule to make target 'fs/ssdfs/xattr_user.o', needed by 'fs/ssdfs/ssdfs.o'.
>> make[3]: *** No rule to make target 'fs/ssdfs/xattr_trusted.o', needed by 'fs/ssdfs/ssdfs.o'.
>> make[3]: *** No rule to make target 'fs/ssdfs/acl.o', needed by 'fs/ssdfs/ssdfs.o'.
>> make[3]: *** No rule to make target 'fs/ssdfs/xattr_security.o', needed by 'fs/ssdfs/ssdfs.o'.
   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/inode.o] Error 1
   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/dir.o] Error 1
   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/file.o] Error 1
   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/compression.o] Error 1
>> make[3]: *** No rule to make target 'fs/ssdfs/testing.o', needed by 'fs/ssdfs/ssdfs.o'.
>> make[3]: *** No rule to make target 'fs/ssdfs/diff_on_write.o', needed by 'fs/ssdfs/ssdfs.o'.
>> make[3]: *** No rule to make target 'fs/ssdfs/diff_on_write_metadata.o', needed by 'fs/ssdfs/ssdfs.o'.
   make[3]: *** No rule to make target 'fs/ssdfs/diff_on_write_user_data.o', needed by 'fs/ssdfs/ssdfs.o'.
   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/compr_zlib.o] Error 1
   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/compr_lzo.o] Error 1
   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/dev_zns.o] Error 1
   make[3]: *** [scripts/Makefile.build:252: fs/ssdfs/dev_bdev.o] Error 1
   make[3]: Target 'fs/ssdfs/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
