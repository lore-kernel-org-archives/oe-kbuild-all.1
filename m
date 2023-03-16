Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0105BAD28
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Mar 2023 20:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678997745; x=1710533745;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/CUoPG9/vhwmnRPa+2v/S/d9R2nOX+g5FyYt9I5OBFI=;
  b=lY1/c2XVwUnE2ioAweSkKYV6pvcVuGpbkVbIYAU+XGtp/JonwR+Nw9sa
   yw1xntubKLs3sSZtMdXQLP26aOspZxlDTSRylA960QIcAn+o+tAWquM7m
   OSKmLz56dIdPuLneWy1T/5UCYw+IC/NHggW7K+fK/RBrSeqDUrtBUrBgM
   303TMnf/HkK1CQZeI5KZkmDKUkGALoZbzCLvBAUW/DhcXkxRhptKBqMqY
   LASwUghiHXJys/YWNogyfPjYKyF11TTnPhw5n6aX2O/0z7LO4VwUoIS8f
   EWzqtOdhiwlJUiqxRByZiZByXOOKOALyexphDDdbYucd1nCa3BZHkKJco
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="336797682"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="336797682"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 13:15:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="925892459"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="925892459"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 16 Mar 2023 13:15:42 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcu0k-0008ms-0Y;
	Thu, 16 Mar 2023 20:15:42 +0000
Date: Fri, 17 Mar 2023 04:15:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.15.y 7450/9999] WARNING: modpost:
 vmlinux.o(.text.unlikely+0x178d0): Section mismatch in reference from the
 function io_uring_drop_tctx_refs() to the variable
 .init.data:initcall_level_names
Message-ID: <202303170437.miU2xZ7e-lkp@intel.com>
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
head:   2ddbd0f967b34872290e0f98fae32b91b4de7b87
commit: f435c66d2336fff104e2c3cbfff60905733e7d89 [7450/9999] io_uring: move to separate directory
config: xtensa-randconfig-r031-20230312 (https://download.01.org/0day-ci/archive/20230317/202303170437.miU2xZ7e-lkp@intel.com/config)
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
| Link: https://lore.kernel.org/oe-kbuild-all/202303170437.miU2xZ7e-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux.o(.text.unlikely+0x178d0): Section mismatch in reference from the function io_uring_drop_tctx_refs() to the variable .init.data:initcall_level_names
The function io_uring_drop_tctx_refs() references
the variable __initdata initcall_level_names.
This is often because io_uring_drop_tctx_refs lacks a __initdata
annotation or the annotation of initcall_level_names is wrong.

Note: the below error/warnings can be found in parent commit:
<< WARNING: modpost: vmlinux.o(.text.unlikely+0x4b24): Section mismatch in reference from the function __trace_event_discard_commit() to the variable .init.data:initcall_level_names
<< WARNING: modpost: vmlinux.o(.text.unlikely+0x178d0): Section mismatch in reference from the function bfq_pos_tree_add_move() to the variable .init.data:initcall_level_names
<< WARNING: modpost: vmlinux.o(.text.unlikely+0x17a30): Section mismatch in reference from the function bitmap_equal() to the variable .init.rodata:__setup_str_initcall_blacklist

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
