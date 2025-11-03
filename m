Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5013F280CD2
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Nov 2025 02:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762138163; cv=none; b=GzbvaL7oxutBLiKdsWNRY4EQrLmlsyAcZ2UiPGI6mmZOY4uYlgPrZ6kYxRp7j8YfENXBb7nDi82EURiMpZukyfJ7/IsaX2KwKrs3cHaV8u7sz8zmUIvGAXYaydypO++NM/StawvZRwuqjCD/J4RVClU/3kxS99+xb9+d28O22eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762138163; c=relaxed/simple;
	bh=virJQ33giplGy4qPRVV2d+D7i8WorYU8pqTDqfYJOPU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NeawS1wOz2wNMKKXxK9RnE44RQ1ccmAm1TYA/scB0+JskPtZhUuSutkHFQg3dRjpI9Tp68ZDq4MOmpSMRAt606cSCSq/RPSBLobUIKdstJtxorvivB3gt24mrySsTJfS+KXHmx4xbwHnpWLHRYoxGzrlWf9L/ypwl3IAQ7C6lhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Omrea1op; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Omrea1op"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762138161; x=1793674161;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=virJQ33giplGy4qPRVV2d+D7i8WorYU8pqTDqfYJOPU=;
  b=Omrea1opZlwcw0GvjnZ/zEex1SPx1jEtK3PYPqzAUfkdTm3gFB1+BIxH
   ba2ORGiO5Iop0VP+0WN+wDjGijrJtkdOeZfXDp/dyFFYvwJW96Rt8XB06
   VmDja4sFCtvFIj9V1wUZEqSecx9P+0rdSYnyuMR3XiAr2gAsUgZcT+Q+X
   QFTlF5C3y84YcKLFQ/vl1EKYFj4VBADqhhX9nPm4U5+Esls+xuQ0ixbgO
   ZhTnvtqzgp0MyXj/pewecYgQA25Cb2/JYKDkp47YBGQXdj0d67D0NA3Li
   RTljiRR5mgxUpU3CiSrRKFKrQDVS1RNTezBLazJ/ItUEJjSITrWXDmBQt
   w==;
X-CSE-ConnectionGUID: mek5EgbwREu0gTt4zDOvMQ==
X-CSE-MsgGUID: EMhy3fk6TyuRsW/6v/5Gsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="63415802"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="63415802"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2025 18:48:57 -0800
X-CSE-ConnectionGUID: YMCPNw7jTje8EskFrTOSgA==
X-CSE-MsgGUID: FDEppbIWTPm7fM7uBT9UZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="187069488"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 02 Nov 2025 18:48:57 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFkcU-000PmI-1a;
	Mon, 03 Nov 2025 02:48:38 +0000
Date: Mon, 3 Nov 2025 10:47:48 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-xen 10/17] ERROR: modpost: "dma_heap_add"
 [drivers/virtio/virtio_msg_ffa_bus.ko] undefined!
Message-ID: <202511031025.2wGaABGO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-xen
head:   cdc52122313863bdce40a9403e5ccf7ca915fc36
commit: 7b40677924876916ef306adfd4e8a48b08b28aee [10/17] virtio-msg: ffa: Add DMA Heap
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251103/202511031025.2wGaABGO-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251103/202511031025.2wGaABGO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511031025.2wGaABGO-lkp@intel.com/

All error/warnings (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "dma_common_alloc_pages" [drivers/virtio/virtio_msg_ffa_bus.ko] undefined!
ERROR: modpost: "dma_common_free_pages" [drivers/virtio/virtio_msg_ffa_bus.ko] undefined!
>> ERROR: modpost: "dma_heap_add" [drivers/virtio/virtio_msg_ffa_bus.ko] undefined!
>> ERROR: modpost: "dma_heap_get_name" [drivers/virtio/virtio_msg_ffa_bus.ko] undefined!
>> WARNING: modpost: module virtio_msg_ffa_bus uses symbol dma_buf_export from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: "dma_heap_get_drvdata" [drivers/virtio/virtio_msg_ffa_bus.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
