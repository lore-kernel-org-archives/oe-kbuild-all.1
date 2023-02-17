Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6C77F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Feb 2023 00:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676592534; x=1708128534;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oX3UJJxczaJaa3AQZFrMbc+5ZKaBOnqSwKh8UCXEAKQ=;
  b=P6Un4xkWCE/JFo/xY63pPl7RGrtNrVa09xl+wHbRGrF8FSUlfP6buHlz
   fD5PEfh2+pvSgqAEaIL4jJZPVPN5xjfFxrUTRYlU8UdBF/w3yy7QLGhOO
   aZHrdpEaKvdTndefh58oWRB+v8/oiid+Ok9BOBDY35gMaCw4LU+KEPApo
   1aM5WzJIHLije17mqVEkhA5hdSamUUyNqMbFH97UmAz0WFr73AIzQ9UlN
   zatv5z1HexIPffAp7KY5mL8BmUiz1IJDdHa5TA82V7ZXiS4lG2mSw9kez
   xrGRA7a03ohCC92chWQeyppeFIEjwcZxAZvSHTzG/TDTgyos/cOBP5t59
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="394346070"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="394346070"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 16:08:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="999258179"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="999258179"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 16 Feb 2023 16:08:51 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSoJ1-000AyL-1C;
	Fri, 17 Feb 2023 00:08:51 +0000
Date: Fri, 17 Feb 2023 08:07:54 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [ammarfaizi2-block:dhowells/linux-fs/iov-extract-3 2/5]
 mm/filemap.c:2862:43: error: implicit declaration of function
 'pipe_head_buf'
Message-ID: <202302170756.V4OVVYDf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/iov-extract-3
head:   c750b59474eb9ca0a3bfc963efd6fadb2ace467a
commit: 2ca06cb9c7f2926fba1008439283685c1f9dc0a4 [2/5] splice: Add a func to do a splice from a buffered file without ITER_PIPE
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20230217/202302170756.V4OVVYDf-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/2ca06cb9c7f2926fba1008439283685c1f9dc0a4
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block dhowells/linux-fs/iov-extract-3
        git checkout 2ca06cb9c7f2926fba1008439283685c1f9dc0a4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302170756.V4OVVYDf-lkp@intel.com/

Note: the ammarfaizi2-block/dhowells/linux-fs/iov-extract-3 HEAD c750b59474eb9ca0a3bfc963efd6fadb2ace467a builds fine.
      It only hurts bisectability.

All error/warnings (new ones prefixed by >>):

   mm/filemap.c: In function 'splice_folio_into_pipe':
>> mm/filemap.c:2862:43: error: implicit declaration of function 'pipe_head_buf' [-Werror=implicit-function-declaration]
    2862 |                 struct pipe_buffer *buf = pipe_head_buf(pipe);
         |                                           ^~~~~~~~~~~~~
>> mm/filemap.c:2862:43: warning: initialization of 'struct pipe_buffer *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   cc1: some warnings being treated as errors


vim +/pipe_head_buf +2862 mm/filemap.c

  2846	
  2847	/*
  2848	 * Splice subpages from a folio into a pipe.
  2849	 */
  2850	size_t splice_folio_into_pipe(struct pipe_inode_info *pipe,
  2851				      struct folio *folio, loff_t fpos, size_t size)
  2852	{
  2853		struct page *page;
  2854		size_t spliced = 0, offset = offset_in_folio(folio, fpos);
  2855	
  2856		page = folio_page(folio, offset / PAGE_SIZE);
  2857		size = min(size, folio_size(folio) - offset);
  2858		offset %= PAGE_SIZE;
  2859	
  2860		while (spliced < size &&
  2861		       !pipe_full(pipe->head, pipe->tail, pipe->max_usage)) {
> 2862			struct pipe_buffer *buf = pipe_head_buf(pipe);
  2863			size_t part = min_t(size_t, PAGE_SIZE - offset, size - spliced);
  2864	
  2865			*buf = (struct pipe_buffer) {
  2866				.ops	= &page_cache_pipe_buf_ops,
  2867				.page	= page,
  2868				.offset	= offset,
  2869				.len	= part,
  2870			};
  2871			folio_get(folio);
  2872			pipe->head++;
  2873			page++;
  2874			spliced += part;
  2875			offset = 0;
  2876		}
  2877	
  2878		return spliced;
  2879	}
  2880	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
