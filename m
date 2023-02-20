Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DC07ED
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Feb 2023 16:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676911226; x=1708447226;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g1OsMMc39fsHiSYDxYqaEJx9zXpzV8hIZRJY6s4XFfE=;
  b=nxwSSoXcUVuwj0A5jYqaNDvlPNQNGgBi3g1r6xUDCrGjmAvNEenLm3HR
   Q+YqweDbKtve322eSu3ck85YNxV8geJR5YnGUhfPT+dbUcGMApAvDYpAX
   TV7AEIYTEMrscQ80mcgn5SjIyolPPYr0NgOUp9PnNAzp6FGZhg9/sfgG6
   0Her1Nh/46+0X3bF7fPKJxKCgoluiMcQ2pp+cR7+s3WOtDvhkf4A1raGA
   bmQH+WUK8GwfW40EOV0nVcasYENaLQGm8/Cb8LBgcjrugrFReQAeBR47J
   79acDLGduxwWsstKPVOpdZNjKSBeNxOyokxItNv47Tf1XlbdSXu4dWCY2
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="359909571"
X-IronPort-AV: E=Sophos;i="5.97,313,1669104000"; 
   d="scan'208";a="359909571"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2023 08:40:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="703749784"
X-IronPort-AV: E=Sophos;i="5.97,313,1669104000"; 
   d="scan'208";a="703749784"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 20 Feb 2023 08:40:24 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pU9DD-000E3h-1A;
	Mon, 20 Feb 2023 16:40:23 +0000
Date: Tue, 21 Feb 2023 00:39:45 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Dooks <ben.dooks@sifive.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Thierry Reding <thierry.reding@gmail.com>
Subject: [linux-next:master 13293/13681] drivers/pwm/pwm-dwc.c:314:1: error:
 type defaults to 'int' in declaration of 'module_pci_driver'
Message-ID: <202302210017.XT59WvsM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ben,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d2af0fa4bfa4ec29d03b449ccd43fee39501112d
commit: c901a57e39db555ad7950fd61e1470cdecc8e654 [13293/13681] pwm: dwc: allow driver to be built with COMPILE_TEST
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230221/202302210017.XT59WvsM-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=c901a57e39db555ad7950fd61e1470cdecc8e654
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout c901a57e39db555ad7950fd61e1470cdecc8e654
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/pwm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302210017.XT59WvsM-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pwm/pwm-dwc.c:314:1: warning: data definition has no type or storage class
     314 | module_pci_driver(dwc_pwm_driver);
         | ^~~~~~~~~~~~~~~~~
>> drivers/pwm/pwm-dwc.c:314:1: error: type defaults to 'int' in declaration of 'module_pci_driver' [-Werror=implicit-int]
   drivers/pwm/pwm-dwc.c:314:1: warning: parameter names (without types) in function declaration
   drivers/pwm/pwm-dwc.c:304:26: warning: 'dwc_pwm_driver' defined but not used [-Wunused-variable]
     304 | static struct pci_driver dwc_pwm_driver = {
         |                          ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +314 drivers/pwm/pwm-dwc.c

1ed2b3fca64516 Jarkko Nikula 2020-10-02  313  
1ed2b3fca64516 Jarkko Nikula 2020-10-02 @314  module_pci_driver(dwc_pwm_driver);
1ed2b3fca64516 Jarkko Nikula 2020-10-02  315  

:::::: The code at line 314 was first introduced by commit
:::::: 1ed2b3fca64516d1b3503ef21929f3b5f4f41cc6 pwm: Add DesignWare PWM Controller Driver

:::::: TO: Jarkko Nikula <jarkko.nikula@linux.intel.com>
:::::: CC: Thierry Reding <thierry.reding@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
