Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBC41118C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 May 2023 23:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685403948; x=1716939948;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZxkLAt+T2tTst5N4Upa2aLGwMB7qrAJ6eYEXtpheeww=;
  b=lvUElMsZf1F3EqTaEspnpCIFUvTd1hZ0rFRPd3bl+pYFckaAsRPlj8u2
   JvUKebPAnmapCa+kKe+tJGz0bu62MXQrH9XB5X6IMrZ0UgzAaX5TP5fnE
   cd0kbKkagMSFIwEcuVtaI/LwZHYUpqJJCsvg7/Jhqyz/rQDy5fgKQ0kfi
   Ho+7kZvE41cUryMbyN6moSe699zIdBveVzFMNnIAs+RZLUbCnl1YXGnFv
   so1cQnnBDlwJMVYkXlIEMfTisaWZ9r8z+xJOew77bVnLzvm/k1JUR5OD5
   VFo1bHMVg3l8PT0ScOtPBicu/2eVgAv+7IkqjgxEgFAveDTAfjhpGqS7A
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="420535405"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="420535405"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 16:45:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="683726205"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="683726205"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 29 May 2023 16:45:45 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3mYa-000LAu-1o;
	Mon, 29 May 2023 23:45:44 +0000
Date: Tue, 30 May 2023 07:45:04 +0800
From: kernel test robot <lkp@intel.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, s.shtylyov@omp.ru,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	geert+renesas@glider.be, magnus.damm@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH net-next 5/5] net: renesas: rswitch: Use per-queue rate
 limiter
Message-ID: <202305300718.pdF0iaxU-lkp@intel.com>
References: <20230529080840.1156458-6-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230529080840.1156458-6-yoshihiro.shimoda.uh@renesas.com>

Hi Yoshihiro,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Yoshihiro-Shimoda/dt-bindings-net-r8a779f0-ether-switch-Add-ACLK/20230529-161010
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230529080840.1156458-6-yoshihiro.shimoda.uh%40renesas.com
patch subject: [PATCH net-next 5/5] net: renesas: rswitch: Use per-queue rate limiter
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230530/202305300718.pdF0iaxU-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/64502944471d5b6fac76f49c06c29edfbbe43935
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yoshihiro-Shimoda/dt-bindings-net-r8a779f0-ether-switch-Add-ACLK/20230529-161010
        git checkout 64502944471d5b6fac76f49c06c29edfbbe43935
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305300718.pdF0iaxU-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__udivdi3" [drivers/net/ethernet/renesas/rswitch_drv.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
