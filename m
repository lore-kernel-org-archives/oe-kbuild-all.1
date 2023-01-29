Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB6A18F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jan 2023 00:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674950762; x=1706486762;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PvqdkR55aPw4e9r4QrV05Jwlze63Gqm3WtjvnfCNAgk=;
  b=mocMEcuigd5zDjDPlmIN/Pf3/fvNVH6sziq2IwJPikmURooRezYtSv+2
   RDqPS3yOeEYbkyLjPeXT4/SOA6LAiM4jeMiKw8kSG8alvpcWOmMIldj8x
   2RZ/J4jgzo/xdysWPD4ne8HHlvYZjO7UhUBbV34GVubKZveCroajG44jb
   nm2CUMYdK0NZU8xGCokRn27ti4TOOIfeATLsiz9CiCUy0szmZ9Y0Py8sz
   m+Ljo58Uow49LYaCINk0pwDgACxjZpcdbUnvZzFjuGVbCMdo3vhRuITge
   jhB5YU/BC4ZrJ/BCY61CKficdG7WzED1K+4lmt4dXnCQHhh4uRye/x4po
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="354660872"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="354660872"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 16:06:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="732266874"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="732266874"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 28 Jan 2023 16:05:59 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLvCp-0001FO-03;
	Sun, 29 Jan 2023 00:05:59 +0000
Date: Sun, 29 Jan 2023 08:05:28 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fan_pre_modify 25/29] fs/namespace.c:491:5: warning: no
 previous prototype for function '__sb_mnt_want_write_file'
Message-ID: <202301290718.bNi98Wyy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux fan_pre_modify
head:   98a5f0e208bb7b3378da3912e93c51bc400b65cf
commit: d6522cc6094a6e54cfd1c352c24cc534deb67ff2 [25/29] fanotify: introduce FAN_PRE_ATTRIB permission event
config: hexagon-randconfig-r024-20230129 (https://download.01.org/0day-ci/archive/20230129/202301290718.bNi98Wyy-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/amir73il/linux/commit/d6522cc6094a6e54cfd1c352c24cc534deb67ff2
        git remote add amir73il https://github.com/amir73il/linux
        git fetch --no-tags amir73il fan_pre_modify
        git checkout d6522cc6094a6e54cfd1c352c24cc534deb67ff2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from fs/namespace.c:11:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from fs/namespace.c:11:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from fs/namespace.c:11:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> fs/namespace.c:491:5: warning: no previous prototype for function '__sb_mnt_want_write_file' [-Wmissing-prototypes]
   int __sb_mnt_want_write_file(struct file *file)
       ^
   fs/namespace.c:491:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __sb_mnt_want_write_file(struct file *file)
   ^
   static 
   7 warnings generated.


vim +/__sb_mnt_want_write_file +491 fs/namespace.c

   481	
   482	/**
   483	 * __sb_mnt_want_write_file - get write access to a file's mount and sb
   484	 * @file: the file who's mount on which to take a write
   485	 *
   486	 * This is like mnt_want_write, but if the file is already open for writing it
   487	 * skips incrementing mnt_writers (since the open file already has a reference)
   488	 * and instead only does the freeze protection and the check for emergency r/o
   489	 * remounts.  This must be paired with mnt_drop_write_file.
   490	 */
 > 491	int __sb_mnt_want_write_file(struct file *file)
   492	{
   493		int ret;
   494	
   495		sb_start_write(file_inode(file)->i_sb);
   496		ret = __mnt_want_write_file(file);
   497		if (ret)
   498			sb_end_write(file_inode(file)->i_sb);
   499		return ret;
   500	}
   501	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
