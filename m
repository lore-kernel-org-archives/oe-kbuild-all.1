Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C47C2BD59C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Mar 2026 14:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773153612; cv=none; b=f9U9fhyTGBFG7PuEacVVLLMbaXEV9yUqAzRoRQP+rtrC5He18aY9ZgdcQvNDZTVAKwSw5HEE50PvQisSuDxffyYZ/ZFWOmhxHsh02/FxH4YFopkHHpN3opRfE7dfjYqHr07StAtxvR9qTYuhnMdiSOHgPMH49WsFOJ3lClAPi6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773153612; c=relaxed/simple;
	bh=8T67TVdhSVtvvdepFz9J1Xlz8I4C54onclSvxO6OHRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lwUoD5nJyv5rAEZytGENAaQAnyIsxKvSDdB20HU2f803b+bX23Y7uGspHoUFbLI3+x4/FF9v7N1ZFnIRxnMI4zCAw2YwlA1BEmTfQ8JpQ+89wSkcDCxgx+wCiBFjh+jtFM7lAGh4BvTv8C++doDbBeXdBm6miOyITCRfp62Dgq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DbnnMZf9; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DbnnMZf9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773153612; x=1804689612;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8T67TVdhSVtvvdepFz9J1Xlz8I4C54onclSvxO6OHRs=;
  b=DbnnMZf900gq+ujDc80G+vOHYFX/JN9DQtmp1iqqRTHvCva6236dOUvH
   ULrNwtYiv9MocmLgTW8I81YO+rIoyA7UENUTYVHdr4XWqkI4IP1kUOILd
   zGlDnD8MrAxnT1J0xT02MTzSG4pXoKbu38VwtbOLTX/FbKfiuT4ptARa8
   LzhINQ0Dg0y7dzjMLrvlk+sySAR4sa03TpqF7/GDCb9DIbHSZqTJqhH0+
   JAHmZ1nU9TYegr/6kELV6CQfoP3/89OdaBBUT8OVhWcqjvcQpTJvpsLtz
   KdxhuUpOlURsr1/IbB/QQRKcaLdCjgVe+NMDjLA3oasI5t962CY889wgG
   A==;
X-CSE-ConnectionGUID: g9jaKN0hSbinS20XXZnOqA==
X-CSE-MsgGUID: FK39jr99RCebgtdtm+R4RQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="85679950"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="85679950"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 07:40:12 -0700
X-CSE-ConnectionGUID: KDrZC1mQTqq3uRBDsVX0dQ==
X-CSE-MsgGUID: d5gc+KztSySnXUEngiDR5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="218094562"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Mar 2026 07:40:07 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzyFg-0000000025C-3tHG;
	Tue, 10 Mar 2026 14:40:04 +0000
Date: Tue, 10 Mar 2026 22:40:02 +0800
From: kernel test robot <lkp@intel.com>
To: Lakshay Piplani <lakshay.piplani@nxp.com>, linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org, alexandre.belloni@bootlin.com,
	krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, broonie@kernel.org, lee@kernel.org,
	Frank.Li@nxp.com, lgirdwood@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, vikash.bansal@nxp.com,
	priyanka.jain@nxp.com, aman.kumarpandey@nxp.com,
	lakshay.piplani@nxp.com
Subject: Re: [PATCH v6 1/7] i3c: master: Expose the APIs to support I3C hub
Message-ID: <202603102243.IVWJtjqQ-lkp@intel.com>
References: <20260310065727.3759342-1-lakshay.piplani@nxp.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310065727.3759342-1-lakshay.piplani@nxp.com>

Hi Lakshay,

kernel test robot noticed the following build warnings:

[auto build test WARNING on i3c/i3c/next]
[also build test WARNING on lee-mfd/for-mfd-next broonie-regulator/for-next linus/master lee-mfd/for-mfd-fixes v7.0-rc3 next-20260309]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lakshay-Piplani/i3c-master-Add-the-APIs-to-support-I3C-hub/20260310-150040
base:   https://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git i3c/next
patch link:    https://lore.kernel.org/r/20260310065727.3759342-1-lakshay.piplani%40nxp.com
patch subject: [PATCH v6 1/7] i3c: master: Expose the APIs to support I3C hub
config: loongarch-randconfig-001-20260310 (https://download.01.org/0day-ci/archive/20260310/202603102243.IVWJtjqQ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260310/202603102243.IVWJtjqQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603102243.IVWJtjqQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/i3c/master.c:3197 expecting prototype for i3c_dev_disable_ibi(). Prototype was for i3c_dev_disable_ibi_locked() instead
>> Warning: drivers/i3c/master.c:3263 expecting prototype for i3c_dev_request_ibi(). Prototype was for i3c_dev_request_ibi_locked() instead
>> Warning: drivers/i3c/master.c:3312 expecting prototype for i3c_dev_free_ibi(). Prototype was for i3c_dev_free_ibi_locked() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
