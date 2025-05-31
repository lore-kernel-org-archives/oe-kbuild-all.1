Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1801F0E49
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 May 2025 23:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748734325; cv=none; b=ZUGE2T0/qGsJ97Dj8ba0Z2kGGf6017nSI95LbbkbQdKHmUVD2dcM0gzChzUoAzAaOf90m/tJkQECWusrwo4totCNq/l1et62/jniQCAczUWbCz5knC6WnzaX0Ie5sJ+Cn3pkVrZ1imfyG3B35Q7/3QS1r2q9+xpdzjDMailwJZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748734325; c=relaxed/simple;
	bh=l/6JWtbuEjpEYr0d5Qx0p0ETOLprUagjTTOYMllVTmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dHpt7sHwV85JJVIB97+iocyuah5dbbnTPJmBwTfjXBkN17WJ5vgnmEsMSP3Xs4wBa4yDlSJ7fMvUZjHDyfdN6hL10k1DF/z5V8blUhXA298BjVbs1BROWB3/HNYgNiCWJRVBC6W/KZmDUiNdnlcC61ObWtOHma+0LWBI98tmHd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WG0pu5SV; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WG0pu5SV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748734324; x=1780270324;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l/6JWtbuEjpEYr0d5Qx0p0ETOLprUagjTTOYMllVTmM=;
  b=WG0pu5SVXIEsfpiktm/ZUKu091lGV/PnNbLTnaGe0YB/hggQB+xhMFiv
   rls5JKWX8h03RCRXjjorjEuXKQv5UnLX+JkOGtZvqIyfQ1J44/MGjmuZw
   iWRAVMorFSzonDfxqlqvhkMIzH91BxGkIMzFvjycr/MahpzcM/yFyDQrI
   fdNyE7xoi9JyfV5kUKYVX2fle9MFtmK2xR+eay7iNmTf9AvFfZlov/XMl
   uEAaLC/+QIn8eKv/fjvSsQGFZjsf4z9rrqq3bJD5YoeM7yY28BhNiTaZ9
   MtK/K+Je9ySyMe7r0/TdiodxVT8ZMZmHFcaugmrK0tuW1RXhbIlvQTzDJ
   A==;
X-CSE-ConnectionGUID: wHxmW9GETxCz+smPByEMwg==
X-CSE-MsgGUID: pYsFtBOASMuAQT/W4CBhcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="50711544"
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="50711544"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 16:31:59 -0700
X-CSE-ConnectionGUID: /h+kF7heR8C0mmFRf2NNvQ==
X-CSE-MsgGUID: i8uZgsDoT2aSoq8+NoX0WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="144224192"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 31 May 2025 16:31:57 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLVgA-000YhA-2z;
	Sat, 31 May 2025 23:31:54 +0000
Date: Sun, 1 Jun 2025 07:31:07 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Lamparter <chunkeey@gmail.com>, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v1] spi: push HAS_IOMEM dependency down to the drivers
Message-ID: <202506010734.yl1PFBaA-lkp@intel.com>
References: <20250530234941.950431-1-chunkeey@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530234941.950431-1-chunkeey@gmail.com>

Hi Christian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-spi/for-next]
[also build test WARNING on linus/master next-20250530]
[cannot apply to v6.15]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Lamparter/spi-push-HAS_IOMEM-dependency-down-to-the-drivers/20250531-075211
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/20250530234941.950431-1-chunkeey%40gmail.com
patch subject: [PATCH v1] spi: push HAS_IOMEM dependency down to the drivers
config: s390-kismet-CONFIG_MFD_CORE-CONFIG_IIO_SSP_SENSORHUB-0-0 (https://download.01.org/0day-ci/archive/20250601/202506010734.yl1PFBaA-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250601/202506010734.yl1PFBaA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506010734.yl1PFBaA-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for MFD_CORE when selected by IIO_SSP_SENSORHUB
   WARNING: unmet direct dependencies detected for MFD_CORE
     Depends on [n]: HAS_IOMEM [=n]
     Selected by [y]:
     - IIO_SSP_SENSORHUB [=y] && IIO [=y] && SPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
