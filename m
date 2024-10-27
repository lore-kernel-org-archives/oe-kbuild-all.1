Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E9529A1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Oct 2024 03:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730000770; cv=none; b=i6wT5ed652ZOXSnmdSViy9yQE3SxMINRdOoavWvK7TGiHoMVHbaDnqxJitzkc8hWjf4DEOC8axrU25qMpNHUtIYZBllnXwMbZxOQRHpd+HHRA0YN4hahXyJZ2+1cok6K0ulNzovFj8CC3FuSkCr0ucYYEV3EAZq8k+QuVqWKMMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730000770; c=relaxed/simple;
	bh=im5TJ9Z9VuQ5Bqa6XfsgqQe1fYhvSEy34UwIp6rwJ6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZJ/OAcFIR8vPnqHQj7MiOuayiBUewTkEb6n0rSbgDcUvTaTY75DHdHLP7fx54YLbvHB34WUrLy17ssZ9XfCraYGEG6kLgOHLM1C0UZTAb2uDgiHpplTk2ElFY42Gmjghp8D6p3sPSS6GYlvR/HzEztAocLXMkZ0vdJwd2g/TNL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WKBj8HE5; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WKBj8HE5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730000768; x=1761536768;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=im5TJ9Z9VuQ5Bqa6XfsgqQe1fYhvSEy34UwIp6rwJ6M=;
  b=WKBj8HE52h2gvyipsjZKMKDnWG9zJQeozfPhDK9G8qB1JbMUYWn8yhqA
   2m7xSDmu9myHS/IJvLW70PBLGru+y1d8VvoX1Nf3IcqqvqnVoUEw1CzjW
   s3yBCj2qdPJv92lJhh0pTod9oOF2mzBLowVudFJdS4U+X0qTnSxl2AhY0
   J5fxbIQjvrO01PxlrAIU07cHbENLi41sLknaYR3FcUUAJoxV13nrAxVxu
   zaWNhsfB8idP1PE3H/q8Bc8foJ6JDbOB0U1exavGWkm6ISYbUUzZEmlmN
   6EOTOF/nSsySPfCBjQWis1wWfGg/RZmzgEddu8PCmA/33RNN49xRgIe9S
   w==;
X-CSE-ConnectionGUID: jygq6sg1Ql+GoiR8vT2HTQ==
X-CSE-MsgGUID: 0bWZ1qSMRLmxw5zC593dnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29815968"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29815968"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 20:46:08 -0700
X-CSE-ConnectionGUID: /h+1uPdFRBGFo1qpeVnVNw==
X-CSE-MsgGUID: zsVa5I/qT6uIrtyMCJHaHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="85242921"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 26 Oct 2024 20:46:07 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4uE8-000aKc-2i;
	Sun, 27 Oct 2024 03:46:04 +0000
Date: Sun, 27 Oct 2024 11:45:51 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [net-next RFC PATCH v2 2/3] net: dsa: Add Airoha AN8855 5-Port
 Gigabit DSA Switch driver
Message-ID: <202410271159.ToFiatmn-lkp@intel.com>
References: <20241023161958.12056-3-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023161958.12056-3-ansuelsmth@gmail.com>

Hi Christian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/dt-bindings-net-dsa-Add-Airoha-AN8855-Gigabit-Switch-documentation/20241024-002325
base:   net-next/main
patch link:    https://lore.kernel.org/r/20241023161958.12056-3-ansuelsmth%40gmail.com
patch subject: [net-next RFC PATCH v2 2/3] net: dsa: Add Airoha AN8855 5-Port Gigabit DSA Switch driver
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20241027/202410271159.ToFiatmn-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410271159.ToFiatmn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410271159.ToFiatmn-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/net/dsa/an8855.o: in function `an8855_vlan_add':
>> an8855.c:(.text.an8855_vlan_add+0x1a4): undefined reference to `__ffsdi2'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
