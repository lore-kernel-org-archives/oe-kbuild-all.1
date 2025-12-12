Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68F341C71
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 03:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765508777; cv=none; b=tiQs4KdsoEFVKA4ZBULPCLH42Ncom6Wugs4lnhVZpiNrBVB81KTUJ2cyx0lNvkjrxyfsYNCWorz26LPskwk56uzWGzdyvujrotksx3gfyGVCnrXb1b+RskyOTFzwXI91RZibe+lzBNSp3lVetIG2pnhdogvgmpHfIy9FmoyqSJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765508777; c=relaxed/simple;
	bh=RG7uSbpfr3CjxybLtw+F4Oe+r/WzDSBKKoClieWqWbk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DVkqlaT+lW6wbulW3v5Jdla0506Pq+30Ik+rS/6JEcgpELXNgxdqj4TTWDftFCWkKcGEynKwWGDNZRz9VQgAU6aekFddjpKxdVlCMQlOPPj/riv+LHry+wNNQHm6qQlEMV4o/BmfVd34gScIzVxxVr6C2LjbtY/8QLd1qNs3DGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GubgPqE1; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GubgPqE1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765508776; x=1797044776;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RG7uSbpfr3CjxybLtw+F4Oe+r/WzDSBKKoClieWqWbk=;
  b=GubgPqE1WFFQDfJDKF1Cv5reSkfoc9moqQUqE4vrYm8LM0rRjEZCX/l4
   SX3UamJSN6ObtHkLDUtTt3YesYHJAJIhQJ4CYm0uf8xEDyx09lC7oi29j
   Pz7mJtSUOQlZ/vY95pofc+0lSAv07N2m/GAjp78iMLDAUr+D1u1BcMQuH
   Fc/Meo6RuAEVZbMRwxM7qlI7hJpMVy1sxXTKSs3Vx2CFsMPVjvebn4BGQ
   3V/ggmMkZ+ZwiXQc49JQ2bll8dXHO0CswklTJG9XJhHGt5RpnJ49J+yEu
   T51oEeWR2neAW1fADV5l4n961a0WQgGPiTlseLtUajchJSp2FAB8+nObu
   A==;
X-CSE-ConnectionGUID: HHztrSjPShu3+Q71C3Rwbw==
X-CSE-MsgGUID: 0wnPPy1mRgqFDH0Z8LI0uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78866673"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="78866673"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 19:06:15 -0800
X-CSE-ConnectionGUID: JBwZuzvVSJOivE3RGatWwQ==
X-CSE-MsgGUID: TaLtaUBOQJyNW3EeWxupZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="196954531"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Dec 2025 19:06:14 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTtTv-000000005Q5-2h00;
	Fri, 12 Dec 2025 03:06:11 +0000
Date: Fri, 12 Dec 2025 11:05:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1] drivers/dma-buf/dma-buf.c:345:
 warning: Excess function parameter 'buf' description in 'dma_buf_set_name'
Message-ID: <202512121024.JBKNhlix-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   3a6f5d8bb93a24a08c3bcf615b349a5d93e4a265
commit: 88a96b0b27bcdda732e9d4e9d35cefad8ea7ffd9 [1/1] ANDROID: dma-buf: support users to change dma_buf.name
config: x86_64-randconfig-002-20251212 (https://download.01.org/0day-ci/archive/20251212/202512121024.JBKNhlix-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121024.JBKNhlix-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121024.JBKNhlix-lkp@intel.com/

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
