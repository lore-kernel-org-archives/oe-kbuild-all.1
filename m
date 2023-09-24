Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1377F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Sep 2023 10:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695549765; x=1727085765;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=77odX9QkFQDrZG1V60efIIFE6wqwYN3J3hmjX/jaTkc=;
  b=Lp886Tg2FotNv09voB3pek98rzDFrxos3c5W3DDOsOTdAluUQS3TTXql
   yPteF1LRwqvmJT6g3MI4agQjojjthsXvFDCt+VqOswoHi2W5lCjurzXAA
   YZonL8Wkt1EaDRvQAw+wfSwmtcW5mDn4zsXkmd6p7RMfpeaVH3erkeJGK
   BiPrah2mIT0sOdpDJe6IJDIYdKWTCnFzCn2/z2+7ZWH/L9lpwJyLZ/6KD
   4y1Tf6i5ZMRwFUStrS2DMNwoeHsg41rpO278cypYIofdPLZMiIli10y+G
   wRx6lkRYfVV+OMRzPBX3tRg3+1S4jAlk/dM4BwV0jKeIAo9pjLinTntHq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="445191563"
X-IronPort-AV: E=Sophos;i="6.03,173,1694761200"; 
   d="scan'208";a="445191563"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2023 03:02:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="777357071"
X-IronPort-AV: E=Sophos;i="6.03,173,1694761200"; 
   d="scan'208";a="777357071"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 24 Sep 2023 03:02:43 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkLwn-0003SV-26;
	Sun, 24 Sep 2023 10:02:41 +0000
Date: Sun, 24 Sep 2023 18:02:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 13076/29449]
 fs/fuse/file.c:2777:19: warning: result of comparison of constant
 18446744073709551611 with expression of type '__u16' (aka 'unsigned short')
 is always false
Message-ID: <202309241706.4MuXUa6q-lkp@intel.com>
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
head:   833db5ec53f6ad1606b5363338fb455e6bd7bd01
commit: 7f33c2b5012b1ada851aafcf8620e1723b8db574 [13076/29449] CHROMIUM: Support fsverity in fuse
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230924/202309241706.4MuXUa6q-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230924/202309241706.4MuXUa6q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309241706.4MuXUa6q-lkp@intel.com/

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
