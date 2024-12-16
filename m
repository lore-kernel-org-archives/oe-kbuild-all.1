Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5CF1CD213
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Dec 2024 06:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734331905; cv=none; b=OmUptnC0v20mQWJoj/QMt59vaKxEKYuSuTwzk8tiHLgaefaQ05AwPzhoC4u2zPG2zJn2WoR/rPdaXxs1CsXZOrKlNfxoTrXvDtpv69X+WUrWM5M5/rXKJgAi+5jZgsq5GNSfNfvK6lxX8Zf3c1Pkb522CpOuZnTzMgznlTWtKnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734331905; c=relaxed/simple;
	bh=EnQp0UP0uL5OBa+gAUqfm2A3p9TF6QpAN/R+voyTzFI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mi/gqvLzWaB+fEv0KfiSUgzo2t7gyWS/EOScTvjthjgLr41g5pZwPg3+A6sFWW2nJFmI5/P4fXeko1qPQXieOY18ISRAKSFt9UCrMxDJn7Z4ae2KJFDUn1/CtbQIvvv45Qajds4vLeVs2LRkfmnMvbvv87an1EijrSZhH9p+Ijs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ibOK6lKr; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ibOK6lKr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734331903; x=1765867903;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EnQp0UP0uL5OBa+gAUqfm2A3p9TF6QpAN/R+voyTzFI=;
  b=ibOK6lKrv+D1wnxvXK7m8eVojueQ1/Ckglwh/1qDF0VOAdMIOocG9vqZ
   48eNJPHOTv6nRfusr/HFKjgnNBSIabZgWemo2EJgLhdZwGdvq0LejvmQW
   cau3wKL7OKviIpFZAupbGBErhhpvkoZ7/GSaEVDb8E8VkauD2AoKjlSqc
   LWQm0nIlq4rf0VWbJmLdnz5pVQxOCPDzgmjdreMjq10iX3tO8fp3tMpSP
   mv1iWKW9cwQDejDeFymkaXCeDHH5gs2MgVmCUApxqHh3/yYVaiBXQ4G9J
   zWfQtNbi5EGcddzv+GF95OlBaJt9YH/9o4BnRePSQrz3Ey2F1H8BgWnMT
   Q==;
X-CSE-ConnectionGUID: 3m/hTyGaTPaVTbsUbe2DcA==
X-CSE-MsgGUID: IitxHD/LRa+JM9nsAfRmnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="34437412"
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="34437412"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 22:51:42 -0800
X-CSE-ConnectionGUID: zdDYjtD3QwyXvgKdxLuDRg==
X-CSE-MsgGUID: tHl7iNEjS9ajtjwSRBlzmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="96858573"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 15 Dec 2024 22:51:41 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tN4x9-000E4M-01;
	Mon, 16 Dec 2024 06:51:39 +0000
Date: Mon, 16 Dec 2024 14:50:33 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Penkler <dpenkler@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c:1920:7-14:
 WARNING opportunity for memdup_user
Message-ID: <202412161428.VkrrQFab-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8
commit: 165e8cc3cfec9ef51f3376b0d49b115294f34f3b staging: gpib: Add KBUILD files for GPIB drivers
date:   10 weeks ago
config: x86_64-randconfig-104-20241216 (https://download.01.org/0day-ci/archive/20241216/202412161428.VkrrQFab-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412161428.VkrrQFab-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c:1920:7-14: WARNING opportunity for memdup_user

vim +1920 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c

fce79512a96afac Dave Penkler 2024-09-18  1906  
fce79512a96afac Dave Penkler 2024-09-18  1907  /*
fce79512a96afac Dave Penkler 2024-09-18  1908   *  user space access to write function
fce79512a96afac Dave Penkler 2024-09-18  1909   */
fce79512a96afac Dave Penkler 2024-09-18  1910  
fce79512a96afac Dave Penkler 2024-09-18  1911  static ssize_t skel_write(struct file *file, const char *user_buffer,
fce79512a96afac Dave Penkler 2024-09-18  1912  			  size_t count, loff_t *ppos)
fce79512a96afac Dave Penkler 2024-09-18  1913  {
fce79512a96afac Dave Penkler 2024-09-18  1914  	struct usb_skel *dev;
fce79512a96afac Dave Penkler 2024-09-18  1915  	char *buf;
fce79512a96afac Dave Penkler 2024-09-18  1916  	ssize_t rv;
fce79512a96afac Dave Penkler 2024-09-18  1917  
fce79512a96afac Dave Penkler 2024-09-18  1918  	dev = file->private_data;
fce79512a96afac Dave Penkler 2024-09-18  1919  
fce79512a96afac Dave Penkler 2024-09-18 @1920  	buf = kmalloc(count, GFP_KERNEL);
fce79512a96afac Dave Penkler 2024-09-18  1921  	if (!buf)
fce79512a96afac Dave Penkler 2024-09-18  1922  		return -ENOMEM;
fce79512a96afac Dave Penkler 2024-09-18  1923  
fce79512a96afac Dave Penkler 2024-09-18  1924  	if (copy_from_user(buf, user_buffer, count)) {
fce79512a96afac Dave Penkler 2024-09-18  1925  		kfree(buf);
fce79512a96afac Dave Penkler 2024-09-18  1926  		return -EFAULT;
fce79512a96afac Dave Penkler 2024-09-18  1927  	}
fce79512a96afac Dave Penkler 2024-09-18  1928  
fce79512a96afac Dave Penkler 2024-09-18  1929  	rv = skel_do_write(dev, buf, count);
fce79512a96afac Dave Penkler 2024-09-18  1930  	kfree(buf);
fce79512a96afac Dave Penkler 2024-09-18  1931  	return rv;
fce79512a96afac Dave Penkler 2024-09-18  1932  }
fce79512a96afac Dave Penkler 2024-09-18  1933  #endif
fce79512a96afac Dave Penkler 2024-09-18  1934  

:::::: The code at line 1920 was first introduced by commit
:::::: fce79512a96afacbe297ba3c5c2f7ed34944540d staging: gpib: Add LPVO DIY USB GPIB driver

:::::: TO: Dave Penkler <dpenkler@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
