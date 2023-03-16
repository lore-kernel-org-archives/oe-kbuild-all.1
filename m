Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1709C613F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Mar 2023 18:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678989791; x=1710525791;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nHat++qjIFQ2Nrzehz3FSXWhfQiZwo0+9ykUR/Py+Ns=;
  b=Rknqr/fKmPqh1EPbVpblpyubaKJBbOHXIAg5cuXZCJczEI1a9UvbfIEv
   jM0xUrHW6HIAbOmBla6asm6y5tPMB23HRkdZSwyiAHyq7sS2Eb1sCBQ4v
   QIYHc9ASbRnVgyjZJzsFYPTR58ULqesg2uepDm1El1SZlXx3mVFYNcidd
   UTjRh774gpugj7pdhE6Ooj+Y47B3vCnAuRPN22bJBEdxYt8l3dWH8E/7u
   FLJGCm+xs4sKdCHFJMdDYd0T1hPiEfdeo80Z7SMp3wVvzhDevsNf6mXTA
   KxmDW4hts6JJSx7vMUoxeoGmyzGTNCrSDcw/a7NbHOdhcYs3qvUEaxjR7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="321927644"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="321927644"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 11:02:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="925851475"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="925851475"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 16 Mar 2023 11:02:43 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcrvx-0008fg-1L;
	Thu, 16 Mar 2023 18:02:37 +0000
Date: Fri, 17 Mar 2023 02:02:16 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:pipe-list 48/48] net/smc/smc_rx.c:155:33: warning:
 unused variable 'spd'
