Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B2B3D7B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Mar 2023 16:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678983637; x=1710519637;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GTWG6+GOrU5iDq9zqtlbNvuus5DjZ7HBdRqXyU/O2uM=;
  b=T62+YHqvb9NtMpbpHLq4qIYrqU/p9UevCqzNBrBUXigtiH5RONcaNmWR
   BHIYbBkF+KxVinUCyJmtfaC4MiTBnhbSc9YP6drCgegdqwCHeASf7YRdM
   e8Zq5d2WGkygIaaEVTGaLIjrWdgfardP3FtaNo0arGdcYIOpsTNyHxmQF
   HWj7UuTJDxSWbR2itcl+AhKfAxbLmkI8Gl6qAuirhN2PJYrHi6CYpEoiV
   VRy5qbfuG0NE6YEgNoPM5CjCqgW63MvR7xG18m3hy4mKs6f5fc5Cc7QJj
   3AG/2D/cTP4JwS8wmQQPOiV1EXDvkmlFVGNqPL2bEkfD/c/OFt5/vHbUt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="400630439"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="400630439"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 09:20:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="769016058"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="769016058"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Mar 2023 09:20:35 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcqLD-0008co-0C;
	Thu, 16 Mar 2023 16:20:35 +0000
Date: Fri, 17 Mar 2023 00:20:31 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:pipe-list 48/48] fs/fuse/dev.c:673:28: error: 'struct
 pipe_buffer' has no member named 'len'
