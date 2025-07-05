Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AABA199924
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Jul 2025 23:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751758550; cv=none; b=IikfCwLiFd0eXkKOGKk7GjxYKOLdbN63kKVlI9pZcoNexpRqX6ktCqCy39bx2ClH1+BoUxZpgsL3Lj5s+twbaevfXgCMtDr6VxZYznkexqWAehlZ3bhtAc5pyHRxf0lk0cVZfsqA9X9Uk30s/IRjxYZszKRd6YjNvjRasN52hIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751758550; c=relaxed/simple;
	bh=A94WtBC9VOjOZLtKx9YvAY4tYhQiEfvWGt+qLpUShNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d972NukHVE8mw5aGPw0iMUEZSCoy5hQn/50bD3SOk1Hkx9m33W36KHrLSDZRJwte43Y5xAMeI8VkP1CS4/b429LtK5/oZQSaYisGmFcZW5S8T7ysfe29XM3xEazgaLnsc9EMzXCrDHPJdeERqGNMAZpLS3PUTl/USr3o3CnmZvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YLl62+td; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YLl62+td"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751758548; x=1783294548;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A94WtBC9VOjOZLtKx9YvAY4tYhQiEfvWGt+qLpUShNs=;
  b=YLl62+tdUx6adPAaglONuG5VZvNCj3QV7M1Mv7ymSBhhHR5hlFAYUjXq
   4h5We7j8ch4G5gB2UDYJ0LEmhKV2tqqfyxXRumEkJYuIEu9vShlUAuIRm
   Y1036cCniUpSiWLAwkhCAG+Qizavnrx/nVGXzjRixQnzBiovVL4Rydsr5
   rUvV9MLo9AmfHi5j8T/HLvd7z63BLdp067g/TcvRPsGjpQHcZrGZQ0H8M
   mkgYCtmp+FMLr9HO0FBipdzhQalGc/OjcvSkuHFiiFoM3LJgqGEwdaPUh
   TWMD6jW1bbJ4e8j55og3DQLl8v8SL6o7im51bQBL3YP4Yj/Lm89G9xtHQ
   A==;
X-CSE-ConnectionGUID: gKs96giSRS+4Fho87r3U+Q==
X-CSE-MsgGUID: s4Bpr6irTVen8KtFI+7Qmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="57797194"
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="57797194"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2025 16:35:47 -0700
X-CSE-ConnectionGUID: /5ztsOlUS9y0Y1kLwnajeQ==
X-CSE-MsgGUID: xO0D70IBSJOrMCQd3nxu9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="159167154"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 05 Jul 2025 16:35:47 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYCQ4-0004ln-37;
	Sat, 05 Jul 2025 23:35:44 +0000
Date: Sun, 6 Jul 2025 07:35:04 +0800
From: kernel test robot <lkp@intel.com>
To: Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 2/6] greybus: cpc: add core logic
Message-ID: <202507060710.jUXLbK61-lkp@intel.com>
References: <20250705004036.3828-3-damien.riegel@silabs.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250705004036.3828-3-damien.riegel@silabs.com>

Hi Damien,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]
[also build test ERROR on staging/staging-next staging/staging-linus linus/master v6.16-rc4 next-20250704]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Damien-Ri-gel/greybus-move-host-controller-drivers-comment-in-Makefile/20250705-090138
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20250705004036.3828-3-damien.riegel%40silabs.com
patch subject: [RFC 2/6] greybus: cpc: add core logic
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250706/202507060710.jUXLbK61-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250706/202507060710.jUXLbK61-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507060710.jUXLbK61-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> make[6]: *** No rule to make target 'drivers/greybus/cpc/main.o', needed by 'drivers/greybus/cpc/gb-cpc.o'.
   make[6]: Target 'drivers/greybus/cpc/' not remade because of errors.
--
>> Warning: drivers/greybus/cpc/header.c:181 function parameter 'wnd' not described in 'cpc_header_number_in_window'
>> Warning: drivers/greybus/cpc/header.c:181 Excess function parameter 'end' description in 'cpc_header_number_in_window'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
