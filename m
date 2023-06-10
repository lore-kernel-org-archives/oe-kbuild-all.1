Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B308BE553
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jun 2023 20:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686429155; x=1717965155;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bw+65aIThXyd2NUcDCqFC5hNuTsLVnHB/ZPcaccIs2I=;
  b=J35DNokprugNSvGcmRsBdC/H3iRK4XEktrEC3YCFe19ZoJD4fNxztCVv
   d6yYtTrtaro0HV++/2RAubRNQJin0bloFN42qH+BJYmqXS2kEI87ENaZR
   3OXwmWwbdW7pSMAk2D1TneBuCni758csVpVMlCFZ7N77ROkfuFWeniD7a
   5EQ+ymJow5DsLVydR5WRC8GVrmgWSgpYAzNWK5JSjnNnJl2/TBOnKId+d
   RPTKTN9CLxGrgy9A2udsKvXGVVw0yzJ78ONn0RKUxyxIxcHN8G8ZsV0Bg
   aAgZSl9ZEKmM91eB15eg+YLtdFBFkqII20XLzsNTLXeQ59IcxS8gFEMQ1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="360285233"
X-IronPort-AV: E=Sophos;i="6.00,233,1681196400"; 
   d="scan'208";a="360285233"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 13:32:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="780693885"
X-IronPort-AV: E=Sophos;i="6.00,233,1681196400"; 
   d="scan'208";a="780693885"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 10 Jun 2023 13:32:32 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q85GB-000APl-1q;
	Sat, 10 Jun 2023 20:32:31 +0000
Date: Sun, 11 Jun 2023 04:31:51 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:ovl_encode_fid 20/23] fs/open.c:1132:18: error: use of
 undeclared identifier 'file'
Message-ID: <202306110449.yXtsYx0I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux ovl_encode_fid
head:   0ba31a7b3dcbf443fbdd938d66dd9fdc5218bf9d
commit: 67e5341e22f0f5cbc1d3a0bbb4c2131b2bf896e6 [20/23] ovl: enable fsnotify events on underlying real files
config: um-x86_64_defconfig (https://download.01.org/0day-ci/archive/20230611/202306110449.yXtsYx0I-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install um cross compiling tool for clang build
        # apt-get install binutils-um-linux-gnu
        # https://github.com/amir73il/linux/commit/67e5341e22f0f5cbc1d3a0bbb4c2131b2bf896e6
        git remote add amir73il https://github.com/amir73il/linux
        git fetch --no-tags amir73il ovl_encode_fid
        git checkout 67e5341e22f0f5cbc1d3a0bbb4c2131b2bf896e6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=um olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=um SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306110449.yXtsYx0I-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/open.c:14:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from fs/open.c:14:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from fs/open.c:14:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> fs/open.c:1132:18: error: use of undeclared identifier 'file'
                           fsnotify_open(file);
                                         ^
   12 warnings and 1 error generated.


vim +/file +1132 fs/open.c

  1118	
  1119	struct file *open_with_fake_path(const struct path *path, int flags,
  1120					struct inode *inode, const struct cred *cred)
  1121	{
  1122		struct file *f = alloc_empty_file_internal(flags, cred);
  1123		if (!IS_ERR(f)) {
  1124			int error;
  1125	
  1126			f->f_path = *path;
  1127			error = do_dentry_open(f, inode, NULL);
  1128			if (error) {
  1129				fput(f);
  1130				f = ERR_PTR(error);
  1131			} else {
> 1132				fsnotify_open(file);
  1133			}
  1134		}
  1135		return f;
  1136	}
  1137	EXPORT_SYMBOL(open_with_fake_path);
  1138	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
