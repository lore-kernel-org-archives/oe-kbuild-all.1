Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F7910EE
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Mar 2023 09:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677661274; x=1709197274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3llqA4wwEo1OoE+ho+CkB9YZjKNeCHK4NQLw6xlpIEk=;
  b=gEIEZ+EAjc6lSpCnvycHP0txRB2kwzucEadMpyFoNAZFb/YbPGm7hu2J
   kFNA4nh+lrPEXN4N3IZUfnbk13hyjAfK6gFKNJGAIHs4idOEBYunpgWEb
   8QG09fkhkwlosnNHMZ5XKkflAgyThHYmASiL01A8RS3TkQkpNLLW6JfWQ
   +VQRYbUuSX3un7cJ5fi5bMy1Slh2q+hH5uM368QJlBy5/y8Z6l2nVRZyM
   Rd/LGIFyNjUnCOx2JgWb/eE6uv/BcJTvUx9GBOv3sF9+iyDM/bMmxWj/f
   dYsKGAPIatUXMn4bWLaF8T35qaaEqKsLWafRFU/GQ8DecAFT4pvS9Xgn8
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="396924251"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; 
   d="scan'208";a="396924251"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 01:01:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="763530421"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; 
   d="scan'208";a="763530421"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 01 Mar 2023 01:01:11 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXIKk-00061v-33;
	Wed, 01 Mar 2023 09:01:10 +0000
Date: Wed, 1 Mar 2023 17:00:19 +0800
From: kernel test robot <lkp@intel.com>
To: Stephan Uphoff <ups@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, Guenter Roeck <groeck@chromium.org>,
	Kees Cook <keescook@chromium.org>,
	Mandeep Singh Baines <msb@chromium.org>,
	Filipe Brandenburger <filbranden@chromium.org>
Subject: [jsarha:topic/cros-sof-v4.19 715/6555]
 security/chromiumos/inode_mark.c:164:24: warning: assignment to 'struct
 fsnotify_group *' from 'int' makes pointer from integer without a cast
