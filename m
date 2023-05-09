Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E349B16427
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 May 2023 22:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683670496; x=1715206496;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xYiT93Red9JyRGuopqOl0RsTbSzpZeUBRmS4gCYdMuo=;
  b=LMnhqCjmzj/w+QdtjTqjt8EM63pMYcpKdv/PuSc7dl29Rwd0OzG7zZ+q
   z6l9jqqsp47i0Gt4vklKDLYrejcyNrUczgeyVdG7Kl4KmLgcQPOSPceaw
   UpMQTM5VDeEtLLhgqVvvXXo6LJ5SKt2l1cN58PN7tSlyiqL3XlTCuB7Wz
   9Lmsx1v35/iO59XlvqADeZvNs0V0AIS34fw9WB5e+4xIB3LdObvDCBEeH
   VVthT31JGEt8XX2pFuNx/7QWBDCm7nqnm/olr5P0ZNwBQSClaZ7F9XsaF
   wsRVqAitzIJwD9f/PWIDp4f8VSZfquz0AXoTOGQrhLWiTR81+wACaImmd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="413347048"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
   d="scan'208";a="413347048"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2023 15:14:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="1028968131"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
   d="scan'208";a="1028968131"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 09 May 2023 15:14:53 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwVbg-0002Yo-2K;
	Tue, 09 May 2023 22:14:52 +0000
Date: Wed, 10 May 2023 06:14:45 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, vineetg@rivosinc.com,
	greentime.hu@sifive.com, guoren@linux.alibaba.com,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH -next v19 23/24] riscv: Enable Vector code to be built
Message-ID: <202305100615.JXidADRN-lkp@intel.com>
References: <20230509103033.11285-24-andy.chiu@sifive.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230509103033.11285-24-andy.chiu@sifive.com>

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20230509]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Chiu/riscv-Rename-__switch_to_aux-fpu/20230509-183621
base:   next-20230509
patch link:    https://lore.kernel.org/r/20230509103033.11285-24-andy.chiu%40sifive.com
patch subject: [PATCH -next v19 23/24] riscv: Enable Vector code to be built
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20230510/202305100615.JXidADRN-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/cacd7c504c93b48a44b87516cfdbe417dca4d007
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andy-Chiu/riscv-Rename-__switch_to_aux-fpu/20230509-183621
        git checkout cacd7c504c93b48a44b87516cfdbe417dca4d007
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305100615.JXidADRN-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "riscv_v_user_allowed" [arch/riscv/kvm/kvm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