Message-ID: <202303170135.nd2GC6cX-lkp@intel.com>
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
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230317/202303170135.nd2GC6cX-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/commit/?id=b678626289708f1a3b1f2a46671bf3e0f00282e5
        git remote add dhowells-fs https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
        git fetch --no-tags dhowells-fs pipe-list
        git checkout b678626289708f1a3b1f2a46671bf3e0f00282e5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash net/smc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303170135.nd2GC6cX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/splice.h:12,
                    from net/smc/smc_rx.c:16:
   include/linux/pipe_fs_i.h: In function 'pipe_buf_get':
   include/linux/pipe_fs_i.h:109:24: error: 'const struct pipe_buf_operations' has no member named 'get'
     109 |         return buf->ops->get(pipe, buf);
         |                        ^~
   net/smc/smc_rx.c: In function 'smc_rx_pipe_buf_release':
   net/smc/smc_rx.c:134:21: error: 'struct pipe_buffer' has no member named 'page'
     134 |         put_page(buf->page);
         |                     ^~
   net/smc/smc_rx.c: At top level:
   net/smc/smc_rx.c:140:10: error: 'const struct pipe_buf_operations' has no member named 'get'
     140 |         .get = generic_pipe_buf_get
         |          ^~~
   net/smc/smc_rx.c:140:16: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     140 |         .get = generic_pipe_buf_get
         |                ^~~~~~~~~~~~~~~~~~~~
   net/smc/smc_rx.c:140:16: note: (near initialization for 'smc_pipe_ops')
   net/smc/smc_rx.c:140:16: error: initialization of 'ssize_t (*)(struct pipe_inode_info *, struct pipe_buffer *, struct iov_iter *)' {aka 'long int (*)(struct pipe_inode_info *, struct pipe_buffer *, struct iov_iter *)'} from incompatible pointer type 'bool (*)(struct pipe_inode_info *, struct pipe_buffer *)' {aka '_Bool (*)(struct pipe_inode_info *, struct pipe_buffer *)'} [-Werror=incompatible-pointer-types]
   net/smc/smc_rx.c:140:16: note: (near initialization for 'smc_pipe_ops.copy_to_iter')
   net/smc/smc_rx.c:143:39: warning: 'struct splice_pipe_desc' declared inside parameter list will not be visible outside of this definition or declaration
     143 | static void smc_rx_spd_release(struct splice_pipe_desc *spd,
         |                                       ^~~~~~~~~~~~~~~~
   net/smc/smc_rx.c: In function 'smc_rx_spd_release':
   net/smc/smc_rx.c:146:21: error: invalid use of undefined type 'struct splice_pipe_desc'
     146 |         put_page(spd->pages[i]);
         |                     ^~
   net/smc/smc_rx.c:144:45: warning: parameter 'i' set but not used [-Wunused-but-set-parameter]
     144 |                                unsigned int i)
         |                                ~~~~~~~~~~~~~^
   net/smc/smc_rx.c: In function 'smc_rx_splice':
   net/smc/smc_rx.c:155:33: error: storage size of 'spd' isn't known
     155 |         struct splice_pipe_desc spd;
         |                                 ^~~
   net/smc/smc_rx.c:167:43: error: invalid application of 'sizeof' to incomplete type 'struct partial_page'
     167 |         partial = kcalloc(nr_pages, sizeof(*partial), GFP_KERNEL);
         |                                           ^
   net/smc/smc_rx.c:184:24: error: invalid use of undefined type 'struct partial_page'
     184 |                 partial[0].offset = src - (char *)smc->conn.rmb_desc->cpu_addr;
         |                        ^
   net/smc/smc_rx.c:184:27: error: invalid use of undefined type 'struct partial_page'
     184 |                 partial[0].offset = src - (char *)smc->conn.rmb_desc->cpu_addr;
         |                           ^
   net/smc/smc_rx.c:185:24: error: invalid use of undefined type 'struct partial_page'
     185 |                 partial[0].len = len;
         |                        ^
   net/smc/smc_rx.c:185:27: error: invalid use of undefined type 'struct partial_page'
     185 |                 partial[0].len = len;
         |                           ^
   net/smc/smc_rx.c:186:24: error: invalid use of undefined type 'struct partial_page'
     186 |                 partial[0].private = (unsigned long)priv[0];
         |                        ^
   net/smc/smc_rx.c:186:27: error: invalid use of undefined type 'struct partial_page'
     186 |                 partial[0].private = (unsigned long)priv[0];
         |                           ^
   net/smc/smc_rx.c:197:32: error: invalid use of undefined type 'struct partial_page'
     197 |                         partial[i].offset = offset;
         |                                ^
   net/smc/smc_rx.c:197:35: error: invalid use of undefined type 'struct partial_page'
     197 |                         partial[i].offset = offset;
         |                                   ^
   net/smc/smc_rx.c:198:32: error: invalid use of undefined type 'struct partial_page'
     198 |                         partial[i].len = size;
         |                                ^
   net/smc/smc_rx.c:198:35: error: invalid use of undefined type 'struct partial_page'
     198 |                         partial[i].len = size;
         |                                   ^
   net/smc/smc_rx.c:199:32: error: invalid use of undefined type 'struct partial_page'
     199 |                         partial[i].private = (unsigned long)priv[i];
         |                                ^
   net/smc/smc_rx.c:199:35: error: invalid use of undefined type 'struct partial_page'
     199 |                         partial[i].private = (unsigned long)priv[i];
         |                                   ^
   net/smc/smc_rx.c:212:17: error: implicit declaration of function 'splice_to_pipe'; did you mean 'splice_from_pipe'? [-Werror=implicit-function-declaration]
     212 |         bytes = splice_to_pipe(pipe, &spd);
         |                 ^~~~~~~~~~~~~~
         |                 splice_from_pipe
>> net/smc/smc_rx.c:155:33: warning: unused variable 'spd' [-Wunused-variable]
     155 |         struct splice_pipe_desc spd;
         |                                 ^~~
   cc1: some warnings being treated as errors


vim +/spd +155 net/smc/smc_rx.c

