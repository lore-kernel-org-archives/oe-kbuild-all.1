Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4844B158DCE
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Apr 2024 23:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712705834; cv=none; b=saNHNuYyjFai5JWltlMJqEqRA7AaTCUgqJJu0GbMPdrQZ+ScvGSaayMh37lsIqnQelkMpQXpCetuRJnH5IT4mOdymwaIPhYmVvtHKcVdsUGpJESYhpM4cFBDZUnmuf9VbrwENy5eJ2tuVvbr2wkvU4qDRfD45v1WL9tnc8AXtJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712705834; c=relaxed/simple;
	bh=QIU9OdzKHBRqfZlsQpzbuctUQTC4zgotfw/qXmY7YU4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cgNg7mg+9buGz6phWXBU2581OeWIvWBzsASUeIh3lnCed7vqLuxhRbpQ8qwTvzMCQbSlMQDBIKWiSM9sKrhl92Zkt3wPbqPiJZqO4ccgBRNoBgoqfnYrL8TlHUu24oliwIUW9QpEPSj4I9zr548Q0Yg8Lo0sM7YdL2kiILZZ/pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WvCkH2Bw; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WvCkH2Bw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712705832; x=1744241832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QIU9OdzKHBRqfZlsQpzbuctUQTC4zgotfw/qXmY7YU4=;
  b=WvCkH2Bw9Zyk9RCoy1MMhpKItEqNCsBiXFQGCbwlqtcEBriDO/w/tDSm
   R4iL9fpHvKMxejbf2D91YgPTE48ooT6Fp/u+PRsvaB8XvCbm8zPMwZhRX
   5oX16A5fHUqDC7HhgfGzuLXkoGklY/SBxTNC1TYwDKm99XZicYeNAC5pU
   j8vwGvZ5QQOAdyJRca5QRUIHMBBP9uXKowutNXlFKuKspVkZKWeFwo13F
   tTjfN23swqIyXZwmMF5NE6fq/Lq4dNeCbWrw4QwxrrWlr6OfYDkSsV9/V
   MfCP/HjTfXb40dy7awQmJq+525pKJXx+05XhtAJa76jLEIT7qfpdq1tWS
   Q==;
X-CSE-ConnectionGUID: d4sjaWKNTGq8fKFZxlr63w==
X-CSE-MsgGUID: vLfUFy4CSbGE0Hqp8BmNUw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="25551222"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="25551222"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 16:37:11 -0700
X-CSE-ConnectionGUID: LPbeJGcUQB6Jxt+hYIafbQ==
X-CSE-MsgGUID: U//Jj0BtRiu+4qW2nyOQ2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="20809237"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Apr 2024 16:37:10 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruL1X-0006cY-1t;
	Tue, 09 Apr 2024 23:37:07 +0000
Date: Wed, 10 Apr 2024 07:36:54 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:clk-reset-stuff 6/6] drivers/reset/reset-mpfs.c:154:2: error:
 call to undeclared function 'kfree'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202404100728.JoU33xWV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git clk-reset-stuff
head:   a12f281d2cb869bcd9a6ffc45d0c6a0d3aa2e9e2
commit: a12f281d2cb869bcd9a6ffc45d0c6a0d3aa2e9e2 [6/6] clock, reset: microchip: move all mpfs reset code to the reset subsystem
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240410/202404100728.JoU33xWV-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404100728.JoU33xWV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404100728.JoU33xWV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/reset/reset-mpfs.c:11:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/reset/reset-mpfs.c:11:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/reset/reset-mpfs.c:11:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/reset/reset-mpfs.c:154:2: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     154 |         kfree(adev);
         |         ^
   drivers/reset/reset-mpfs.c:154:2: note: did you mean 'vfree'?
   include/linux/vmalloc.h:162:13: note: 'vfree' declared here
     162 | extern void vfree(const void *addr);
         |             ^
>> drivers/reset/reset-mpfs.c:162:9: error: call to undeclared function 'kzalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     162 |         adev = kzalloc(sizeof(*adev), GFP_KERNEL);
         |                ^
   drivers/reset/reset-mpfs.c:162:9: note: did you mean 'vzalloc'?
   include/linux/vmalloc.h:142:14: note: 'vzalloc' declared here
     142 | extern void *vzalloc(unsigned long size) __alloc_size(1);
         |              ^
>> drivers/reset/reset-mpfs.c:162:7: error: incompatible integer to pointer conversion assigning to 'struct auxiliary_device *' from 'int' [-Wint-conversion]
     162 |         adev = kzalloc(sizeof(*adev), GFP_KERNEL);
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/reset/reset-mpfs.c:173:3: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     173 |                 kfree(adev);
         |                 ^
   6 warnings and 4 errors generated.


vim +/kfree +154 drivers/reset/reset-mpfs.c

   149	
   150	static void mpfs_reset_adev_release(struct device *dev)
   151	{
   152		struct auxiliary_device *adev = to_auxiliary_dev(dev);
   153	
 > 154		kfree(adev);
   155	}
   156	
   157	static struct auxiliary_device *mpfs_reset_adev_alloc(struct device *clk_dev)
   158	{
   159		struct auxiliary_device *adev;
   160		int ret;
   161	
 > 162		adev = kzalloc(sizeof(*adev), GFP_KERNEL);
   163		if (!adev)
   164			return ERR_PTR(-ENOMEM);
   165	
   166		adev->name = "reset-mpfs";
   167		adev->dev.parent = clk_dev;
   168		adev->dev.release = mpfs_reset_adev_release;
   169		adev->id = 666u;
   170	
   171		ret = auxiliary_device_init(adev);
   172		if (ret) {
   173			kfree(adev);
   174			return ERR_PTR(ret);
   175		}
   176	
   177		return adev;
   178	}
   179	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
