Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE573AE6F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Jun 2023 20:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686169903; x=1717705903;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cLIRnMyNQZ7ebY7q4g5RpbOL+Q4dWvl0WtG+GSy+lGs=;
  b=h94VKIcNPFax4UpDnc/447xagRNpwBYtJr9FFgYAMh1GyfCZ7qMqukg7
   O8GxKEmY+gCSl0zyJAo23Gi5ZS248pfZo1x3iGBQAvRhiiq6VKawHv9DF
   yxbizmq5u2yBHzuWrStm5KpxXYkQwsn7pAwV0F3lY1RgiSNjepwpg2ZMj
   4l7j8rOHQXL55A/UTBNrtNVmiqZDHfaKVnpFgXE6IwDX2BBeZvXXLdjqR
   BRTVtoY4P2kH1UIloioBB4B+umLqm87/ncNKLMAnrEa+AquNoFIqpCFH9
   srxYyWKXEZCieF+vvoMg18++xAdX0IKOGEOZIEMpvU1hUNwW8mvZEberv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="420661020"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="420661020"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 13:31:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="709682577"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="709682577"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 07 Jun 2023 13:31:41 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6zoj-0006tP-07;
	Wed, 07 Jun 2023 20:31:41 +0000
Date: Thu, 8 Jun 2023 04:30:42 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:mnt_idmap_prot 29/29] fs/mnt_idmapping.c:20:19: warning:
 no previous prototype for function 'fsnotify_conn_mnt_idmap'
Message-ID: <202306080408.yMSt7j7a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux mnt_idmap_prot
head:   8e70eb8a651b98677105e34ded526227e7afb4a8
commit: 8f4005a5f79055586a56c4bd677e49a6876ac7f6 [29/29] fs: add support for "protected" attribute on a mount
config: i386-randconfig-i063-20230607 (https://download.01.org/0day-ci/archive/20230608/202306080408.yMSt7j7a-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/amir73il/linux/commit/8f4005a5f79055586a56c4bd677e49a6876ac7f6
        git remote add amir73il https://github.com/amir73il/linux
        git fetch --no-tags amir73il mnt_idmap_prot
        git checkout 8f4005a5f79055586a56c4bd677e49a6876ac7f6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306080408.yMSt7j7a-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/mnt_idmapping.c:20:19: warning: no previous prototype for function 'fsnotify_conn_mnt_idmap' [-Wmissing-prototypes]
   struct mnt_idmap *fsnotify_conn_mnt_idmap(struct fsnotify_mark_connector *conn)
                     ^
   fs/mnt_idmapping.c:20:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct mnt_idmap *fsnotify_conn_mnt_idmap(struct fsnotify_mark_connector *conn)
   ^
   static 
   1 warning generated.


vim +/fsnotify_conn_mnt_idmap +20 fs/mnt_idmapping.c

    19	
  > 20	struct mnt_idmap *fsnotify_conn_mnt_idmap(struct fsnotify_mark_connector *conn)
    21	{
    22		return container_of(conn->obj, struct mnt_idmap, fsnotify_marks);
    23	}
    24	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
