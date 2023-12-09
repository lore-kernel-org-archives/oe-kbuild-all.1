Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8224514AB6
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Dec 2023 13:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fls45vmK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702128202; x=1733664202;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z+g75rp39+u/KjgG9h4SER7OvkC0rmh4IMHKk9fen8s=;
  b=fls45vmK1lDkDIX3LJ9dcMFHzF/WRpM7MPQ3gn83Eym9ur71eYJyNawr
   Qx+fC7IRVNxHM0x+f1dDBvSZHXwqnP+AbUEXhoqzHjlV+mZ5CNHK7LyRR
   qyaw6GCSVKESGglHpcIK1gRxTMhpW+fRe/5zgHkdi/1x4/lxjlghR4tRr
   CrnoX0ul+LoNQsqSP5S1Hh439KsSn8QvME1x8evseuyEi+MMJUXZLDZqk
   VYdEBuKHBi4qE5bS+4iUfOnaoMfkRyFgDv6/NRJTo9PcOEaVSSl4vprIc
   VHsJ+mUzG5hdwFRQdllOcHBzI1PqwMpbneGQHLEUPGV3DzMquOssPqgos
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="480704942"
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; 
   d="scan'208";a="480704942"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 05:23:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="842930282"
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; 
   d="scan'208";a="842930282"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 09 Dec 2023 05:23:18 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBxIZ-000FNX-39;
	Sat, 09 Dec 2023 13:23:15 +0000
Date: Sat, 9 Dec 2023 21:23:09 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Martin Schwidefsky <schwidefsky@de.ibm.com>,
	Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: arch/s390/pci/pci_mmio.c:35:1: sparse: sparse: Using plain integer
 as NULL pointer
