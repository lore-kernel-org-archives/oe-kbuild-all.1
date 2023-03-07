Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F496FC5
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Mar 2023 13:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678194909; x=1709730909;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KMD+7nISHYDsimyFeL3XOVVSYfDFAzKU6izTpU0r/s4=;
  b=G0A49716Rq4YUTMKD8hQLDBUmCXy4XsYIYVkfWTmnh/d2c/vNTmyylgB
   zf05am0vCFf9PL6gYgmlDCh+v+fBwxjL3kC6fDvUm7OfazOE/Mr79Bml3
   LFwDH+OrhgFbZedVlFyuMTwQ3zA02TcYJxDa79hzWokYmZ9hsSuqVyM1I
   r76I30L3t6Y6AgtBWJsrPPKG3S5RNOUTI02p52sT2kprHwbFQ41ZQjOYC
   t7LE3GUftgTkkJzsnrkJlAPfzZkoymtTflOpmY9TcR0TL/f8wCXcV8wRx
   X0bQhCycWMdw7lWKt1lnjg8epVADUkNyElh9SsRTlC1VcL6AjXB0qK6xR
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="319676670"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; 
   d="scan'208";a="319676670"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 05:15:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="709050434"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="709050434"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 07 Mar 2023 05:15:07 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZX9m-0001LO-26;
	Tue, 07 Mar 2023 13:15:06 +0000
Date: Tue, 7 Mar 2023 21:14:16 +0800
From: kernel test robot <lkp@intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [ammarfaizi2-block:viro/vfs/work.fd 7/8]
 kernel/cgroup/cgroup.c:6861:13: error: incompatible types when assigning to
 type 'struct fd *' from type 'struct fd'
Message-ID: <202303072110.O557Zf2W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block viro/vfs/work.fd
head:   792be394ebd3f30e973319f4a8019c294ca02ce2
commit: 96416baecdcc05aa7bfe16986dd9955e613ed808 [7/8] cgroup_get_from_fd(): switch to fdget_raw()
config: riscv-buildonly-randconfig-r006-20230305 (https://download.01.org/0day-ci/archive/20230307/202303072110.O557Zf2W-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/96416baecdcc05aa7bfe16986dd9955e613ed808
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block viro/vfs/work.fd
        git checkout 96416baecdcc05aa7bfe16986dd9955e613ed808
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303072110.O557Zf2W-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/cgroup/cgroup.c: In function 'cgroup_v1v2_get_from_fd':
>> kernel/cgroup/cgroup.c:6861:13: error: incompatible types when assigning to type 'struct fd *' from type 'struct fd'
    6861 |         f = fdget_raw(fd);
         |             ^~~~~~~~~
>> kernel/cgroup/cgroup.c:6862:15: error: 'f' is a pointer; did you mean to use '->'?
    6862 |         if (!f.file)
         |               ^
         |               ->
   kernel/cgroup/cgroup.c:6865:43: error: 'f' is a pointer; did you mean to use '->'?
    6865 |         cgrp = cgroup_v1v2_get_from_file(f.file);
         |                                           ^
         |                                           ->
>> kernel/cgroup/cgroup.c:6866:15: error: incompatible type for argument 1 of 'fdput'
    6866 |         fdput(f);
         |               ^
         |               |
         |               struct fd *
   In file included from include/linux/kernel_read_file.h:5,
                    from include/linux/security.h:26,
                    from include/linux/fs_context.h:14,
                    from include/linux/fs_parser.h:11,
                    from kernel/cgroup/cgroup-internal.h:10,
                    from kernel/cgroup/cgroup.c:31:
   include/linux/file.h:42:36: note: expected 'struct fd' but argument is of type 'struct fd *'
      42 | static inline void fdput(struct fd fd)
         |                          ~~~~~~~~~~^~


vim +6861 kernel/cgroup/cgroup.c

  6846	
  6847	/**
  6848	 * cgroup_v1v2_get_from_fd - get a cgroup pointer from a fd
  6849	 * @fd: fd obtained by open(cgroup_dir)
  6850	 *
  6851	 * Find the cgroup from a fd which should be obtained
  6852	 * by opening a cgroup directory.  Returns a pointer to the
  6853	 * cgroup on success. ERR_PTR is returned if the cgroup
  6854	 * cannot be found.
  6855	 */
  6856	struct cgroup *cgroup_v1v2_get_from_fd(int fd)
  6857	{
  6858		struct cgroup *cgrp;
  6859		struct fd *f;
  6860	
> 6861		f = fdget_raw(fd);
> 6862		if (!f.file)
  6863			return ERR_PTR(-EBADF);
  6864	
  6865		cgrp = cgroup_v1v2_get_from_file(f.file);
> 6866		fdput(f);
  6867		return cgrp;
  6868	}
  6869	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
