Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D955388
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Apr 2023 09:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681203607; x=1712739607;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cDo0eBs5TO3rBICtrl8mZxRSuxs7bokyuNyYumY1dz4=;
  b=nuS8mc+yNx8mq4FxqJ5Fnbzd3xRHDpTRBN5UtGUXOzVAIe6XuP4D9NyI
   +3gqwBNE3dnVyTcOeIZmoYMONB60s8d17az1vIkMEGvy16VakiIO+5aE3
   8ECi+ryV9L0JwOEK+zxyQQAXE2Zdhrn80i1qnBWtpblBA4RnQTM9e9u2G
   fqZRgB2LyC7hM9m1W03apAeEr7tCLMGeoZzpe4YjcC3ejMUVDGt5CORLQ
   oAjOg1k7A/YrClVhUf68zCXFq4/9bRtn3jfNRv/ZuxskRdMqEo77oZyaI
   VNY/eMl5TGEswrpCqYOl9gMgj9MbzFSjxToHUCvBpXtcEFz6MevIsl57X
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="323923588"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="323923588"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 02:00:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="1018299400"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="1018299400"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 11 Apr 2023 02:00:04 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pm9r8-000WA1-25;
	Tue, 11 Apr 2023 09:00:02 +0000
Date: Tue, 11 Apr 2023 16:59:40 +0800
From: kernel test robot <lkp@intel.com>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFCv2 8/8] ext2: Add direct-io trace points
Message-ID: <202304111652.wsP3dMR0-lkp@intel.com>
References: <f9825fab612761bee205046ce6e6e4caf25642ee.1681188927.git.ritesh.list@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9825fab612761bee205046ce6e6e4caf25642ee.1681188927.git.ritesh.list@gmail.com>

Hi Ritesh,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tytso-ext4/dev]
[also build test ERROR on xfs-linux/for-next jack-fs/for_next linus/master v6.3-rc6 next-20230406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ritesh-Harjani-IBM/ext2-dax-Fix-ext2_setsize-when-len-is-page-aligned/20230411-132421
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
patch link:    https://lore.kernel.org/r/f9825fab612761bee205046ce6e6e4caf25642ee.1681188927.git.ritesh.list%40gmail.com
patch subject: [RFCv2 8/8] ext2: Add direct-io trace points
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230411/202304111652.wsP3dMR0-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/4fff7c561c76e8ee730b2b5ec288aeeb65ca449d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ritesh-Harjani-IBM/ext2-dax-Fix-ext2_setsize-when-len-is-page-aligned/20230411-132421
        git checkout 4fff7c561c76e8ee730b2b5ec288aeeb65ca449d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash fs/ext2/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304111652.wsP3dMR0-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:102,
                    from fs/ext2/trace.h:61,
                    from fs/ext2/trace.c:5:
   fs/ext2/./trace.h: In function 'trace_raw_output_ext2_dio_class':
>> fs/ext2/./trace.h:34:19: warning: format '%ld' expects argument of type 'long int', but argument 8 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
      34 |         TP_printk("dev %d:%d ino 0x%lx isize 0x%llx pos 0x%llx count %ld flags %s aio %d ret=%d",
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     203 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   fs/ext2/./trace.h:34:9: note: in expansion of macro 'TP_printk'
      34 |         TP_printk("dev %d:%d ino 0x%lx isize 0x%llx pos 0x%llx count %ld flags %s aio %d ret=%d",
         |         ^~~~~~~~~
   In file included from include/trace/trace_events.h:237:
   fs/ext2/./trace.h:34:72: note: format string is defined here
      34 |         TP_printk("dev %d:%d ino 0x%lx isize 0x%llx pos 0x%llx count %ld flags %s aio %d ret=%d",
         |                                                                      ~~^
         |                                                                        |
         |                                                                        long int
         |                                                                      %d
   fs/ext2/./trace.h: In function 'trace_event_raw_event_ext2_dio_class':
>> fs/ext2/./trace.h:29:41: error: implicit declaration of function 'iov_iter_count' [-Werror=implicit-function-declaration]
      29 |                 __entry->count = iter ? iov_iter_count(iter) : ret;
         |                                         ^~~~~~~~~~~~~~
   include/trace/trace_events.h:402:11: note: in definition of macro 'DECLARE_EVENT_CLASS'
     402 |         { assign; }                                                     \
         |           ^~~~~~
   fs/ext2/./trace.h:24:9: note: in expansion of macro 'TP_fast_assign'
      24 |         TP_fast_assign(
         |         ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/iov_iter_count +29 fs/ext2/./trace.h

    10	
    11	DECLARE_EVENT_CLASS(ext2_dio_class,
    12		TP_PROTO(struct kiocb *iocb, struct iov_iter *iter, int ret),
    13		TP_ARGS(iocb, iter, ret),
    14		TP_STRUCT__entry(
    15			__field(dev_t,	dev)
    16			__field(ino_t,	ino)
    17			__field(loff_t, isize)
    18			__field(loff_t, pos)
    19			__field(size_t,	count)
    20			__field(int,	ki_flags)
    21			__field(int,	aio)
    22			__field(int,	ret)
    23		),
    24		TP_fast_assign(
    25			__entry->dev = file_inode(iocb->ki_filp)->i_sb->s_dev;
    26			__entry->ino = file_inode(iocb->ki_filp)->i_ino;
    27			__entry->isize = file_inode(iocb->ki_filp)->i_size;
    28			__entry->pos = iocb->ki_pos;
  > 29			__entry->count = iter ? iov_iter_count(iter) : ret;
    30			__entry->ki_flags = iocb->ki_flags;
    31			__entry->aio = !is_sync_kiocb(iocb);
    32			__entry->ret = iter ? ret : 0;
    33		),
  > 34		TP_printk("dev %d:%d ino 0x%lx isize 0x%llx pos 0x%llx count %ld flags %s aio %d ret=%d",
    35			  MAJOR(__entry->dev), MINOR(__entry->dev),
    36			  __entry->ino,
    37			  __entry->isize,
    38			  __entry->pos,
    39			  __entry->count,
    40			  __print_flags(__entry->ki_flags, "|", IOCB_STRINGS),
    41			  __entry->aio,
    42			  __entry->ret)
    43	)
    44	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