Message-ID: <202303170025.OiyNUwBk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git pipe-list
head:   b678626289708f1a3b1f2a46671bf3e0f00282e5
commit: b678626289708f1a3b1f2a46671bf3e0f00282e5 [48/48] pipe: Use a linked-list instead of a ring buffer
config: parisc64-defconfig (https://download.01.org/0day-ci/archive/20230317/202303170025.OiyNUwBk-lkp@intel.com/config)
compiler: hppa64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/commit/?id=b678626289708f1a3b1f2a46671bf3e0f00282e5
        git remote add dhowells-fs https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
        git fetch --no-tags dhowells-fs pipe-list
        git checkout b678626289708f1a3b1f2a46671bf3e0f00282e5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc64 SHELL=/bin/bash fs/fuse/ fs/nfsd/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303170025.OiyNUwBk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/fuse/dev.c:20:
   include/linux/pipe_fs_i.h: In function 'pipe_buf_get':
   include/linux/pipe_fs_i.h:109:24: error: 'const struct pipe_buf_operations' has no member named 'get'
     109 |         return buf->ops->get(pipe, buf);
         |                        ^~
   fs/fuse/dev.c: In function 'fuse_copy_finish':
>> fs/fuse/dev.c:673:28: error: 'struct pipe_buffer' has no member named 'len'
     673 |                         buf->len = PAGE_SIZE - cs->len;
         |                            ^~
   fs/fuse/dev.c: In function 'fuse_copy_fill':
>> fs/fuse/dev.c:709:37: error: 'struct pipe_buffer' has no member named 'page'
     709 |                         cs->pg = buf->page;
         |                                     ^~
>> fs/fuse/dev.c:710:41: error: 'struct pipe_buffer' has no member named 'offset'
     710 |                         cs->offset = buf->offset;
         |                                         ^~
   fs/fuse/dev.c:711:38: error: 'struct pipe_buffer' has no member named 'len'
     711 |                         cs->len = buf->len;
         |                                      ^~
   fs/fuse/dev.c:715:52: error: invalid use of undefined type 'struct pipe_inode_info'
     715 |                         if (cs->nr_segs >= cs->pipe->max_usage)
         |                                                    ^~
   fs/fuse/dev.c:722:28: error: 'struct pipe_buffer' has no member named 'page'
     722 |                         buf->page = page;
         |                            ^~
   fs/fuse/dev.c:723:28: error: 'struct pipe_buffer' has no member named 'offset'
     723 |                         buf->offset = 0;
         |                            ^~
   fs/fuse/dev.c:724:28: error: 'struct pipe_buffer' has no member named 'len'
     724 |                         buf->len = 0;
         |                            ^~
   fs/fuse/dev.c: In function 'fuse_try_move_page':
   fs/fuse/dev.c:809:22: error: 'struct pipe_buffer' has no member named 'len'
     809 |         cs->len = buf->len;
         |                      ^~
   In file included from include/linux/mmzone.h:23,
                    from include/linux/gfp.h:7,
                    from include/linux/xarray.h:15,
                    from include/linux/list_lru.h:14,
                    from include/linux/fs.h:13,
                    from fs/fuse/fuse_i.h:17,
                    from fs/fuse/dev.c:9:
   fs/fuse/dev.c:819:34: error: 'struct pipe_buffer' has no member named 'page'
     819 |         newfolio = page_folio(buf->page);
         |                                  ^~
   include/linux/page-flags.h:273:44: note: in definition of macro 'page_folio'
     273 | #define page_folio(p)           (_Generic((p),                          \
         |                                            ^
   fs/fuse/dev.c:884:21: error: 'struct pipe_buffer' has no member named 'page'
     884 |         cs->pg = buf->page;
         |                     ^~
   fs/fuse/dev.c:885:25: error: 'struct pipe_buffer' has no member named 'offset'
     885 |         cs->offset = buf->offset;
         |                         ^~
   fs/fuse/dev.c: In function 'fuse_ref_page':
   fs/fuse/dev.c:900:36: error: invalid use of undefined type 'struct pipe_inode_info'
     900 |         if (cs->nr_segs >= cs->pipe->max_usage)
         |                                    ^~
   fs/fuse/dev.c:913:12: error: 'struct pipe_buffer' has no member named 'page'
     913 |         buf->page = page;
         |            ^~
   fs/fuse/dev.c:914:12: error: 'struct pipe_buffer' has no member named 'offset'
     914 |         buf->offset = offset;
         |            ^~
   fs/fuse/dev.c:915:12: error: 'struct pipe_buffer' has no member named 'len'
     915 |         buf->len = count;
         |            ^~
   fs/fuse/dev.c: In function 'fuse_dev_splice_read':
   fs/fuse/dev.c:1383:35: error: invalid use of undefined type 'struct pipe_inode_info'
    1383 |         bufs = kvmalloc_array(pipe->max_usage, sizeof(struct pipe_buffer),
         |                                   ^~
   fs/fuse/dev.c:1395:13: error: implicit declaration of function 'pipe_occupancy' [-Werror=implicit-function-declaration]
    1395 |         if (pipe_occupancy(pipe->head, pipe->tail) + cs.nr_segs > pipe->max_usage) {
         |             ^~~~~~~~~~~~~~
   fs/fuse/dev.c:1395:32: error: invalid use of undefined type 'struct pipe_inode_info'
    1395 |         if (pipe_occupancy(pipe->head, pipe->tail) + cs.nr_segs > pipe->max_usage) {
         |                                ^~
   fs/fuse/dev.c:1395:44: error: invalid use of undefined type 'struct pipe_inode_info'
    1395 |         if (pipe_occupancy(pipe->head, pipe->tail) + cs.nr_segs > pipe->max_usage) {
         |                                            ^~
   fs/fuse/dev.c:1395:71: error: invalid use of undefined type 'struct pipe_inode_info'
    1395 |         if (pipe_occupancy(pipe->head, pipe->tail) + cs.nr_segs > pipe->max_usage) {
         |                                                                       ^~
>> fs/fuse/dev.c:1407:23: error: implicit declaration of function 'add_to_pipe' [-Werror=implicit-function-declaration]
    1407 |                 ret = add_to_pipe(pipe, &bufs[page_nr++]);
         |                       ^~~~~~~~~~~
   fs/fuse/dev.c:1415:39: error: 'struct pipe_buffer' has no member named 'page'
    1415 |                 put_page(bufs[page_nr].page);
         |                                       ^
   fs/fuse/dev.c: In function 'fuse_dev_splice_write':
   fs/fuse/dev.c:1982:20: error: invalid use of undefined type 'struct pipe_inode_info'
    1982 |         head = pipe->head;
         |                    ^~
   fs/fuse/dev.c:1983:20: error: invalid use of undefined type 'struct pipe_inode_info'
    1983 |         tail = pipe->tail;
         |                    ^~
   fs/fuse/dev.c:1984:20: error: invalid use of undefined type 'struct pipe_inode_info'
    1984 |         mask = pipe->ring_size - 1;
         |                    ^~
   fs/fuse/dev.c:1996:28: error: invalid use of undefined type 'struct pipe_inode_info'
    1996 |                 rem += pipe->bufs[idx & mask].len;
         |                            ^~
   fs/fuse/dev.c:2010:29: error: invalid use of undefined type 'struct pipe_inode_info'
    2010 |                 ibuf = &pipe->bufs[tail & mask];
         |                             ^~
   fs/fuse/dev.c:2013:32: error: 'struct pipe_buffer' has no member named 'len'
    2013 |                 if (rem >= ibuf->len) {
         |                                ^~
   fs/fuse/dev.c:2017:29: error: invalid use of undefined type 'struct pipe_inode_info'
    2017 |                         pipe->tail = tail;
         |                             ^~
   fs/fuse/dev.c:2024:29: error: 'struct pipe_buffer' has no member named 'len'
    2024 |                         obuf->len = rem;
         |                             ^~
   fs/fuse/dev.c:2025:29: error: 'struct pipe_buffer' has no member named 'offset'
    2025 |                         ibuf->offset += obuf->len;
         |                             ^~
   fs/fuse/dev.c:2025:45: error: 'struct pipe_buffer' has no member named 'len'
    2025 |                         ibuf->offset += obuf->len;
         |                                             ^~
   fs/fuse/dev.c:2026:29: error: 'struct pipe_buffer' has no member named 'len'
    2026 |                         ibuf->len -= obuf->len;
         |                             ^~
   fs/fuse/dev.c:2026:42: error: 'struct pipe_buffer' has no member named 'len'
    2026 |                         ibuf->len -= obuf->len;
         |                                          ^~
   fs/fuse/dev.c:2029:28: error: 'struct pipe_buffer' has no member named 'len'
    2029 |                 rem -= obuf->len;
         |                            ^~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/splice.h:12,
                    from fs/nfsd/vfs.c:19:
   include/linux/pipe_fs_i.h: In function 'pipe_buf_get':
   include/linux/pipe_fs_i.h:109:24: error: 'const struct pipe_buf_operations' has no member named 'get'
     109 |         return buf->ops->get(pipe, buf);
         |                        ^~
   fs/nfsd/vfs.c: In function 'nfsd_splice_actor':
>> fs/nfsd/vfs.c:939:32: error: 'struct pipe_buffer' has no member named 'page'
     939 |         struct page *page = buf->page;  // may be a compound one
         |                                ^~
>> fs/nfsd/vfs.c:940:30: error: 'struct pipe_buffer' has no member named 'offset'
     940 |         unsigned offset = buf->offset;
         |                              ^~
   fs/nfsd/vfs.c: In function 'nfsd_direct_splice_actor':
   fs/nfsd/vfs.c:955:45: error: passing argument 3 of '__splice_from_pipe' from incompatible pointer type [-Werror=incompatible-pointer-types]
     955 |         return __splice_from_pipe(pipe, sd, nfsd_splice_actor);
         |                                             ^~~~~~~~~~~~~~~~~
         |                                             |
         |                                             int (*)(struct pipe_inode_info *, struct pipe_buffer *, struct splice_desc *)
   include/linux/splice.h:60:57: note: expected 'int (*)(struct pipe_inode_info *, struct splice_desc *, unsigned int,  struct bio_vec *)' but argument is of type 'int (*)(struct pipe_inode_info *, struct pipe_buffer *, struct splice_desc *)'
      60 |                                   struct splice_desc *, splice_actor *);
         |                                                         ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +673 fs/fuse/dev.c

334f485df85ac7 Miklos Szeredi 2005-09-09  665  
334f485df85ac7 Miklos Szeredi 2005-09-09  666  /* Unmap and put previous page of userspace buffer */
8bfc016d2e2fff Miklos Szeredi 2006-01-16  667  static void fuse_copy_finish(struct fuse_copy_state *cs)
334f485df85ac7 Miklos Szeredi 2005-09-09  668  {
dd3bb14f44a638 Miklos Szeredi 2010-05-25  669  	if (cs->currbuf) {
dd3bb14f44a638 Miklos Szeredi 2010-05-25  670  		struct pipe_buffer *buf = cs->currbuf;
dd3bb14f44a638 Miklos Szeredi 2010-05-25  671  
c55a01d360afaf Miklos Szeredi 2014-07-07  672  		if (cs->write)
c3021629a0d820 Miklos Szeredi 2010-05-25 @673  			buf->len = PAGE_SIZE - cs->len;
dd3bb14f44a638 Miklos Szeredi 2010-05-25  674  		cs->currbuf = NULL;
c55a01d360afaf Miklos Szeredi 2014-07-07  675  	} else if (cs->pg) {
334f485df85ac7 Miklos Szeredi 2005-09-09  676  		if (cs->write) {
334f485df85ac7 Miklos Szeredi 2005-09-09  677  			flush_dcache_page(cs->pg);
334f485df85ac7 Miklos Szeredi 2005-09-09  678  			set_page_dirty_lock(cs->pg);
334f485df85ac7 Miklos Szeredi 2005-09-09  679  		}
334f485df85ac7 Miklos Szeredi 2005-09-09  680  		put_page(cs->pg);
334f485df85ac7 Miklos Szeredi 2005-09-09  681  	}
c55a01d360afaf Miklos Szeredi 2014-07-07  682  	cs->pg = NULL;
334f485df85ac7 Miklos Szeredi 2005-09-09  683  }
334f485df85ac7 Miklos Szeredi 2005-09-09  684  
334f485df85ac7 Miklos Szeredi 2005-09-09  685  /*
334f485df85ac7 Miklos Szeredi 2005-09-09  686   * Get another pagefull of userspace buffer, and map it to kernel
334f485df85ac7 Miklos Szeredi 2005-09-09  687   * address space, and lock request
334f485df85ac7 Miklos Szeredi 2005-09-09  688   */
334f485df85ac7 Miklos Szeredi 2005-09-09  689  static int fuse_copy_fill(struct fuse_copy_state *cs)
334f485df85ac7 Miklos Szeredi 2005-09-09  690  {
c55a01d360afaf Miklos Szeredi 2014-07-07  691  	struct page *page;
334f485df85ac7 Miklos Szeredi 2005-09-09  692  	int err;
334f485df85ac7 Miklos Szeredi 2005-09-09  693  
dc00809a53edd1 Miklos Szeredi 2015-07-01  694  	err = unlock_request(cs->req);
0d8e84b0432beb Miklos Szeredi 2015-07-01  695  	if (err)
0d8e84b0432beb Miklos Szeredi 2015-07-01  696  		return err;
0d8e84b0432beb Miklos Szeredi 2015-07-01  697  
334f485df85ac7 Miklos Szeredi 2005-09-09  698  	fuse_copy_finish(cs);
dd3bb14f44a638 Miklos Szeredi 2010-05-25  699  	if (cs->pipebufs) {
dd3bb14f44a638 Miklos Szeredi 2010-05-25  700  		struct pipe_buffer *buf = cs->pipebufs;
dd3bb14f44a638 Miklos Szeredi 2010-05-25  701  
c3021629a0d820 Miklos Szeredi 2010-05-25  702  		if (!cs->write) {
fba597db4218ac Miklos Szeredi 2016-09-27  703  			err = pipe_buf_confirm(cs->pipe, buf);
dd3bb14f44a638 Miklos Szeredi 2010-05-25  704  			if (err)
dd3bb14f44a638 Miklos Szeredi 2010-05-25  705  				return err;
dd3bb14f44a638 Miklos Szeredi 2010-05-25  706  
dd3bb14f44a638 Miklos Szeredi 2010-05-25  707  			BUG_ON(!cs->nr_segs);
dd3bb14f44a638 Miklos Szeredi 2010-05-25  708  			cs->currbuf = buf;
c55a01d360afaf Miklos Szeredi 2014-07-07 @709  			cs->pg = buf->page;
c55a01d360afaf Miklos Szeredi 2014-07-07 @710  			cs->offset = buf->offset;
dd3bb14f44a638 Miklos Szeredi 2010-05-25  711  			cs->len = buf->len;
dd3bb14f44a638 Miklos Szeredi 2010-05-25  712  			cs->pipebufs++;
dd3bb14f44a638 Miklos Szeredi 2010-05-25  713  			cs->nr_segs--;
c3021629a0d820 Miklos Szeredi 2010-05-25  714  		} else {
6718b6f855a0b4 David Howells  2019-10-16  715  			if (cs->nr_segs >= cs->pipe->max_usage)
c3021629a0d820 Miklos Szeredi 2010-05-25  716  				return -EIO;
c3021629a0d820 Miklos Szeredi 2010-05-25  717  
c3021629a0d820 Miklos Szeredi 2010-05-25  718  			page = alloc_page(GFP_HIGHUSER);
c3021629a0d820 Miklos Szeredi 2010-05-25  719  			if (!page)
c3021629a0d820 Miklos Szeredi 2010-05-25  720  				return -ENOMEM;
c3021629a0d820 Miklos Szeredi 2010-05-25  721  
c3021629a0d820 Miklos Szeredi 2010-05-25  722  			buf->page = page;
c3021629a0d820 Miklos Szeredi 2010-05-25  723  			buf->offset = 0;
c3021629a0d820 Miklos Szeredi 2010-05-25  724  			buf->len = 0;
c3021629a0d820 Miklos Szeredi 2010-05-25  725  
c3021629a0d820 Miklos Szeredi 2010-05-25  726  			cs->currbuf = buf;
c55a01d360afaf Miklos Szeredi 2014-07-07  727  			cs->pg = page;
c55a01d360afaf Miklos Szeredi 2014-07-07  728  			cs->offset = 0;
c3021629a0d820 Miklos Szeredi 2010-05-25  729  			cs->len = PAGE_SIZE;
c3021629a0d820 Miklos Szeredi 2010-05-25  730  			cs->pipebufs++;
c3021629a0d820 Miklos Szeredi 2010-05-25  731  			cs->nr_segs++;
c3021629a0d820 Miklos Szeredi 2010-05-25  732  		}
dd3bb14f44a638 Miklos Szeredi 2010-05-25  733  	} else {
6c09e94a32e109 Al Viro        2015-04-03  734  		size_t off;
1ef255e257173f Al Viro        2022-06-09  735  		err = iov_iter_get_pages2(cs->iter, &page, PAGE_SIZE, 1, &off);
334f485df85ac7 Miklos Szeredi 2005-09-09  736  		if (err < 0)
334f485df85ac7 Miklos Szeredi 2005-09-09  737  			return err;
6c09e94a32e109 Al Viro        2015-04-03  738  		BUG_ON(!err);
6c09e94a32e109 Al Viro        2015-04-03  739  		cs->len = err;
6c09e94a32e109 Al Viro        2015-04-03  740  		cs->offset = off;
c55a01d360afaf Miklos Szeredi 2014-07-07  741  		cs->pg = page;
dd3bb14f44a638 Miklos Szeredi 2010-05-25  742  	}
334f485df85ac7 Miklos Szeredi 2005-09-09  743  
dc00809a53edd1 Miklos Szeredi 2015-07-01  744  	return lock_request(cs->req);
334f485df85ac7 Miklos Szeredi 2005-09-09  745  }
334f485df85ac7 Miklos Szeredi 2005-09-09  746  

:::::: The code at line 673 was first introduced by commit
:::::: c3021629a0d820247ee12b6c5192a1d5380e21c6 fuse: support splice() reading from fuse device

:::::: TO: Miklos Szeredi <mszeredi@suse.cz>
:::::: CC: Miklos Szeredi <mszeredi@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
