Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F16214229
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Jan 2025 14:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737557052; cv=none; b=LoJvSFBB8CDBJQhSDTBCNl9Tq/+5VuE4JbJPKyQnkSTVWpVlHDdRJFNbPg3L1ESkTtIA5p3mMLSY6mmiCgbTsD1dGYSjjsu0ljLtK0apOBuCX+r0sKKbcQBy/JJg1o/A+G/K6RB9+zg63N7M4AZcLdF1rjVqb4ExmDUqo609exk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737557052; c=relaxed/simple;
	bh=/XR+K/mMPboodityNB/7BQU8qHWFY/5w2OQXHe/jYlU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rsv3NG8SHCRVouto0Bcwan/imKYegUMEMyRTBM/s1Jk6braozOucLvVjiBhOQ5GU+KfWlmZO1aEKaRYEqS+jUMOIA+Psv+yVofwDG4wB6e+jAtkLw2o6LybbuwhrSXE6AN0UWfCTJ4CSGiYAtL9BNyzChqix39uaowcrD+A+9Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cJIVia9H; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cJIVia9H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737557050; x=1769093050;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/XR+K/mMPboodityNB/7BQU8qHWFY/5w2OQXHe/jYlU=;
  b=cJIVia9Hc4BHqUexJk3VR6hEN3ebqt5QcPXPvjhRqb9iRCXoZJY013CB
   1iXwW3oQU1+dnD69YmexF9JmNU8BYglR5B/wGCdVI+cZz/6b4jnWv6UpB
   gnKr0W+S/Ur4FRAVkXvwZVzoqZvya8h39Z7Z5iYQJ/H1MXFpeOClF4Z/V
   Wp1yIBHLRGTQ7FBPCHvNyNkCTv/mt8OjJBAYQhvM030MvZqSoVIpUal4o
   8tp5HAobC+kKqJPC9xCZsLlqiFJ+JedMIbCzKCRtdMDR6LdQiZtSy3EWL
   XDivEtgDG6NNualR+fl0JnZ9nvoDHaN3zEpkqrTFxBus3UFh1LKyVW2c/
   w==;
X-CSE-ConnectionGUID: tXWex4YISwKO66xFkXyZkA==
X-CSE-MsgGUID: WhN12EoeSOeqCv4Moe5Uqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37714650"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="37714650"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 06:44:09 -0800
X-CSE-ConnectionGUID: aIg8YGIoSDmIB6OYRVh3dw==
X-CSE-MsgGUID: GbSfAbyxQLugE7sCV+mx8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="107268332"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 22 Jan 2025 06:44:08 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tabxd-000ZyR-17;
	Wed, 22 Jan 2025 14:44:05 +0000
Date: Wed, 22 Jan 2025 22:43:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 0/1]
 fs/fuse/file.c:2777:19: warning: result of comparison of constant 4294967291
 with expression of type '__u16' (aka 'unsigned short') is always false
Message-ID: <202501222250.O12F0E2Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chirantan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   f2a45e7307e73a366b48781aa253aec45ff1fd5a
commit: 7f33c2b5012b1ada851aafcf8620e1723b8db574 [0/1] CHROMIUM: Support fsverity in fuse
config: i386-buildonly-randconfig-004-20250122 (https://download.01.org/0day-ci/archive/20250122/202501222250.O12F0E2Y-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250122/202501222250.O12F0E2Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501222250.O12F0E2Y-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/fuse/file.c:9:
   In file included from fs/fuse/fuse_i.h:22:
   In file included from include/linux/mm.h:1593:
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/fuse/file.c:2777:19: warning: result of comparison of constant 4294967291 with expression of type '__u16' (aka 'unsigned short') is always false [-Wtautological-constant-out-of-range-compare]
    2777 |                 if (digest_size > SIZE_MAX - sizeof(struct fsverity_digest))
         |                 ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
      56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_var'
      58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ~~~~~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_value'
      69 |         (cond) ?                                        \
         |          ^~~~
>> fs/fuse/file.c:2777:19: warning: result of comparison of constant 4294967291 with expression of type '__u16' (aka 'unsigned short') is always false [-Wtautological-constant-out-of-range-compare]
    2777 |                 if (digest_size > SIZE_MAX - sizeof(struct fsverity_digest))
         |                 ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
      56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
      58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
>> fs/fuse/file.c:2777:19: warning: result of comparison of constant 4294967291 with expression of type '__u16' (aka 'unsigned short') is always false [-Wtautological-constant-out-of-range-compare]
    2777 |                 if (digest_size > SIZE_MAX - sizeof(struct fsverity_digest))
         |                 ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
      56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:61: note: expanded from macro '__trace_if_var'
      58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   4 warnings generated.


vim +2777 fs/fuse/file.c

  2745	
  2746	static int fuse_get_ioctl_len(unsigned int cmd, unsigned long arg, size_t *len)
  2747	{
  2748		switch (cmd) {
  2749		case FS_IOC_GETFLAGS:
  2750		case FS_IOC_SETFLAGS:
  2751			*len = sizeof(int);
  2752			break;
  2753		case FS_IOC_GET_ENCRYPTION_POLICY_EX: {
  2754			__u64 policy_size;
  2755			struct fscrypt_get_policy_ex_arg __user *uarg =
  2756				(struct fscrypt_get_policy_ex_arg __user *)arg;
  2757	
  2758			if (copy_from_user(&policy_size, &uarg->policy_size,
  2759					   sizeof(policy_size)))
  2760				return -EFAULT;
  2761	
  2762			if (policy_size > SIZE_MAX - sizeof(policy_size))
  2763				return -EINVAL;
  2764	
  2765			*len = sizeof(policy_size) + policy_size;
  2766			break;
  2767		}
  2768		case FS_IOC_MEASURE_VERITY: {
  2769			__u16 digest_size;
  2770			struct fsverity_digest __user *uarg =
  2771				(struct fsverity_digest __user *)arg;
  2772	
  2773			if (copy_from_user(&digest_size, &uarg->digest_size,
  2774					   sizeof(digest_size)))
  2775				return -EFAULT;
  2776	
> 2777			if (digest_size > SIZE_MAX - sizeof(struct fsverity_digest))
  2778				return -EINVAL;
  2779	
  2780			*len = sizeof(struct fsverity_digest) + digest_size;
  2781			break;
  2782		}
  2783		default:
  2784			*len = _IOC_SIZE(cmd);
  2785			break;
  2786		}
  2787	
  2788		return 0;
  2789	}
  2790	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
