Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770958F78
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Feb 2023 21:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677013663; x=1708549663;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bj+EugWqQqycNyPqUBiH5kyEVluH5yB7SgJcmvUle2w=;
  b=H3aeXYVJo2MIsftHexJ6qiiB1DmwFRrka/Wg+OjmfK1oaA/TGfi6XnpO
   ZSK/SKiO0AyT81d1Xf7R2qu1TOEp1t2NKW83051cdNwcGCaCfo+cE18HQ
   4S+439u6AU03ylSkhyoOi38RApE6BTiajrrKuDqazl9tVW9cxH5oR1qWD
   SDnmRcdajVJWw93L3UYLrDp8Y87hls0rkESVXq3d5b8Jg+mUJ5BnC88jK
   iUzxQRCRq4PMGop5K4MmSqLam0mvoYH6/nhSsJ9ZdtJTOW8lWP2w9FxAz
   mOjopjNB7AYQTnClUu+Dpy8x+DisJUoLRUPvSeB9HdcGTvd9lIT5Y3dS+
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="334113797"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="334113797"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 13:07:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="702153042"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="702153042"
Received: from lkp-server01.sh.intel.com (HELO eac18b5d7d93) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 21 Feb 2023 13:07:41 -0800
Received: from kbuild by eac18b5d7d93 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUZrQ-0000Eb-27;
	Tue, 21 Feb 2023 21:07:40 +0000
Date: Wed, 22 Feb 2023 05:06:50 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	David Howells <dhowells@redhat.com>
Subject: [ammarfaizi2-block:dhowells/linux-fs/iov-cifs-mm 1/2]
 fs/gfs2/log.c:143:55: error: passing argument 3 of 'write_cache_pages' from
 incompatible pointer type
