Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A463BE15F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Mar 2026 16:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774284484; cv=none; b=eeloF24XmNtgAb1HIVMi7VW78urWXilgyXSEkUyeA06azQ35RqS2DuS9cW8QihW2vnzH7DYh2ynk2sv/yfxY+AtJEMw4ErqMH0CjaJj0NYppmsLmLRMv5TMAWO29fmr0wwvSXaJd4JZBJdhPGT2EcYzORYTyjXkcd8dYMmqq4XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774284484; c=relaxed/simple;
	bh=DzlbShrk/NHY/6GfL8BW1dmNpDKuC/n106aoUQBK9JE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tGlVftA2GY4myZADM4B3ZV4VHUvDjNEC7KH9C+8pfEikvUhVWTf1PZlEuKMYKATdHVmFTH1uzXRZ7vJkUwenxB54lJ/IRUbSDc7XZgw7mBgiTz48YQmyT8pX1gdxfSrWWm0GgasNt+doChg0rXQiIVIBOspzsZgT+KyJ1pFHqvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kVMfUc1A; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kVMfUc1A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774284483; x=1805820483;
  h=date:from:to:cc:subject:message-id;
  bh=DzlbShrk/NHY/6GfL8BW1dmNpDKuC/n106aoUQBK9JE=;
  b=kVMfUc1AQqdscZuhAHow7oKc8Hy762UnsYH4r2gIXmBw/UKPNe/ne/Ky
   31zz1DU9nOwix1hipw0VY69RIezrSVffkhE7iBEuGcloSu7H8u+NuzDZj
   DjwMbzC9TQz4TRM6k2dhuwS1v68Ck8ZbNluDnE4PXnzTCr8nRz030355D
   LEM1QOHXujdOZUbGqXx8FtBNunYkO4+gVs4ILFUMu9x8tdulCqkgRr1nV
   Rjpz6jhhXbyXZTCdLC1wBZnVrSX5/lk0pFvfZYCK3rYLTjgST6mkAhM9I
   8VcbNQOAsfIfSsw0oH/3SfJZpNnS58V2+qcXkJLwmHrTGu/mvBt6Xschy
   w==;
X-CSE-ConnectionGUID: +KBO83+PTIWBIeRgdgFYCQ==
X-CSE-MsgGUID: KAyWuAYwQTikuM+NMlLaeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="86762959"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="86762959"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 09:48:03 -0700
X-CSE-ConnectionGUID: PIsikTcpSyGc8QffwlDW7A==
X-CSE-MsgGUID: arxOL2FpRkKWwqp/nvNrNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="224292287"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 23 Mar 2026 09:48:01 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4iRb-000000002ZH-2VLO;
	Mon, 23 Mar 2026 16:47:59 +0000
Date: Tue, 24 Mar 2026 00:47:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/36]
 drivers/dma-buf/dma-buf.c:345: warning: Excess function parameter 'buf'
 description in 'dma_buf_set_name'
Message-ID: <202603240015.RaX6igJP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Guangming,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   b98cfc3cd4ab26abf9d75eaa32b740007d196796
commit: 88a96b0b27bcdda732e9d4e9d35cefad8ea7ffd9 [0/36] ANDROID: dma-buf: support users to change dma_buf.name
config: x86_64-buildonly-randconfig-003-20260323 (https://download.01.org/0day-ci/archive/20260324/202603240015.RaX6igJP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603240015.RaX6igJP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603240015.RaX6igJP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dma-buf/dma-buf.c:345: warning: Function parameter or struct member 'name' not described in 'dma_buf_set_name'
>> drivers/dma-buf/dma-buf.c:345: warning: Excess function parameter 'buf' description in 'dma_buf_set_name'


vim +345 drivers/dma-buf/dma-buf.c

   330	
   331	/**
   332	 * dma_buf_set_name - Set a name to a specific dma_buf to track the usage.
   333	 * It could support changing the name of the dma-buf if the same
   334	 * piece of memory is used for multiple purpose between different devices.
   335	 *
   336	 * @dmabuf: [in]     dmabuf buffer that will be renamed.
   337	 * @buf:    [in]     A piece of userspace memory that contains the name of
   338	 *                   the dma-buf.
   339	 *
   340	 * Returns 0 on success. If the dma-buf buffer is already attached to
   341	 * devices, return -EBUSY.
   342	 *
   343	 */
   344	long dma_buf_set_name(struct dma_buf *dmabuf, const char *name)
 > 345	{
   346		char *buf = kstrndup(name, DMA_BUF_NAME_LEN, GFP_KERNEL);
   347		if (!buf)
   348			return -ENOMEM;
   349	
   350		_dma_buf_set_name(dmabuf, buf);
   351	
   352		return 0;
   353	}
   354	EXPORT_SYMBOL_GPL(dma_buf_set_name);
   355	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
