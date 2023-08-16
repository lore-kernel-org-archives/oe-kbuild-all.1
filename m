Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A799443D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Aug 2023 08:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692174966; x=1723710966;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Djlc4kLZrpV7+3Mk9bfWd0tzJ8Qx90rkJ8yaGNVQOds=;
  b=OsHmuExB5rS5O4Uu5eu8tq7ZuyMd8BkEEI/1l/QPrCTyrFr57kynsirE
   ZpCvYNreQ2IdPMrZTLhZu6TuffPhG7gotFs9Pk2+Dg1yOOBFDXvjKDRBC
   EcZFfjRGhWMSAOXehqZu3uizWyUMnNm39bV1VZWK+VzwWsFh+Y7B+ggo/
   ebsfQ+kXAcOVx++Ce4k4BAtmm0a0J+JPBi1tMPBLW8GzvQ5sngz7GD0Ti
   JFMGjbNinpZcked9ikJ4kw2HdlcBLGP7+21QPlFRw2iT8obynUz17M6qC
   iw7AJbnzrwQ4b+Su3Puqc6wr9xMtLXj/Jz1F3SzXzqGWTzyX3LOAgC2mX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="362630558"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="362630558"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 01:36:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="763567489"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="763567489"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 16 Aug 2023 01:36:04 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWC0Z-00009C-11;
	Wed, 16 Aug 2023 08:36:03 +0000
Date: Wed, 16 Aug 2023 16:35:14 +0800
From: kernel test robot <lkp@intel.com>
To: Prasad Pandit <ppandit@redhat.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: oe-kbuild-all@lists.linux.dev, linux-crypto@vger.kernel.org,
	P J P <pjp@fedoraproject.org>
Subject: Re: [PATCH] crypto: use SRCARCH to source arch Kconfigs
Message-ID: <202308161641.v6maXREx-lkp@intel.com>
References: <20230816063107.11215-1-ppandit@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230816063107.11215-1-ppandit@redhat.com>

Hi Prasad,

kernel test robot noticed the following build errors:

[auto build test ERROR on herbert-cryptodev-2.6/master]
[also build test ERROR on herbert-crypto-2.6/master linus/master v6.5-rc6 next-20230815]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Prasad-Pandit/crypto-use-SRCARCH-to-source-arch-Kconfigs/20230816-143209
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20230816063107.11215-1-ppandit%40redhat.com
patch subject: [PATCH] crypto: use SRCARCH to source arch Kconfigs
config: xtensa-randconfig-r015-20230816 (attached as .config)
compiler: xtensa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230816/202308161641.v6maXREx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308161641.v6maXREx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> crypto/Kconfig:1424: can't open file "arch/xtensa/crypto/Kconfig"
   make[3]: *** [scripts/kconfig/Makefile:77: oldconfig] Error 1 shuffle=2313028485
   make[2]: *** [Makefile:693: oldconfig] Error 2 shuffle=2313028485
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=2313028485
   make[1]: Target 'oldconfig' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=2313028485
   make: Target 'oldconfig' not remade because of errors.
--
>> crypto/Kconfig:1424: can't open file "arch/xtensa/crypto/Kconfig"
   make[3]: *** [scripts/kconfig/Makefile:77: olddefconfig] Error 1 shuffle=2313028485
   make[2]: *** [Makefile:693: olddefconfig] Error 2 shuffle=2313028485
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=2313028485
   make[1]: Target 'olddefconfig' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=2313028485
   make: Target 'olddefconfig' not remade because of errors.


vim +1424 crypto/Kconfig

  1419	
  1420	config CRYPTO_HASH_INFO
  1421		bool
  1422	
  1423	if !KMSAN # avoid false positives from assembly
> 1424	source "arch/$(SRCARCH)/crypto/Kconfig"
  1425	endif
  1426	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
