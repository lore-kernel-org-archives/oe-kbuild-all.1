Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCA1BA57
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 21:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678397504; x=1709933504;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=vyt5Fp0qZxseT7G30pdPv6ixH5W2EWyWFp21dai8eXU=;
  b=kF32QSyeN8yrIoFnnx4pTzttQFOKWRLZpgEyFgF/lnFdq3qc1hqw3U5h
   IDrBcPuSrJm0jRb1J7lDkeNQTvrOyXlhNgxYAhJKbcL9QP/eBgVVq2IHB
   M0d6XdQMAOlGBTEoDz+rn+y8Djdrbsbbfi+u/iz4tCSWC6J1a1aZ3vypq
   94TsHXMvxGErKurg+f1Rx26pBuTFm4R1avrYKARRN0E08GxAbY2dYojCL
   kg6+oHf6l8lT3dUHK+E8VusTq0xdshE9wVFQywLb6m8yztgP+E5kUYR2A
   4375U0315BZycy7QD9JQGJyRp2OiiIXrGapDYP37ed2jTPuHJOOeOUYKF
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="324924255"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; 
   d="scan'208";a="324924255"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 13:31:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="746474001"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; 
   d="scan'208";a="746474001"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 09 Mar 2023 13:31:41 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paNrQ-0003EN-04;
	Thu, 09 Mar 2023 21:31:40 +0000
Date: Fri, 10 Mar 2023 05:31:03 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Lu=EDs?= Henriques <lhenriques@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] fscrypt: new helper function -
 __fscrypt_prepare_atomic_open()
Message-ID: <202303100501.8hd2Beo7-lkp@intel.com>
References: <20230309121910.18939-2-lhenriques@suse.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230309121910.18939-2-lhenriques@suse.de>

