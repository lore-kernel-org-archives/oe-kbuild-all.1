Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26C118B0F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 May 2023 13:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685109454; x=1716645454;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+WqKjCCCWuiyLCInhnhgrzFv3OUME8/+KMYAxEO7LZ8=;
  b=lHIpG+ZdCfWVk2vmyEgYdS17hKtVuiChHVKXdzRJkmASZ3lE9FkPLeGK
   JBcF+wuuTXD7X0ymeRnJ81Ck/I+VsD3ixWBO6n/N3U+/qAOwtJc+cDw9I
   gJnwHZInRgtAaBM3hqAkzfEkru0+zoSaxgtV0xnv9lSxAYyYRRXoV8J2g
   4iV/1tDKVkvjQcNS1NQW7K1RPznRA07QFTkPuSrDOnYFRVceJk+chMCPk
   D6S1MQBMTZEztcIM3oceexDS9t+YxBGB2mvAChlsEBY4sjM7D2SXeyGIC
   yUlZ5zvJg1aSQIhaNJoS5NwyPSjgefGxabT6CcUamOxnsb/OGxkYKxxao
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="357456818"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="357456818"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 06:57:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="655636946"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="655636946"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 26 May 2023 06:57:33 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2Xwi-000JNy-31;
	Fri, 26 May 2023 13:57:32 +0000
Date: Fri, 26 May 2023 21:56:47 +0800
From: kernel test robot <lkp@intel.com>
To: David Gow <davidgow@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] kunit: Move kunit_abort() call out of
 kunit_do_failed_assertion()
Message-ID: <202305262139.YWUV6EUg-lkp@intel.com>
References: <20230526075355.586335-1-davidgow@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230526075355.586335-1-davidgow@google.com>

Hi David,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.4-rc3 next-20230525]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Gow/kunit-Move-kunit_abort-call-out-of-kunit_do_failed_assertion/20230526-155531
base:   linus/master
patch link:    https://lore.kernel.org/r/20230526075355.586335-1-davidgow%40google.com
patch subject: [RFC PATCH] kunit: Move kunit_abort() call out of kunit_do_failed_assertion()
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230526/202305262139.YWUV6EUg-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/136a31fc735d9d77702b9e00bf1b45378b78f36e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review David-Gow/kunit-Move-kunit_abort-call-out-of-kunit_do_failed_assertion/20230526-155531
        git checkout 136a31fc735d9d77702b9e00bf1b45378b78f36e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305262139.YWUV6EUg-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "kunit_abort" [kernel/time/time_test.ko] undefined!
>> ERROR: modpost: "kunit_abort" [kernel/sysctl-test.ko] undefined!
>> ERROR: modpost: "kunit_abort" [mm/kfence/kfence_test.ko] undefined!
>> ERROR: modpost: "kunit_abort" [security/apparmor/apparmor_policy_unpack_test.ko] undefined!
>> ERROR: modpost: "kunit_abort" [lib/kunit/kunit-test.ko] undefined!
>> ERROR: modpost: "kunit_abort" [lib/test_list_sort.ko] undefined!
>> ERROR: modpost: "kunit_abort" [lib/test_sort.ko] undefined!
>> ERROR: modpost: "kunit_abort" [lib/bitfield_kunit.ko] undefined!
>> ERROR: modpost: "kunit_abort" [lib/hashtable_test.ko] undefined!
>> ERROR: modpost: "kunit_abort" [lib/memcpy_kunit.ko] undefined!
WARNING: modpost: suppressed 29 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
