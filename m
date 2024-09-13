Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892DFBA33
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 14:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726238942; cv=none; b=J2YHUcvGOXXqYHqgv15ydwXYhGsnhlgwvkydhDqGZjRo2T3qjAe6yVRfD/q5/k9UtKRop8GYaWErEPH8PLW2ySsnSdHbh8nnLj0RuJUDaYHm5bw8uPIC4bTtiQkXccmMn0nwGgysuLRz74km8fIrpprvM2I9rQg5CTfP/z8GQbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726238942; c=relaxed/simple;
	bh=0S9iojoXN57qPta0N1E6e6/Yi4ZKA2Rq8y1sVPsMBsw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=iJVOM+MhsBwulMSiAraOUVvEUwb4by3v53TCRoUR6URaScO0UKcv5UZmRnDRSxqB0nF5oGA1pGChnIzEPmtGLahFVDcFwejtTh8cf4q1gmEphdgm1MehX+IPimbSqP8nCgzRH82bDbNaAOZ71eEbVutkIbhFW/G21Mh4Y39086Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cpytt62t; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cpytt62t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726238941; x=1757774941;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=0S9iojoXN57qPta0N1E6e6/Yi4ZKA2Rq8y1sVPsMBsw=;
  b=cpytt62tjwts8RT9kbCMIty3OK4xktyXRpWIZZ5WmSVpOmB0RAvp0HSL
   Xfk6mif2D3+iOrwcwAVEjU055unJ81UqUMtcoZf9DMpd9pIitvACPICHh
   FCHroEQWqgxeIThcgufe2nRSR2tIGwRMXuO7eW+NGq1HDKPk9QV2FHVmj
   vZKwUl05u6zEbn3IgCaV+eJfwo5+FuCHEht8mHpXyFHJQejwPXEIcG15e
   H6JFrP9roRrCC48//sjWaLOlt47K/rXNGvK9rFkTq9ZacOFRE7R3MijWJ
   esgx0LMBEJbTgR8Mc/qlZPl7o9m/jszvNOyLnrFd1f8DWwLE2dDVAVm6n
   w==;
X-CSE-ConnectionGUID: cGbpyZMLRZG7as+euDT61A==
X-CSE-MsgGUID: ONXbH3++R2qBB4+o6VH2mA==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="24680382"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="24680382"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 07:49:00 -0700
X-CSE-ConnectionGUID: IRymOH8OSbWhVQ7dmYuOGw==
X-CSE-MsgGUID: 7J2RBkGxTFCHfCrPH1o+1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="68058953"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Sep 2024 07:48:59 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sp7bV-0006b4-01;
	Fri, 13 Sep 2024 14:48:57 +0000
Date: Fri, 13 Sep 2024 22:48:40 +0800
From: kernel test robot <lkp@intel.com>
To: Danny Tsen <dtsen@linux.ibm.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] crypto: Removing CRYPTO_AES_GCM_P10.
Message-ID: <ZuRQyPqoUQKmN5J5@4a3c5ba80e9c>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913144223.1783162-1-dtsen@linux.ibm.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v2] crypto: Removing CRYPTO_AES_GCM_P10.
Link: https://lore.kernel.org/stable/20240913144223.1783162-1-dtsen%40linux.ibm.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



