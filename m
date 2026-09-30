Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DC13CE4B9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 18:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790794322; cv=none; b=U4szI+YIyTpm1n2jNeenl4LqxzToaZRrsLvczzs9PRMA+xa95ljLUedVQ7cnb/aMckV+/oaF7KjB68XKzvgeOgRAT/KZpp/VXvG5ZrI8hznvcr/3Ww9erXHTkB/9VfIOFzLH1RMaStThYlHDWzGHom9wbjisOLkC16dHiHVKIfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790794322; c=relaxed/simple;
	bh=wDoG6HdEXK5R8HbYj3puIxMCzQFDy/UZTwQr4bsHCaw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=o1ZIvYeIRoWPJUF21ffgJxrgT1NUmEcxpIbvkEcubj9GNqiaKhk5stiJSeNZzUjxO0KvU4N5r2v3uCwX1YwphFMKpJaZiQR+sF75EyU/tVmvu6x2mIn8HsnrBMc5+APBRNM5E9+acEiz8u7laRCHfzI8PU04pI+FJakS3YH+Fg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F52c0AmN; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F52c0AmN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790794321; x=1822330321;
  h=date:from:to:cc:subject:message-id;
  bh=wDoG6HdEXK5R8HbYj3puIxMCzQFDy/UZTwQr4bsHCaw=;
  b=F52c0AmNUbzCGuvg08v9bORQcape+bYV+xxmqHD68QXreKiK5ZBW1rVV
   LlHhItJf7Yf2zBl825m6w95nKDpUdPkCIw/MXTXzphq09GoTH8yJX8h2z
   OWcXk1HbZ0CptpatSshcL06VRkg/vcV93j5SJFVn6su0Ho1WV5cky+Sfd
   Tmdi8LvQACW3YbQxk66IWv+TknWzrXZJvjBweVe70G2yvv06Iv14LWXZD
   HQAem8gdfIJXRKoB8/NuFygjboCNtlU3ilLb8g/D/Hvxg5OCrpgBO++mz
   vJhD4dZe+VDulkI2HNs33OImVLO/oLfGfA30WBWWsaz1zxKEkoLMUmzSU
   g==;
X-CSE-ConnectionGUID: E9JpiUjZRVuZvT/jFbFvvQ==
X-CSE-MsgGUID: J/mItyuZTx2nEGVehaM+Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="101705054"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="101705054"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 11:52:00 -0700
X-CSE-ConnectionGUID: JcI2jgaHS26WRD9LIoefsQ==
X-CSE-MsgGUID: 6RcjcT7HTNKmFok5DIxx5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="275898495"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 30 Sep 2026 11:51:59 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBzPI-000000001y3-3CUw;
	Wed, 30 Sep 2026 18:51:56 +0000
Date: Wed, 30 Sep 2026 20:51:08 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1]
 arch/arm64/geniezone/../../../drivers/virt/geniezone/gzvm_main.c:58:25:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202609302058.hmdp7xyp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   127112c19ee1a85a5e1becf01f3fc63f9ad902f3
commit: 95c99c73ca517a95f0b2eae2634bac66640a28eb [1/1] ANDROID: virt: geniezone: Add block-based demand paging support
config: arm64-randconfig-r2303-20260930 (https://download.01.org/0day-ci/archive/20260930/202609302058.hmdp7xyp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609302058.hmdp7xyp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609302058.hmdp7xyp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/geniezone/../../../drivers/virt/geniezone/gzvm_main.c:58:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *s @@     got char const [noderef] __user *buf @@
   arch/arm64/geniezone/../../../drivers/virt/geniezone/gzvm_main.c:58:25: sparse:     expected char const *s
   arch/arm64/geniezone/../../../drivers/virt/geniezone/gzvm_main.c:58:25: sparse:     got char const [noderef] __user *buf

vim +58 arch/arm64/geniezone/../../../drivers/virt/geniezone/gzvm_main.c

    37	
    38	static ssize_t demand_paging_batch_pages_store(struct file *file,
    39						       const char __user *buf,
    40						       size_t count,
    41						       loff_t *ppos)
    42	{
    43		int ret;
    44		u32 temp;
    45		char buffer[16];
    46	
    47		if (*ppos != 0)
    48			return 0;
    49	
    50		if (count > sizeof(buffer))
    51			return -EINVAL;
    52	
    53		if (copy_from_user(buffer, buf, count))
    54			return -EFAULT;
    55	
    56		buffer[count] = '\0';
    57	
  > 58		ret = kstrtoint(buf, 10, &temp);
    59		if (ret < 0)
    60			return ret;
    61	
    62		if (temp == 0 || (PMD_SIZE % (PAGE_SIZE * temp)) != 0)
    63			return -EINVAL;
    64	
    65		gzvm_drv.demand_paging_batch_pages = temp;
    66	
    67		return count;
    68	}
    69	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
