Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A1C125DF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 May 2023 22:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685227585; x=1716763585;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8f5jdyIGkXhDQ6nKfiJw8o1xEghB8VGwol0EPXjX5mk=;
  b=SKX3x/zTBklQ+iCPYsbuqeJc/2NAPotCtCM8hDDcl//7bdswWZCxzwgq
   SnmQGJSHFOWJvVt8m50CLFALB5B+PoENYhpfiG3bxx7g+NPSo1zpUitzh
   wALEWh4JZAz6TpVaq50JkLmx9jtEQpc1geXw7mZ9IX+P8k60e+HfH/qLH
   Zu2XWGiCRKsw7z0wjQLYeFUz97T52wqNFw3hX6uVO5/4hJGC4+yrdDH3B
   4iO0cC2PwNsK+H1X0WAENGLUSRoCc/Y1L4xbmcXKdDqiVOa9jNvnDZGjh
   eJcvtpZ5qK/h8aw8CDE1mx2w3gvUzRslFHoqk4RvxR/qtyhyND5ntxr/N
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="417932983"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="417932983"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 15:46:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="708784585"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="708784585"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 27 May 2023 15:46:23 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q32g2-000KEK-25;
	Sat, 27 May 2023 22:46:22 +0000
Date: Sun, 28 May 2023 06:45:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:arcvm12-5.10 4030/27651]
 drivers/android/debug_symbols.c:50:9: sparse: sparse: cast removes address
 space '__percpu' of expression
Message-ID: <202305280643.r3FWwzQY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common arcvm12-5.10
head:   fb8d4193a852c7d62938aaf3a8c58bbc7888bb23
commit: 3fcbb15c1a91a318fb9367bee24603af24648a2d [4030/27651] ANDROID: android: Create debug_symbols driver
config: i386-randconfig-s002-20230528 (https://download.01.org/0day-ci/archive/20230528/202305280643.r3FWwzQY-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common arcvm12-5.10
        git checkout 3fcbb15c1a91a318fb9367bee24603af24648a2d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/android/ drivers/virtio/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305280643.r3FWwzQY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/android/debug_symbols.c:50:9: sparse: sparse: cast removes address space '__percpu' of expression

vim +/__percpu +50 drivers/android/debug_symbols.c

    41	
    42	/*
    43	 * ads_per_cpu_entries array contains all the per_cpu variable address information.
    44	 */
    45	static const struct ads_entry ads_per_cpu_entries[ADS_DEBUG_PER_CPU_END] = {
    46	#ifdef CONFIG_ARM64
    47		ADS_PER_CPU_ENTRY(ADS_IRQ_STACK_PTR, irq_stack_ptr),
    48	#endif
    49	#ifdef CONFIG_X86
  > 50		ADS_PER_CPU_ENTRY(ADS_IRQ_STACK_PTR, hardirq_stack_ptr),
    51	#endif
    52	};
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
