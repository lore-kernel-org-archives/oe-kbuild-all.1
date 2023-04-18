Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FA415B8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Apr 2023 04:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681792044; x=1713328044;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Fh1N101s7G5YCKNgpWcaH7JMYf2mP+JXTUnlODC/Nn4=;
  b=bxaKR4uNhB6UIG+Aakyg4O9CeEb60D+Rgt9Ncibm6BxaL4rB3PDO30yJ
   yxZFsU7ayB8qxtvli/+mhgLBZ4wX92nLTUX1mHVtEUeT+EwpXeWQcK2F+
   TAi7zgpgIy114OG4uvw2RRDOXoEDMocwYnIwEm0QdE6zW8g3Z4p7TlmPv
   72AsgpTe2Lefe1XKY2d+iYQJoNEQJYlm9mDMXPE2efKXw0l2m8BF7AxE0
   mkqYTZVtLdKJxmzPjOezuI8X2V8I+p1rGvTwUCTJd+MFPYueBonZF2T6+
   65xi3QO72R0GMAV2RM2jLm0PSwuDSNQByEGoKVJZBwI10ToLj80emoMOW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="407967481"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; 
   d="scan'208";a="407967481"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 21:27:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="802398707"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; 
   d="scan'208";a="802398707"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 17 Apr 2023 21:27:20 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pocw3-000cyd-2D;
	Tue, 18 Apr 2023 04:27:19 +0000
Date: Tue, 18 Apr 2023 12:27:04 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Rosenberg <drosen@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 30/37] fuse: Provide registration functions for
 fuse-bpf
Message-ID: <202304181233.f0Sz5uJ1-lkp@intel.com>
References: <20230418014037.2412394-31-drosen@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230418014037.2412394-31-drosen@google.com>

