Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B931E807
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 07:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678345575; x=1709881575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=74G64ygPFsQ4g/oZp2s4C2yXaUTpOj74R0yuY7CtoIE=;
  b=hAvwH7aYURq4JaDpR9ELhv2A40oLGfoUFnhHROHUaZIUA70bHKXRu2sV
   Mno1tZ80DMUC2VNnPjJNQ6BtU44g/J0PtQmVDxN9S7IyYOcQYQ/Q8tiEZ
   2ODv1N6dzPyPv237vHtbEHq0ugxGNMuyTZEGJ4A5+ADy/q/5AccConYcU
   z4O052HBS7NJIBW+RcUygVikBEdw9EvwcgSZMK8359xs7KRDl9B7GJFDK
   i5M+cM0gs27jxatnv9FRyQaAwi+rk/0T+PIF4y307lfoF4m1hsaH+JKn9
   URmjCxjGSwQzejMPV6GTRJKrwXVnYDmkAit1i+HOccfGuYlxu10Xupg0o
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="324691334"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="324691334"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 23:06:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="741440057"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="741440057"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 08 Mar 2023 23:06:13 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paALt-0002jh-0e;
	Thu, 09 Mar 2023 07:06:13 +0000
Date: Thu, 9 Mar 2023 15:05:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Baron <jbaron@akamai.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Luis Chamberlain <mcgrof@kernel.org>
Subject: [linux-next:master 766/2428] include/linux/dynamic_debug.h:307:14:
 error: implicit declaration of function 'strcmp'
Message-ID: <202303091548.VqmH7I6Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2c6433e9294b6d0f4d8f08c3c70a3eac434d3ec8
commit: b1ec22f8dc85bb0b2e82a528a7ebca377f46d4cb [766/2428] dyndbg: use the module notifier callbacks
config: arm-randconfig-r013-20230308 (https://download.01.org/0day-ci/archive/20230309/202303091548.VqmH7I6Q-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=b1ec22f8dc85bb0b2e82a528a7ebca377f46d4cb
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout b1ec22f8dc85bb0b2e82a528a7ebca377f46d4cb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303091548.VqmH7I6Q-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/module.h:30,
                    from arch/arm/boot/compressed/../../../../lib/lz4/lz4_decompress.c:39,
                    from arch/arm/boot/compressed/../../../../lib/decompress_unlz4.c:10,
                    from arch/arm/boot/compressed/decompress.c:59:
   include/linux/dynamic_debug.h: In function 'ddebug_dyndbg_module_param_cb':
>> include/linux/dynamic_debug.h:307:14: error: implicit declaration of function 'strcmp' [-Werror=implicit-function-declaration]
     307 |         if (!strcmp(param, "dyndbg")) {
         |              ^~~~~~
   include/linux/dynamic_debug.h:1:1: note: 'strcmp' is defined in header '<string.h>'; did you forget to '#include <string.h>'?
     +++ |+#include <string.h>
       1 | /* SPDX-License-Identifier: GPL-2.0 */
   arch/arm/boot/compressed/decompress.c: At top level:
   arch/arm/boot/compressed/decompress.c:62:5: warning: no previous prototype for 'do_decompress' [-Wmissing-prototypes]
      62 | int do_decompress(u8 *input, int len, u8 *output, void (*error)(char *x))
         |     ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/strcmp +307 include/linux/dynamic_debug.h

b48420c1d3019c Jim Cromie 2012-04-27  303  
b48420c1d3019c Jim Cromie 2012-04-27  304  static inline int ddebug_dyndbg_module_param_cb(char *param, char *val,
b48420c1d3019c Jim Cromie 2012-04-27  305  						const char *modname)
b48420c1d3019c Jim Cromie 2012-04-27  306  {
85d6b66d31c351 Jim Cromie 2022-09-04 @307  	if (!strcmp(param, "dyndbg")) {
516cf1be07cf3a Jim Cromie 2012-05-01  308  		/* avoid pr_warn(), which wants pr_fmt() fully defined */
516cf1be07cf3a Jim Cromie 2012-05-01  309  		printk(KERN_WARNING "dyndbg param is supported only in "
b48420c1d3019c Jim Cromie 2012-04-27  310  			"CONFIG_DYNAMIC_DEBUG builds\n");
b48420c1d3019c Jim Cromie 2012-04-27  311  		return 0; /* allow and ignore */
b48420c1d3019c Jim Cromie 2012-04-27  312  	}
b48420c1d3019c Jim Cromie 2012-04-27  313  	return -EINVAL;
b48420c1d3019c Jim Cromie 2012-04-27  314  }
b48420c1d3019c Jim Cromie 2012-04-27  315  

:::::: The code at line 307 was first introduced by commit
:::::: 85d6b66d31c35158364058ee98fb69ab5bb6a6b1 dyndbg: fix module.dyndbg handling

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
