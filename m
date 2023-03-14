Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C4BA930
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Mar 2023 18:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678817269; x=1710353269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ryzxvxfIgtRoaKeOz7A6YwKR/2mkURSxz3SGuxM4acM=;
  b=HkaqTpbGeWe7fIRhcMkM9UfcWn+SwcSBan3JIFP98HFqEb2V00nfHY1k
   XCL/a7nxD1x6w+v8eSHGFuplwN+hci2ibZc5jF3Bz0vnBLtDfKSfMv/4o
   3PDB0rGRP6j7Vut6bRNDiNPkYXDsoZmQ6tsP/YFSBFW2bXF3wCZkwUD0i
   SRlwW9TwZ49YEmdYS1KhH4izDo+CgZcz6knRPHQvIC6R0iCHhUkPI8coc
   ROUr8SUf+gPrw8OBtXsGulgwtqNBnbD/8+S2UUE9tjIBoDbu+M4yoXo1Q
   xdnk8eWHsH8rZo1geMgD1wM9IbVL6+cC9sC9bND8BdQY3rs6tNd5doqt3
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="337530879"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="337530879"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 11:07:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="681526838"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="681526838"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 14 Mar 2023 11:07:47 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pc93q-00075W-32;
	Tue, 14 Mar 2023 18:07:46 +0000
Date: Wed, 15 Mar 2023 02:07:26 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:pipe-list 39/39] fs/nfsd/vfs.c:955:45: error: passing
 argument 3 of '__splice_from_pipe' from incompatible pointer type
Message-ID: <202303150252.diIjDc15-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git pipe-list
head:   04b41c19739aec7e0cae6cba28b4e317d703a614
commit: 04b41c19739aec7e0cae6cba28b4e317d703a614 [39/39] pipe, splice: Pass a bio_vec to splice_actor, not a pipe_buffer
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20230315/202303150252.diIjDc15-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/commit/?id=04b41c19739aec7e0cae6cba28b4e317d703a614
        git remote add dhowells-fs https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
        git fetch --no-tags dhowells-fs pipe-list
        git checkout 04b41c19739aec7e0cae6cba28b4e317d703a614
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash fs/nfsd/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303150252.diIjDc15-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nfsd/vfs.c: In function 'nfsd_direct_splice_actor':
>> fs/nfsd/vfs.c:955:45: error: passing argument 3 of '__splice_from_pipe' from incompatible pointer type [-Werror=incompatible-pointer-types]
     955 |         return __splice_from_pipe(pipe, sd, nfsd_splice_actor);
         |                                             ^~~~~~~~~~~~~~~~~
         |                                             |
         |                                             int (*)(struct pipe_inode_info *, struct pipe_buffer *, struct splice_desc *)
   In file included from fs/nfsd/vfs.c:19:
   include/linux/splice.h:75:57: note: expected 'int (*)(struct pipe_inode_info *, struct splice_desc *, unsigned int,  struct bio_vec *)' but argument is of type 'int (*)(struct pipe_inode_info *, struct pipe_buffer *, struct splice_desc *)'
      75 |                                   struct splice_desc *, splice_actor);
         |                                                         ^~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/__splice_from_pipe +955 fs/nfsd/vfs.c

^1da177e4c3f415 Linus Torvalds 2005-04-16  951  
cf8208d0eabd1d5 Jens Axboe     2007-06-12  952  static int nfsd_direct_splice_actor(struct pipe_inode_info *pipe,
cf8208d0eabd1d5 Jens Axboe     2007-06-12  953  				    struct splice_desc *sd)
cf8208d0eabd1d5 Jens Axboe     2007-06-12  954  {
cf8208d0eabd1d5 Jens Axboe     2007-06-12 @955  	return __splice_from_pipe(pipe, sd, nfsd_splice_actor);
cf8208d0eabd1d5 Jens Axboe     2007-06-12  956  }
cf8208d0eabd1d5 Jens Axboe     2007-06-12  957  

:::::: The code at line 955 was first introduced by commit
:::::: cf8208d0eabd1d5d2625ec02a175a294c3f30d36 sendfile: convert nfsd to splice_direct_to_actor()

:::::: TO: Jens Axboe <jens.axboe@oracle.com>
:::::: CC: Jens Axboe <jens.axboe@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
