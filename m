Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439FA8635C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Aug 2025 20:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754252234; cv=none; b=lVxCA5ieQ+S11Swf0801SDJZgtUWtJehwcRD2qnvp7YDi2uSACkFExCtmNqT9aimMraNblZKa1IBVCuFT4N5h9QiSpSQlb1qB+WwQ4XfMRDpf+y8UTz+NIXyAh7eWSYuPlo7glNvlEjmANEfpCIrPelQe71Q+24IRyc//Zbgucc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754252234; c=relaxed/simple;
	bh=GOpaRJJHnQWv6BU9pt8vqzSk+jtH4jeeBTyr5lmeXMI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QCjQw4q2KfMp0Hg1hqilrGTtaXA3SKnWNrJf+5J28SMr/fR8ylhfpxB9f1CLxEZJCR3mXT+XkjO8X/7P4ETDCVZbyi5Bw1GBpFr3mYx3nPLG4ncKS8o0QEeYMNIrq9qCOCaI6mEp3Vo0qaoWRuxOZ7fu2J5w0MJ6VWil651SRm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pv+Xotsx; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pv+Xotsx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754252232; x=1785788232;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GOpaRJJHnQWv6BU9pt8vqzSk+jtH4jeeBTyr5lmeXMI=;
  b=Pv+XotsxJfpgMJ+8OvENm0YR5LZQYsoK9Wen3IJfLTz0jvnmjpFTC7Z+
   kdrqL5H4580zpH8DrSDVMJTQStJdo4w3nFnHHhlMJaYGCPK5F6CxfMmMz
   8zSZxvYM9EU6fJzxJek1m6jAkTDRiObpJ3wQqe80pNzseKsnoJEy5lvmk
   Y4Jz8db7E/2jlAXxF97zPUtTanvp5Ndf9xUsLIL9G6ObhgL9/7Jop0Fej
   VPPqxp2fqCZuavr/E7BQUrxBoGvG94EA+Jc0psNoT+Q4fM+x436kty1tU
   30GPp3/K8+4aY+GUm1efrvt+bZew5wi8r7l1laKZk8z4n77W87hiyRan7
   A==;
X-CSE-ConnectionGUID: PB30l9CjRXC8WyBGlX5FJQ==
X-CSE-MsgGUID: XJvzNaVXS3abjjCFkGJxlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="56593995"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56593995"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 13:17:12 -0700
X-CSE-ConnectionGUID: QF5ZtIzlRFS0RHTDytXERw==
X-CSE-MsgGUID: ZFDHDmbzQ+Ww+dlYZl/dtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="163261754"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa010.jf.intel.com with ESMTP; 03 Aug 2025 13:17:10 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uif8m-0001fn-08;
	Sun, 03 Aug 2025 20:17:08 +0000
Date: Sun, 3 Aug 2025 22:16:12 +0200
From: kernel test robot <lkp@intel.com>
To: Jorge Marques <jorge.marques@analog.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [linux-next:master 12702/13054]
 drivers/i3c/master/../internals.h:53:9: warning: passing argument 1 of
 'readsl' discards 'const' qualifier from pointer target type
Message-ID: <202508032252.aGMlznTm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b9ddaa95fd283bce7041550ddbbe7e764c477110
commit: c20d3fa7049144f519b21616e6020e6939822145 [12702/13054] i3c: master: cdns: Use i3c_writel_fifo() and i3c_readl_fifo()
config: sparc64-randconfig-2001-20250802 (https://download.01.org/0day-ci/archive/20250803/202508032252.aGMlznTm-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250803/202508032252.aGMlznTm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508032252.aGMlznTm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/i3c/master/i3c-master-cdns.c:26:
   drivers/i3c/master/../internals.h: In function 'i3c_readl_fifo':
>> drivers/i3c/master/../internals.h:53:9: warning: passing argument 1 of 'readsl' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
      53 |  readsl(addr, buf, nbytes / 4);
         |         ^~~~
   In file included from arch/sparc/include/asm/io.h:5,
                    from include/linux/io.h:12,
                    from drivers/i3c/master/i3c-master-cdns.c:14:
   arch/sparc/include/asm/io_64.h:265:41: note: expected 'void *' but argument is of type 'const void *'
     265 | static inline void readsl(void __iomem *port, void *buf, unsigned long count)
         |                           ~~~~~~~~~~~~~~^~~~


vim +53 drivers/i3c/master/../internals.h

733b439375b494 Jorge Marques 2025-06-24  43  
733b439375b494 Jorge Marques 2025-06-24  44  /**
733b439375b494 Jorge Marques 2025-06-24  45   * i3c_readl_fifo - Read data buffer from 32bit FIFO
733b439375b494 Jorge Marques 2025-06-24  46   * @addr: FIFO Address to read from
733b439375b494 Jorge Marques 2025-06-24  47   * @buf: Pointer to the buffer to store read bytes
733b439375b494 Jorge Marques 2025-06-24  48   * @nbytes: Number of bytes to read
733b439375b494 Jorge Marques 2025-06-24  49   */
733b439375b494 Jorge Marques 2025-06-24  50  static inline void i3c_readl_fifo(const void __iomem *addr, void *buf,
733b439375b494 Jorge Marques 2025-06-24  51  				  int nbytes)
733b439375b494 Jorge Marques 2025-06-24  52  {
733b439375b494 Jorge Marques 2025-06-24 @53  	readsl(addr, buf, nbytes / 4);
733b439375b494 Jorge Marques 2025-06-24  54  	if (nbytes & 3) {
733b439375b494 Jorge Marques 2025-06-24  55  		u32 tmp;
733b439375b494 Jorge Marques 2025-06-24  56  
733b439375b494 Jorge Marques 2025-06-24  57  		tmp = readl(addr);
733b439375b494 Jorge Marques 2025-06-24  58  		memcpy(buf + (nbytes & ~3), &tmp, nbytes & 3);
733b439375b494 Jorge Marques 2025-06-24  59  	}
733b439375b494 Jorge Marques 2025-06-24  60  }
733b439375b494 Jorge Marques 2025-06-24  61  

:::::: The code at line 53 was first introduced by commit
:::::: 733b439375b494e8a6950ab47d18a4b615b73cb3 i3c: master: Add inline i3c_readl_fifo() and i3c_writel_fifo()

:::::: TO: Jorge Marques <jorge.marques@analog.com>
:::::: CC: Alexandre Belloni <alexandre.belloni@bootlin.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
