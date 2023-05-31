Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B3A1FBA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 May 2023 09:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685524211; x=1717060211;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4YhRUaZGn5cQwp/4B9ElxzvgZRjL7HdXJFZqKfnGMFA=;
  b=JWuy7sTxwv3GPbcbsP6EuJ5q/kOvZUKpqt94TZylfMkHW8pHpSNcg0fg
   rlXaH7sBszwdV98+N8vibcBDzEsm5xk5q7az68MhC2RrfVmT3HuUsudEy
   jbpmWZuVkhBqpwp90knCtINqYjTkkQIO1pDoGngOQ+DmnlLFBnyj3t4rQ
   IwCpPTvfe4g0m+I9x7eTDOtzOoYHkvsuK1amdYld5MQU+kDXByismAK7q
   qWV4CJzuStcUCOPF1Lk+t2gRFFba4/txashAecMyg/sJ/lNBMiyVBjsys
   TdmwGm8FGiCv6tNrJeIv0XWqLAoCwh7g5+VGesYmoFXv/o8J9PXs5aeB1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="354028401"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="354028401"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 02:10:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="709989790"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="709989790"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 31 May 2023 02:10:09 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4HqK-0001Db-0d;
	Wed, 31 May 2023 09:10:08 +0000
Date: Wed, 31 May 2023 17:10:07 +0800
From: kernel test robot <lkp@intel.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 6093/6126] include/linux/usb/typec_mux.h:77:1:
 error: expected identifier or '(' before '{' token
Message-ID: <202305311652.OP9x8xkW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d4cee89031c80066ec461bb77b5e13a4f37d5fd2
commit: 8bf3c33a5ebf4f4faab2bafb1d237f3051ae2499 [6093/6126] Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git
config: parisc-randconfig-r025-20230531 (https://download.01.org/0day-ci/archive/20230531/202305311652.OP9x8xkW-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=8bf3c33a5ebf4f4faab2bafb1d237f3051ae2499
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 8bf3c33a5ebf4f4faab2bafb1d237f3051ae2499
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash drivers/phy/qualcomm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305311652.OP9x8xkW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/phy/qualcomm/phy-qcom-qmp-combo.c:23:
>> include/linux/usb/typec_mux.h:77:1: error: expected identifier or '(' before '{' token
      77 | {
         | ^
   include/linux/usb/typec_mux.h:76:33: warning: 'fwnode_typec_mux_get' used but never defined
      76 | static inline struct typec_mux *fwnode_typec_mux_get(struct fwnode_handle *fwnode);
         |                                 ^~~~~~~~~~~~~~~~~~~~


vim +77 include/linux/usb/typec_mux.h

a37599ebfb656c Prashant Malani 2022-06-15  75  
3524fe31538c1a Heikki Krogerus 2023-05-26  76  static inline struct typec_mux *fwnode_typec_mux_get(struct fwnode_handle *fwnode);
a37599ebfb656c Prashant Malani 2022-06-15 @77  {
a37599ebfb656c Prashant Malani 2022-06-15  78  	return NULL;
a37599ebfb656c Prashant Malani 2022-06-15  79  }
a37599ebfb656c Prashant Malani 2022-06-15  80  

:::::: The code at line 77 was first introduced by commit
:::::: a37599ebfb656c2af4ca119de556eba29b6926d6 usb: typec: mux: Add CONFIG guards for functions

:::::: TO: Prashant Malani <pmalani@chromium.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
