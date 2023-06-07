Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B7A1772E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Jun 2023 17:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686159777; x=1717695777;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7DozfBAfjyOkRdD/7zhMbBNwGFWoDjVKP241UHjynlU=;
  b=Ao9cim4faSSEDUfZw16Kbv6qkLQMz6WxrM0RO/ahSe4A9YOpcu6PDmoG
   EwbY8E+T6mChghUJJdAzIYj0+qDyjft3Vku9OMpQebmILZoiwZNgt+nII
   h6pAxompOz0Gyzz9kHD1djOh7/S+aclZIlG3U9srDeLs6pBlLNks7Mniw
   6RPtJ+gF5EeSt52AWOvL3D+J63Qv+gUm0LBxYF8SNQrqUX+s2kn/pWkfw
   04AiSyd9CiEEaUHXSXaZQFbzuMMbtdoleWV8V6PCNUW6hmraX+99VNSmR
   llsHxmHrbY2hpruz3ibzP66sJCEaIzwiklFJ+u/AwYpbcOTV/FzleOifW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="357068931"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; 
   d="scan'208";a="357068931"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 10:42:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="799485186"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; 
   d="scan'208";a="799485186"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 07 Jun 2023 10:42:56 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6xBP-0006mh-28;
	Wed, 07 Jun 2023 17:42:55 +0000
Date: Thu, 8 Jun 2023 01:42:35 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:mnt_idmap_prot 29/29] fs/mnt_idmapping.c:20:19: warning:
 no previous prototype for function 'fsnotify_conn_mnt_idmap'
Message-ID: <202306080124.52KZ0dOL-lkp@intel.com>
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
commit: c2694695d45048f17fbb48fafc41a919e3cd2d60 [29/29] fs: add support for "protected" attribute on a mount
config: hexagon-buildonly-randconfig-r004-20230607 (https://download.01.org/0day-ci/archive/20230608/202306080124.52KZ0dOL-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/amir73il/linux/commit/c2694695d45048f17fbb48fafc41a919e3cd2d60
        git remote add amir73il https://github.com/amir73il/linux
        git fetch --no-tags amir73il mnt_idmap_prot
        git checkout c2694695d45048f17fbb48fafc41a919e3cd2d60
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306080124.52KZ0dOL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/mnt_idmapping.c:20:19: warning: no previous prototype for function 'fsnotify_conn_mnt_idmap' [-Wmissing-prototypes]
      20 | struct mnt_idmap *fsnotify_conn_mnt_idmap(struct fsnotify_mark_connector *conn)
         |                   ^
   fs/mnt_idmapping.c:20:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      20 | struct mnt_idmap *fsnotify_conn_mnt_idmap(struct fsnotify_mark_connector *conn)
         | ^
         | static 
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
