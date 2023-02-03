Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A48AD3A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Feb 2023 17:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675445113; x=1706981113;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xqBFLA0g13Dq7FKxO+7DPVP+Yp1n7l8JnM3SktXOyWo=;
  b=PJ9b54U6uZTOLsZ03b0oOAMaTSJdYlVK9UQRmwVWUDAxong44C1Mzp41
   Etdvn8EBWmHjq7x29n8r9KvgVe1/ZazFbTzNFsYllIiyYHJneIfaKGOJg
   K65tDugFG2DMo84bp40SyQvYe6SM+YTJuw5XbIM9yHXGVKeYAvKp/2eOM
   jV0W4bSKmwPJsnNAJj9Lr4RxYF7GXHGC4xdm7WD+GRDsAD/CDmOPHW/7I
   tauFMqZlQbyOnF/rtcMEeG/FxAZgV7srxdByHkIXtkR/4NArIWG2R+ta3
   Rc398Zs6oGSr17UGWSh8zSBAIlgsfkVUKHBr6dK1rmL50B+s47U/Xs8+5
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="393392623"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; 
   d="scan'208";a="393392623"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2023 09:25:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="911227511"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; 
   d="scan'208";a="911227511"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 03 Feb 2023 09:25:11 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNzoE-0000fR-1l;
	Fri, 03 Feb 2023 17:25:10 +0000
Date: Sat, 4 Feb 2023 01:24:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 13184/28743]
 fs/incfs/integrity.c:196:9: sparse: sparse: Variable length array is used.
Message-ID: <202302040158.Jl7o16bM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   7b8eb82135b171c1f11d8b0ea6d2cc691021840d
commit: 040942fc50b20325bb56737c32b303268bb6f35c [13184/28743] ANDROID: Initial commit of Incremental FS
config: i386-randconfig-s002 (https://download.01.org/0day-ci/archive/20230204/202302040158.Jl7o16bM-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android-4.19-stable
        git checkout 040942fc50b20325bb56737c32b303268bb6f35c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash fs/incfs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> fs/incfs/integrity.c:196:9: sparse: sparse: Variable length array is used.
   In file included from include/linux/kernel.h:14,
                    from include/linux/crypto.h:21,
                    from include/crypto/hash.h:16,
                    from fs/incfs/integrity.c:6:
   fs/incfs/integrity.c: In function 'incfs_validate_pkcs7_signature':
   include/linux/kern_levels.h:5:25: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:136:24: note: in definition of macro 'no_printk'
     136 |                 printk(fmt, ##__VA_ARGS__);             12-      |                        ^~~
   include/linux/kern_levels.h:15:25: note: in expansion of macro 'KERN_SOH'
      15 | #define KERN_DEBUG      KERN_SOH "7"    /* debug-level messages */
         |                         ^~~~~~~~
   include/linux/printk.h:346:19: note: in expansion of macro 'KERN_DEBUG'
     346 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |                   ^~~~~~~~~~
   fs/incfs/integrity.c:24:17: note: in expansion of macro 'pr_debug'
      24 |                 pr_debug("PKCS#7 parsing error. ptr=%p size=%ld err=%ldn",
         |                 ^~~~~~~~
   In file included from arch/x86/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from include/linux/crypto.h:23,
                    from include/crypto/hash.h:16,
                    from fs/incfs/integrity.c:6:
   include/asm-generic/bug.h:7:70: note: format string is defined here
       7 | #define CUT_HERE                "------------[ cut here ]------------n"
         |                                                                    ~~^~
         |                                                                      |
         |                                                                      long int
         |                                                                    -d

vim +196 fs/incfs/integrity.c

   192	
   193	int incfs_calc_digest(struct incfs_hash_alg *alg, struct mem_range data,
   194				struct mem_range digest)
   195	{
 > 196		SHASH_DESC_ON_STACK(desc, alg->shash);
   197	
   198		if (!alg || !alg->shash || !data.data || !digest.data)
   199			return -EFAULT;
   200	
   201		if (alg->digest_size > digest.len)
   202			return -EINVAL;
   203	
   204		desc->tfm = alg->shash;
   205		return crypto_shash_digest(desc, data.data, data.len, digest.data);
   206	}
   207	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
