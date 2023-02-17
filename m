Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B131D746A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Feb 2023 15:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676647820; x=1708183820;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GFTD/HarulhLFgAN4I8WZTTuel7B7bUhifM9wAhW4p8=;
  b=n5aSadVAUz1FsLY6ZKqAVFNrnjREpTRxOHjTdKlYTwdmwAXfPlrLS027
   zXVoxrPHChLpMl528IJSOqz8J/4xelZCwplxOKmzu89X1/8UTKlK3tYH/
   77Tc3mNvEqDCgGVKConkIIU3seCzXZegZDh1jGwC5O8mfH72vYnlNnpHy
   TdfMC8v3yOo9YSAch6jcfyAvIpJzDS6PtP6ld26/0VZQj5M+XuBGXMZ8Q
   If4m7Vvjd2zxaKDEMSrYAbqjUa+WN3e5lhZhMkOnO0AUY2fdq6/zGJIQu
   nvJ0gQDip60sdaFNSNtnAfdWBSzK8Mjqtim4uqKYAIP3eR2g9XBhPXzIl
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="333366738"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="333366738"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 07:30:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="813408378"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="813408378"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 17 Feb 2023 07:30:18 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pT2gj-000BaP-2e;
	Fri, 17 Feb 2023 15:30:17 +0000
Date: Fri, 17 Feb 2023 23:30:00 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [krzk-github:n/audio-wsa884x-on-top-of-audio-wsa881x-gpio 186/615]
 drivers/pci/endpoint/functions/pci-epf-test.c:829:5: warning: no previous
 prototype for 'pci_epf_test_link_up'
Message-ID: <202302172359.xdYJsY5q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/audio-wsa884x-on-top-of-audio-wsa881x-gpio
head:   04e5048badb91c86b22993d0d9fd1bf8b79c0d91
commit: 6d527be9a8e8e15b4003956846a35503fd1beb98 [186/615] PCI: endpoint: Use link_up() callback in place of LINK_UP notifier
config: ia64-randconfig-r036-20230217 (https://download.01.org/0day-ci/archive/20230217/202302172359.xdYJsY5q-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/krzk/linux/commit/6d527be9a8e8e15b4003956846a35503fd1beb98
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github n/audio-wsa884x-on-top-of-audio-wsa881x-gpio
        git checkout 6d527be9a8e8e15b4003956846a35503fd1beb98
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/pci/endpoint/functions/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302172359.xdYJsY5q-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/endpoint/functions/pci-epf-test.c:829:5: warning: no previous prototype for 'pci_epf_test_link_up' [-Wmissing-prototypes]
     829 | int pci_epf_test_link_up(struct pci_epf *epf)
         |     ^~~~~~~~~~~~~~~~~~~~


vim +/pci_epf_test_link_up +829 drivers/pci/endpoint/functions/pci-epf-test.c

   828	
 > 829	int pci_epf_test_link_up(struct pci_epf *epf)
   830	{
   831		struct pci_epf_test *epf_test = epf_get_drvdata(epf);
   832	
   833		queue_delayed_work(kpcitest_workqueue, &epf_test->cmd_handler,
   834				   msecs_to_jiffies(1));
   835	
   836		return 0;
   837	}
   838	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
