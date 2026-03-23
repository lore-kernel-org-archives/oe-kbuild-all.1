Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF1137B40C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Mar 2026 23:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774308987; cv=none; b=DMTCg2Rq8XSzgkxZ8FNs4ca41XADveyG7lyx5lZNGM5w9ZQAqQ4R5wWDz1GcSZ2YBTJvvU8qHyKHO42KyyfcgSY8zGmSvQ2TzUkv+fk+V/1Vzy9Vi5mI58L90daYDWEDct3OZtFBQJ7GrwntYYjQ0FZ+By4Qa8t41IZHTtRuIoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774308987; c=relaxed/simple;
	bh=FojdXNmMGAxHzMoIBam1HX+QMvlL78P2pB0/bdu7Tpo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U4fSj3eChiadMTnjRiJup28LdDylbsKVO6WEHq1NFMgqtvz6rJ46moqH7i6jJWeW9apvnN8egaGNTt+PVXpVXHTVu9tVHF6OliBJ497taK00dTo7seouShiPCjxrtBu11mHay14p8cyZWuUFYbpzdD69p3wySPOMG+45P5u+gxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mX+ewJCU; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mX+ewJCU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774308986; x=1805844986;
  h=date:from:to:cc:subject:message-id;
  bh=FojdXNmMGAxHzMoIBam1HX+QMvlL78P2pB0/bdu7Tpo=;
  b=mX+ewJCUE6JF/O79hYdCGbV6O/8byp70qT+6L8YfEsOq3ZdyWMSOPjVK
   7T4vkDjKSVSIJigoFGoBBCamAqv/AEw/iVU9qNL+weUTXMygypy6ip8OX
   WQBIIeCgsp95PUCAWDWeJi2AawUdpYCIy972ZXVHGWpuBykD74TMPQH1d
   nQAKSfBQc7xQpUGzOSN31/6Dpsub+I1ZiG5UAMIFLj+xoRkThpoaBXYFy
   hRLiYi2rEz8SY0qf4pJEG1PMlyXlmh8Yi1Z01dwLYXmFn051/AIaYpU/l
   l4mCzgVAwXELpWoREpvUxR29eV6CIVwSXNBRDQUE0JWteoJJ1TtsP2XSv
   A==;
X-CSE-ConnectionGUID: QXe+RVOjSDKdlRnWN1NjvQ==
X-CSE-MsgGUID: hfyFNG7+TYGn7SuvGvQruw==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75436421"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="75436421"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 16:36:25 -0700
X-CSE-ConnectionGUID: yDeBH2k+RFWtzKv5jgGlqw==
X-CSE-MsgGUID: 6q4FIAv3S0mQiNRgvMAnKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="254648917"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 Mar 2026 16:36:23 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4oom-000000003Or-2qxb;
	Mon, 23 Mar 2026 23:36:20 +0000
Date: Tue, 24 Mar 2026 07:36:13 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Penkler <dpenkler@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c:1817:7-14:
 WARNING opportunity for memdup_user
Message-ID: <202603240737.Hzix2nb7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c369299895a591d96745d6492d4888259b004a9e
commit: e6ab504633e4c06e35377ecf3c8cbc304de79858 staging: gpib: Destage gpib
date:   4 months ago
config: csky-randconfig-r063-20260324 (https://download.01.org/0day-ci/archive/20260324/202603240737.Hzix2nb7-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603240737.Hzix2nb7-lkp@intel.com/

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
