Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2C3D50F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Apr 2024 12:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712923312; cv=none; b=bdd+QzTGHqk8JNk8ZHE/zYoMgrLoJtgiD/T9+GFNxHi83iV7v71Ks/cwDZnD1IKoYjshLSoyi07nvbr8DLhn0HfSaXi6SMVFkhpVHtHpb8+cLDIFwDr0I15sI+9UNusHXAQmV7XxreDmMotDjuygYe9AtbD7RzN7tG6m5Foa1Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712923312; c=relaxed/simple;
	bh=WqH8iu1DHLDQ7Tgdr95QxniWlncyrPlmDKgHwd6wlYw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aIK8fl6VyRuFmQ9Ufuyp13L9K1gX24CWRDxRCep88ZPFunhPUkLaeqH+Lz4fRYtj39Jz9o0EuX67hhUhK21EOHI8lOQ4d8nrMi6FhE8RgKgIFVY1Srn0y0cn0CCritflDFnQ2u6LDw9w3tSbHNhGxnewC1tZXTKR3wpZUqMvcTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ej+63r8N; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ej+63r8N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712923308; x=1744459308;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WqH8iu1DHLDQ7Tgdr95QxniWlncyrPlmDKgHwd6wlYw=;
  b=ej+63r8NSO3OuPd0rkTCWyVcqSXe4lf0I/Rflo7dF8pLm6lWQCrcvqxw
   00Hz/0zjAiv1jHp1z4JuheR4EfsmPL1EQJ7Zv3RPFaYgGzt10G8/NSI0q
   90nlNKfE4BPZUzXkHqTP9L7CrNTlkK8JEpUtAF7qHEruCBSBstkjuY73T
   yx3+IjdBX1J9u6ZWoXSa/v4x0cj2QtL2SfrfXsJqIantKeRnPvom8kN8c
   QMi7fCGKmMCjBTkD9t+XLCbfPTsil6h222+B/A1Jm/LVIVr4B9ngZW26K
   NG3PewI9qPeFKbOzbFsZbbqCyKHq8du2/ClPnyK0xp1okqUyNPhSxj7GC
   g==;
X-CSE-ConnectionGUID: KOkM0bqWSM2PXhEofO/f1Q==
X-CSE-MsgGUID: WJZxuy93SRmeV6qdm7fwOQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="18981958"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="18981958"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 05:01:47 -0700
X-CSE-ConnectionGUID: siwhzmogQo6GLMuZM8sWWA==
X-CSE-MsgGUID: yUnznXBRQ8Cu2w/HWdTwkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="21299757"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Apr 2024 05:01:46 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvFbD-0009jV-0o;
	Fri, 12 Apr 2024 12:01:43 +0000
Date: Fri, 12 Apr 2024 20:01:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 149/438]
 drivers/gpu/drm/armada/armada_debugfs.c:67:15: error: implicit declaration
 of function 'strncpy_from_iter'; did you mean 'strncpy_from_user'?
Message-ID: <202404122009.4aHWcVo2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   8e79f6c3d0a118031e843758491803e38794f6e8
commit: 4e0822889b2a1480f452308832726a528b06365e [149/438] drm: armada: convert to read/write iterators
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20240412/202404122009.4aHWcVo2-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240412/202404122009.4aHWcVo2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404122009.4aHWcVo2-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/armada/armada_debugfs.c: In function 'armada_debugfs_crtc_reg_write':
>> drivers/gpu/drm/armada/armada_debugfs.c:67:15: error: implicit declaration of function 'strncpy_from_iter'; did you mean 'strncpy_from_user'? [-Werror=implicit-function-declaration]
      67 |         ret = strncpy_from_iter(from, ptr, len);
         |               ^~~~~~~~~~~~~~~~~
         |               strncpy_from_user
>> drivers/gpu/drm/armada/armada_debugfs.c:67:39: error: 'ptr' undeclared (first use in this function)
      67 |         ret = strncpy_from_iter(from, ptr, len);
         |                                       ^~~
   drivers/gpu/drm/armada/armada_debugfs.c:67:39: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/gpu/drm/armada/armada_debugfs.c:77:37: error: 'file' undeclared (first use in this function)
      77 |         dcrtc = ((struct seq_file *)file->private_data)->private;
         |                                     ^~~~
   cc1: some warnings being treated as errors


vim +67 drivers/gpu/drm/armada/armada_debugfs.c

    50	
    51	static int armada_debugfs_crtc_reg_write(struct kiocb *iocb,
    52						 struct iov_iter *from)
    53	{
    54		size_t len = iov_iter_count(from);
    55		struct armada_crtc *dcrtc;
    56		unsigned long reg, mask, val;
    57		char buf[32];
    58		int ret;
    59		u32 v;
    60	
    61		if (iocb->ki_pos != 0)
    62			return 0;
    63	
    64		if (len > sizeof(buf) - 1)
    65			len = sizeof(buf) - 1;
    66	
  > 67		ret = strncpy_from_iter(from, ptr, len);
    68		if (ret < 0)
    69			return ret;
    70		buf[len] = '\0';
    71	
    72		if (sscanf(buf, "%lx %lx %lx", &reg, &mask, &val) != 3)
    73			return -EINVAL;
    74		if (reg < 0x84 || reg > 0x1c4 || reg & 3)
    75			return -ERANGE;
    76	
  > 77		dcrtc = ((struct seq_file *)file->private_data)->private;
    78		v = readl(dcrtc->base + reg);
    79		v &= ~mask;
    80		v |= val & mask;
    81		writel(v, dcrtc->base + reg);
    82	
    83		return len;
    84	}
    85	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
