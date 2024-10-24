Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA1C1A0BC4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 11:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729771134; cv=none; b=hnhD0h/NlN4sDG0lGSt1/swH6HsfTFmgR3Rah4Wr4hPH/PtynWrA6xG0t6Z4D8Yfs+yoeaSed1YHEZWdFd5r28CQMWT8w6r16ZUCg8ZLVihEkDiAts8K9fiWtdkMtRA+zAwZAhxbVsORxMSo+ZWW74NxUaF6G1eAbhJkBgAIXIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729771134; c=relaxed/simple;
	bh=4mBlpD+DmpWnYa3dgFr1+psqvQRGSlMf+YEh55uZO4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e5uMA7J6wgZMkHXonuLOnx2MHZBApLE5JyqTN7yDOPOVUDuAGYTpJh4HhY+bSm+LIgyw4AC7bJK+enIqwhMIjKQLfZ3twOea8rZsikItbVeyQZ9WfvjOlC59LcH71sAmmKE3BAd0KAxx1Xnc71StqBT3Qz+MH7LNT56iAL5zKJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ERrCMO7e; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ERrCMO7e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729771132; x=1761307132;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4mBlpD+DmpWnYa3dgFr1+psqvQRGSlMf+YEh55uZO4w=;
  b=ERrCMO7emu++jf7Z/pWxcfLoQJg+f0yE+StxEGfEnfRnyYoXoBOFZl5t
   LNLFiQ2i6vqdIDq3Gcf3L+alfPIUFGcFdUI2B+k4QNUlKCYoI+DW2HvaN
   FhZASZ36s4y8P3caS0EiyOVN05pi0zhu5TM2hy4+XZPA3YAik9/URTQ16
   5F+nQMBg3k07uRaEKfFj4dtq4C5ohK4Kr2/kABcmbQT1tuzJ5jNHDXfBx
   r2n67EEWddEa0Korv0y+jWEPWqXh5076pRP6dfKctF375GawmRmhjBoOF
   LLpPUHHoFa+lomjDyVQsO1Bc2eFFOFTnveM8Zr2uXVu7zfHYWCuT0pPSG
   w==;
X-CSE-ConnectionGUID: gL4EX+U3SWaFGZkf1kJUZw==
X-CSE-MsgGUID: w/CTRguuSzm2lMHpff/MhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40513332"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40513332"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 04:58:51 -0700
X-CSE-ConnectionGUID: llp5Q/DQRq+teLPpI4hUOQ==
X-CSE-MsgGUID: intIdmPbQtu0ItkvB236zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="80663004"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 24 Oct 2024 04:58:50 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3wUK-000WMK-0Y;
	Thu, 24 Oct 2024 11:58:48 +0000
Date: Thu, 24 Oct 2024 19:58:34 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [net-next RFC PATCH 3/4] net: dsa: Add Airoha AN8855 5-Port
 Gigabit DSA Switch driver
Message-ID: <202410241956.pYt9JIxG-lkp@intel.com>
References: <20241021130209.15660-4-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021130209.15660-4-ansuelsmth@gmail.com>

Hi Christian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/net-mdio-implement-mdio_mutex_nested-guard-variant/20241021-210643
base:   net-next/main
patch link:    https://lore.kernel.org/r/20241021130209.15660-4-ansuelsmth%40gmail.com
patch subject: [net-next RFC PATCH 3/4] net: dsa: Add Airoha AN8855 5-Port Gigabit DSA Switch driver
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241024/202410241956.pYt9JIxG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410241956.pYt9JIxG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410241956.pYt9JIxG-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__ffsdi2" [drivers/net/dsa/an8855.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
