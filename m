Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BAA3C10
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Apr 2023 20:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682886046; x=1714422046;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EH2QyYmPGyWtURbWG/Cu8AIcDAVH/mhKL8AGOZRDr7U=;
  b=U9DjNPKD8Om3G8LDG09JmcXvjMuLzCFlNT/TuC//8DFhSiQZkxlKyCH4
   XxoZ1/9yrycoXKc8cEZPJ4Btu4qQUVxP++9DvKpo1gogI/MhqMYGBsHPs
   5pRX23/6BoAZ4LfIF2Cm6Ku5fA96cBTVlB6aHj1jtjKnHfDfs3r3gj828
   dsfzmcjm7/yyJ3swXuSGwExYWVCJM5FDlY8e8FbXkuigYHaRLYZ1z1l5a
   ZEusk7yQmkTtESyycW4F321vpKXn/QWee4h+fsgHiHzvK6gC54lhZnQti
   Iyn9Ei7AjWzzhSZuwE7nWL13SDvv4kta2Bv+wkfDLDdsepgUh4GjcHzCt
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="350112387"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="350112387"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2023 13:20:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="765083916"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="765083916"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 30 Apr 2023 13:20:44 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptDXI-000077-0S;
	Sun, 30 Apr 2023 20:20:44 +0000
Date: Mon, 1 May 2023 04:20:26 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lunn:leds-offload-support-reduced-auto-netdev 1/38]
 drivers/net/dsa/qca/qca8k-leds.c:171:1: error: redefinition of
 'qca8k_setup_led_ctrl'
Message-ID: <202305010438.qnVXGjbS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git leds-offload-support-reduced-auto-netdev
head:   95771ae239994ead436141b910fabce1e1376c11
commit: b5aec9daa41c336daa56ce5653b3fc67297a5174 [1/38] net: dsa: qca8k: add LEDs basic support
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230501/202305010438.qnVXGjbS-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/lunn/linux/commit/b5aec9daa41c336daa56ce5653b3fc67297a5174
        git remote add lunn https://github.com/lunn/linux.git
        git fetch --no-tags lunn leds-offload-support-reduced-auto-netdev
        git checkout b5aec9daa41c336daa56ce5653b3fc67297a5174
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/net/dsa/qca/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305010438.qnVXGjbS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/dsa/qca/qca8k-leds.c:171:1: error: redefinition of 'qca8k_setup_led_ctrl'
     171 | qca8k_setup_led_ctrl(struct qca8k_priv *priv)
         | ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/dsa/qca/qca8k-leds.c:5:
   drivers/net/dsa/qca/qca8k.h:578:19: note: previous definition of 'qca8k_setup_led_ctrl' with type 'int(struct qca8k_priv *)'
     578 | static inline int qca8k_setup_led_ctrl(struct qca8k_priv *priv)
         |                   ^~~~~~~~~~~~~~~~~~~~


vim +/qca8k_setup_led_ctrl +171 drivers/net/dsa/qca/qca8k-leds.c

   169	
   170	int
 > 171	qca8k_setup_led_ctrl(struct qca8k_priv *priv)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