Hi Daniel,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 49859de997c3115b85544bce6b6ceab60a7fabc4]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Rosenberg/bpf-verifier-Accept-dynptr-mem-as-mem-in-herlpers/20230418-094717
base:   49859de997c3115b85544bce6b6ceab60a7fabc4
patch link:    https://lore.kernel.org/r/20230418014037.2412394-31-drosen%40google.com
patch subject: [RFC PATCH v3 30/37] fuse: Provide registration functions for fuse-bpf
config: i386-randconfig-a004-20230417 (https://download.01.org/0day-ci/archive/20230418/202304181233.f0Sz5uJ1-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/ff2c02ca675655ec88e525c51defda64d7774b0d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Daniel-Rosenberg/bpf-verifier-Accept-dynptr-mem-as-mem-in-herlpers/20230418-094717
        git checkout ff2c02ca675655ec88e525c51defda64d7774b0d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304181233.f0Sz5uJ1-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   ld: fs/fuse/dir.o: in function `init_fuse_bpf':
>> fs/fuse/fuse_i.h:1403: multiple definition of `init_fuse_bpf'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1403: first defined here
   ld: fs/fuse/dir.o: in function `uninit_fuse_bpf':
>> fs/fuse/fuse_i.h:1406: multiple definition of `uninit_fuse_bpf'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1406: first defined here
   ld: fs/fuse/dir.o: in function `find_fuse_ops':
>> fs/fuse/fuse_i.h:1410: multiple definition of `find_fuse_ops'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1410: first defined here
   ld: fs/fuse/dir.o: in function `get_fuse_ops':
>> fs/fuse/fuse_i.h:1410: multiple definition of `get_fuse_ops'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1410: first defined here
   ld: fs/fuse/dir.o: in function `put_fuse_ops':
>> fs/fuse/fuse_i.h:1417: multiple definition of `put_fuse_ops'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1417: first defined here
   ld: fs/fuse/file.o: in function `init_fuse_bpf':
>> fs/fuse/fuse_i.h:1403: multiple definition of `init_fuse_bpf'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1403: first defined here
   ld: fs/fuse/file.o: in function `uninit_fuse_bpf':
>> fs/fuse/fuse_i.h:1406: multiple definition of `uninit_fuse_bpf'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1406: first defined here
   ld: fs/fuse/file.o: in function `find_fuse_ops':
>> fs/fuse/fuse_i.h:1410: multiple definition of `find_fuse_ops'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1410: first defined here
   ld: fs/fuse/file.o: in function `get_fuse_ops':
>> fs/fuse/fuse_i.h:1410: multiple definition of `get_fuse_ops'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1410: first defined here
   ld: fs/fuse/file.o: in function `put_fuse_ops':
>> fs/fuse/fuse_i.h:1417: multiple definition of `put_fuse_ops'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1417: first defined here
   ld: fs/fuse/inode.o: in function `init_fuse_bpf':
>> fs/fuse/fuse_i.h:1403: multiple definition of `init_fuse_bpf'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1403: first defined here
   ld: fs/fuse/inode.o: in function `uninit_fuse_bpf':
>> fs/fuse/fuse_i.h:1406: multiple definition of `uninit_fuse_bpf'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1406: first defined here
   ld: fs/fuse/inode.o: in function `find_fuse_ops':
>> fs/fuse/fuse_i.h:1410: multiple definition of `find_fuse_ops'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1410: first defined here
   ld: fs/fuse/inode.o: in function `get_fuse_ops':
>> fs/fuse/fuse_i.h:1410: multiple definition of `get_fuse_ops'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1410: first defined here
   ld: fs/fuse/inode.o: in function `put_fuse_ops':
>> fs/fuse/fuse_i.h:1417: multiple definition of `put_fuse_ops'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1417: first defined here
   ld: fs/fuse/control.o: in function `init_fuse_bpf':
>> fs/fuse/fuse_i.h:1403: multiple definition of `init_fuse_bpf'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1403: first defined here
   ld: fs/fuse/control.o: in function `uninit_fuse_bpf':
>> fs/fuse/fuse_i.h:1406: multiple definition of `uninit_fuse_bpf'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1406: first defined here
   ld: fs/fuse/control.o: in function `find_fuse_ops':
>> fs/fuse/fuse_i.h:1410: multiple definition of `find_fuse_ops'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1410: first defined here
   ld: fs/fuse/control.o: in function `get_fuse_ops':
>> fs/fuse/fuse_i.h:1410: multiple definition of `get_fuse_ops'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1410: first defined here
   ld: fs/fuse/control.o: in function `put_fuse_ops':
>> fs/fuse/fuse_i.h:1417: multiple definition of `put_fuse_ops'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1417: first defined here
   ld: fs/fuse/xattr.o: in function `init_fuse_bpf':
   fs/fuse/fuse_i.h:1403: multiple definition of `init_fuse_bpf'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1403: first defined here
   ld: fs/fuse/xattr.o: in function `uninit_fuse_bpf':
   fs/fuse/fuse_i.h:1406: multiple definition of `uninit_fuse_bpf'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1406: first defined here
   ld: fs/fuse/xattr.o: in function `find_fuse_ops':
   fs/fuse/fuse_i.h:1410: multiple definition of `find_fuse_ops'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1410: first defined here
   ld: fs/fuse/xattr.o: in function `get_fuse_ops':
   fs/fuse/fuse_i.h:1410: multiple definition of `get_fuse_ops'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1410: first defined here
   ld: fs/fuse/xattr.o: in function `put_fuse_ops':
   fs/fuse/fuse_i.h:1417: multiple definition of `put_fuse_ops'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1417: first defined here
   ld: fs/fuse/acl.o: in function `init_fuse_bpf':
   fs/fuse/fuse_i.h:1403: multiple definition of `init_fuse_bpf'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1403: first defined here
   ld: fs/fuse/acl.o: in function `uninit_fuse_bpf':
   fs/fuse/fuse_i.h:1406: multiple definition of `uninit_fuse_bpf'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1406: first defined here
   ld: fs/fuse/acl.o: in function `find_fuse_ops':
   fs/fuse/fuse_i.h:1410: multiple definition of `find_fuse_ops'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1410: first defined here
   ld: fs/fuse/acl.o: in function `get_fuse_ops':
   fs/fuse/fuse_i.h:1410: multiple definition of `get_fuse_ops'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1410: first defined here
   ld: fs/fuse/acl.o: in function `put_fuse_ops':
   fs/fuse/fuse_i.h:1417: multiple definition of `put_fuse_ops'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1417: first defined here
   ld: fs/fuse/readdir.o: in function `init_fuse_bpf':
   fs/fuse/fuse_i.h:1403: multiple definition of `init_fuse_bpf'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1403: first defined here
   ld: fs/fuse/readdir.o: in function `uninit_fuse_bpf':
   fs/fuse/fuse_i.h:1406: multiple definition of `uninit_fuse_bpf'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1406: first defined here
   ld: fs/fuse/readdir.o: in function `find_fuse_ops':
   fs/fuse/fuse_i.h:1410: multiple definition of `find_fuse_ops'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1410: first defined here
   ld: fs/fuse/readdir.o: in function `get_fuse_ops':
   fs/fuse/fuse_i.h:1410: multiple definition of `get_fuse_ops'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1410: first defined here
   ld: fs/fuse/readdir.o: in function `put_fuse_ops':
   fs/fuse/fuse_i.h:1417: multiple definition of `put_fuse_ops'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1417: first defined here
   ld: fs/fuse/ioctl.o: in function `init_fuse_bpf':
   fs/fuse/fuse_i.h:1403: multiple definition of `init_fuse_bpf'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1403: first defined here
   ld: fs/fuse/ioctl.o: in function `uninit_fuse_bpf':
   fs/fuse/fuse_i.h:1406: multiple definition of `uninit_fuse_bpf'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1406: first defined here
   ld: fs/fuse/ioctl.o: in function `find_fuse_ops':
   fs/fuse/fuse_i.h:1410: multiple definition of `find_fuse_ops'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1410: first defined here
   ld: fs/fuse/ioctl.o: in function `get_fuse_ops':
   fs/fuse/fuse_i.h:1410: multiple definition of `get_fuse_ops'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1410: first defined here
   ld: fs/fuse/ioctl.o: in function `put_fuse_ops':
   fs/fuse/fuse_i.h:1417: multiple definition of `put_fuse_ops'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1417: first defined here
   ld: fs/fuse/cuse.o: in function `init_fuse_bpf':
   fs/fuse/fuse_i.h:1403: multiple definition of `init_fuse_bpf'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1403: first defined here
   ld: fs/fuse/cuse.o: in function `uninit_fuse_bpf':
   fs/fuse/fuse_i.h:1406: multiple definition of `uninit_fuse_bpf'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1406: first defined here
   ld: fs/fuse/cuse.o: in function `find_fuse_ops':
   fs/fuse/fuse_i.h:1410: multiple definition of `find_fuse_ops'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1410: first defined here
   ld: fs/fuse/cuse.o: in function `get_fuse_ops':
   fs/fuse/fuse_i.h:1410: multiple definition of `get_fuse_ops'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1410: first defined here
   ld: fs/fuse/cuse.o: in function `put_fuse_ops':
   fs/fuse/fuse_i.h:1417: multiple definition of `put_fuse_ops'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1417: first defined here
   ld: fs/fuse/virtio_fs.o: in function `init_fuse_bpf':
   fs/fuse/fuse_i.h:1403: multiple definition of `init_fuse_bpf'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1403: first defined here
   ld: fs/fuse/virtio_fs.o: in function `uninit_fuse_bpf':
   fs/fuse/fuse_i.h:1406: multiple definition of `uninit_fuse_bpf'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1406: first defined here
   ld: fs/fuse/virtio_fs.o: in function `find_fuse_ops':
   fs/fuse/fuse_i.h:1410: multiple definition of `find_fuse_ops'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1410: first defined here
   ld: fs/fuse/virtio_fs.o: in function `get_fuse_ops':
   fs/fuse/fuse_i.h:1410: multiple definition of `get_fuse_ops'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1410: first defined here
   ld: fs/fuse/virtio_fs.o: in function `put_fuse_ops':
   fs/fuse/fuse_i.h:1417: multiple definition of `put_fuse_ops'; fs/fuse/dev.o:fs/fuse/fuse_i.h:1417: first defined here
--
   In file included from fs/fuse/inode.c:9:
>> fs/fuse/fuse_i.h:1400:5: warning: no previous prototype for 'init_fuse_bpf' [-Wmissing-prototypes]
    1400 | int init_fuse_bpf(void)
         |     ^~~~~~~~~~~~~
>> fs/fuse/fuse_i.h:1404:6: warning: no previous prototype for 'uninit_fuse_bpf' [-Wmissing-prototypes]
    1404 | void uninit_fuse_bpf(void)
         |      ^~~~~~~~~~~~~~~
>> fs/fuse/fuse_i.h:1407:18: warning: no previous prototype for 'find_fuse_ops' [-Wmissing-prototypes]
    1407 | struct fuse_ops *find_fuse_ops(const char *key)
         |                  ^~~~~~~~~~~~~
>> fs/fuse/fuse_i.h:1411:18: warning: no previous prototype for 'get_fuse_ops' [-Wmissing-prototypes]
    1411 | struct fuse_ops *get_fuse_ops(struct fuse_ops *ops)
         |                  ^~~~~~~~~~~~
>> fs/fuse/fuse_i.h:1415:6: warning: no previous prototype for 'put_fuse_ops' [-Wmissing-prototypes]
    1415 | void put_fuse_ops(struct fuse_ops *ops)
         |      ^~~~~~~~~~~~


vim +1403 fs/fuse/fuse_i.h

  1385	
  1386	struct fuse_file *fuse_file_open(struct fuse_mount *fm, u64 nodeid,
  1387					 unsigned int open_flags, bool isdir,
  1388					 struct file *file);
  1389	void fuse_file_release(struct inode *inode, struct fuse_file *ff,
  1390			       unsigned int open_flags, fl_owner_t id, bool isdir);
  1391	
  1392	/* backing.c */
  1393	#ifdef CONFIG_FUSE_BPF
  1394	struct fuse_ops *find_fuse_ops(const char *key);
  1395	struct fuse_ops *get_fuse_ops(struct fuse_ops *ops);
  1396	void put_fuse_ops(struct fuse_ops *ops);
  1397	int init_fuse_bpf(void);
  1398	void uninit_fuse_bpf(void);
  1399	#else
> 1400	int init_fuse_bpf(void)
  1401	{
  1402		return -EOPNOTSUPP;
> 1403	}
> 1404	void uninit_fuse_bpf(void)
  1405	{
> 1406	}
> 1407	struct fuse_ops *find_fuse_ops(const char *key)
  1408	{
  1409		return NULL;
> 1410	}
> 1411	struct fuse_ops *get_fuse_ops(struct fuse_ops *ops)
  1412	{
  1413		return NULL;
  1414	}
> 1415	void put_fuse_ops(struct fuse_ops *ops)
  1416	{
> 1417	}
  1418	#endif
  1419	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