Message-ID: <202312092144.nRcv9gfg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f2e8a57ee9036c7d5443382b6c3c09b51a92ec7e
commit: aa0d6e70d3b34e710a6a57a53a3096cb2e0ea99f s390: autogenerate compat syscall wrappers
date:   4 years, 11 months ago
config: s390-randconfig-r113-20231115 (https://download.01.org/0day-ci/archive/20231209/202312092144.nRcv9gfg-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231209/202312092144.nRcv9gfg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312092144.nRcv9gfg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/s390/pci/pci_mmio.c:35:1: sparse: sparse: Using plain integer as NULL pointer
>> arch/s390/pci/pci_mmio.c:35:1: sparse: sparse: Using plain integer as NULL pointer
   arch/s390/pci/pci_mmio.c:75:1: sparse: sparse: Using plain integer as NULL pointer
   arch/s390/pci/pci_mmio.c:75:1: sparse: sparse: Using plain integer as NULL pointer
--
>> kernel/acct.c:273:1: sparse: sparse: Using plain integer as NULL pointer
>> kernel/acct.c:273:1: sparse: sparse: Using plain integer as NULL pointer
   kernel/acct.c:193:12: sparse: sparse: context imbalance in 'acct_on' - different lock contexts for basic block
   kernel/acct.c:294:9: sparse: sparse: context imbalance in '__se_sys_acct' - different lock contexts for basic block
   kernel/acct.c:297:6: sparse: sparse: context imbalance in 'acct_exit_ns' - wrong count at exit

vim +35 arch/s390/pci/pci_mmio.c

4eafad7febd482 Alexey Ishchuk 2014-11-14  34  
4eafad7febd482 Alexey Ishchuk 2014-11-14 @35  SYSCALL_DEFINE3(s390_pci_mmio_write, unsigned long, mmio_addr,
4eafad7febd482 Alexey Ishchuk 2014-11-14  36  		const void __user *, user_buffer, size_t, length)
4eafad7febd482 Alexey Ishchuk 2014-11-14  37  {
4eafad7febd482 Alexey Ishchuk 2014-11-14  38  	u8 local_buf[64];
4eafad7febd482 Alexey Ishchuk 2014-11-14  39  	void __iomem *io_addr;
4eafad7febd482 Alexey Ishchuk 2014-11-14  40  	void *buf;
4eafad7febd482 Alexey Ishchuk 2014-11-14  41  	unsigned long pfn;
4eafad7febd482 Alexey Ishchuk 2014-11-14  42  	long ret;
4eafad7febd482 Alexey Ishchuk 2014-11-14  43  
4eafad7febd482 Alexey Ishchuk 2014-11-14  44  	if (!zpci_is_enabled())
4eafad7febd482 Alexey Ishchuk 2014-11-14  45  		return -ENODEV;
4eafad7febd482 Alexey Ishchuk 2014-11-14  46  
4eafad7febd482 Alexey Ishchuk 2014-11-14  47  	if (length <= 0 || PAGE_SIZE - (mmio_addr & ~PAGE_MASK) < length)
4eafad7febd482 Alexey Ishchuk 2014-11-14  48  		return -EINVAL;
4eafad7febd482 Alexey Ishchuk 2014-11-14  49  	if (length > 64) {
4eafad7febd482 Alexey Ishchuk 2014-11-14  50  		buf = kmalloc(length, GFP_KERNEL);
4eafad7febd482 Alexey Ishchuk 2014-11-14  51  		if (!buf)
4eafad7febd482 Alexey Ishchuk 2014-11-14  52  			return -ENOMEM;
4eafad7febd482 Alexey Ishchuk 2014-11-14  53  	} else
4eafad7febd482 Alexey Ishchuk 2014-11-14  54  		buf = local_buf;
4eafad7febd482 Alexey Ishchuk 2014-11-14  55  
4eafad7febd482 Alexey Ishchuk 2014-11-14  56  	ret = get_pfn(mmio_addr, VM_WRITE, &pfn);
4eafad7febd482 Alexey Ishchuk 2014-11-14  57  	if (ret)
4eafad7febd482 Alexey Ishchuk 2014-11-14  58  		goto out;
eba8452525e3fd Heiko Carstens 2014-12-12  59  	io_addr = (void __iomem *)((pfn << PAGE_SHIFT) | (mmio_addr & ~PAGE_MASK));
4eafad7febd482 Alexey Ishchuk 2014-11-14  60  
4eafad7febd482 Alexey Ishchuk 2014-11-14  61  	ret = -EFAULT;
4eafad7febd482 Alexey Ishchuk 2014-11-14  62  	if ((unsigned long) io_addr < ZPCI_IOMAP_ADDR_BASE)
4eafad7febd482 Alexey Ishchuk 2014-11-14  63  		goto out;
4eafad7febd482 Alexey Ishchuk 2014-11-14  64  
4eafad7febd482 Alexey Ishchuk 2014-11-14  65  	if (copy_from_user(buf, user_buffer, length))
4eafad7febd482 Alexey Ishchuk 2014-11-14  66  		goto out;
4eafad7febd482 Alexey Ishchuk 2014-11-14  67  
f0483044c1c960 Sebastian Ott  2015-02-25  68  	ret = zpci_memcpy_toio(io_addr, buf, length);
4eafad7febd482 Alexey Ishchuk 2014-11-14  69  out:
4eafad7febd482 Alexey Ishchuk 2014-11-14  70  	if (buf != local_buf)
4eafad7febd482 Alexey Ishchuk 2014-11-14  71  		kfree(buf);
4eafad7febd482 Alexey Ishchuk 2014-11-14  72  	return ret;
4eafad7febd482 Alexey Ishchuk 2014-11-14  73  }
4eafad7febd482 Alexey Ishchuk 2014-11-14  74  

:::::: The code at line 35 was first introduced by commit
:::::: 4eafad7febd482092b331ea72c37274d745956be s390/kernel: add system calls for PCI memory access

:::::: TO: Alexey Ishchuk <aishchuk@linux.vnet.ibm.com>
:::::: CC: Martin Schwidefsky <schwidefsky@de.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