9014db202cb764 Stefan Raspl 2018-05-03  148  
9014db202cb764 Stefan Raspl 2018-05-03  149  static int smc_rx_splice(struct pipe_inode_info *pipe, char *src, size_t len,
9014db202cb764 Stefan Raspl 2018-05-03  150  			 struct smc_sock *smc)
9014db202cb764 Stefan Raspl 2018-05-03  151  {
b8d199451c99b3 Wen Gu       2022-07-14  152  	struct smc_link_group *lgr = smc->conn.lgr;
b8d199451c99b3 Wen Gu       2022-07-14  153  	int offset = offset_in_page(src);
b8d199451c99b3 Wen Gu       2022-07-14  154  	struct partial_page *partial;
9014db202cb764 Stefan Raspl 2018-05-03 @155  	struct splice_pipe_desc spd;
b8d199451c99b3 Wen Gu       2022-07-14  156  	struct smc_spd_priv **priv;
b8d199451c99b3 Wen Gu       2022-07-14  157  	struct page **pages;
b8d199451c99b3 Wen Gu       2022-07-14  158  	int bytes, nr_pages;
b8d199451c99b3 Wen Gu       2022-07-14  159  	int i;
9014db202cb764 Stefan Raspl 2018-05-03  160  
b8d199451c99b3 Wen Gu       2022-07-14  161  	nr_pages = !lgr->is_smcd && smc->conn.rmb_desc->is_vm ?
b8d199451c99b3 Wen Gu       2022-07-14  162  		   PAGE_ALIGN(len + offset) / PAGE_SIZE : 1;
b8d199451c99b3 Wen Gu       2022-07-14  163  
b8d199451c99b3 Wen Gu       2022-07-14  164  	pages = kcalloc(nr_pages, sizeof(*pages), GFP_KERNEL);
b8d199451c99b3 Wen Gu       2022-07-14  165  	if (!pages)
b8d199451c99b3 Wen Gu       2022-07-14  166  		goto out;
b8d199451c99b3 Wen Gu       2022-07-14  167  	partial = kcalloc(nr_pages, sizeof(*partial), GFP_KERNEL);
b8d199451c99b3 Wen Gu       2022-07-14  168  	if (!partial)
b8d199451c99b3 Wen Gu       2022-07-14  169  		goto out_page;
b8d199451c99b3 Wen Gu       2022-07-14  170  	priv = kcalloc(nr_pages, sizeof(*priv), GFP_KERNEL);
9014db202cb764 Stefan Raspl 2018-05-03  171  	if (!priv)
b8d199451c99b3 Wen Gu       2022-07-14  172  		goto out_part;
b8d199451c99b3 Wen Gu       2022-07-14  173  	for (i = 0; i < nr_pages; i++) {
b8d199451c99b3 Wen Gu       2022-07-14  174  		priv[i] = kzalloc(sizeof(**priv), GFP_KERNEL);
b8d199451c99b3 Wen Gu       2022-07-14  175  		if (!priv[i])
b8d199451c99b3 Wen Gu       2022-07-14  176  			goto out_priv;
b8d199451c99b3 Wen Gu       2022-07-14  177  	}
b8d199451c99b3 Wen Gu       2022-07-14  178  
b8d199451c99b3 Wen Gu       2022-07-14  179  	if (lgr->is_smcd ||
b8d199451c99b3 Wen Gu       2022-07-14  180  	    (!lgr->is_smcd && !smc->conn.rmb_desc->is_vm)) {
b8d199451c99b3 Wen Gu       2022-07-14  181  		/* smcd or smcr that uses physically contiguous RMBs */
b8d199451c99b3 Wen Gu       2022-07-14  182  		priv[0]->len = len;
b8d199451c99b3 Wen Gu       2022-07-14  183  		priv[0]->smc = smc;
b8d199451c99b3 Wen Gu       2022-07-14  184  		partial[0].offset = src - (char *)smc->conn.rmb_desc->cpu_addr;
b8d199451c99b3 Wen Gu       2022-07-14  185  		partial[0].len = len;
b8d199451c99b3 Wen Gu       2022-07-14  186  		partial[0].private = (unsigned long)priv[0];
b8d199451c99b3 Wen Gu       2022-07-14  187  		pages[0] = smc->conn.rmb_desc->pages;
b8d199451c99b3 Wen Gu       2022-07-14  188  	} else {
b8d199451c99b3 Wen Gu       2022-07-14  189  		int size, left = len;
b8d199451c99b3 Wen Gu       2022-07-14  190  		void *buf = src;
b8d199451c99b3 Wen Gu       2022-07-14  191  		/* smcr that uses virtually contiguous RMBs*/
b8d199451c99b3 Wen Gu       2022-07-14  192  		for (i = 0; i < nr_pages; i++) {
b8d199451c99b3 Wen Gu       2022-07-14  193  			size = min_t(int, PAGE_SIZE - offset, left);
b8d199451c99b3 Wen Gu       2022-07-14  194  			priv[i]->len = size;
b8d199451c99b3 Wen Gu       2022-07-14  195  			priv[i]->smc = smc;
b8d199451c99b3 Wen Gu       2022-07-14  196  			pages[i] = vmalloc_to_page(buf);
b8d199451c99b3 Wen Gu       2022-07-14  197  			partial[i].offset = offset;
b8d199451c99b3 Wen Gu       2022-07-14  198  			partial[i].len = size;
b8d199451c99b3 Wen Gu       2022-07-14  199  			partial[i].private = (unsigned long)priv[i];
b8d199451c99b3 Wen Gu       2022-07-14  200  			buf += size / sizeof(*buf);
b8d199451c99b3 Wen Gu       2022-07-14  201  			left -= size;
b8d199451c99b3 Wen Gu       2022-07-14  202  			offset = 0;
b8d199451c99b3 Wen Gu       2022-07-14  203  		}
b8d199451c99b3 Wen Gu       2022-07-14  204  	}
b8d199451c99b3 Wen Gu       2022-07-14  205  	spd.nr_pages_max = nr_pages;
b8d199451c99b3 Wen Gu       2022-07-14  206  	spd.nr_pages = nr_pages;
b8d199451c99b3 Wen Gu       2022-07-14  207  	spd.pages = pages;
b8d199451c99b3 Wen Gu       2022-07-14  208  	spd.partial = partial;
9014db202cb764 Stefan Raspl 2018-05-03  209  	spd.ops = &smc_pipe_ops;
9014db202cb764 Stefan Raspl 2018-05-03  210  	spd.spd_release = smc_rx_spd_release;
9014db202cb764 Stefan Raspl 2018-05-03  211  
9014db202cb764 Stefan Raspl 2018-05-03  212  	bytes = splice_to_pipe(pipe, &spd);
9014db202cb764 Stefan Raspl 2018-05-03  213  	if (bytes > 0) {
9014db202cb764 Stefan Raspl 2018-05-03  214  		sock_hold(&smc->sk);
b8d199451c99b3 Wen Gu       2022-07-14  215  		if (!lgr->is_smcd && smc->conn.rmb_desc->is_vm) {
b8d199451c99b3 Wen Gu       2022-07-14  216  			for (i = 0; i < PAGE_ALIGN(bytes + offset) / PAGE_SIZE; i++)
b8d199451c99b3 Wen Gu       2022-07-14  217  				get_page(pages[i]);
b8d199451c99b3 Wen Gu       2022-07-14  218  		} else {
9014db202cb764 Stefan Raspl 2018-05-03  219  			get_page(smc->conn.rmb_desc->pages);
b8d199451c99b3 Wen Gu       2022-07-14  220  		}
9014db202cb764 Stefan Raspl 2018-05-03  221  		atomic_add(bytes, &smc->conn.splice_pending);
9014db202cb764 Stefan Raspl 2018-05-03  222  	}
b8d199451c99b3 Wen Gu       2022-07-14  223  	kfree(priv);
b8d199451c99b3 Wen Gu       2022-07-14  224  	kfree(partial);
b8d199451c99b3 Wen Gu       2022-07-14  225  	kfree(pages);
9014db202cb764 Stefan Raspl 2018-05-03  226  
9014db202cb764 Stefan Raspl 2018-05-03  227  	return bytes;
b8d199451c99b3 Wen Gu       2022-07-14  228  
b8d199451c99b3 Wen Gu       2022-07-14  229  out_priv:
b8d199451c99b3 Wen Gu       2022-07-14  230  	for (i = (i - 1); i >= 0; i--)
b8d199451c99b3 Wen Gu       2022-07-14  231  		kfree(priv[i]);
b8d199451c99b3 Wen Gu       2022-07-14  232  	kfree(priv);
b8d199451c99b3 Wen Gu       2022-07-14  233  out_part:
b8d199451c99b3 Wen Gu       2022-07-14  234  	kfree(partial);
b8d199451c99b3 Wen Gu       2022-07-14  235  out_page:
b8d199451c99b3 Wen Gu       2022-07-14  236  	kfree(pages);
b8d199451c99b3 Wen Gu       2022-07-14  237  out:
b8d199451c99b3 Wen Gu       2022-07-14  238  	return -ENOMEM;
9014db202cb764 Stefan Raspl 2018-05-03  239  }
9014db202cb764 Stefan Raspl 2018-05-03  240  

:::::: The code at line 155 was first introduced by commit
:::::: 9014db202cb764b8e14c53e7bacc81f9a1a2ba7f smc: add support for splice()

:::::: TO: Stefan Raspl <stefan.raspl@linux.ibm.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
