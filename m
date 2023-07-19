Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A02515A9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 00:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689727792; x=1721263792;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i1q7pv7zIpcud4w2hBz/1F5y7QVuqUrs3m1YS8Iuf2k=;
  b=FZPlGzQ5wKX6FUdy/o25VlhrqbBXGSNOF/3r/F9rnonBZ8iaLvgF9+QD
   9emRMVBBT6/UyF9U0ayZ4TpwYEs4tvKvOQ4w3Ilv2RwdecrdpVoJjGcdu
   89UoJKfqI7glU56jblQDCPNNY+akyfCqtMYd/BVlkXFocDnvUnSe3G6yn
   R5EvpC7SsoLxu8OFrLYLRAb0adFt98TfureCpqw77e+jJAyQantVnlM0N
   O8lneylPHbe8phgMdG2Kr4py89oRIHl3d2IxgzvsJicWnXZrfe2O3b9lZ
   1lGPqGrObOL1/X8iSx01P0NtRL+ViHuUoQ/8kfEkBpgHaSu9+Kgu0OOXL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="365226374"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="365226374"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 17:49:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="723822435"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="723822435"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 18 Jul 2023 17:49:49 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLvNq-0003zj-1Z;
	Wed, 19 Jul 2023 00:49:41 +0000
Date: Wed, 19 Jul 2023 08:48:56 +0800
From: kernel test robot <lkp@intel.com>
To: Pankaj Raghav <p.raghav@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, Luis Chamberlain <mcgrof@kernel.org>
Subject: [mcgrof-next:large-block-nobdev-20230714-minorder 6/10]
 mm/readahead.c:797: undefined reference to `__divdi3'
Message-ID: <202307190859.NZD5OHJ7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git large-block-nobdev-20230714-minorder
head:   037b96adc07c3f2004459646537f6735ec545aca
commit: 2b51ed864d56c86c2c17b6abca4e15e8dd7be055 [6/10] filemap: use minimum order while allocating folios
config: microblaze-randconfig-r006-20230718 (https://download.01.org/0day-ci/archive/20230719/202307190859.NZD5OHJ7-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307190859.NZD5OHJ7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307190859.NZD5OHJ7-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: mm/readahead.o: in function `readahead_expand':
>> mm/readahead.c:797: undefined reference to `__divdi3'


vim +797 mm/readahead.c

   769	
   770	/**
   771	 * readahead_expand - Expand a readahead request
   772	 * @ractl: The request to be expanded
   773	 * @new_start: The revised start
   774	 * @new_len: The revised size of the request
   775	 *
   776	 * Attempt to expand a readahead request outwards from the current size to the
   777	 * specified size by inserting locked pages before and after the current window
   778	 * to increase the size to the new window.  This may involve the insertion of
   779	 * THPs, in which case the window may get expanded even beyond what was
   780	 * requested.
   781	 *
   782	 * The algorithm will stop if it encounters a conflicting page already in the
   783	 * pagecache and leave a smaller expansion than requested.
   784	 *
   785	 * The caller must check for this by examining the revised @ractl object for a
   786	 * different expansion than was requested.
   787	 */
   788	void readahead_expand(struct readahead_control *ractl,
   789			      loff_t new_start, size_t new_len)
   790	{
   791		struct address_space *mapping = ractl->mapping;
   792		struct file_ra_state *ra = ractl->ra;
   793		pgoff_t new_index, new_nr_pages;
   794		gfp_t gfp_mask = readahead_gfp_mask(mapping);
   795		unsigned min_folio_count = 1U << mapping_min_folio_order(mapping);
   796	
 > 797		new_index = new_start / (min_folio_count * PAGE_SIZE);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
