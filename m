Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA731B81CA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 19:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765655598; cv=none; b=DqUDMUShm2sFX7sHf0h9n+pvNu3aC/dmGhfqpMptlmuXPuw/n6Gqbu3T/FivjQW9Sl7t+sxJBpTjUmMMXCVyzeBFxiy7ywuEsqUNRFTalXn8ajmIQ6HUKBomt6jHJjmAheAve/qcFfG+DTOV9QO5Bkt5E561HpCWRKZk/bNqpnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765655598; c=relaxed/simple;
	bh=t5eA2bUkxr7f9SZblsDTU+FxsRQStSQ2ZSwn4ikqTtc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WZdZnXpe3ehNGyH1gegUlV2J0/psYK9TAU1g9mmOoGlL/3offQxMiI3tKvKM8PGfP4PaLL4rsi7YAm4jdp9gHe1+cmp/0jn7RvUYRF+DwtHKrWkcIK76WlvLZK5GBf0K+h53NkZcchYS0fQLwxcqvZyzOZ//PUyKAf7ldz/CGgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=axpEbzTM; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="axpEbzTM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765655597; x=1797191597;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t5eA2bUkxr7f9SZblsDTU+FxsRQStSQ2ZSwn4ikqTtc=;
  b=axpEbzTMSg1qDJ6ZyeoshouPsFe+9lCsCkMyzbd6qPPZoi+asa1POe9a
   LcmmjTDmQARkKC3zIFA0BHBcYd7QvSpDB8pcNW05g9m+4v9EDNWZhpPKk
   SZA2hWSenRxSnCsFVz3BNDSRY6+mFMJ4pdepBDqDwlD5SlIP45tU1tQFr
   PeQalFPqfjpZbOn51ADwkMXT+IJhHfg+DKhvrETaj5Wgn+/SuxdCLF7CK
   MSFlfV7ku/ADVzFtF0OYNJwAg+2ULYPCoT2XaUMWIgylmjESLpNfOZvW+
   RSbwI5CvWcqYnuwOsfyDCi0r3cAQzYFzUWXYE7lEAjUPnHgL5M2iqstz1
   g==;
X-CSE-ConnectionGUID: O9Ov0DU+R1WipTpKFL/uZw==
X-CSE-MsgGUID: G/+Rj6+DTHKFck33EcXBwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="79076632"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="79076632"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 11:53:16 -0800
X-CSE-ConnectionGUID: czsdwvO5TGukDCjStJU49A==
X-CSE-MsgGUID: y6cr8PFUQRWYSIB/Q0WRDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="196979701"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Dec 2025 11:53:15 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUVg1-0000000088L-1Vdd;
	Sat, 13 Dec 2025 19:53:13 +0000
Date: Sun, 14 Dec 2025 03:52:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 0/42]
 drivers/dma-buf/dma-buf.c:366: warning: Function parameter or member 'name'
 not described in 'dma_buf_set_name'
Message-ID: <202512140355.brLqn27V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Guangming,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   ebacb5ab3a1e5bf8dc788a29244f0e68d00a5bd6
commit: 9c6866c99b8a6e6c04753d928233a927bac0c632 [0/42] ANDROID: dma-buf: support users to change dma_buf.name
config: i386-buildonly-randconfig-004-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140355.brLqn27V-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140355.brLqn27V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140355.brLqn27V-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma-buf/dma-buf.c:366: warning: Function parameter or member 'name' not described in 'dma_buf_set_name'
   drivers/dma-buf/dma-buf.c:366: warning: Excess function parameter 'buf' description in 'dma_buf_set_name'


vim +366 drivers/dma-buf/dma-buf.c

   351	
   352	/**
   353	 * dma_buf_set_name - Set a name to a specific dma_buf to track the usage.
   354	 * It could support changing the name of the dma-buf if the same
   355	 * piece of memory is used for multiple purpose between different devices.
   356	 *
   357	 * @dmabuf: [in]     dmabuf buffer that will be renamed.
   358	 * @buf:    [in]     A piece of userspace memory that contains the name of
   359	 *                   the dma-buf.
   360	 *
   361	 * Returns 0 on success. If the dma-buf buffer is already attached to
   362	 * devices, return -EBUSY.
   363	 *
   364	 */
   365	long dma_buf_set_name(struct dma_buf *dmabuf, const char *name)
 > 366	{
   367		long ret = 0;
   368		char *buf = kstrndup(name, DMA_BUF_NAME_LEN, GFP_KERNEL);
   369	
   370		if (!buf)
   371			return -ENOMEM;
   372	
   373		ret = _dma_buf_set_name(dmabuf, buf);
   374		if (ret)
   375			kfree(buf);
   376	
   377		return ret;
   378	}
   379	EXPORT_SYMBOL_GPL(dma_buf_set_name);
   380	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
