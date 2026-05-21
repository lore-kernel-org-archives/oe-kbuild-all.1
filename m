Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10A02F872
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 06:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779343527; cv=none; b=ESYI+c6tcV/SFWtZK2Jjp++sdIXdhV/Zn9GFLe8tQsoexO2w9tkeh6p1ORq7MfzpiwTC3F2cpWxk4etBe1/fZaFvy+laazneM9tzWkJxFP8T/f6vBMp1FxJj0HiCY1DyJ8rn8VsXg7eBtgdougAMkKoxsTtrx+LRObdo9z6tlQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779343527; c=relaxed/simple;
	bh=eDbuRdOlY9i+Pe3FKJ9eHowBESmBFajVJV/ST0N7cKY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TC1Vjuy7jxLQ0KqBPP0aPZ137GD3tEpHVUnhk/X9rKsTbj1TS+PqID3AX6al2yWnFKrao1puLQD+27wuOpb8vOIbrGXPRA39rM/wObjiVzRF5tGcA/FP//I3M1niBn95woI3Hgvgs8hV8Tfha1J+CkgFZGEV2vtALEmZK/MtJ88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RXmPS0H5; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RXmPS0H5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779343527; x=1810879527;
  h=date:from:to:cc:subject:message-id;
  bh=eDbuRdOlY9i+Pe3FKJ9eHowBESmBFajVJV/ST0N7cKY=;
  b=RXmPS0H5pBCpccdrukCMYBwqs4gTFQML83V6vRgNOr52+oQvAdyvA4cZ
   vXnpu6nZOQHsrF9J+OJyKt+7IP041pW4u6tiQ0qegoH3PpAUr2lOcHL3i
   GbQCHWWdzsT86GyQnL6v90jLLFxN/yIoFOVe2B4DwGk96zKm3e23nC7XW
   irO7/f1FaQpHDUvXIOkkljomvAT3F6YozYbG1bxBoT/PZiAVyHAKT0CEm
   W0dBlzTd/RE2AOqprGzdKCdvmjVIRli1/BqTG6NdzBCHrFKTekj/Ky/Tc
   c9bs1F49JldRSstbFUx0eeXi4ZggCQLqHnT0HuKMq/btb3LpDDNHYLnQF
   Q==;
X-CSE-ConnectionGUID: rrk27oIoS36XQliLtYlLMg==
X-CSE-MsgGUID: 1qmSQUv1QJ+KvTcAlLmT8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="84141525"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="84141525"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 23:05:26 -0700
X-CSE-ConnectionGUID: 6KLc+02yQ2ClidTDa4tjWg==
X-CSE-MsgGUID: HzftCaT6T2yIrZf3sI0/mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="240295080"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 20 May 2026 23:05:24 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPwWj-000000004Ut-1twn;
	Thu, 21 May 2026 06:05:11 +0000
Date: Thu, 21 May 2026 14:03:17 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Ehrhardt <christian.ehrhardt@codasip.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 760/1130]
 drivers/usb/dwc2/hcd.c:2454: warning: ignoring '#pragma clang diagnostic'
Message-ID: <202605211320.ryVg55Mt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: b22436dee7a7cb6f5d16647cd3f3edc4170a7e8e [760/1130] cheri: Enable more cheri warnings and fix fallout
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260521/202605211320.ryVg55Mt-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605211320.ryVg55Mt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605211320.ryVg55Mt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/dwc2/hcd.c:2454: warning: ignoring '#pragma clang diagnostic' [-Wunknown-pragmas]
    2454 | #pragma clang diagnostic push
   drivers/usb/dwc2/hcd.c:2455: warning: ignoring '#pragma clang diagnostic' [-Wunknown-pragmas]
    2455 | #pragma clang diagnostic ignored "-Wcheri-inefficient"
   drivers/usb/dwc2/hcd.c:2483: warning: ignoring '#pragma clang diagnostic' [-Wunknown-pragmas]
    2483 | #pragma clang diagnostic pop
   drivers/usb/dwc2/hcd.c:2485: warning: ignoring '#pragma clang diagnostic' [-Wunknown-pragmas]
    2485 | #pragma clang diagnostic push
   drivers/usb/dwc2/hcd.c:2486: warning: ignoring '#pragma clang diagnostic' [-Wunknown-pragmas]
    2486 | #pragma clang diagnostic ignored "-Wcheri-inefficient"
   drivers/usb/dwc2/hcd.c:2553: warning: ignoring '#pragma clang diagnostic' [-Wunknown-pragmas]
    2553 | #pragma clang diagnostic pop
--
>> drivers/gpu/drm/bridge/tda998x_drv.c:1073: warning: ignoring '#pragma clang diagnostic' [-Wunknown-pragmas]
    1073 | #pragma clang diagnostic push
   drivers/gpu/drm/bridge/tda998x_drv.c:1074: warning: ignoring '#pragma clang diagnostic' [-Wunknown-pragmas]
    1074 | #pragma clang diagnostic ignored "-Wcheri-inefficient"
   drivers/gpu/drm/bridge/tda998x_drv.c:1136: warning: ignoring '#pragma clang diagnostic' [-Wunknown-pragmas]
    1136 | #pragma clang diagnostic pop


vim +2454 drivers/usb/dwc2/hcd.c

  2453	
> 2454	#pragma clang diagnostic push
  2455	#pragma clang diagnostic ignored "-Wcheri-inefficient"
  2456	static void dwc2_free_dma_aligned_buffer(struct urb *urb)
  2457	{
  2458		void *stored_xfer_buffer;
  2459		size_t length;
  2460	
  2461		if (!(urb->transfer_flags & URB_ALIGNED_TEMP_BUFFER))
  2462			return;
  2463	
  2464		/* Restore urb->transfer_buffer from the end of the allocated area */
  2465		memcpy(&stored_xfer_buffer,
  2466		       PTR_ALIGN(urb->transfer_buffer + urb->transfer_buffer_length,
  2467				 get_dma_and_ptr_alignment()),
  2468		       sizeof(urb->transfer_buffer));
  2469	
  2470		if (usb_urb_dir_in(urb)) {
  2471			if (usb_pipeisoc(urb->pipe))
  2472				length = urb->transfer_buffer_length;
  2473			else
  2474				length = urb->actual_length;
  2475	
  2476			memcpy(stored_xfer_buffer, urb->transfer_buffer, length);
  2477		}
  2478		kfree(urb->transfer_buffer);
  2479		urb->transfer_buffer = stored_xfer_buffer;
  2480	
  2481		urb->transfer_flags &= ~URB_ALIGNED_TEMP_BUFFER;
  2482	}
  2483	#pragma clang diagnostic pop
  2484	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
