Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1826723BCE4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Nov 2025 21:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762810605; cv=none; b=lr7cgqrhGz4E8yurhYQjvnbDqZzep5wXu/TInERCmbOYttidQvAFwQR4ieLp7Yo0wEBz2Ld1yAysAyJghILaqDsLr+5zrIQpEyK2l8gkSdlhI5AcmlYpaGMcfy8FIer0T1eMBKSuPDAUQ/m6quEkexmz40hb2e0i27MfwWsbp6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762810605; c=relaxed/simple;
	bh=A0GU5qq9HA1svLiXjvESvIcAHmWUinWInAPgwPjSTWU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q0YyWXAA69mjX3AZ7a+7xRebRQ6Y1nvoT+1yKWGeWCL/47QipzjThoDPLfl8Wyp5rb6xBHIUXTEMd5HD4sqPW3t8dvJ9uRxu0JAqxOf0X4AUGHOVIMh8hTiIfZEAN7I+qSX63CR4wNRcZDFw+++re6Ofn5KHuvGnIumjZ7mEWGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bwUiZyhb; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bwUiZyhb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762810603; x=1794346603;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A0GU5qq9HA1svLiXjvESvIcAHmWUinWInAPgwPjSTWU=;
  b=bwUiZyhb9fs7vpL1YvidHQ4kHYqqPEMzFoHY1Z21ejVX758r8T3gwvZh
   sdYK/ZRxtjD6mbnSLV8B9yDu1/unlf+qczAVZhIhQNq3uNcX9UJ/hBqVn
   GKKwwp8SNTMZlZRmkX9zuP6TFkjfjAJg5Mdr7OVeg62+HoBwffkhpiHDa
   U8Z7++klR/PM6EFDa+CbcKiUOvot7X4qhlGRu00WB+paJseXwjBim/MSy
   uDLPif/C5KfMmV1/0rt9xCeGLqmR4+Jlzz56CR2r5x1MGTAbENpz8kBey
   rASQRjxdNc/CLTrAK6byvZO9ifkR/675pikP2L6QUvcLLBUnVSR7jd+JZ
   w==;
X-CSE-ConnectionGUID: 4pxsL5EATACKjc9hX9R+8Q==
X-CSE-MsgGUID: pMtanO5yRbee0oi3jfYnWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="67473623"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; 
   d="scan'208";a="67473623"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 13:36:42 -0800
X-CSE-ConnectionGUID: KIlcU9kPRnKTWEoMBzFePw==
X-CSE-MsgGUID: EpX+DLxLRhms1zELMfG9tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; 
   d="scan'208";a="212161385"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Nov 2025 13:36:42 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIZZ1-00013D-2D;
	Mon, 10 Nov 2025 21:36:39 +0000
Date: Tue, 11 Nov 2025 05:35:59 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 49/49] mm/shrinker.c:698: warning:
 This comment starts with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202511110515.i62TbDxd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Qi,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   9964ca4dc63640e5a033c29162ca148e6a4dd12a
commit: 1e63c23f99e1610c8c483368df6922ec9076d95a [49/49] drm/ttm: introduce pool_shrink_rwsem
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251111/202511110515.i62TbDxd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251111/202511110515.i62TbDxd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511110515.i62TbDxd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/shrinker.c:698: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Keep synchronize_shrinkers() here only to keep KAPI compatibility,


vim +698 mm/shrinker.c

   695	
   696	
   697	/**
 > 698	 * Keep synchronize_shrinkers() here only to keep KAPI compatibility,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
