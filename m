Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879C5BD06
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jan 2023 02:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674958145; x=1706494145;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OzSPgBDQryugxMPqwiBmvdaWadWkZatENkqom3F8dwk=;
  b=dQKZPcEZKG8TPFkgIAssChU4PwLQhuDaF9D609eUlQN8TNBCYc7B6lpF
   6OS+N9XX+3iburwIOV6mwgigbk3L6OWn/jhDLF19UvnXtyUuV8jTcPSrm
   UkaD7aXedhyfpIep2I63NZ6QCqEANfkcU7ykBTAfFfHJOWolLhegDOJnj
   otc1/9OiQPe+Yo4o1TlorOd4rL/KDWIRb/Rm5yYtD5lg1QJb4tUaBhzr/
   PWbMyjtZlBUEEPq0s3+XmBySWXvpr4JEGwMNklDS3EMKZAnpJSmuueNcM
   yaBuV0RKkndiKE2wie0YdU6MwhzWpRwTDYlVwIcL9iSR+WKsrwxTMNwbw
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="325049073"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="325049073"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 18:09:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="732289427"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="732289427"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 28 Jan 2023 18:09:03 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLx7u-0001LY-28;
	Sun, 29 Jan 2023 02:09:02 +0000
Date: Sun, 29 Jan 2023 10:08:14 +0800
From: kernel test robot <lkp@intel.com>
To: Masahisa Kojima <masahisa.kojima@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] tee: Add op-tee helper functions for variable
 access
Message-ID: <202301290936.Tla4Ic8d-lkp@intel.com>
References: <20230126132120.1661-3-masahisa.kojima@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126132120.1661-3-masahisa.kojima@linaro.org>

Hi Masahisa,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on efi/next]
[also build test ERROR on next-20230127]
[cannot apply to linus/master v6.2-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Masahisa-Kojima/efi-expose-efivar-generic-ops-register-function/20230128-170022
base:   https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git next
patch link:    https://lore.kernel.org/r/20230126132120.1661-3-masahisa.kojima%40linaro.org
patch subject: [RFC PATCH 2/2] tee: Add op-tee helper functions for variable access
config: arm-randconfig-r046-20230129 (https://download.01.org/0day-ci/archive/20230129/202301290936.Tla4Ic8d-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2ff56d7a5b6fa1214c4ef504b921b52d387e0e3b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Masahisa-Kojima/efi-expose-efivar-generic-ops-register-function/20230128-170022
        git checkout 2ff56d7a5b6fa1214c4ef504b921b52d387e0e3b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/tee/tee_core.o: in function `tee_register_efivar_ops':
>> tee_core.c:(.text+0x1122): undefined reference to `efivar_supports_writes'
>> arm-linux-gnueabi-ld: tee_core.c:(.text+0x1132): undefined reference to `efivars_generic_ops_unregister'
   arm-linux-gnueabi-ld: drivers/tee/tee_core.o: in function `tee_unregister_efivar_ops':
>> tee_core.c:(.text+0x114e): undefined reference to `efivars_unregister'
   arm-linux-gnueabi-ld: drivers/tee/tee_core.o: in function `tee_register_efivar_ops':
>> tee_core.c:(.text+0x113e): undefined reference to `efivars_register'
   arm-linux-gnueabi-ld: drivers/tee/tee_core.o: in function `tee_unregister_efivar_ops':
>> tee_core.c:(.text+0x1156): undefined reference to `efivars_generic_ops_register'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
