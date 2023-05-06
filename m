Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF441FDA
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 May 2023 10:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683369672; x=1714905672;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=21QhRBCmRyk6kDdl0vqD8tbSXIMBRgStpNLsCFJKNaY=;
  b=nHCjC4vHbS0i8fcdLX3RHX9PfKmcQqxITtjO8JaXOp3oZHoPyD6EkNjZ
   fGT1C6zpzdi/jpCay6wBPryq81GTAahadbVsBDJBKAmCXikyhjmWQOcD5
   Cx+3ucaty2C9u474YmQI32b52jJ5eopiGwDsSEUiJSm9gCOo5ozm1+8gG
   KLBBYTLI1UGla7xVKuKlokIaH3qgAIWFpYgrvsnNF4EndwveMoz/mOuAP
   Hasp9xuZjcUoi/zAOp9olVJdvCibsmk9BaXf2i2sydgft5VWVPxrM2lKW
   2AR6+V4Qa1BEO3v6cUF15uu3LJTQ81PHThkAq/o0NfNp7HkgeCYmA+qda
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="328993102"
X-IronPort-AV: E=Sophos;i="5.99,254,1677571200"; 
   d="scan'208";a="328993102"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2023 03:41:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="697904352"
X-IronPort-AV: E=Sophos;i="5.99,254,1677571200"; 
   d="scan'208";a="697904352"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 May 2023 03:41:10 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvFLh-00009O-1k;
	Sat, 06 May 2023 10:41:09 +0000
Date: Sat, 6 May 2023 18:40:40 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [stable:linux-5.10.y 127/9999] WARNING: modpost:
 vmlinux.o(.text.unlikely+0x25c0): Section mismatch in reference from the
 function trace_define_generic_fields() to the variable
 .init.data:initcall_level_names
Message-ID: <202305061834.71GPhELu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Steven,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
head:   f1b32fda06d2cfb8eea9680b0ba7a8b0d5b81eeb
commit: 092a58f0d9ef5013ad3c197a9a5ecf2d7f797a88 [127/9999] tracing: Fix pid filtering when triggers are attached
config: xtensa-randconfig-r016-20230430 (https://download.01.org/0day-ci/archive/20230506/202305061834.71GPhELu-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=092a58f0d9ef5013ad3c197a9a5ecf2d7f797a88
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.10.y
        git checkout 092a58f0d9ef5013ad3c197a9a5ecf2d7f797a88
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=xtensa olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=xtensa SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305061834.71GPhELu-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

<< WARNING: modpost: vmlinux.o(.text.unlikely+0x243c): Section mismatch in reference from the function trace_printk_seq() to the variable .init.data:initcall_level_names
>> WARNING: modpost: vmlinux.o(.text.unlikely+0x25c0): Section mismatch in reference from the function trace_define_generic_fields() to the variable .init.data:initcall_level_names
The function trace_define_generic_fields() references
the variable __initdata initcall_level_names.
This is often because trace_define_generic_fields lacks a __initdata
annotation or the annotation of initcall_level_names is wrong.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
