Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167BC10FC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Feb 2023 07:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676879712; x=1708415712;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=32t0/bxl4iiiasv7QIsw5inkvsafBn9AwV4nvETbeSw=;
  b=nNvfeSj61jMb5S8VRbanR5j961+5AbCq3BmEZhkDlwKNUY5CAvdZLrfb
   1YQ5VuG+dKWQB57CaS443E9+HVcnWZu+qRo/SXmsKkI8Fxl16ZmSQaGTL
   zLwJe4vbk3xEUl4Kyn7KdGFXpIjteefxSEMyx32grfHk+EdjvFUQGq6V6
   iP3B6KKR6CLUzCUzWQTWwlwgEKMQTDXDOn85Zmai/bmX3Tn6Zs0hp0RcS
   Um9k4fLR0MEblaVqrljO6Y46Khio02BTkFDQBzanJSedF0LwFukQza3fl
   6x3ewqNv6zmO1TW92+/xuIxlk8KfO+AH2XIFt0CuMmu4eHu9TKVdGIrtL
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="330059133"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="330059133"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 23:55:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="814045927"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="814045927"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 19 Feb 2023 23:55:07 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pU10s-000Dlf-2e;
	Mon, 20 Feb 2023 07:55:06 +0000
Date: Mon, 20 Feb 2023 15:54:33 +0800
From: kernel test robot <lkp@intel.com>
To: Masahisa Kojima <masahisa.kojima@linaro.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Sumit Garg <sumit.garg@linaro.org>, linux-kernel@vger.kernel.org,
	op-tee@lists.trustedfirmware.org
Cc: oe-kbuild-all@lists.linux.dev,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Masahisa Kojima <masahisa.kojima@linaro.org>
Subject: Re: [PATCH v2 3/4] tee: expose tee efivar register function
Message-ID: <202302201500.w7nKUwV7-lkp@intel.com>
References: <20230220051723.1257-4-masahisa.kojima@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230220051723.1257-4-masahisa.kojima@linaro.org>

Hi Masahisa,

I love your patch! Yet something to improve:

[auto build test ERROR on efi/next]
[also build test ERROR on next-20230217]
[cannot apply to linus/master v6.2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Masahisa-Kojima/efi-expose-efivar-generic-ops-register-function/20230220-132235
base:   https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git next
patch link:    https://lore.kernel.org/r/20230220051723.1257-4-masahisa.kojima%40linaro.org
patch subject: [PATCH v2 3/4] tee: expose tee efivar register function
config: arm64-randconfig-r034-20230220 (https://download.01.org/0day-ci/archive/20230220/202302201500.w7nKUwV7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c9bb47729e4c5c9999ce523e6c72785e897d9ae6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Masahisa-Kojima/efi-expose-efivar-generic-ops-register-function/20230220-132235
        git checkout c9bb47729e4c5c9999ce523e6c72785e897d9ae6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302201500.w7nKUwV7-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "efivar_supports_writes" [drivers/tee/tee.ko] undefined!
>> ERROR: modpost: "efivars_register" [drivers/tee/tee.ko] undefined!
>> ERROR: modpost: "efivars_generic_ops_register" [drivers/tee/tee.ko] undefined!
>> ERROR: modpost: "efivars_unregister" [drivers/tee/tee.ko] undefined!
>> ERROR: modpost: "efivars_generic_ops_unregister" [drivers/tee/tee.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
