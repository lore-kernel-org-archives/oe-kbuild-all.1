Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC65A801
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Sep 2024 00:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726877422; cv=none; b=qgJo5PaMfuqgoXznBPxm4iTveYqD6yWGWeFKbjNGgQ3Sl7XY09SfN+z5DAl0QIAmqztvgixLbwJFX36tKC/9Lzc0Mslnz24ja7WWIP+Zlua16F3wcsWGR0XZln0ELzKov0SoFyzmPBQ3LAdrntNRllv+N7VZcHXsbS0aaVOjFXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726877422; c=relaxed/simple;
	bh=QzbrOBDqB46D29KQYQF7XQryDbOOL1H4GqahUMQz6HE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GTHyf/1ePEuvQ5vxY3V+QAdrWAcwSrVOcW4+T0deAEKQ03TkENq2CMinUtnDgclD3M5tXrXMKGR50RreqkCVV9b5kSOvfkvSO2C+iYymNt1GMiibHH5zITgKCcahOyUr4iYkV7zaBJyEiEn7VchRTFa0J3EsvGpLx91hSdUoNvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m/hGjNIt; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m/hGjNIt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726877420; x=1758413420;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QzbrOBDqB46D29KQYQF7XQryDbOOL1H4GqahUMQz6HE=;
  b=m/hGjNItzYyRuQn8ECqa2nE9QLUlPeWjSyTorvYxDqUHClKwNUmO98CO
   dDDtxYc+k2bQ1rtMxSXgL9d7AQmV6P8/gmH1ElkZUklbVEgPT7/KUcJVz
   cdWVURjEN5h1lZ8ejw5tvXHlWSLfmtaOjh2O8C5r/cZuHE7h9RQ2JA8RE
   zVb6GtjI1FFW3ZWVb7Uw9iTzpB5IL0egECrWOJPuxpTMSNrA8qP8AfFnY
   A5cA7PmBPvbLHqdjZxxvWUd2i54mwvOVYO81AlqlDU7oBOvnl1RojZPRh
   lV8zTdV023pWn21GI8TpzTct7E1BWkJsb1ZORW7V+4zhicgnAO4BS7qzI
   w==;
X-CSE-ConnectionGUID: 8vzcKbmuTLGxGfjDlDx9bA==
X-CSE-MsgGUID: iZw8L9PAS8GGKavtEoHSEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="26085449"
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; 
   d="scan'208";a="26085449"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 17:10:20 -0700
X-CSE-ConnectionGUID: 5T9kpWP3T02QN7z172jFvw==
X-CSE-MsgGUID: mfaJ7AQaRhujsvgJu9GDrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; 
   d="scan'208";a="70912738"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 Sep 2024 17:10:20 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srnhY-000EyB-2b;
	Sat, 21 Sep 2024 00:10:16 +0000
Date: Sat, 21 Sep 2024 08:09:48 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Gospodarek <gospo@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:pr/4 1/1] usr/include/fwctl/bnxt.h:78: userspace cannot
 reference function or variable defined in the kernel
Message-ID: <202409210830.N7yQQIza-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux pr/4
head:   4391e88cc4f62e532f2c1aee1012ac4b4d0e71bf
commit: 4391e88cc4f62e532f2c1aee1012ac4b4d0e71bf [1/1] bnxt_en: add support for fwctl infrastructure
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240921/202409210830.N7yQQIza-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240921/202409210830.N7yQQIza-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409210830.N7yQQIza-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> usr/include/fwctl/bnxt.h:78: userspace cannot reference function or variable defined in the kernel

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
