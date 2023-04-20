Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CCB8C06
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Apr 2023 14:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682001287; x=1713537287;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kSjI3HhxTzDOUolW8Wi2neR0i4fYgQMXc/J7y+Hxqsc=;
  b=jWgYtVE9N4pp4HokjJxSFOXZRBIcR4sWm2qkURx+VlRdEFsQO7eE1TP2
   wUKJuAGQXKKvvMWVzNO8aZPKGoS8oAUh6vRHICTQt5kdIfYuOyfsMZQuZ
   amhYYCfdrm6t4Hb4q8t0b6DKs9YuyEYEOkAtYV6iE7CgCLxCVCP4Z9Pag
   mTUI0Oz+smylyRaMW+0/oB48wtBgvpLW8Db5zU5Yk6Xz0MvqT7OnKXxeL
   vZTiaQpiA+Q1BL7ciSugVd+MkqXCL2RP8Li9pTt2sXEsz7AavPNvNQLdm
   AujxTFoBBcEEoYjNO5FTS5KnAVuxPnBvAS/Us65hlRaNNq2AqZAhccYD0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="343222901"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; 
   d="scan'208";a="343222901"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 07:34:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="722387981"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; 
   d="scan'208";a="722387981"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 20 Apr 2023 07:34:43 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppVMx-000ft4-0M;
	Thu, 20 Apr 2023 14:34:43 +0000
Date: Thu, 20 Apr 2023 22:34:12 +0800
From: kernel test robot <lkp@intel.com>
To: Hangbin Liu <liuhangbin@gmail.com>, netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jay Vosburgh <j.vosburgh@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>, Liang Li <liali@redhat.com>,
	Vincent Bernat <vincent@bernat.ch>,
	Hangbin Liu <liuhangbin@gmail.com>
Subject: Re: [PATCH net 1/4] bonding: fix send_peer_notif overflow
Message-ID: <202304202222.eUq4Xfv8-lkp@intel.com>
References: <20230420082230.2968883-2-liuhangbin@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230420082230.2968883-2-liuhangbin@gmail.com>

Hi Hangbin,

kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Hangbin-Liu/bonding-fix-send_peer_notif-overflow/20230420-162411
patch link:    https://lore.kernel.org/r/20230420082230.2968883-2-liuhangbin%40gmail.com
patch subject: [PATCH net 1/4] bonding: fix send_peer_notif overflow
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20230420/202304202222.eUq4Xfv8-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/5bf7296696ea0aa3997bf310fae2aa5cf62a3af5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Hangbin-Liu/bonding-fix-send_peer_notif-overflow/20230420-162411
        git checkout 5bf7296696ea0aa3997bf310fae2aa5cf62a3af5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304202222.eUq4Xfv8-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__umoddi3" [drivers/net/bonding/bonding.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
