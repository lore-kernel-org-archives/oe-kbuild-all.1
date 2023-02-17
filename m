Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7216B5692
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Feb 2023 11:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676633473; x=1708169473;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1egM+cosy3MuUCMvtarYeZel0J4DvPIxt62P8K25+kA=;
  b=bYx8Pm34qiE3IMfTk++FLzK/W1V5YeLfk0t4EPKS5qAoVd//ksjBHqQK
   Qb0GW2N69+1ya/BzQRnW/c0h++OZhP+r8pRGD/Th1++IgiPLOnuoRoLRP
   uAz2BKYTwRq9iHbaqqtXAZNbADPQPEqqj0BUwL9ANN9CcYndR8c1LTwVt
   MlQ2FwIbLQwLsL/7DSJlzwokY0okwRTKgt0HBtJq76vshIjtRt+wFUMdR
   bXX9+BRbYf9CQArhjPCtCkZ+U0EQMKM/2ZTG81EHxjpg8eY5XrfbIbT3/
   0LQGoFKYf2tP6RAuXw6geZN4KkN0ZLB5D0xmksnY/khnL292aiifEbHKG
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="418187748"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="418187748"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 03:31:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="663845872"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="663845872"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 17 Feb 2023 03:31:10 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSyxJ-000BOx-26;
	Fri, 17 Feb 2023 11:31:09 +0000
Date: Fri, 17 Feb 2023 19:30:18 +0800
From: kernel test robot <lkp@intel.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>,
	linux-integrity@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jarkko Sakkinen <jarkko@kernel.org>,
	keyrings@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH 07/12] tpm: Add full HMAC and encrypt/decrypt session
 handling code
Message-ID: <202302171905.Ornmq8g3-lkp@intel.com>
References: <20230216201410.15010-8-James.Bottomley@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230216201410.15010-8-James.Bottomley@HansenPartnership.com>

Hi James,

I love your patch! Yet something to improve:

[auto build test ERROR on char-misc/char-misc-testing]
[also build test ERROR on char-misc/char-misc-next char-misc/char-misc-linus herbert-cryptodev-2.6/master herbert-crypto-2.6/master linus/master v6.2-rc8 next-20230217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/James-Bottomley/crypto-lib-implement-library-version-of-AES-in-CFB-mode/20230217-044329
patch link:    https://lore.kernel.org/r/20230216201410.15010-8-James.Bottomley%40HansenPartnership.com
patch subject: [PATCH 07/12] tpm: Add full HMAC and encrypt/decrypt session handling code
config: parisc64-defconfig (https://download.01.org/0day-ci/archive/20230217/202302171905.Ornmq8g3-lkp@intel.com/config)
compiler: hppa64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/1d4f519aa756ba5ed684fb2a2f9ad6e1fb91bdb5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review James-Bottomley/crypto-lib-implement-library-version-of-AES-in-CFB-mode/20230217-044329
        git checkout 1d4f519aa756ba5ed684fb2a2f9ad6e1fb91bdb5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302171905.Ornmq8g3-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "aescfb_encrypt" [drivers/char/tpm/tpm.ko] undefined!
>> ERROR: modpost: "aescfb_decrypt" [drivers/char/tpm/tpm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
