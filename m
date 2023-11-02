Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37DD1FA1
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Nov 2023 05:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SEFs5+ld"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698901252; x=1730437252;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YFJs9qrNhKA6a4/mRlt8scKh+HlJMhxOtr5AxHmK38E=;
  b=SEFs5+ldY3DUA2WSwIm7oc8/1x+xDBk32Ajbix0x9KGwG9maqJB284Nw
   Q7FRqpdGrQgSLYdlzjzVpvEiHlP39jl61J8VgGqTwYvHfGkLOICfYwMd7
   XsRyn6QJKaT+aHikbmxtf3XrTbeqRc7k6cWO9K5uMgdyigbG1+Xp7FLhu
   MqxeG3dQ1ResnWHbX0XwO8LfheL/M3P1aFbBkJkRxilyuGjzY4oNFX8l/
   t6XItF8AfM+OKgZci1QBQKn7O/sISO7ovsggvA6FxiJREcnfaOQGDFSU8
   HFvGyzt0azbrirI0IZeJeSVUkfrGgcrxLyOplHLoejs2titIiK0flTjfi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="373681788"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; 
   d="scan'208";a="373681788"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 22:00:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="884766584"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; 
   d="scan'208";a="884766584"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 01 Nov 2023 22:00:51 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyPp2-00017k-2o;
	Thu, 02 Nov 2023 05:00:48 +0000
Date: Thu, 2 Nov 2023 12:59:43 +0800
From: kernel test robot <lkp@intel.com>
To: Junxiao Bi <junxiao.bi@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] md/raid5: fix hung by MD_SB_CHANGE_PENDING
Message-ID: <202311021259.Kv4kJKyX-lkp@intel.com>
References: <20231101230214.57190-1-junxiao.bi@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231101230214.57190-1-junxiao.bi@oracle.com>

Hi Junxiao,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on song-md/md-next]
[also build test ERROR on axboe-block/for-next linus/master v6.6 next-20231102]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Junxiao-Bi/md-raid5-fix-hung-by-MD_SB_CHANGE_PENDING/20231102-070925
base:   git://git.kernel.org/pub/scm/linux/kernel/git/song/md.git md-next
patch link:    https://lore.kernel.org/r/20231101230214.57190-1-junxiao.bi%40oracle.com
patch subject: [RFC] md/raid5: fix hung by MD_SB_CHANGE_PENDING
config: i386-randconfig-015-20231102 (https://download.01.org/0day-ci/archive/20231102/202311021259.Kv4kJKyX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231102/202311021259.Kv4kJKyX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311021259.Kv4kJKyX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/preempt.h:7,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/blkdev.h:9,
                    from drivers/md/raid5.c:38:
   drivers/md/raid5.c: In function 'raid5d':
>> arch/x86/include/asm/current.h:44:17: error: passing argument 1 of 'blk_flush_plug' from incompatible pointer type [-Werror=incompatible-pointer-types]
      44 | #define current get_current()
         |                 ^~~~~~~~~~~~~
         |                 |
         |                 struct task_struct *
   drivers/md/raid5.c:6825:40: note: in expansion of macro 'current'
    6825 |                         blk_flush_plug(current);
         |                                        ^~~~~~~
   include/linux/blkdev.h:992:52: note: expected 'struct blk_plug *' but argument is of type 'struct task_struct *'
     992 | static inline void blk_flush_plug(struct blk_plug *plug, bool async)
         |                                   ~~~~~~~~~~~~~~~~~^~~~
   drivers/md/raid5.c:6825:25: error: too few arguments to function 'blk_flush_plug'
    6825 |                         blk_flush_plug(current);
         |                         ^~~~~~~~~~~~~~
   include/linux/blkdev.h:992:20: note: declared here
     992 | static inline void blk_flush_plug(struct blk_plug *plug, bool async)
         |                    ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/blk_flush_plug +44 arch/x86/include/asm/current.h

f0766440dda7ac include/asm-x86/current.h      Christoph Lameter 2008-05-09  43  
c6f5e0acd5d12e arch/x86/include/asm/current.h Brian Gerst       2009-01-19 @44  #define current get_current()
f0766440dda7ac include/asm-x86/current.h      Christoph Lameter 2008-05-09  45  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
