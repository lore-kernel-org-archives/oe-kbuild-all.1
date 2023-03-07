Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A567F631
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Mar 2023 05:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678167359; x=1709703359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nLdZw5V/52dlGyBRCrG0X2rE777IGKcg0bHZnUmm6Jo=;
  b=G25HuDY71vCujscyEHwspreHegoD4MrQJVT6pt7Jy1eu9RvuPticBi2u
   QFLRlmGgcQFVz9/dnP89qZfCiudGhPOenWyEsI/AyyEe1le4kMtA4rCy+
   7F59sdbezGb51Jgll3CagndBFxdZqWXetpswVb4oHgs2f1WKkTTVmbWcp
   Khx2e4M1yrdkJbrHtGbvrXB2oRyQwhmw8YoLagDTcSvTgtJCw/Gk+78Bj
   HloHVKh2tOXLeZJ0zFIdAaf8qJL/erg7sgaVhO4tgDlYl7ac0ROrxaPjJ
   w14PSOsBGHZg1OPYnAoqi9NA2TqqKCV/rVnpcy4BzlTQpMtFfzK6BVho7
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="335786364"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="335786364"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 21:35:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="653847110"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="653847110"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 06 Mar 2023 21:35:57 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZPzL-0000zh-0j;
	Tue, 07 Mar 2023 05:35:51 +0000
Date: Tue, 7 Mar 2023 13:35:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [ammarfaizi2-block:paulmck/linux-rcu/dev.2023.02.27a 108/108]
 undefined reference to `set_nmi_torture'
Message-ID: <202303071331.kR21mwSK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block paulmck/linux-rcu/dev.2023.02.27a
head:   b171cbcbbd8e5f5f2e0638c5b5b5c77e3cc79007
commit: b171cbcbbd8e5f5f2e0638c5b5b5c77e3cc79007 [108/108] rcutorture: Test NMI diagnostics
config: parisc-randconfig-r014-20230305 (https://download.01.org/0day-ci/archive/20230307/202303071331.kR21mwSK-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/b171cbcbbd8e5f5f2e0638c5b5b5c77e3cc79007
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block paulmck/linux-rcu/dev.2023.02.27a
        git checkout b171cbcbbd8e5f5f2e0638c5b5b5c77e3cc79007
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303071331.kR21mwSK-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: kernel/rcu/rcutorture.o: in function `rcu_torture_cleanup.part.0':
>> (.text+0x2b68): undefined reference to `set_nmi_torture'
>> hppa-linux-ld: (.text+0x2b80): undefined reference to `set_nmi_torture'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
