Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8A734D75
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Jun 2023 18:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686161903; x=1717697903;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AGbPkYqzS8Om8Hb7eit3V3qrj4qqbi6lxGfWB5JjG5U=;
  b=jDnRv7uJlHibXEDnDBpY3KA/B1cYSzXbIFE3z134O3A1DRh3u3Ln2PEu
   cOJe4Sr5uLia2y46RCDZVImGA2wkrTFC6TrYS+A3CTt2Bwl2FVxRtgz1h
   l6+j6nf4wxMBpLAKXlr+1LYyw5sFmHl/lUO5dnsVwlAMRme/ZqqK8HTl6
   quxkQtg0560NwKVpnLezcH4EeVck9kCyPVtlfUsloHFSd9MoFKpbWyE7D
   fbOToqzfrxnt6rFncNeYXkNaBvARdZju6clOD+0mfd5uxMXG7M+XQR7UR
   voBYudrByWWSHLjHmDDMuq2VasQuHOZtIHp7q+9V/s/KL3oR7j/xG9cEg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="336699625"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; 
   d="scan'208";a="336699625"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 11:18:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="822281386"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; 
   d="scan'208";a="822281386"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 07 Jun 2023 11:18:21 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6xjh-0006nr-0m;
	Wed, 07 Jun 2023 18:18:21 +0000
Date: Thu, 8 Jun 2023 02:17:24 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:mnt_idmap_prot 29/29] fs/mnt_idmapping.c:20:19: warning:
 no previous prototype for 'fsnotify_conn_mnt_idmap'
Message-ID: <202306080249.RdiRafZr-lkp@intel.com>
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
config: m68k-randconfig-r001-20230607 (https://download.01.org/0day-ci/archive/20230608/202306080249.RdiRafZr-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306080249.RdiRafZr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/mnt_idmapping.c:20:19: warning: no previous prototype for 'fsnotify_conn_mnt_idmap' [-Wmissing-prototypes]
      20 | struct mnt_idmap *fsnotify_conn_mnt_idmap(struct fsnotify_mark_connector *conn)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~


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
