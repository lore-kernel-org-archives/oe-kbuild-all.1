Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8047C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Feb 2023 03:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675480051; x=1707016051;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rkZEpfMtzrxxc5rd3Hd4kWOqUdWKLBYSTgUK2dMk9rY=;
  b=XbH3rNKi83dMPpFwJDzCZ2gJyQja81UeFb6mj6NRZUN2EZgvHGYQf8Re
   DYcnT24SZbZ/Tf1mo91HN+X7DUIY9Slhc/el0BrRFWmPYUP5+XHZYC5nu
   NK9rL4bZFA+UR/8ROleYLhrkw12Fgdl2uHHUwQ/3hBAsbdWvQBHUSryHQ
   7ZBSysnLO2TC46x69vMtZmQvtNivaLibzl2XWqjOLAolSeL8VPMFUoNpL
   NNzbpX+ui2cp3mpwVrKMTfXCYIF0n33iwH7Swgtn7/iyI3JmipX9RLi37
   HzdwT4/d4rx/QT/Xpjxwl7qvlK+f1NbWVm4oEpdm14/Wzn190bZt6r7ke
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="356256135"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; 
   d="scan'208";a="356256135"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2023 19:07:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="665927273"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; 
   d="scan'208";a="665927273"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 03 Feb 2023 19:07:29 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pO8tk-0000zV-1Z;
	Sat, 04 Feb 2023 03:07:28 +0000
Date: Sat, 4 Feb 2023 11:07:23 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/android13-5.15-arcvm
 66/138] fs/fuse/ioctl.c:132:19: warning: result of comparison of constant
 18446744073709551611 with expression of type '__u16' (aka 'unsigned short')
 is always false
Message-ID: <202302041038.M5iffNf9-lkp@intel.com>
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

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android13-5.15-arcvm
head:   573344b8d137d3584c918c7efa8d4b949d0414d4
commit: 35008c86efa8449b79739d1911c04f6dccad104c [66/138] CHROMIUM: Support fsverity in fuse
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20230204/202302041038.M5iffNf9-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/35008c86efa8449b79739d1911c04f6dccad104c
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android13-5.15-arcvm
        git checkout 35008c86efa8449b79739d1911c04f6dccad104c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/fuse/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/fuse/ioctl.c:132:19: warning: result of comparison of constant 18446744073709551611 with expression of type '__u16' (aka 'unsigned short') is always false [-Wtautological-constant-out-of-range-compare]
                   if (digest_size > SIZE_MAX - sizeof(struct fsverity_digest))
                       ~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +132 fs/fuse/ioctl.c

    66	
    67	static int fuse_copy_ioctl_iovec(struct fuse_conn *fc, struct iovec *dst,
    68					 void *src, size_t transferred, unsigned count,
    69					 bool is_compat)
    70	{
    71		unsigned i;
    72		struct fuse_ioctl_iovec *fiov = src;
    73	
    74		if (fc->minor < 16) {
    75			return fuse_copy_ioctl_iovec_old(dst, src, transferred,
    76							 count, is_compat);
    77		}
    78	
    79		if (count * sizeof(struct fuse_ioctl_iovec) != transferred)
    80			return -EIO;
    81	
    82		for (i = 0; i < count; i++) {
    83			/* Did the server supply an inappropriate value? */
    84			if (fiov[i].base != (unsigned long) fiov[i].base ||
    85			    fiov[i].len != (unsigned long) fiov[i].len)
    86				return -EIO;
    87	
    88			dst[i].iov_base = (void __user *) (unsigned long) fiov[i].base;
    89			dst[i].iov_len = (size_t) fiov[i].len;
    90	
    91	#ifdef CONFIG_COMPAT
    92			if (is_compat &&
    93			    (ptr_to_compat(dst[i].iov_base) != fiov[i].base ||
    94			     (compat_size_t) dst[i].iov_len != fiov[i].len))
    95				return -EIO;
    96	#endif
    97		}
    98	
    99		return 0;
   100	}
   101	static int fuse_get_ioctl_len(unsigned int cmd, unsigned long arg, size_t *len)
   102	{
   103		switch (cmd) {
   104		case FS_IOC_GETFLAGS:
   105		case FS_IOC_SETFLAGS:
   106			*len = sizeof(int);
   107			break;
   108		case FS_IOC_GET_ENCRYPTION_POLICY_EX: {
   109			__u64 policy_size;
   110			struct fscrypt_get_policy_ex_arg __user *uarg =
   111				(struct fscrypt_get_policy_ex_arg __user *)arg;
   112	
   113			if (copy_from_user(&policy_size, &uarg->policy_size,
   114					   sizeof(policy_size)))
   115				return -EFAULT;
   116	
   117			if (policy_size > SIZE_MAX - sizeof(policy_size))
   118				return -EINVAL;
   119	
   120			*len = sizeof(policy_size) + policy_size;
   121			break;
   122		}
   123		case FS_IOC_MEASURE_VERITY: {
   124			__u16 digest_size;
   125			struct fsverity_digest __user *uarg =
   126				(struct fsverity_digest __user *)arg;
   127	
   128			if (copy_from_user(&digest_size, &uarg->digest_size,
   129					   sizeof(digest_size)))
   130				return -EFAULT;
   131	
 > 132			if (digest_size > SIZE_MAX - sizeof(struct fsverity_digest))
   133				return -EINVAL;
   134	
   135			*len = sizeof(struct fsverity_digest) + digest_size;
   136			break;
   137		}
   138		default:
   139			*len = _IOC_SIZE(cmd);
   140			break;
   141		}
   142	
   143		return 0;
   144	}
   145	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
