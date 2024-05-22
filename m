Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506AA8286A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 May 2024 10:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716373907; cv=none; b=XTJSyBJyafh/aizGt5kIuJSAkQQfTFvk/FF8YrQRnngMFaMk372OuGbeOE9c323s3LoKQTIBMudjDGEV4+L0yMt/k6yIGRk68ypnrkxFNLs8xsNDFg2TFgr0Lfr376ttIMl/BboZb082vWtiZD2Lizor8PJKlhvsyjH+8x9FD+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716373907; c=relaxed/simple;
	bh=oFJ2TU3TfwBhbYctuhkMNl6YwF0Zqgu9IFBEEhpDtBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qqO+e9+ERlPI3sRf0vmomFNKv5VWfcbMvEl7g7I16VG1EQwI/rJr5i9qKkwpiCx77kyDpxCygk8ZLTZnjAm//naUG6nfer6/SORw3Et7ay/kkzsdnMLkPOwWMfyZSrpV/yT7H5EqvJuod4RdpsyAaJ8lI+PpbTMY+nMdqfoe0+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BAs/iqNe; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BAs/iqNe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716373905; x=1747909905;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oFJ2TU3TfwBhbYctuhkMNl6YwF0Zqgu9IFBEEhpDtBQ=;
  b=BAs/iqNeV5RPQod876shNGw7osYvuULoRqGNpuN5cY30/L35FX6mHEFY
   Kw1fAV5qOGuHexmNNBNvOjqwhcE+7klosZXUPsFUvOtFPBtst1nemTXOC
   uTtRv91Au2Rh4wn4kBdGcGmfyfmLN+JzNL1i/KyBmn+OMM06ee3FMFflX
   d9Pxs84Q5283Avs9en0FMQVkLuWsbVNO2hlUKroe+5So7HwI7b5yGcyYK
   Qb5CJX74R6PGALs+sszGHaYa1lKN4j+GzXVtrwdXFnENAhpkyUtJ3+l4X
   uJSBa3Kr0HDK4NogD7zFO/4c3dSeDR+g/rdnOuHD4bwB75gj584tPOTqH
   A==;
X-CSE-ConnectionGUID: +isjpjD2RKSQNf2uDdLS/g==
X-CSE-MsgGUID: 7OoHobcnRqKEcmfLK6/7Ag==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="24028466"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="24028466"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 03:31:45 -0700
X-CSE-ConnectionGUID: z2TYCgjpQG60sFh6j3cUXQ==
X-CSE-MsgGUID: hn8K7XbySQyiIkJpHmCGXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="37826653"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 22 May 2024 03:31:44 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9jG1-0001I5-2h;
	Wed, 22 May 2024 10:31:41 +0000
Date: Wed, 22 May 2024 18:30:45 +0800
From: kernel test robot <lkp@intel.com>
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v3 1/9] libfdt: board-id: Implement board-id scoring
Message-ID: <202405221853.YBhn7Koy-lkp@intel.com>
References: <20240521-board-ids-v3-1-e6c71d05f4d2@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-board-ids-v3-1-e6c71d05f4d2@quicinc.com>

Hi Elliot,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on e8f897f4afef0031fe618a8e94127a0934896aba]

url:    https://github.com/intel-lab-lkp/linux/commits/Elliot-Berman/libfdt-board-id-Implement-board-id-scoring/20240522-024327
base:   e8f897f4afef0031fe618a8e94127a0934896aba
patch link:    https://lore.kernel.org/r/20240521-board-ids-v3-1-e6c71d05f4d2%40quicinc.com
patch subject: [PATCH RFC v3 1/9] libfdt: board-id: Implement board-id scoring
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20240522/202405221853.YBhn7Koy-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240522/202405221853.YBhn7Koy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405221853.YBhn7Koy-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: arch/riscv/kernel/pi/lib-fdt_ro.pi.o: in function `__pi_fdt_stringlist_search':
>> __pi_fdt_ro.c:(.init.pi.text+0xe6e): undefined reference to `__pi_strcmp'
   riscv64-linux-ld: arch/riscv/kernel/pi/lib-fdt_ro.pi.o: in function `__pi_.L336':
   __pi_fdt_ro.c:(.init.pi.text+0xf86): undefined reference to `__pi_strcmp'
   riscv64-linux-ld: arch/riscv/kernel/pi/lib-fdt_ro.pi.o: in function `__pi_.L335':
   __pi_fdt_ro.c:(.init.pi.text+0xf94): undefined reference to `__pi_strcmp'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
