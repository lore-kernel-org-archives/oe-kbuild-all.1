Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26812F5B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Feb 2023 13:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675258590; x=1706794590;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jMpFUSivbxQlKS/MKuG0l+vIWu5CVA395Kq19ZJc9EI=;
  b=PzlWIkoPT2gU5SP/T1pArltbdKimvqRV2ljDwAS8JK5EGh/kKp1FOs+2
   c+MO3XKSkZw2eZldBsYPOSujcLME8mlKbjKipsT/Y/Dib0QXTBHOxZ/EB
   O6DBndcb3Y4Nl0MRhx+UE0pieW4xYXVqbRIfRX9DHXWoTk1U/55XVr75G
   NAAtjtl/RWHCVTe/qQnKAXXNQhTQuu9fsylVK2moPTSkMGuIV0hx9CyMA
   +QbVUI/FqX23BZqSPxHzP+ye4uAWR3cUC+5u7QMKYRBohk1mmSvSOsJMj
   u+d0qTYd8uqiRhr8b8/7EJbyPEBhWbVS6/lbP4xXIKU/BeB6lGd9HU2Pf
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="325842931"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="325842931"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 05:36:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="697250333"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="697250333"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 01 Feb 2023 05:36:28 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNDHn-0005TH-2f;
	Wed, 01 Feb 2023 13:36:27 +0000
Date: Wed, 1 Feb 2023 21:35:55 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [ammarfaizi2-block:dhowells/linux-fs/iov-cifs 2/13]
 fs/netfs/iterator.c:65:66: sparse: sparse: incorrect type in argument 5
 (different base types)
Message-ID: <202302012158.eK6uvMkU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/iov-cifs
head:   418842b957d86e37f2eafde039bb92623962ee19
commit: d6a8d826e443d9da9c2585088abc3be9b7cc66d6 [2/13] netfs: Add a function to extract a UBUF or IOVEC into a BVEC iterator
config: sparc-randconfig-s043-20230129 (https://download.01.org/0day-ci/archive/20230201/202302012158.eK6uvMkU-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/ammarfaizi2/linux-block/commit/d6a8d826e443d9da9c2585088abc3be9b7cc66d6
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block dhowells/linux-fs/iov-cifs
        git checkout d6a8d826e443d9da9c2585088abc3be9b7cc66d6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sparc SHELL=/bin/bash fs/netfs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> fs/netfs/iterator.c:65:66: sparse: sparse: incorrect type in argument 5 (different base types) @@     expected restricted iov_iter_extraction_t [usertype] extraction_flags @@     got unsigned int extract_flags @@
   fs/netfs/iterator.c:65:66: sparse:     expected restricted iov_iter_extraction_t [usertype] extraction_flags
   fs/netfs/iterator.c:65:66: sparse:     got unsigned int extract_flags

vim +65 fs/netfs/iterator.c

    13	
    14	/**
    15	 * netfs_extract_user_iter - Extract the pages from a user iterator into a bvec
    16	 * @orig: The original iterator
    17	 * @orig_len: The amount of iterator to copy
    18	 * @new: The iterator to be set up
    19	 * @extract_flags: Flags to qualify the request
    20	 *
    21	 * Extract the page fragments from the given amount of the source iterator and
    22	 * build up a second iterator that refers to all of those bits.  This allows
    23	 * the original iterator to disposed of.
    24	 *
    25	 * @extract_flags can have ITER_ALLOW_P2PDMA set to request peer-to-peer DMA be
    26	 * allowed on the pages extracted.
    27	 *
    28	 * On success, the number of elements in the bvec is returned, the original
    29	 * iterator will have been advanced by the amount extracted.
    30	 *
    31	 * The iov_iter_extract_mode() function should be used to query how cleanup
    32	 * should be performed.
    33	 */
    34	ssize_t netfs_extract_user_iter(struct iov_iter *orig, size_t orig_len,
    35					struct iov_iter *new, unsigned int extract_flags)
    36	{
    37		struct bio_vec *bv = NULL;
    38		struct page **pages;
    39		unsigned int cur_npages;
    40		unsigned int max_pages;
    41		unsigned int npages = 0;
    42		unsigned int i;
    43		ssize_t ret;
    44		size_t count = orig_len, offset, len;
    45		size_t bv_size, pg_size;
    46	
    47		if (WARN_ON_ONCE(!iter_is_ubuf(orig) && !iter_is_iovec(orig)))
    48			return -EIO;
    49	
    50		max_pages = iov_iter_npages(orig, INT_MAX);
    51		bv_size = array_size(max_pages, sizeof(*bv));
    52		bv = kvmalloc(bv_size, GFP_KERNEL);
    53		if (!bv)
    54			return -ENOMEM;
    55	
    56		/* Put the page list at the end of the bvec list storage.  bvec
    57		 * elements are larger than page pointers, so as long as we work
    58		 * 0->last, we should be fine.
    59		 */
    60		pg_size = array_size(max_pages, sizeof(*pages));
    61		pages = (void *)bv + bv_size - pg_size;
    62	
    63		while (count && npages < max_pages) {
    64			ret = iov_iter_extract_pages(orig, &pages, count,
  > 65						     max_pages - npages, extract_flags,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
