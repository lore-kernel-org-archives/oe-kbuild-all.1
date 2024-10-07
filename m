Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45DD1DDA3C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Oct 2024 19:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728328214; cv=none; b=fbkfRftBzXSacLhVg9C4PstWQKuTGQvHpy/VIHjAjzvfZvm4p9PzZBwAF41fpGEKoCiyJQ757vmaljYBzHAliBQsUl3uvVV+r0610kUQV+ISHxT9BsXCVok366iry6uLCPIimmCbx3iA8a4T6pVcOYZdX7V2aPUrMjE/FCIPm3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728328214; c=relaxed/simple;
	bh=2xHOn4Sb3qrGqjaFXGtD6mFtxXFbop8YTeiQdWCmtNI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AIN06GhPP4Fs9FFxAe01G28w+TKTLUQp0WTuqiXyKi8L5MdOtql9Qw+WRxye4AdG3FOm6k/IRh/Ad2UYUVSitV0WbaYEvJOKa343xyX3j0PC4OrjXHWZBmGVao3MeITSYFHKmofebcrXVxGgImTQsmNAkdXmMVr5fxsqKGuYciI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SoOCKev9; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SoOCKev9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728328212; x=1759864212;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2xHOn4Sb3qrGqjaFXGtD6mFtxXFbop8YTeiQdWCmtNI=;
  b=SoOCKev9B/9gcqRdW6TrV7vbqL1LnhnC8N1ahrriNa8DWKdlmnWElidX
   iVsRJPboc6YXmI3sr4MD+kH9laOJDToexPjx1yWMRVWWy4yLMJGyaG/ZU
   Tkjs0tnhc18c28ntpl+64z+nWOhGJC4gm0GFy6r8ZZWGD1FBvp/EzJZZv
   kOk3ggPGdthsQ6Lfm4JJen0BqK3Z8Rwe32y0BnRliibGNpWSG19mVocxh
   b+q1s/+k7X0LjZEwEUBpnE6GQe2qPTdocJkfZA/kl8LfLleIy/PmLuRTw
   UiEw+4bUGpPLg6pzQqUPyF9bQzv/TVSh5UDlvY2aBmv2YOz9Cuwiu6JyS
   Q==;
X-CSE-ConnectionGUID: RLiEgtGQQyq2Ma+0/5uL6w==
X-CSE-MsgGUID: HLeTTMWETz2YNNoyBeHphQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="27619103"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="27619103"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 12:10:12 -0700
X-CSE-ConnectionGUID: AqdgPkVvS7eCB+nAY2A9wQ==
X-CSE-MsgGUID: t7HHOBGqTOK1uXSIAt4v2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="79563203"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Oct 2024 12:10:11 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxt7R-0005Qy-0T;
	Mon, 07 Oct 2024 19:10:09 +0000
Date: Tue, 8 Oct 2024 03:09:50 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@kernel.org>
Subject: [niks:has_ioport 6/6] include/asm-generic/io.h:596:15: error: call
 to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
Message-ID: <202410080349.EoAYQpvB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git has_ioport
head:   2d4f63f06a07c0470db8570a5b831c5ce9f91345
commit: 2d4f63f06a07c0470db8570a5b831c5ce9f91345 [6/6] asm-generic/io.h: Remove I/O port accessors for HAS_IOPORT=n
config: um-randconfig-r121-20241007 (https://download.01.org/0day-ci/archive/20241008/202410080349.EoAYQpvB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241008/202410080349.EoAYQpvB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410080349.EoAYQpvB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/um/include/asm/io.h:24,
                    from include/linux/io.h:14,
                    from include/linux/irq.h:20,
                    from drivers/tty/serial/8250/8250_port.c:18:
   drivers/tty/serial/8250/8250_port.c: In function 'autoconfig':
>> include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/tty/serial/8250/8250_port.c:1206:17: note: in expansion of macro 'outb'
    1206 |                 outb(0xff, 0x080);
         |                 ^~~~
>> include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/tty/serial/8250/8250_port.c:1215:17: note: in expansion of macro 'outb'
    1215 |                 outb(0, 0x080);
         |                 ^~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +/_outb +596 include/asm-generic/io.h

9216efafc52ff9 Thierry Reding  2014-10-01  594  
f009c89df79abe John Garry      2020-03-28  595  #if !defined(outb) && !defined(_outb)
f009c89df79abe John Garry      2020-03-28 @596  #define _outb _outb
2d4f63f06a07c0 Niklas Schnelle 2021-12-20  597  #ifdef CONFIG_HAS_IOPORT
f009c89df79abe John Garry      2020-03-28  598  static inline void _outb(u8 value, unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  599  {
a7851aa54c0cdd Sinan Kaya      2018-04-05  600  	__io_pbw();
a7851aa54c0cdd Sinan Kaya      2018-04-05  601  	__raw_writeb(value, PCI_IOBASE + addr);
a7851aa54c0cdd Sinan Kaya      2018-04-05  602  	__io_paw();
9216efafc52ff9 Thierry Reding  2014-10-01  603  }
2d4f63f06a07c0 Niklas Schnelle 2021-12-20  604  #else
2d4f63f06a07c0 Niklas Schnelle 2021-12-20  605  void _outb(u8 value, unsigned long addr)
2d4f63f06a07c0 Niklas Schnelle 2021-12-20  606  	__compiletime_error("outb() requires CONFIG_HAS_IOPORT");
2d4f63f06a07c0 Niklas Schnelle 2021-12-20  607  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  608  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  609  

:::::: The code at line 596 was first introduced by commit
:::::: f009c89df79abea5f5244b8135a205f7d4352f86 io: Provide _inX() and _outX()

:::::: TO: John Garry <john.garry@huawei.com>
:::::: CC: Wei Xu <xuwei5@hisilicon.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
