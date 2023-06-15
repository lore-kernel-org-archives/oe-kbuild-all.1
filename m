Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043DC125DA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jun 2023 11:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686829660; x=1718365660;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hMnbSBNxlqsZkuwF0ei9XjaDwDmmpxYIsmLdTsOmqwk=;
  b=a2DPD9Tc8yEuSQy+a8gdg5G3WL5DV8mvE+qkEacRzB/t+fsxeO/f9PFo
   2Or9XasQEtpWoJM4yVzlPBMwm4jK8+3k90xoGVvwNtdzMt+d4T2yp5Sep
   4VihO0Yofk59UseuaNE0XVTHB+jM+VHDelGfYYRY/tTKUaMEMxJdRZLXG
   n/JnXeR9i4AbZEWNgDhxfP0cOyZQvJD/gdsRyV9w74rk7sVou+3pWUKIh
   JzOipz2wiBNDnahSBPucqBz3DLwGuBTC2oHqQb3PiFtW4nulwVceELhJU
   ykMN0IXDJOa6hzY5ZoJ3yv8O0SHluSc2uc7DPkbnP5AELsQCZoGqTnvMI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="362272374"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="362272374"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 04:47:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="1042629224"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="1042629224"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 15 Jun 2023 04:47:33 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9lRs-0001pX-1c;
	Thu, 15 Jun 2023 11:47:32 +0000
Date: Thu, 15 Jun 2023 19:47:14 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Safonov <dima@arista.com>, David Ahern <dsahern@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Dmitry Safonov <dima@arista.com>,
	Andy Lutomirski <luto@amacapital.net>,
	Ard Biesheuvel <ardb@kernel.org>,
	Bob Gilligan <gilligan@arista.com>,
	Dan Carpenter <error27@gmail.com>,
	David Laight <David.Laight@aculab.com>,
	Donald Cassidy <dcassidy@redhat.com>,
	Eric Biggers <ebiggers@kernel.org>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Francesco Ruggeri <fruggeri05@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	Ivan Delalande <colona@arista.com>,
	Leonard Crestez <cdleonard@gmail.com>,
	Salam Noureddine <noureddine@arista.com>
Subject: Re: [PATCH v7 08/22] net/tcp: Add AO sign to RST packets
Message-ID: <202306151905.1KMdlW2R-lkp@intel.com>
References: <20230614230947.3954084-9-dima@arista.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230614230947.3954084-9-dima@arista.com>

Hi Dmitry,

kernel test robot noticed the following build errors:

[auto build test ERROR on b6dad5178ceaf23f369c3711062ce1f2afc33644]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Safonov/net-tcp-Prepare-tcp_md5sig_pool-for-TCP-AO/20230615-071334
base:   b6dad5178ceaf23f369c3711062ce1f2afc33644
patch link:    https://lore.kernel.org/r/20230614230947.3954084-9-dima%40arista.com
patch subject: [PATCH v7 08/22] net/tcp: Add AO sign to RST packets
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230615/202306151905.1KMdlW2R-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout b6dad5178ceaf23f369c3711062ce1f2afc33644
        b4 shazam https://lore.kernel.org/r/20230614230947.3954084-9-dima@arista.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306151905.1KMdlW2R-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "tcp_ao_prepare_reset" [net/ipv6/ipv6.ko] undefined!
ERROR: modpost: "tcp_v6_ao_calc_key_sk" [net/ipv6/ipv6.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