Hi Luís,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on ceph-client/testing]
[also build test ERROR on ceph-client/for-linus linus/master v6.3-rc1 next-20230309]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lu-s-Henriques/fscrypt-new-helper-function-__fscrypt_prepare_atomic_open/20230309-202021
base:   https://github.com/ceph/ceph-client.git testing
patch link:    https://lore.kernel.org/r/20230309121910.18939-2-lhenriques%40suse.de
patch subject: [RFC PATCH 1/2] fscrypt: new helper function - __fscrypt_prepare_atomic_open()
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20230310/202303100501.8hd2Beo7-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/bc0e93e713bcb2b95af1bcb4ac369a7fe3a72863
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Lu-s-Henriques/fscrypt-new-helper-function-__fscrypt_prepare_atomic_open/20230309-202021
        git checkout bc0e93e713bcb2b95af1bcb4ac369a7fe3a72863
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=um SUBARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=um SUBARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303100501.8hd2Beo7-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/ioctl.o: in function `__fscrypt_prepare_atomic_open':
>> include/linux/fscrypt.h:695: multiple definition of `__fscrypt_prepare_atomic_open'; fs/super.o:include/linux/fscrypt.h:695: first defined here
   ld: fs/dcache.o: in function `__fscrypt_prepare_atomic_open':
>> include/linux/fscrypt.h:695: multiple definition of `__fscrypt_prepare_atomic_open'; fs/super.o:include/linux/fscrypt.h:695: first defined here
   ld: fs/libfs.o: in function `__fscrypt_prepare_atomic_open':
>> include/linux/fscrypt.h:695: multiple definition of `__fscrypt_prepare_atomic_open'; fs/super.o:include/linux/fscrypt.h:695: first defined here
   ld: fs/buffer.o: in function `__fscrypt_prepare_atomic_open':
>> include/linux/fscrypt.h:695: multiple definition of `__fscrypt_prepare_atomic_open'; fs/super.o:include/linux/fscrypt.h:695: first defined here
   ld: fs/iomap/direct-io.o: in function `__fscrypt_prepare_atomic_open':
>> include/linux/fscrypt.h:695: multiple definition of `__fscrypt_prepare_atomic_open'; fs/super.o:include/linux/fscrypt.h:695: first defined here
   ld: fs/ext4/balloc.o: in function `__fscrypt_prepare_atomic_open':
>> include/linux/fscrypt.h:695: multiple definition of `__fscrypt_prepare_atomic_open'; fs/super.o:include/linux/fscrypt.h:695: first defined here
   ld: fs/ext4/bitmap.o: in function `__fscrypt_prepare_atomic_open':
>> include/linux/fscrypt.h:695: multiple definition of `__fscrypt_prepare_atomic_open'; fs/super.o:include/linux/fscrypt.h:695: first defined here
   ld: fs/ext4/block_validity.o: in function `__fscrypt_prepare_atomic_open':
>> include/linux/fscrypt.h:695: multiple definition of `__fscrypt_prepare_atomic_open'; fs/super.o:include/linux/fscrypt.h:695: first defined here
   ld: fs/ext4/dir.o: in function `__fscrypt_prepare_atomic_open':
>> include/linux/fscrypt.h:695: multiple definition of `__fscrypt_prepare_atomic_open'; fs/super.o:include/linux/fscrypt.h:695: first defined here
   ld: fs/ext4/ext4_jbd2.o: in function `__fscrypt_prepare_atomic_open':
>> include/linux/fscrypt.h:695: multiple definition of `__fscrypt_prepare_atomic_open'; fs/super.o:include/linux/fscrypt.h:695: first defined here
   ld: fs/ext4/extents.o: in function `__fscrypt_prepare_atomic_open':
>> include/linux/fscrypt.h:695: multiple definition of `__fscrypt_prepare_atomic_open'; fs/super.o:include/linux/fscrypt.h:695: first defined here
   ld: fs/ext4/extents_status.o: in function `__fscrypt_prepare_atomic_open':
>> include/linux/fscrypt.h:695: multiple definition of `__fscrypt_prepare_atomic_open'; fs/super.o:include/linux/fscrypt.h:695: first defined here
   ld: fs/ext4/file.o: in function `__fscrypt_prepare_atomic_open':
>> include/linux/fscrypt.h:695: multiple definition of `__fscrypt_prepare_atomic_open'; fs/super.o:include/linux/fscrypt.h:695: first defined here
   ld: fs/ext4/fsmap.o: in function `__fscrypt_prepare_atomic_open':
>> include/linux/fscrypt.h:695: multiple definition of `__fscrypt_prepare_atomic_open'; fs/super.o:include/linux/fscrypt.h:695: first defined here
   ld: fs/ext4/fsync.o: in function `__fscrypt_prepare_atomic_open':
   fs/ext4/fsync.c:695: multiple definition of `__fscrypt_prepare_atomic_open'; fs/super.o:include/linux/fscrypt.h:695: first defined here
   ld: fs/ext4/hash.o: in function `__fscrypt_prepare_atomic_open':
>> include/linux/fscrypt.h:695: multiple definition of `__fscrypt_prepare_atomic_open'; fs/super.o:include/linux/fscrypt.h:695: first defined here
   ld: fs/ext4/ialloc.o: in function `__fscrypt_prepare_atomic_open':
>> include/linux/fscrypt.h:695: multiple definition of `__fscrypt_prepare_atomic_open'; fs/super.o:include/linux/fscrypt.h:695: first defined here
   ld: fs/ext4/indirect.o: in function `__fscrypt_prepare_atomic_open':
>> include/linux/fscrypt.h:695: multiple definition of `__fscrypt_prepare_atomic_open'; fs/super.o:include/linux/fscrypt.h:695: first defined here
   ld: fs/ext4/inline.o: in function `__fscrypt_prepare_atomic_open':
>> include/linux/fscrypt.h:695: multiple definition of `__fscrypt_prepare_atomic_open'; fs/super.o:include/linux/fscrypt.h:695: first defined here
   ld: fs/ext4/inode.o: in function `__fscrypt_prepare_atomic_open':
>> include/linux/fscrypt.h:695: multiple definition of `__fscrypt_prepare_atomic_open'; fs/super.o:include/linux/fscrypt.h:695: first defined here
   ld: fs/ext4/ioctl.o: in function `__fscrypt_prepare_atomic_open':
>> include/linux/fscrypt.h:695: multiple definition of `__fscrypt_prepare_atomic_open'; fs/super.o:include/linux/fscrypt.h:695: first defined here
   ld: fs/ext4/mballoc.o: in function `__fscrypt_prepare_atomic_open':
   include/linux/fscrypt.h:695: multiple definition of `__fscrypt_prepare_atomic_open'; fs/super.o:include/linux/fscrypt.h:695: first defined here
   ld: fs/ext4/migrate.o: in function `__fscrypt_prepare_atomic_open':
   include/linux/fscrypt.h:695: multiple definition of `__fscrypt_prepare_atomic_open'; fs/super.o:include/linux/fscrypt.h:695: first defined here
   ld: fs/ext4/mmp.o: in function `__fscrypt_prepare_atomic_open':
   include/linux/fscrypt.h:695: multiple definition of `__fscrypt_prepare_atomic_open'; fs/super.o:include/linux/fscrypt.h:695: first defined here
   ld: fs/ext4/move_extent.o: in function `__fscrypt_prepare_atomic_open':
   include/linux/fscrypt.h:695: multiple definition of `__fscrypt_prepare_atomic_open'; fs/super.o:include/linux/fscrypt.h:695: first defined here
   ld: fs/ext4/namei.o: in function `__fscrypt_prepare_atomic_open':
   include/linux/fscrypt.h:695: multiple definition of `__fscrypt_prepare_atomic_open'; fs/super.o:include/linux/fscrypt.h:695: first defined here
   ld: fs/ext4/page-io.o: in function `__fscrypt_prepare_atomic_open':
   include/linux/fscrypt.h:695: multiple definition of `__fscrypt_prepare_atomic_open'; fs/super.o:include/linux/fscrypt.h:695: first defined here
   ld: fs/ext4/readpage.o: in function `__fscrypt_prepare_atomic_open':
   include/linux/fscrypt.h:695: multiple definition of `__fscrypt_prepare_atomic_open'; fs/super.o:include/linux/fscrypt.h:695: first defined here
   ld: fs/ext4/resize.o: in function `__fscrypt_prepare_atomic_open':
   include/linux/fscrypt.h:695: multiple definition of `__fscrypt_prepare_atomic_open'; fs/super.o:include/linux/fscrypt.h:695: first defined here
   ld: fs/ext4/super.o: in function `__fscrypt_prepare_atomic_open':
   include/linux/fscrypt.h:695: multiple definition of `__fscrypt_prepare_atomic_open'; fs/super.o:include/linux/fscrypt.h:695: first defined here
   ld: fs/ext4/symlink.o: in function `__fscrypt_prepare_atomic_open':
   include/linux/fscrypt.h:695: multiple definition of `__fscrypt_prepare_atomic_open'; fs/super.o:include/linux/fscrypt.h:695: first defined here
   ld: fs/ext4/sysfs.o: in function `__fscrypt_prepare_atomic_open':
   include/linux/fscrypt.h:695: multiple definition of `__fscrypt_prepare_atomic_open'; fs/super.o:include/linux/fscrypt.h:695: first defined here
   ld: fs/ext4/xattr.o: in function `__fscrypt_prepare_atomic_open':
   include/linux/fscrypt.h:695: multiple definition of `__fscrypt_prepare_atomic_open'; fs/super.o:include/linux/fscrypt.h:695: first defined here
   ld: fs/ext4/xattr_hurd.o: in function `__fscrypt_prepare_atomic_open':
   include/linux/fscrypt.h:695: multiple definition of `__fscrypt_prepare_atomic_open'; fs/super.o:include/linux/fscrypt.h:695: first defined here
   ld: fs/ext4/xattr_trusted.o: in function `__fscrypt_prepare_atomic_open':
   include/linux/fscrypt.h:695: multiple definition of `__fscrypt_prepare_atomic_open'; fs/super.o:include/linux/fscrypt.h:695: first defined here
   ld: fs/ext4/xattr_user.o: in function `__fscrypt_prepare_atomic_open':
   include/linux/fscrypt.h:695: multiple definition of `__fscrypt_prepare_atomic_open'; fs/super.o:include/linux/fscrypt.h:695: first defined here
   ld: fs/ext4/fast_commit.o: in function `__fscrypt_prepare_atomic_open':
   include/linux/fscrypt.h:695: multiple definition of `__fscrypt_prepare_atomic_open'; fs/super.o:include/linux/fscrypt.h:695: first defined here
   ld: fs/ext4/orphan.o: in function `__fscrypt_prepare_atomic_open':
   include/linux/fscrypt.h:695: multiple definition of `__fscrypt_prepare_atomic_open'; fs/super.o:include/linux/fscrypt.h:695: first defined here


vim +695 include/linux/fscrypt.h

   691	
   692	int __fscrypt_prepare_atomic_open(struct inode *dir, struct dentry *dentry)
   693	{
   694		return -EOPNOTSUPP;
 > 695	}
   696	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
