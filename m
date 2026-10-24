Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792846538;
	b=Rw9TtPBOGTF6Mzht+FrGpNlo/n9O1fFSH6BUEHTkdvevVXcnmS/tfZtK894s1UNr5HD2
	 ZqHfsvpl7ryiuWPlhRD2JhEtZwzumh0OmtVPmgJDUI4OqGeF3Bd8I2r1Io9aXTJglAWsl
	 RKv8HwOp4T6C94KhmsCP3OMbV9g+Greordmn2deOEn2nwZVbONHJR6PLXtiwzt+G+Vulu
	 exyMU3NnFgelAKd/gGGNA+21bRUz0KPhR98uQ89L0NZzZHWcb3GUkFjA7Rh/++2NqehgS
	 ouw2Rl1PXd/mUvPU6hiNQQlRX4r8uZwFO45cbeh4tFo3Fy/l/uEWxBE5WnVU86tovyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792846538;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=OEo9MuwrhAxlKndK7JFzPiqomvMs2AGZ1w4rVHi43Cs=;
	b=GxCvMGxRQzPOCBkRXIBuYpuvlL6S+U1nfHuRIUrwJP8Fk9iY/7irAvRwPLgEa5q0QUOu
	 xAW8mBZG6mIuNrmPMpzbJhWHTQ3w9DV8gIF+t6GkP1DPCcfR39RGlGIXSKg2K+r9Wi2aJ
	 76Nnd/jrePKLLXRNhU1gfTFxPVbiyT+L8px9RlDsMVVS1IuH/yEjR3JMRceKxUbPR4Hmh
	 xTS11dnvLCuf/hPo3YksHF2L/kr4UIeyhLXev7nRwKEkT3D6XpbDC5nP+lA5tokHfyVt9
	 q6j71QuTLHTLmwUPnJn+5JenuVr0+m1cIO8UCNb4nI4BJwOEvP90q/dIB6PqfSurXkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Kca3Pu1x;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E390E606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Oct 2026 12:55:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E390E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Kca3Pu1x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792846537; x=1824382537;
  h=date:from:to:cc:subject:message-id;
  bh=myNWvuVDFV4QjlY3Py8LghcnHHLrznUaCQl4YDQyu/s=;
  b=Kca3Pu1xeT4AQxyKQFPkCWewsF3uaq7IRbcuyBXk1lo9dzC4ddSet+FH
   vaU/QP5OLLlTJWkwxqDCycwxt99Zq5VC1Ym6dvvHNCFAFTq8aUKEKLdgp
   Hv8PiByKg6sd51CVavOJEsDvqAQCy4fTMFsUKUuf30IJxSFhmBFvKZeLm
   uxDDFge+fsTuZsYJQa5Tlm7a6RkG8qBJpW10VjnkuSSj2bRMa37mmcjFC
   f+kITjhtq5eSCOh6E+KEkMvpIHr8kNDJGhjSxXUogrAMNjRDLIhQdoLOT
   p0RnXhUsCnSglY0gisFZQDU0jJT6wy+Ge2rz0dy4+CpeYtF5yIvoxrl+x
   w==;
X-CSE-ConnectionGUID: SIQ3kVMoRG+/11nkBH+mdw==
X-CSE-MsgGUID: GTBh2YMsSjmqzYdbv6IYsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1687167"
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="1687167"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 05:55:36 -0700
X-CSE-ConnectionGUID: oHkR7TJ8TnqTU1uSwXBzig==
X-CSE-MsgGUID: Vf4A2CUlSIWX2tBwobGIjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="3882004"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 Oct 2026 05:55:35 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKbHY-00000000Tso-2Pkz;
	Sat, 24 Oct 2026 12:55:32 +0000
Date: Sat, 24 Oct 2026 20:54:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 drivers/dma-buf/dma-buf.c:363: warning: Function parameter or member 'name'
 not described in 'dma_buf_set_name'
Message-ID: <202610242048.rON5p0DA-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Guangming,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   60cf931c5a95dacbbd86483d5d0978e80a756ccd
commit: 05811b07b50aa107b805735f20c9029b40e9a7d9 [1/1] ANDROID: dma-buf: support users to change dma_buf.name
config: arm-randconfig-1001-20261020 (https://download.01.org/0day-ci/archive/20261024/202610242048.rON5p0DA-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261024/202610242048.rON5p0DA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610242048.rON5p0DA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma-buf/dma-buf.c:363: warning: Function parameter or member 'name' not described in 'dma_buf_set_name'
   drivers/dma-buf/dma-buf.c:363: warning: Excess function parameter 'buf' description in 'dma_buf_set_name'


vim +363 drivers/dma-buf/dma-buf.c

   348	
   349	/**
   350	 * dma_buf_set_name - Set a name to a specific dma_buf to track the usage.
   351	 * It could support changing the name of the dma-buf if the same
   352	 * piece of memory is used for multiple purpose between different devices.
   353	 *
   354	 * @dmabuf: [in]     dmabuf buffer that will be renamed.
   355	 * @buf:    [in]     A piece of userspace memory that contains the name of
   356	 *                   the dma-buf.
   357	 *
   358	 * Returns 0 on success. If the dma-buf buffer is already attached to
   359	 * devices, return -EBUSY.
   360	 *
   361	 */
   362	long dma_buf_set_name(struct dma_buf *dmabuf, const char *name)
 > 363	{
   364		char *buf = kstrndup(name, DMA_BUF_NAME_LEN, GFP_KERNEL);
   365		if (!buf)
   366			return -ENOMEM;
   367	
   368		_dma_buf_set_name(dmabuf, buf);
   369	
   370		return 0;
   371	}
   372	EXPORT_SYMBOL_GPL(dma_buf_set_name);
   373	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
