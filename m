Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D8EDDAD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Feb 2025 01:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739754561; cv=none; b=n1e+0n74RoZlj2Ny/1b+TlF9sdBg8aFjfNl84m+YnTAVTeXClxcbsQWKVm+xwpCR/QgHue6Cs1Ch02er4aKgOEOJ2EpWoAJPkUgA35U80i+VPEmZ5wbtMvXtRmi2fej89a821RUFaoLcLszGYq2OlGR0NvS+Eczn4xJHv18wc1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739754561; c=relaxed/simple;
	bh=IyP9K/2xv4Wu5JcOU6n0ubuJzXLjZvryxyFocxIL09c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NV+9DXz3YsqLRS3rBUO/rqNSXwZ/3OW1SVXT16QaKTcNS6qgdXvasTUsxr3w1ieywqeXklxKXpFVotS5ADmZoN5Y/BlPjMNhsSUU/PTvWnH4QwYA16r5FWHrEAgL3j+2vGRYLhnQl7HU309boomDKd2fwhynkGbTkwvoz7KECmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZIqYNGFm; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZIqYNGFm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739754559; x=1771290559;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IyP9K/2xv4Wu5JcOU6n0ubuJzXLjZvryxyFocxIL09c=;
  b=ZIqYNGFmrlho9HAVWEX4yuJvm8T7wsWShezP04YKzg2dS9IkJpyyfr8w
   K30BH5s9FNLwyY3FXZ1C2NcLofRh26UF5iqOFfEujLBMWl3Kj8feBckR7
   u/rr0VmgIylOVAxc62yVMqamRlTXoTw4XSz946ZZKXo8pGYkol7j+xKx6
   zi64mw+K29QTPL6/gvIDh+DjWz+VZ1PD36jhwEW6XoftKaqKmzXXHFDgN
   mUk88lnX9AED7UywjhT7dA8NXfSELcv+mTs6qoZVDOkxEwOuXRZZa/DRt
   E5YRgJ9/3lKoP/cYvougqPm2M1r/KXTmdZwD5COvbdinbPeHQRQ2b7pcz
   Q==;
X-CSE-ConnectionGUID: upWdYUUhQ8mDcDQVSkjDVw==
X-CSE-MsgGUID: qZHJvbUYTziVLNMf7JRxNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="51410565"
X-IronPort-AV: E=Sophos;i="6.13,291,1732608000"; 
   d="scan'208";a="51410565"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 17:09:19 -0800
X-CSE-ConnectionGUID: HhaaUKYyReacNHhiBpzScg==
X-CSE-MsgGUID: iUPkY01LQ3yGCEIvsPrunQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118133064"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 16 Feb 2025 17:09:17 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjpdL-001CQv-14;
	Mon, 17 Feb 2025 01:09:15 +0000
Date: Mon, 17 Feb 2025 09:08:43 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Alexander Duyck <alexanderduyck@fb.com>
Subject: mm/page_frag_cache.c:46 encoded_page_decode_page() warn: unsigned
 '_x' is never less than zero.
Message-ID: <202502170903.Daw5Q7fC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0ad2507d5d93f39619fc42372c347d6006b64319
commit: 0c3ce2f50261cd2f654d931eeb933c370a3a7d7a mm: page_frag: reuse existing space for 'size' and 'pfmemalloc'
date:   3 months ago
config: riscv-randconfig-r073-20250213 (https://download.01.org/0day-ci/archive/20250217/202502170903.Daw5Q7fC-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502170903.Daw5Q7fC-lkp@intel.com/

New smatch warnings:
mm/page_frag_cache.c:46 encoded_page_decode_page() warn: unsigned '_x' is never less than zero.

Old smatch warnings:
include/linux/mm.h:1275 virt_to_head_page() warn: unsigned '_x' is never less than zero.

vim +/_x +46 mm/page_frag_cache.c

    43	
    44	static struct page *encoded_page_decode_page(unsigned long encoded_page)
    45	{
  > 46		return virt_to_page((void *)encoded_page);
    47	}
    48	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
