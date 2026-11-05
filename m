Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793858856;
	b=CJipomXtj4/IvKIMAMt3k/KWnjjBalZs2xHMapByrp22LkPbTNy1I9GV6idrDE3Zn+Do
	 hX2zR14sXb5h97xbLxL7HTLQ+4rCs5mP6brJCb6/bxLxWwcgzzCDneCBqyZQqsFyE6921
	 /AWbsIFanIUsUpCpUiLnyhFoewTC72+w1XmrIVta63vWK2XHbakemJzoZf8PsOnb0/4PG
	 dyhpSe1DE1NPiKea0PjaQW/lCFa/h/lbxHOXpg59PkPad23MXFvkGtf6YAoyPp6QsEzT0
	 3Rb/8M6CdpGiUqP070gkMeciTpWUwJ2E6yjcxuNkXFXbn2BsRT90uVno4NS7OAZJf7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793858856;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=c+bwd4n5X4txcZscB+3LSJCfP+WqAI1O2AW/98iw44g=;
	b=SAVbyyYJ+b2fcNrCyTjhA2E6TAfxmhPf5OssQfgsnJ74FSY59WOoozhUBhtfvwuOzSX0
	 VmFTkC+Tpt768yHfQ/qBuYgz17aEXP64JCjT/lCg615jWwRzaZdnKHw0doWFSsw6g5nHp
	 eOfe6tcudmeAto6xxxH0L1+M/Tb/uAWGT484L1kFHSD8Z1zMnlcbawt2Es9IAs0dCfKlo
	 Ugoc7FeBxInKAYMe7aLLT4Yy6VMvATu04/cAzlsXgEC8tez4iv5+Cga4XfcQOvmqHER2a
	 mV33TYZRTVGBlAUrjnOtOyUdlvzPCg0VUkz9fXaSVeej5Fenk3LCu8PGwwjaqHeh8Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MNT0Dsv2;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7991E606A31B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Nov 2026 06:07:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7991E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MNT0Dsv2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793858855; x=1825394855;
  h=date:from:to:cc:subject:message-id;
  bh=LUTDiIbESZIvnjIaP6lKC4B9K4J3JCIG1juRP2EwW4g=;
  b=MNT0Dsv2Lj2n5zit+xRDpgBGHnoGotDHOoB13zugKZRAeEhAjWLHgZ8g
   ukqn/YQUhQQUaxyZPsZXokONzFKzIgr+kWtjWMap4Iah6cvXeGwY0LXGz
   iL/xI2ZmHOum3eC33YHc1o6jZ8elqmDJ6XlPCT54Jxgjbq+930I8DI7RW
   Mz56FxLhiYsQXD+2Chw3N58l+V/2kCKMhUc4nM/PtwQlNvJgHBJqs22K8
   we8MUhft34rq9Kh2R3wo6Dw3MbkSnS5p91I5cbuILjvt9xhF1fakC2pBf
   FTNCNbDOWwZ9RNlVYXS5Y1XYsifFcAfWRG4fs1nAaS3oOFVFcXHEUNy81
   A==;
X-CSE-ConnectionGUID: g7/76H1yS5OLZLu1KW0O3A==
X-CSE-MsgGUID: UsKkblXVSmSl258d+d/3Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2651863"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2651863"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 22:07:35 -0800
X-CSE-ConnectionGUID: eq2jhB7EQIiJSiEprv+Ovw==
X-CSE-MsgGUID: UvvrT+yTRFKjG+V/a0ADGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="6932692"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 04 Nov 2026 22:07:34 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOqdH-000000009Yd-1gF4;
	Thu, 05 Nov 2026 06:07:31 +0000
Date: Thu, 05 Nov 2026 07:07:08 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2026-09 0/1] ERROR: modpost:
 module f2fs uses symbol dma_buf_vunmap_unlocked from namespace DMA_BUF, but
 does not import it.
Message-ID: <202611050752.VnM6oev5-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android16-6.12-2026-09
head:   d12faa4ea50382dee2af287c3771b199d569ce05
commit: f7a2d75291adba6911b994ac56ce1cb3da1f6bec [0/1] ANDROID: f2fs: add F2FS_IOC_LOAD_DMABUF
config: i386-randconfig-2105-20261104 (https://download.01.org/0day-ci/archive/20261105/202611050752.VnM6oev5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611050752.VnM6oev5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611050752.VnM6oev5-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: memblock_end_of_DRAM: EXPORT_SYMBOL used for init symbol. Remove __init or EXPORT_SYMBOL.
>> ERROR: modpost: module f2fs uses symbol dma_buf_vunmap_unlocked from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: module f2fs uses symbol dma_buf_end_cpu_access from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: module f2fs uses symbol dma_buf_begin_cpu_access from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: module f2fs uses symbol dma_buf_get from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: module f2fs uses symbol dma_buf_put from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: module f2fs uses symbol dma_buf_vmap_unlocked from namespace DMA_BUF, but does not import it.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
