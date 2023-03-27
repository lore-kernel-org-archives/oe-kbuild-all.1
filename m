Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664A463B6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Mar 2023 16:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679935821; x=1711471821;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SOT7nhA6MPObFV5f32FmyqbbzJHsbS0CdZ+uC1Hhuv0=;
  b=c8CYr0vLVm/xfrpVYMsO8cFTTFqW7bbulL4cO6ovd0E2NppsKpShHCsk
   aEvt6My0uVUkQDXdTCjedUeLscFMZbI/MQ4LqS9vzWsElG5xmYQRnSKq9
   zCw+GROat7rsG9MWRYpYTCdYIVJDNxtV+r2lJVdoZ7zjH4YnCVT8v6+Qu
   EpREXzGQw4aK+95y43QaxcLh+ynnQ+P4Wq97eYk13eV1kni3U8b0bATKX
   tGhMCSx+2GepaUdg/fhcmRyrjXO+kYgrFfP4jBGQ47OoydXcTaqr4rHNR
   rV7nCNmZubrHc6idaPFyJ3qZ7ribaM0axr+JLi/XvEEZ7jzQ+xcvvb/SE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="340350953"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="340350953"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 09:50:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="794430414"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="794430414"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 27 Mar 2023 09:50:19 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgq30-000Hr1-1s;
	Mon, 27 Mar 2023 16:50:18 +0000
Date: Tue, 28 Mar 2023 00:49:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.15.y 7197/9999] WARNING: modpost:
 vmlinux.o(.text.unlikely+0x2248c): Section mismatch in reference from the
 function io_uring_drop_tctx_refs() to the variable
 .init.data:initcall_level_names
Message-ID: <202303280053.By0fitJ5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jens,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   115472395b0a9ea522ba0e106d6dfd7a73df8ba6
commit: f435c66d2336fff104e2c3cbfff60905733e7d89 [7197/9999] io_uring: move to separate directory
config: xtensa-randconfig-r016-20230326 (https://download.01.org/0day-ci/archive/20230328/202303280053.By0fitJ5-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=f435c66d2336fff104e2c3cbfff60905733e7d89
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.15.y
        git checkout f435c66d2336fff104e2c3cbfff60905733e7d89
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=xtensa olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=xtensa SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303280053.By0fitJ5-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux.o(.text.unlikely+0x2248c): Section mismatch in reference from the function io_uring_drop_tctx_refs() to the variable .init.data:initcall_level_names
The function io_uring_drop_tctx_refs() references
the variable __initdata initcall_level_names.
This is often because io_uring_drop_tctx_refs lacks a __initdata
annotation or the annotation of initcall_level_names is wrong.

Note: the below error/warnings can be found in parent commit:
<< WARNING: modpost: vmlinux.o(.text.unlikely+0x2248c): Section mismatch in reference from the function bfq_pos_tree_add_move() to the variable .init.data:initcall_level_names
<< WARNING: modpost: vmlinux.o(.text.unlikely+0x2253c): Section mismatch in reference from the function bitmap_equal() to the variable .init.rodata:__setup_str_initcall_blacklist
<< WARNING: modpost: vmlinux.o(.data+0xa3cce8): Section mismatch in reference from the variable qed_mfw_ext_maps to the variable .init.rodata:__setup_str_initcall_blacklist
<< WARNING: modpost: vmlinux.o(.data+0xa491b0): Section mismatch in reference from the variable qede_forced_speed_maps to the variable .init.rodata:__setup_str_initcall_blacklist
<< WARNING: modpost: vmlinux.o(.data+0xa3cbf0): Section mismatch in reference from the variable qed_mfw_legacy_maps to the variable .init.rodata:__setup_str_initcall_blacklist

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
