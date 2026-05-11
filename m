Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5391363C62
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 May 2026 11:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778497556; cv=none; b=pm1BwoUuqvqB9tkVu2DN7wJ/9/u+1GEpWW9c9ICBY2s0ZZMQ2kZHs4a6PlXVt98p56PhB4JzqMtPnO6MrtFN4eSRuqwRxlpNbMf256cl3q08j+rvYyJ6zoCL14/oYZWXk1qel6g96/uMRHuh/ZI3124E3e55cE9Vns9FPk9rKMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778497556; c=relaxed/simple;
	bh=GCpY/f4il1G/gPBYXXM8q5OZ17O/oyd0gH9uy9d5YeY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VzlffPIZHlQPhjgWrzcZTYiEnecTGrHGx0ygxcC2xu/AqmUMzefQTXZLfTXN9YdaRuLCGxNiKGfnCw0RinVLDXs4/FVCkFQyVnkdbLbZ2agSe2Y40ZRz5Ig4KNkGQvFUhZWzcHiQbPgTgijJExKxn+dhSgC3mB8Wrot8torosiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KZgGsO7C; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KZgGsO7C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778497556; x=1810033556;
  h=date:from:to:cc:subject:message-id;
  bh=GCpY/f4il1G/gPBYXXM8q5OZ17O/oyd0gH9uy9d5YeY=;
  b=KZgGsO7CXC/IChK501HEpfkVAXFEnanw2LAVt7n0wa/GVfm37xcSV7Xj
   I6ibupPIhk1zuJFnWzZW4pr42KsX/hQ76Pwee1yhwztNFQ6zvntLBcYpK
   sW1io9rRzl7Yx4eV5s3H5ZpsnPR/WN9qRTCp8XK0FYMLRHHUozat6q2ax
   qI0kZqFlZ0vhbpTbZ7IOFNtF30fyogKzoZJ9GSAaDuzOpE2p2efPvSv1m
   vcLGum8v9HqpMjRh1wESVfEbDpqSdiEgCdlsaUuX2xNfomR8fvowQyHrX
   46UCy1oo98SBTrwFvBGH5FBv3xIMba4qXSJwSwgfK5/5vZAegIEGwtt7T
   Q==;
X-CSE-ConnectionGUID: wmrTakkPRDe4vEi6/iq5YA==
X-CSE-MsgGUID: 8Jm24MT1TqO+GbR4HENloQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="82993198"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="82993198"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 04:05:55 -0700
X-CSE-ConnectionGUID: mULpm9+2SDWRfipko0YsVQ==
X-CSE-MsgGUID: AHCLOyl7S5K7zbvRKEvS4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="236448765"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 May 2026 04:05:52 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMOSM-000000000SL-2QAa;
	Mon, 11 May 2026 11:05:50 +0000
Date: Mon, 11 May 2026 19:05:21 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 0/1]
 fs/fuse/file.c:2777:19: warning: result of comparison of constant 4294967291
 with expression of type '__u16' (aka 'unsigned short') is always false
Message-ID: <202605111916.Wsmqz1T6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Chirantan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   80e99694479e5e9fe7c6230aad1327bbb9c655be
commit: 7f33c2b5012b1ada851aafcf8620e1723b8db574 [0/1] CHROMIUM: Support fsverity in fuse
config: i386-buildonly-randconfig-002-20260511 (https://download.01.org/0day-ci/archive/20260511/202605111916.Wsmqz1T6-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260511/202605111916.Wsmqz1T6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605111916.Wsmqz1T6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/fuse/file.c:2777:19: warning: result of comparison of constant 4294967291 with expression of type '__u16' (aka 'unsigned short') is always false [-Wtautological-constant-out-of-range-compare]
    2777 |                 if (digest_size > SIZE_MAX - sizeof(struct fsverity_digest))
         |                     ~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


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
