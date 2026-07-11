Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703D5381EB6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jul 2026 09:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783763428; cv=none; b=mRmdZyx6E/FZLfRncA46glg7P7RqwyZ65kRF2v52/HpKa9joWVrxgcQ9BKEwrIFN6KBnokET3N2+K/LANCVSbaE7tKA6b4DLXBqhhoqt+hLUImrzP/G9ZaZVmuneQVbAVBvHxhOCCTsiB6RYcxvv5ZOVNP5uYY1NwLjjba+lSDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783763428; c=relaxed/simple;
	bh=51tKNm7aCQ8+TpgA16ThLAubyIgTFqgqQicUphm1N3I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N0n305JQCe9ysGXjI5V+QFEWe8ETTBplE05vyk7e9BW+Iw73wSa/e5jNUh39iEr5cVDhdLMMq6xV2I0gOQE6SNTgm9jNEXaoOGLk2bjFCgrDdAZrjZRNDmDKRsAviklC+TpE53moERpbQ/jwIGuMLzGuWW261xWbOKgdcQtNCrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ALp615iQ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ALp615iQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783763427; x=1815299427;
  h=date:from:to:cc:subject:message-id;
  bh=51tKNm7aCQ8+TpgA16ThLAubyIgTFqgqQicUphm1N3I=;
  b=ALp615iQMln9bfIq7NKyVIstMw6UgyAUL6m6jVtgJtlSlXne6zUD93Rx
   JPHcvH04HIFMwS/lwGSI5zxs1st981UqDyo+mKb5ajvIOPGiOhdrUhhiW
   DveJLdFOsEN2MWB4Y/7dZ3lRc0QbwIJ5d+FT4cl3vZpjpanlJddE5ZL0Y
   nvO+8krMi+u2/zIFO+wnohoT6gjkeZ8pq+i1eqS/+i/M9IgjBVAD/+U6x
   9ovNN7ZyEuuaIDI77qH/E89gNQr8XQR9J0I9YnJplArbuaEZbOjF+UXe2
   Ues+g/7LjHBhrp+YX2pDOPiichZ8vRz8kCs+NWfpcq9cOzcO1ZtULNEnv
   Q==;
X-CSE-ConnectionGUID: pVyzs4BcRSaXYel354i5+A==
X-CSE-MsgGUID: nt621kTcQ2Wc/J0/Ml+/0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="94800637"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="94800637"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 02:50:25 -0700
X-CSE-ConnectionGUID: n1x99ySATkKvGXooSgPyKQ==
X-CSE-MsgGUID: Qggd4/pdTjmUAdUivm3s1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="255747423"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 11 Jul 2026 02:50:23 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiULk-00000000JxM-0no5;
	Sat, 11 Jul 2026 09:50:20 +0000
Date: Sat, 11 Jul 2026 17:50:00 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Penkler <dpenkler@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c:1817:7-14:
 WARNING opportunity for memdup_user
Message-ID: <202607111740.UNpfLXaQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Dave,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dd3210c47e8d3ac6b4e9141fc68acc03b38c0ba3
commit: e6ab504633e4c06e35377ecf3c8cbc304de79858 staging: gpib: Destage gpib
date:   8 months ago
config: hexagon-randconfig-r051-20260709 (https://download.01.org/0day-ci/archive/20260711/202607111740.UNpfLXaQ-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c279890c85da307abe34f10333442bbf72a60644)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e6ab504633e4 ("staging: gpib: Destage gpib")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607111740.UNpfLXaQ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c:1817:7-14: WARNING opportunity for memdup_user

vim +1817 drivers/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c

fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  1803  
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  1804  /*
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  1805   * user space access to write function
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  1806   */
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  1807  
8e7ff4e7a2358f drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2025-01-14  1808  static ssize_t skel_write(struct file *file, const char __user *user_buffer,
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  1809  			  size_t count, loff_t *ppos)
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  1810  {
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  1811  	struct usb_skel *dev;
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  1812  	char *buf;
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  1813  	ssize_t rv;
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  1814  
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  1815  	dev = file->private_data;
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  1816  
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18 @1817  	buf = kmalloc(count, GFP_KERNEL);
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  1818  	if (!buf)
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  1819  		return -ENOMEM;
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  1820  
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  1821  	if (copy_from_user(buf, user_buffer, count)) {
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  1822  		kfree(buf);
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  1823  		return -EFAULT;
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  1824  	}
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  1825  
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  1826  	rv = skel_do_write(dev, buf, count);
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  1827  	kfree(buf);
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  1828  	return rv;
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  1829  }
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  1830  #endif
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  1831  

:::::: The code at line 1817 was first introduced by commit
:::::: fce79512a96afacbe297ba3c5c2f7ed34944540d staging: gpib: Add LPVO DIY USB GPIB driver

:::::: TO: Dave Penkler <dpenkler@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
