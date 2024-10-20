Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A9479F6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Oct 2024 15:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729439154; cv=none; b=guQUJx8gPgc8OdcCu6MdmlAM5+dD2vTava/g1/FbSX8RchKd8Ynyh3PPiz1Ko4Tovb0fFz3qxrmrDgwUwAqqT7wbmGaQko6luNTfwxr+QVOVSWcoK/6zPVPIGVFN1ced5iqzF60/RImb4on3CJU6nDVX4VQBilkPAA8qtix8Q6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729439154; c=relaxed/simple;
	bh=wAR82JXez+DirH1mrsMmkjTjKi0oBljgEfKBEh2xtMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m30ju3QL04GDPFIj88g8L15/lfzFC7tTPc0yQYB9hqUW90lN1oKsgRGIQUM3zeTLoBd+rNCdz2M3LrtY15urFb6M+KQljmuVj0QTvwXF/JpjwR/eHvnc0SnBCOYINi3Zg+/FWTSgIKYc6rY1BzgdnKHJPvl2l7vDjCMRpXIxl8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ARw2zq9q; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ARw2zq9q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729439151; x=1760975151;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wAR82JXez+DirH1mrsMmkjTjKi0oBljgEfKBEh2xtMY=;
  b=ARw2zq9q1kptQFBlA6FWZpsMYhCxKyqajcIvUAsRTOetxwTrxG1s1lUa
   Al/gDQCnqeWZ1VJ8OnhPOW7dIj8q5DvBfgQh6cau7RF1kRfjoSb8zbdMd
   rmRPHlQXKnKh0V737ooACbKpjLJjUOWJHz0DBSO7AZK3Hfi4Srh8hmo5+
   wMh7p+8ugSEKUwMVNoZSC0Z246KsurXrEiTcm9NamAjbvYpL7oVa4KW9v
   GIgkSaLOJ07dIc6jXP66ho8dYSm1IsCM8asUHgUcEGBHXYo8lT6F6w3Yh
   zePiJi+SMAt30F+9fODUwtuLtgwpXST7yzfmWFBulAAnk96whVB6W/PNZ
   g==;
X-CSE-ConnectionGUID: v/XSiL0PRfav8XlsnoN56g==
X-CSE-MsgGUID: gsUlGvPvS5aUDAOB5l089A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="46385027"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="46385027"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 08:45:50 -0700
X-CSE-ConnectionGUID: bzIAthYbQuGM7wishwwc4A==
X-CSE-MsgGUID: JmGTyglGR/WcuuVy0BlNzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="110061709"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 20 Oct 2024 08:45:49 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2Y7n-000QQH-0y;
	Sun, 20 Oct 2024 15:45:47 +0000
Date: Sun, 20 Oct 2024 23:45:04 +0800
From: kernel test robot <lkp@intel.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/2] firmware: add exynos acpm driver
Message-ID: <202410202343.PP1lGrX6-lkp@intel.com>
References: <20241017163649.3007062-3-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017163649.3007062-3-tudor.ambarus@linaro.org>

Hi Tudor,

kernel test robot noticed the following build errors:

[auto build test ERROR on krzk/for-next]
[also build test ERROR on drm-misc/drm-misc-next linus/master v6.12-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tudor-Ambarus/mailbox-add-async-request-mechanism-to-empower-controllers-w-hw-queues/20241018-003840
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20241017163649.3007062-3-tudor.ambarus%40linaro.org
patch subject: [PATCH v2 2/2] firmware: add exynos acpm driver
config: um-randconfig-r111-20241019 (https://download.01.org/0day-ci/archive/20241020/202410202343.PP1lGrX6-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bfe84f7085d82d06d61c632a7bad1e692fd159e4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241020/202410202343.PP1lGrX6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410202343.PP1lGrX6-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: prb_rec_init_rd+0x1b (section: .text.prb_rec_init_rd) -> setup_text_buf (section: .init.data)
>> ERROR: modpost: "devm_ioremap" [drivers/firmware/samsung/exynos-acpm.ko] undefined!
>> ERROR: modpost: "__iowrite32_copy" [drivers/firmware/samsung/exynos-acpm.ko] undefined!
>> ERROR: modpost: "__ioread32_copy" [drivers/firmware/samsung/exynos-acpm.ko] undefined!
WARNING: modpost: EXPORT symbol "cmpxchg8b_emu" [vmlinux] version generation failed, symbol will not be versioned.
Is "cmpxchg8b_emu" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "csum_partial" [vmlinux] version generation failed, symbol will not be versioned.
Is "csum_partial" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: "cmpxchg8b_emu" [fs/bcachefs/bcachefs.ko] has no CRC!
WARNING: modpost: "cmpxchg8b_emu" [lib/test_lockup.ko] has no CRC!
WARNING: modpost: "csum_partial" [drivers/scsi/scsi_debug.ko] has no CRC!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