Message-ID: <202302220442.eOk9rF5J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/iov-cifs-mm
head:   71ad4f67439e60fe04bbf7aed8870e6f83a5d15e
commit: dfb379388e7d018fea286956f77228902c36b7c2 [1/2] Merge remote-tracking branch 'cifs/for-next' into iov-cifs-mm
config: s390-randconfig-r044-20230219 (https://download.01.org/0day-ci/archive/20230222/202302220442.eOk9rF5J-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/dfb379388e7d018fea286956f77228902c36b7c2
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block dhowells/linux-fs/iov-cifs-mm
        git checkout dfb379388e7d018fea286956f77228902c36b7c2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302220442.eOk9rF5J-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/gfs2/log.c: In function 'gfs2_ail1_start_one':
>> fs/gfs2/log.c:143:55: error: passing argument 3 of 'write_cache_pages' from incompatible pointer type [-Werror=incompatible-pointer-types]
     143 |                 ret = write_cache_pages(mapping, wbc, __gfs2_writepage, mapping);
         |                                                       ^~~~~~~~~~~~~~~~
         |                                                       |
         |                                                       int (*)(struct page *, struct writeback_control *, void *)
   In file included from fs/gfs2/log.c:20:
   include/linux/writeback.h:375:66: note: expected 'writepage_t' {aka 'int (*)(struct folio *, struct writeback_control *, void *)'} but argument is of type 'int (*)(struct page *, struct writeback_control *, void *)'
     375 |                       struct writeback_control *wbc, writepage_t writepage,
         |                                                      ~~~~~~~~~~~~^~~~~~~~~
   cc1: some warnings being treated as errors


vim +/write_cache_pages +143 fs/gfs2/log.c

95ecbd0f162fc0 Andreas Gruenbacher     2023-01-19   91  
ddacfaf76dd620 Steven Whitehouse       2006-10-03   92  /**
c551f66c5dfefd Lee Jones               2021-03-30   93   * gfs2_ail1_start_one - Start I/O on a transaction
c551f66c5dfefd Lee Jones               2021-03-30   94   * @sdp: The superblock
4667a0ec328678 Steven Whitehouse       2011-04-18   95   * @wbc: The writeback control structure
c551f66c5dfefd Lee Jones               2021-03-30   96   * @tr: The transaction to start I/O on
c551f66c5dfefd Lee Jones               2021-03-30   97   * @plug: The block plug currently active
ddacfaf76dd620 Steven Whitehouse       2006-10-03   98   */
ddacfaf76dd620 Steven Whitehouse       2006-10-03   99  
4f1de018215fb5 Steven Whitehouse       2011-04-26  100  static int gfs2_ail1_start_one(struct gfs2_sbd *sdp,
4667a0ec328678 Steven Whitehouse       2011-04-18  101  			       struct writeback_control *wbc,
17d77684088510 Bob Peterson            2021-02-18  102  			       struct gfs2_trans *tr, struct blk_plug *plug)
d6a079e82efd5f Dave Chinner            2011-03-11  103  __releases(&sdp->sd_ail_lock)
d6a079e82efd5f Dave Chinner            2011-03-11  104  __acquires(&sdp->sd_ail_lock)
ddacfaf76dd620 Steven Whitehouse       2006-10-03  105  {
5ac048bb7ea6e8 Steven Whitehouse       2011-03-30  106  	struct gfs2_glock *gl = NULL;
4667a0ec328678 Steven Whitehouse       2011-04-18  107  	struct address_space *mapping;
ddacfaf76dd620 Steven Whitehouse       2006-10-03  108  	struct gfs2_bufdata *bd, *s;
ddacfaf76dd620 Steven Whitehouse       2006-10-03  109  	struct buffer_head *bh;
b1676cbb11153b Bob Peterson            2019-11-13  110  	int ret = 0;
ddacfaf76dd620 Steven Whitehouse       2006-10-03  111  
16ca9412d80181 Benjamin Marzinski      2013-04-05  112  	list_for_each_entry_safe_reverse(bd, s, &tr->tr_ail1_list, bd_ail_st_list) {
ddacfaf76dd620 Steven Whitehouse       2006-10-03  113  		bh = bd->bd_bh;
ddacfaf76dd620 Steven Whitehouse       2006-10-03  114  
16ca9412d80181 Benjamin Marzinski      2013-04-05  115  		gfs2_assert(sdp, bd->bd_tr == tr);
ddacfaf76dd620 Steven Whitehouse       2006-10-03  116  
ddacfaf76dd620 Steven Whitehouse       2006-10-03  117  		if (!buffer_busy(bh)) {
30fe70a85a909a Bob Peterson            2019-11-13  118  			if (buffer_uptodate(bh)) {
30fe70a85a909a Bob Peterson            2019-11-13  119  				list_move(&bd->bd_ail_st_list,
30fe70a85a909a Bob Peterson            2019-11-13  120  					  &tr->tr_ail2_list);
30fe70a85a909a Bob Peterson            2019-11-13  121  				continue;
30fe70a85a909a Bob Peterson            2019-11-13  122  			}
036330c914365f Bob Peterson            2019-04-10  123  			if (!cmpxchg(&sdp->sd_log_error, 0, -EIO)) {
ddacfaf76dd620 Steven Whitehouse       2006-10-03  124  				gfs2_io_error_bh(sdp, bh);
69511080bd6efd Bob Peterson            2019-02-12  125  				gfs2_withdraw_delayed(sdp);
9e1a9ecd13b9bb Andreas Gruenbacher     2018-06-07  126  			}
ddacfaf76dd620 Steven Whitehouse       2006-10-03  127  		}
ddacfaf76dd620 Steven Whitehouse       2006-10-03  128  
30fe70a85a909a Bob Peterson            2019-11-13  129  		if (gfs2_withdrawn(sdp)) {
30fe70a85a909a Bob Peterson            2019-11-13  130  			gfs2_remove_from_ail(bd);
30fe70a85a909a Bob Peterson            2019-11-13  131  			continue;
30fe70a85a909a Bob Peterson            2019-11-13  132  		}
ddacfaf76dd620 Steven Whitehouse       2006-10-03  133  		if (!buffer_dirty(bh))
ddacfaf76dd620 Steven Whitehouse       2006-10-03  134  			continue;
5ac048bb7ea6e8 Steven Whitehouse       2011-03-30  135  		if (gl == bd->bd_gl)
5ac048bb7ea6e8 Steven Whitehouse       2011-03-30  136  			continue;
5ac048bb7ea6e8 Steven Whitehouse       2011-03-30  137  		gl = bd->bd_gl;
16ca9412d80181 Benjamin Marzinski      2013-04-05  138  		list_move(&bd->bd_ail_st_list, &tr->tr_ail1_list);
11551cf15ecc17 Matthew Wilcox (Oracle  2022-12-15  139) 		mapping = bh->b_folio->mapping;
4f1de018215fb5 Steven Whitehouse       2011-04-26  140  		if (!mapping)
4f1de018215fb5 Steven Whitehouse       2011-04-26  141  			continue;
d6a079e82efd5f Dave Chinner            2011-03-11  142  		spin_unlock(&sdp->sd_ail_lock);
95ecbd0f162fc0 Andreas Gruenbacher     2023-01-19 @143  		ret = write_cache_pages(mapping, wbc, __gfs2_writepage, mapping);
17d77684088510 Bob Peterson            2021-02-18  144  		if (need_resched()) {
17d77684088510 Bob Peterson            2021-02-18  145  			blk_finish_plug(plug);
17d77684088510 Bob Peterson            2021-02-18  146  			cond_resched();
17d77684088510 Bob Peterson            2021-02-18  147  			blk_start_plug(plug);
17d77684088510 Bob Peterson            2021-02-18  148  		}
d6a079e82efd5f Dave Chinner            2011-03-11  149  		spin_lock(&sdp->sd_ail_lock);
4e79e3f08e576a Bob Peterson            2020-11-12  150  		if (ret == -ENODATA) /* if a jdata write into a new hole */
4e79e3f08e576a Bob Peterson            2020-11-12  151  			ret = 0; /* ignore it */
b1676cbb11153b Bob Peterson            2019-11-13  152  		if (ret || wbc->nr_to_write <= 0)
4667a0ec328678 Steven Whitehouse       2011-04-18  153  			break;
b1676cbb11153b Bob Peterson            2019-11-13  154  		return -EBUSY;
4667a0ec328678 Steven Whitehouse       2011-04-18  155  	}
4f1de018215fb5 Steven Whitehouse       2011-04-26  156  
b1676cbb11153b Bob Peterson            2019-11-13  157  	return ret;
4667a0ec328678 Steven Whitehouse       2011-04-18  158  }
ddacfaf76dd620 Steven Whitehouse       2006-10-03  159  

:::::: The code at line 143 was first introduced by commit
:::::: 95ecbd0f162fc06ef4c4045a66f653f47b62a2d3 Revert "gfs2: stop using generic_writepages in gfs2_ail1_start_one"

:::::: TO: Andreas Gruenbacher <agruenba@redhat.com>
:::::: CC: Andreas Gruenbacher <agruenba@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
