Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1115243952
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Feb 2025 19:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740598910; cv=none; b=PlX1MuBprn5mgHEgS3iwqCA6rJ5EYcaKmrPRrp5XVsFyeGKQPYU1pOKmeSh10GsRGv2Ig7T2HwRyRBM7P7uH/FUm59eng75gq0Lx58UkDFjohlXT95mB7qP1hoCkMdx1Oqvvn7XOcANedzLK1yraiPWo0UApMg87FNRGEgrD+2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740598910; c=relaxed/simple;
	bh=XEHe4LdR+l6GJXwGhALO+6ebXDOPrZud6plrLpHELdg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=UcWtcGICR/UI+N/dEIJ/dd0Mw6RrYiML4Hb3g9zWpj0fB5i15dndAsrRG95fq6I0Y4yzoWrbBYYEvvoXv0szqlSc40XwmIMOtbZ0Z5l9Re0O+xAs7/AQXo/Gdm3f4nZJILweX255tmddlOv/ljZaci8cKgr5Cegkv3A3LkLjnB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AngF11oh; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AngF11oh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740598907; x=1772134907;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=XEHe4LdR+l6GJXwGhALO+6ebXDOPrZud6plrLpHELdg=;
  b=AngF11ohv84Qe67S+o0sJmlrZwKWla0o/ol0xxVGVe89Dyb1gGDaFv5d
   R9ntAVwtQix/Ol1VCrWyBzNO0UcglT9djDQEwk5HeXFGo1HPmjnueKS+u
   Hvhud/E/hggXyCk6FcR4kNrFrWFhDgPJnEFT6JtGY4pPOQ+aDHXQUOsUH
   weFceMjXRVhiPtNd32dOCBUyYUdPlV5JoJBlPndJ1Cf/VByh1Gb9voc7v
   QHiuYLzuMTF+0ue4zOWBWHb9QfzJYwf/BDOyuMmZUcHoXYLBpDk/906gi
   2zm1Yg5jqEO6yQ0U5yGq3XWbLViNZfIrmv/yaoxaeo/6o7jBZtMJao/MZ
   A==;
X-CSE-ConnectionGUID: RxNgRGu3QGiAjfE/Os7HkQ==
X-CSE-MsgGUID: +kowfb1tRDialLRaGihGaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41169529"
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; 
   d="scan'208";a="41169529"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 11:41:47 -0800
X-CSE-ConnectionGUID: PB2TCW9aReKyWkMD71ns5Q==
X-CSE-MsgGUID: lo51Z/RZThqvNfTCKxTlHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="153979267"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 26 Feb 2025 11:41:46 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnNH2-000CK2-1G;
	Wed, 26 Feb 2025 19:41:07 +0000
Date: Thu, 27 Feb 2025 03:38:33 +0800
From: kernel test robot <lkp@intel.com>
To: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 net-next] dpll: Add an assertion to check
 freq_supported_num
Message-ID: <Z79tucNAlwpGo_1Z@c9d8a7425515>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226193715.23898-1-jiashengjiangcool@gmail.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v3 net-next] dpll: Add an assertion to check freq_supported_num
Link: https://lore.kernel.org/stable/20250226193715.23898-1-jiashengjiangcool%40gmail.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



