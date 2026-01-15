Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F8B25776
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 20:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768508358; cv=none; b=sLKTNRjKbUzmPArHf1R00G//P0GwGvyMvS44UBBcjbrVBcro+LIJZ3H2PhOZfyb2r1inaeXXrmM91A6A8J9XEk7kTNgsxPy4hD//xaBVZo1osKGiOLh98ogNeqsA6BDRK4XiYZr3qW41KlxbB9IYBtslLhZrevrFIsG2AWf4KH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768508358; c=relaxed/simple;
	bh=5EkXOjaZooMWsMjjARi3vF43Dascltl0SjglrWKdV5E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rdGoqp/BIgYLJuc8fo8SO/3D7CClg//5pw5GSELZEe+kSVb9GDDdZslCeM8rUqTFeifwXhnMV/SVc6aAigzB26nCTkB5QvZI77oJO27qC7CrdzAGS5CdnDyyvUMdSVfrpCh4v0Y2wsalah9d/3mLmP9dvk3qdIssnwhK2iSAqF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CVy4aI2i; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CVy4aI2i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768508357; x=1800044357;
  h=date:from:to:cc:subject:message-id;
  bh=5EkXOjaZooMWsMjjARi3vF43Dascltl0SjglrWKdV5E=;
  b=CVy4aI2iRJ0JaUvcVIzSIl85LSpB3UMIS33QaDIqtcl7ULogfHEgCr9b
   nknC1KeaDtSkQ4q+QSA5X5HWPiwQ31VZLKd+cB5KmYRJ63X/wdPWnaqz4
   eCJWqzqT3jyrxpzVXziW2dRsB488gLKHiExys9/gST+KAI4Ps9cQBAjEp
   5PLGm9sBXT7gox8TUPA3a+opM/UWVz/RQTP8sYnu2geqwGKmflk/NVUKS
   SfN96ybwBaAV06ix7xcpUIYIcH817XEjUb3nOy4e4+YLr+/W66CE0dEFm
   nYbqUnGfJ6pZVZG2ndm7psUT2497ihggypz5Bbbsfc4DZaZlZ/j0URam3
   w==;
X-CSE-ConnectionGUID: yrkMOJwsS/+E/4TkJjHiRw==
X-CSE-MsgGUID: uwsbOz1sTGutcex6ZNrA8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="80467328"
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="80467328"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 12:19:15 -0800
X-CSE-ConnectionGUID: xGO5ZJfaRHGw9qIehNAGQg==
X-CSE-MsgGUID: 8GhK999FR16bmZiB2Fev+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="209187005"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 15 Jan 2026 12:19:14 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgToF-00000000JxW-0wzv;
	Thu, 15 Jan 2026 20:19:11 +0000
Date: Fri, 16 Jan 2026 04:18:17 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-xen 11/17] WARNING: modpost: module
 vmw_vsock_virtio_transport uses symbol dma_buf_unmap_attachment_unlocked from
 namespace DMA_BUF, but does not import it.
Message-ID: <202601160404.Or25M5HM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-xen
head:   2978a84b82627a16bee8e2cd5718a51de47e7d5e
commit: 8a9514c687cbedd6a7b41f7c9107ed5ea701fd02 [11/17] vsock: Add shared-memory support for virtio and loopback
config: nios2-randconfig-002-20260116 (https://download.01.org/0day-ci/archive/20260116/202601160404.Or25M5HM-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601160404.Or25M5HM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601160404.Or25M5HM-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: module vmw_vsock_virtio_transport uses symbol dma_buf_unmap_attachment_unlocked from namespace DMA_BUF, but does not import it.
>> WARNING: modpost: module vmw_vsock_virtio_transport uses symbol dma_buf_attach from namespace DMA_BUF, but does not import it.
>> WARNING: modpost: module vmw_vsock_virtio_transport uses symbol dma_buf_map_attachment_unlocked from namespace DMA_BUF, but does not import it.
>> WARNING: modpost: module vmw_vsock_virtio_transport uses symbol dma_buf_detach from namespace DMA_BUF, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
