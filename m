Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6EA15A85E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Oct 2024 08:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728202031; cv=none; b=pbIQpj3ZOTBnzECtJuXUPY2sWiQ+6fcFirSZXfucUD4AGGie68BSlLg7vafEmwbfBXwriEPAVXMoiKh6jWjPShzmCq5lyRHii9qQbQzzeWVpB4Q0GjAsr0nMiSNSSVKnT8m+ZaKTXs+agthuxekCxnr8MqIe40qOteFL5VnkBqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728202031; c=relaxed/simple;
	bh=CBFlAgzydf9vzXrx92R/NuXbYQWJ/B2pV228pghKv60=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MM4IiWtB0VTBCI7sJ4bW8Wuxi8H3ZmGfijkrvR1SO158otEl/9ZyJm3hhF17z90fQOsLjokd5Lkdg//iFN6FBLcPxLDgIzpcI6lZ/SOKivdaIRGR8+3h9GOMQ4g5wJiOBdbubhOUGAYis4QJbbVd+6nJxbAV6/h5jyAQiL5td+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nt/VkaxB; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nt/VkaxB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728202030; x=1759738030;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CBFlAgzydf9vzXrx92R/NuXbYQWJ/B2pV228pghKv60=;
  b=nt/VkaxBjhOKU7x1eqLw4VGGTUlyv1AQ7ZRKQ/JNxdLrPDy5dQgbFRB+
   ZiQvhbg6eRs8rhwLi73xfPPhwaqL5Fmz1YY5H7XQMjbzstbsRon0bUzLT
   6Mh30GV4y/ec/sH7q6KhuYmMPKgRdpt+pHyHaCce1Wdj4BVyPIfNxv45b
   xahoeCt7QttviWBemfi/HhASqUJEnxNJMmF5anGLbgJENwKJqpTSeBUBd
   MWYQ2/VYsJkrSE8I0F6PceDZo4UFNBKL9zyY00XrcpoXngFlHd8qX/MS1
   T/9IGRoUUTOTo+xKoaZW5e6n+vwrVK4AJDFUN95BMcFcGMaF1q7GwJZgC
   g==;
X-CSE-ConnectionGUID: pW7Q6SUET8Cx7q2VIjM6ew==
X-CSE-MsgGUID: eu/jzTQ/TuyXE5oJFxUw2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="27247624"
X-IronPort-AV: E=Sophos;i="6.11,182,1725346800"; 
   d="scan'208";a="27247624"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2024 01:07:10 -0700
X-CSE-ConnectionGUID: 4PWheoqPQpeYQRdPORco6g==
X-CSE-MsgGUID: RKPjT9wQRLGlrbjWl1FTOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,182,1725346800"; 
   d="scan'208";a="98472879"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Oct 2024 01:07:08 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxMIE-0003ii-0C;
	Sun, 06 Oct 2024 08:07:06 +0000
Date: Sun, 6 Oct 2024 16:06:29 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:nvme-dma 10/10] ERROR: modpost: "blk_rq_dma_unmap"
 [drivers/nvme/host/nvme.ko] undefined!
Message-ID: <202410061612.HLi2IjA7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git nvme-dma
head:   080c3a9ad1b0163ed2b4f9f9fba9a9fd8fe8919f
commit: 080c3a9ad1b0163ed2b4f9f9fba9a9fd8fe8919f [10/10] nvme-pci: convert to blk_rq_dma_map
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241006/202410061612.HLi2IjA7-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241006/202410061612.HLi2IjA7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410061612.HLi2IjA7-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "blk_rq_dma_unmap" [drivers/nvme/host/nvme.ko] undefined!
>> ERROR: modpost: "blk_rq_dma_map" [drivers/nvme/host/nvme.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