Message-ID: <202303011617.CUUyjNLj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.19
head:   d7a3e91d8d16d1ef8653deec5a1fffc4de034a0c
commit: 67af35d773c3a709d88b67cdf5815d275fa3cf60 [715/6555] CHROMIUM: LSM: chromiumos security module
config: arm64-randconfig-r002-20230227 (https://download.01.org/0day-ci/archive/20230301/202303011617.CUUyjNLj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jsarha/linux/commit/67af35d773c3a709d88b67cdf5815d275fa3cf60
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/cros-sof-v4.19
        git checkout 67af35d773c3a709d88b67cdf5815d275fa3cf60
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash M=security/chromiumos

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303011617.CUUyjNLj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   security/chromiumos/inode_mark.c: In function 'chromiumos_super_block_put':
   security/chromiumos/inode_mark.c:85:17: error: implicit declaration of function 'fsnotify_destroy_group' [-Werror=implicit-function-declaration]
      85 |                 fsnotify_destroy_group(sbm->fsn_group);
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   security/chromiumos/inode_mark.c: In function 'chromiumos_super_block_create':
   security/chromiumos/inode_mark.c:164:26: error: implicit declaration of function 'fsnotify_alloc_group' [-Werror=implicit-function-declaration]
     164 |         sbm->fsn_group = fsnotify_alloc_group(&chromiumos_fsn_ops);
         |                          ^~~~~~~~~~~~~~~~~~~~
>> security/chromiumos/inode_mark.c:164:24: warning: assignment to 'struct fsnotify_group *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     164 |         sbm->fsn_group = fsnotify_alloc_group(&chromiumos_fsn_ops);
         |                        ^
   security/chromiumos/inode_mark.c: In function 'chromiumos_inode_mark_create':
   security/chromiumos/inode_mark.c:212:9: error: implicit declaration of function 'fsnotify_init_mark' [-Werror=implicit-function-declaration]
     212 |         fsnotify_init_mark(&inode_mark->mark, sbm->fsn_group);
         |         ^~~~~~~~~~~~~~~~~~
   security/chromiumos/inode_mark.c:224:15: error: implicit declaration of function 'fsnotify_add_mark_locked' [-Werror=implicit-function-declaration]
     224 |         ret = fsnotify_add_mark_locked(&inode_mark->mark, &inode->i_fsnotify_marks,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~
   security/chromiumos/inode_mark.c:224:65: error: 'struct inode' has no member named 'i_fsnotify_marks'
     224 |         ret = fsnotify_add_mark_locked(&inode_mark->mark, &inode->i_fsnotify_marks,
         |                                                                 ^~
   security/chromiumos/inode_mark.c:233:9: error: implicit declaration of function 'fsnotify_put_mark'; did you mean 'fsnotify_get_cookie'? [-Werror=implicit-function-declaration]
     233 |         fsnotify_put_mark(&inode_mark->mark);
         |         ^~~~~~~~~~~~~~~~~
         |         fsnotify_get_cookie
   security/chromiumos/inode_mark.c: In function 'chromiumos_update_inode_security_policy':
   security/chromiumos/inode_mark.c:254:16: error: implicit declaration of function 'fsnotify_find_mark'; did you mean 'fsnotify_iter_inode_mark'? [-Werror=implicit-function-declaration]
     254 |         mark = fsnotify_find_mark(&inode->i_fsnotify_marks, sbm->fsn_group);
         |                ^~~~~~~~~~~~~~~~~~
         |                fsnotify_iter_inode_mark
   security/chromiumos/inode_mark.c:254:41: error: 'struct inode' has no member named 'i_fsnotify_marks'
     254 |         mark = fsnotify_find_mark(&inode->i_fsnotify_marks, sbm->fsn_group);
         |                                         ^~
   security/chromiumos/inode_mark.c:271:25: error: implicit declaration of function 'fsnotify_detach_mark' [-Werror=implicit-function-declaration]
     271 |                         fsnotify_detach_mark(mark);
         |                         ^~~~~~~~~~~~~~~~~~~~
   security/chromiumos/inode_mark.c:282:17: error: implicit declaration of function 'fsnotify_free_mark' [-Werror=implicit-function-declaration]
     282 |                 fsnotify_free_mark(mark);
         |                 ^~~~~~~~~~~~~~~~~~
   security/chromiumos/inode_mark.c: In function 'chromiumos_flush_inode_security_policies':
   security/chromiumos/inode_mark.c:296:17: error: implicit declaration of function 'fsnotify_clear_marks_by_group' [-Werror=implicit-function-declaration]
     296 |                 fsnotify_clear_marks_by_group(sbm->fsn_group,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/chromiumos/inode_mark.c: In function 'chromiumos_get_inode_security_policy':
   security/chromiumos/inode_mark.c:329:31: error: 'struct inode' has no member named 'i_fsnotify_marks'
     329 |                         &inode->i_fsnotify_marks, sbm->fsn_group);
         |                               ^~
   cc1: some warnings being treated as errors


vim +164 security/chromiumos/inode_mark.c

   148	
   149	static struct chromiumos_super_block_mark *
   150	chromiumos_super_block_create(struct super_block *sb)
   151	{
   152		struct hlist_head *hlist = chromiumos_super_block_hlist(sb);
   153		struct chromiumos_super_block_mark *sbm = NULL;
   154	
   155		WARN_ON(!mutex_is_locked(&chromiumos_super_block_hash_lock));
   156	
   157		/* No match found, create a new entry. */
   158		sbm = kzalloc(sizeof(*sbm), GFP_KERNEL);
   159		if (!sbm)
   160			return ERR_PTR(-ENOMEM);
   161	
   162		atomic_set(&sbm->refcnt, 1);
   163		sbm->sb = sb;
 > 164		sbm->fsn_group = fsnotify_alloc_group(&chromiumos_fsn_ops);
   165		if (IS_ERR(sbm->fsn_group)) {
   166			int ret = PTR_ERR(sbm->fsn_group);
   167	
   168			kfree(sbm);
   169			return ERR_PTR(ret);
   170		}
   171		sbm->fsn_group->private = sbm;
   172		hlist_add_head_rcu(&sbm->node, hlist);
   173	
   174		return sbm;
   175	}
   176	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
