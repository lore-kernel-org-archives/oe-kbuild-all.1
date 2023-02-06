Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F8E7B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Feb 2023 17:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675703650; x=1707239650;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0rhZp1569UE7k/csBOO7yVdmzNOwNR4NncmfCCXbrNA=;
  b=EmZVmqcOYY/JEgvpyoYzTE6Ad02C7UWpw26Y0Uk80ODuvQT9t2HIw4EA
   iuEpchyTjJvsmhXXwXq7optYX23YfO38oSgF4NP7dBVg264cVqlVso+yR
   i+q3t3Ecg98qhW5KeP07CYyuAs9jNpD0msuMxh83Ee8SMwFFOTUPq43x6
   Jg5h+X+PjuF8PCVYtMbNg3s6fIvUT5sRsuDdsRFUXfqebFctSdJhjafsZ
   MH177lH7MHNmA/XoQobQlcwXWo1Cb0Y1iSeQD9T7+i3dP7e78qcN6FxIk
   D1RnKb6Y9306kUcup8RcSTxObsHnMfctXaF0htgMVYaS4qd9rXx+3Eh+W
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="327893260"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="327893260"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 09:14:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="668467473"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="668467473"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 06 Feb 2023 09:14:06 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pP54A-0002gm-17;
	Mon, 06 Feb 2023 17:14:06 +0000
Date: Tue, 7 Feb 2023 01:14:02 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	David Gow <davidgow@google.com>
Subject: lib/fortify_kunit.c:28:9: sparse: sparse: incompatible types for
 operation (==):
Message-ID: <202302070144.x9yAsFJX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2d11f342b179f1894a901f143ec7c008caba43e
commit: 875bfd5276f31d09e811d31fca638b9f4d1205e8 fortify: Add KUnit test for FORTIFY_SOURCE internals
date:   5 months ago
config: arm64-randconfig-s041-20230206 (https://download.01.org/0day-ci/archive/20230207/202302070144.x9yAsFJX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=875bfd5276f31d09e811d31fca638b9f4d1205e8
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 875bfd5276f31d09e811d31fca638b9f4d1205e8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   lib/fortify_kunit.c:28:9: sparse: sparse: undefined identifier '__compiletime_strlen'
   lib/fortify_kunit.c:28:9: sparse: sparse: undefined identifier '__compiletime_strlen'
>> lib/fortify_kunit.c:28:9: sparse: sparse: incompatible types for operation (==):
>> lib/fortify_kunit.c:28:9: sparse:    bad type const __left
>> lib/fortify_kunit.c:28:9: sparse:    int const __right
   lib/fortify_kunit.c:29:9: sparse: sparse: undefined identifier '__compiletime_strlen'
   lib/fortify_kunit.c:29:9: sparse: sparse: undefined identifier '__compiletime_strlen'
   lib/fortify_kunit.c:29:9: sparse: sparse: incompatible types for operation (==):
   lib/fortify_kunit.c:29:9: sparse:    bad type const __left
   lib/fortify_kunit.c:29:9: sparse:    int const __right
   lib/fortify_kunit.c:30:9: sparse: sparse: undefined identifier '__compiletime_strlen'
   lib/fortify_kunit.c:30:9: sparse: sparse: undefined identifier '__compiletime_strlen'
   lib/fortify_kunit.c:30:9: sparse: sparse: incompatible types for operation (==):
   lib/fortify_kunit.c:30:9: sparse:    bad type const __left
   lib/fortify_kunit.c:30:9: sparse:    int const __right
   lib/fortify_kunit.c:32:9: sparse: sparse: undefined identifier '__compiletime_strlen'
   lib/fortify_kunit.c:32:9: sparse: sparse: undefined identifier '__compiletime_strlen'
   lib/fortify_kunit.c:32:9: sparse: sparse: incompatible types for operation (==):
   lib/fortify_kunit.c:32:9: sparse:    bad type const __left
>> lib/fortify_kunit.c:32:9: sparse:    unsigned long const __right
   lib/fortify_kunit.c:34:9: sparse: sparse: undefined identifier '__compiletime_strlen'
   lib/fortify_kunit.c:34:9: sparse: sparse: undefined identifier '__compiletime_strlen'
   lib/fortify_kunit.c:34:9: sparse: sparse: incompatible types for operation (==):
   lib/fortify_kunit.c:34:9: sparse:    bad type const __left
   lib/fortify_kunit.c:34:9: sparse:    unsigned long const __right
   lib/fortify_kunit.c:56:16: sparse: sparse: undefined identifier '__compiletime_strlen'

vim +28 lib/fortify_kunit.c

    25	
    26	static void known_sizes_test(struct kunit *test)
    27	{
  > 28		KUNIT_EXPECT_EQ(test, __compiletime_strlen("88888888"), 8);
    29		KUNIT_EXPECT_EQ(test, __compiletime_strlen(array_of_10), 10);
    30		KUNIT_EXPECT_EQ(test, __compiletime_strlen(ptr_of_11), 11);
    31	
  > 32		KUNIT_EXPECT_EQ(test, __compiletime_strlen(array_unknown), SIZE_MAX);
    33		/* Externally defined and dynamically sized string pointer: */
    34		KUNIT_EXPECT_EQ(test, __compiletime_strlen(saved_command_line), SIZE_MAX);
    35	}
    36	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
