Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5641AFC1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Mar 2023 23:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680045205; x=1711581205;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RhgE0oX8rt0UOYM+WM45s0Huo9EdDKAt/KQC7WlY+VM=;
  b=Ns66dWfrUyc3LLIl8RORHZuioTV+q6ubst5/8DcjhLu3rCXrBGF6+FN7
   R2rYE5+Pn21twrBn8gkFoehf4u1nxzRdflAjHIjii2HpxXSGfpN5KQdWL
   vnC1r6HwoziZzljqY2Q0EsEf2KWHYRrYg4i+Bo0Haya/tKafDhVgmkRnH
   qPcEVW5ZLqW0XEi5iOFuYkDTQfV+1B95AMtLSwyaasdq82mTa95egwcyK
   +GYfRsI+zcKX7KzvjSZVL1M9R+SLZQtpeePJVxg2cgrNfbR+E63rNIwjQ
   IsWO2I+mX1YkTw4MAvw63B31U6oGta8FCqDxjNijKH6SYuS45SIpZp+sR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="324619487"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="324619487"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 16:13:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="716658523"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="716658523"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 28 Mar 2023 16:13:24 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phIVH-000IwY-23;
	Tue, 28 Mar 2023 23:13:23 +0000
Date: Wed, 29 Mar 2023 07:13:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 2/2] include/linux/fsnotify.h:105:51:
 error: positional initialization of field in 'struct' declared with
 'designated_init' attribute
Message-ID: <202303290706.FnTT3hSS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   44a94ece47267e0a8ad9bd6bbf557f712c77e6d9
commit: 44a94ece47267e0a8ad9bd6bbf557f712c77e6d9 [2/2] ANDROID: fuse: Support errors from fuse daemon in canonical path
config: arm-randconfig-r046-20230327 (https://download.01.org/0day-ci/archive/20230329/202303290706.FnTT3hSS-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android13-5.15
        git checkout 44a94ece47267e0a8ad9bd6bbf557f712c77e6d9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash fs/kernfs/ fs/notify/inotify/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303290706.FnTT3hSS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/kernfs/file.c:16:
   include/linux/fsnotify.h: In function 'fsnotify_file':
>> include/linux/fsnotify.h:105:51: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     105 |                         struct path lower_path = {0};
         |                                                   ^
   include/linux/fsnotify.h:105:51: note: (near initialization for 'lower_path')
   cc1: some warnings being treated as errors
--
   In file included from include/linux/vmpressure.h:11,
                    from include/linux/memcontrol.h:18,
                    from fs/notify/inotify/inotify_user.c:32:
   include/linux/eventfd.h:76:19: error: redefinition of 'eventfd_signal_mask'
      76 | static inline int eventfd_signal_mask(struct eventfd_ctx *ctx, __u64 n,
         |                   ^~~~~~~~~~~~~~~~~~~
   include/linux/eventfd.h:70:19: note: previous definition of 'eventfd_signal_mask' with type 'int(struct eventfd_ctx *, __u64,  unsigned int)' {aka 'int(struct eventfd_ctx *, long long unsigned int,  unsigned int)'}
      70 | static inline int eventfd_signal_mask(struct eventfd_ctx *ctx, __u64 n,
         |                   ^~~~~~~~~~~~~~~~~~~
   fs/notify/inotify/inotify_user.c: In function '__do_sys_inotify_add_watch':
>> fs/notify/inotify/inotify_user.c:715:36: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     715 |         struct path alteredpath = {0};
         |                                    ^
   fs/notify/inotify/inotify_user.c:715:36: note: (near initialization for 'alteredpath')
   cc1: some warnings being treated as errors


vim +105 include/linux/fsnotify.h

    91	
    92	static inline int fsnotify_file(struct file *file, __u32 mask)
    93	{
    94		const struct path *path = &file->f_path;
    95	
    96		if (file->f_mode & FMODE_NONOTIFY)
    97			return 0;
    98	
    99		/*
   100		 * Open calls notify early on, so lower file system must be notified
   101		 */
   102		if (mask & FS_OPEN) {
   103			if (path->dentry->d_op &&
   104			    path->dentry->d_op->d_canonical_path) {
 > 105				struct path lower_path = {0};
   106				int ret;
   107	
   108				path->dentry->d_op->d_canonical_path(path, &lower_path);
   109				if (IS_ERR(lower_path.dentry))
   110					return PTR_ERR(lower_path.dentry);
   111	
   112				ret = fsnotify_parent(lower_path.dentry, mask,
   113						      &lower_path, FSNOTIFY_EVENT_PATH);
   114				path_put(&lower_path);
   115	
   116				if (ret)
   117					return ret;
   118			}
   119		}
   120	
   121		return fsnotify_parent(path->dentry, mask, path, FSNOTIFY_EVENT_PATH);
   122	}
   123	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
