Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7497C59B4E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 13:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709473556; cv=none; b=AVQ9DMuVa94yCqFPoO/KZOHzTLNJuWYdUIEfxgg+OFCiWGw4FwcHxtnX7zQqfuiJLVlFjfbi3gqRoYdUMLUOlXg4pxprlQAgq2gfs49ktkb1Su0oCcTFpyys4s+DF3j7FlJOMEqV6IYekaMOheALwCAYPKDKWwy9TZoxR0jgUK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709473556; c=relaxed/simple;
	bh=k9cz3tOjWUCPLCrlSPBqDiJpYEOxWy47i+uw3XHmciI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZgYzbUFljV8ifNRzYadB+2hVW2Ifrx3qt5ANpmSFi6/UnwSyWAsHeMR9olOJMyzITJUHC3WtC2bjfFzNuzIwkgHxwED0xNqOo6Ze+7fv9+HegLQJ/Qporue0C7JtQXBCD7ILljuAUFOAYZdpoe+jAOLpRK1JyHRKZqP1KWuT/Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xg6Zna4d; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xg6Zna4d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709473554; x=1741009554;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k9cz3tOjWUCPLCrlSPBqDiJpYEOxWy47i+uw3XHmciI=;
  b=Xg6Zna4djMtcSjmFuBSu8nuLdaKUHxjiEvrYFb6xLbtpzVe7YLxUKS57
   RcFo+B4yCd+aYjPcZIbSf90cs12Zv7i+sfoZ4bPQrM8Ogo/NY2IXj35IY
   Ll8sHtDfD2hBbhNhPeAIAU4dPeDyZHQKICMwLjNeVCYgdP/HKFdjqKTqE
   7AcWrCUol95WZoA2EwqNGoWNtuT8CHTMHwpxibBMWVLvB575EZuZvDfjN
   h123EnIe3WDmfxdYbTeyBb836p6f7rkjdkgvFT+oP0qsW1d9Q428WfAX3
   RU6tN+3EvrZfSBMSYLh1HO7WJ8WyNd3HEe1+Hos/qZczKBLLS9C28GeLd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="14545097"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="14545097"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 05:45:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="8650882"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Mar 2024 05:45:49 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgm9z-0001oQ-0h;
	Sun, 03 Mar 2024 13:45:47 +0000
Date: Sun, 3 Mar 2024 21:45:14 +0800
From: kernel test robot <lkp@intel.com>
To: Julia Cartwright <julia@ni.com>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Wagner <wagi@monom.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [cip:linux-4.19.y-cip-rt 1910/30000]
 fs/squashfs/decompressor_multi_percpu.c:29:30: warning: 'stream_lock'
 defined but not used
Message-ID: <202403032108.ocTYBrHE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip-rt
head:   dcbd51e7744fcf9baa3ea87a028b574fda95d428
commit: fc25f47e31872f53c64c1ca35c76963fab6530f6 [1910/30000] squashfs: make use of local lock in multi_cpu decompressor
config: i386-buildonly-randconfig-005-20240303 (https://download.01.org/0day-ci/archive/20240303/202403032108.ocTYBrHE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240303/202403032108.ocTYBrHE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403032108.ocTYBrHE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/squashfs/decompressor_multi_percpu.c:13:
>> fs/squashfs/decompressor_multi_percpu.c:29:30: warning: 'stream_lock' defined but not used [-Wunused-const-variable=]
      29 | static DEFINE_LOCAL_IRQ_LOCK(stream_lock);
         |                              ^~~~~~~~~~~
   include/linux/locallock.h:243:71: note: in definition of macro 'DEFINE_LOCAL_IRQ_LOCK'
     243 | #define DEFINE_LOCAL_IRQ_LOCK(lvar)             __typeof__(const int) lvar
         |                                                                       ^~~~


vim +/stream_lock +29 fs/squashfs/decompressor_multi_percpu.c

    28	
  > 29	static DEFINE_LOCAL_IRQ_LOCK(stream_lock);
    30	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
