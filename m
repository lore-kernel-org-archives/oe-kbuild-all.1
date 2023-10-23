Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A75F5221
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Oct 2023 13:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f0uKo9v4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698067073; x=1729603073;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OZXcOlq36Peh7OYuKUAoG924EuMTC6iNfwK54Gbw9EE=;
  b=f0uKo9v4hKF8zp8kIXWnxXU3UhyTGtXxgMRq6TFNTWH2B3Z3vv7KUW2D
   C9lrodD/FScIcr5I/8ffAGWb9endqmJJvIL4I4KR11TSLoomLS5Xr8VlI
   dzMyKeOSvTWUmTNICc40etdqTFtWGo29scjThCWsQlC0DLgUrZX2rIalp
   qUGNAJ2WsYnf5TBHcIxllrjtSIhuUhPW9YUCG2ZWBbB3Q1tgb/9mgJgaJ
   YpctEs+zRtlvHBIwj0vRt0Y3Q9iH8NaesNn+xTK1PNM6yu+rOJSelNRTG
   O+sGMHSrbny1J2rLSr3KnnHem+oCUlItD0mDrMdw5jEUHihr8Ki7sBnz6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="5461994"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="5461994"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 06:17:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="823954850"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="823954850"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 23 Oct 2023 06:17:51 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quuoW-0006vD-2s;
	Mon, 23 Oct 2023 13:17:48 +0000
Date: Mon, 23 Oct 2023 21:17:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 13064/30000]
 fs/fuse/file.c:2777:19: warning: result of comparison of constant
 18446744073709551611 with expression of type '__u16' (aka 'unsigned short')
 is always false
Message-ID: <202310232138.volVk1ie-lkp@intel.com>
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
head:   3e57724f00323e26143a9f214b94a3009d0a83ab
commit: 7f33c2b5012b1ada851aafcf8620e1723b8db574 [13064/30000] CHROMIUM: Support fsverity in fuse
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231023/202310232138.volVk1ie-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231023/202310232138.volVk1ie-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310232138.volVk1ie-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/fuse/file.c:2777:19: warning: result of comparison of constant 18446744073709551611 with expression of type '__u16' (aka 'unsigned short') is always false [-Wtautological-constant-out-of-range-compare]
                   if (digest_size > SIZE_MAX - sizeof(struct fsverity_digest))
                       ~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
