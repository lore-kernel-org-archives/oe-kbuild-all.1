Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606DE2038B5
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Nov 2024 15:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730907322; cv=none; b=XTmcaAWVLjcZMWb36c0z3etFaiKBEIWKF3Y+/Xu/KZnPHKLSuh3SHlOmHVJWdFv3HVazo1Qb/3EfCTEO1YzjoX45Da8ohLsFHZ1iwHPowvpL9Fu/zupq1aJ/Y2S/Hjvhvp4NyHVUwu0Q2Hz/NWR6InUlm5N4oTYsl/6fxO+VYYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730907322; c=relaxed/simple;
	bh=FI7CV0X4k1j7iQ7IahLdRFMBi8yyGlbjrOiYPxWSBi8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=EOEh25N+hCQcUe6701mCysZo8/UDkc0yq2CdeXeEKe7y+YIPFj8+BtqpjTkbBiLNpLXWHzdQH6aqSQtJfkXCbcNZs5WDnMRyujS0AabaBG1sG+2fszyH/qe0vFhAwbC5ZZXvXHsn70Ue3gqsr6SbByrdeogvPAMS6SM1gQOF2iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bM0FxsSr; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bM0FxsSr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730907322; x=1762443322;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=FI7CV0X4k1j7iQ7IahLdRFMBi8yyGlbjrOiYPxWSBi8=;
  b=bM0FxsSrMMsMTz+TYbo2jBAf/09wVGw+nYQHykN0juO5iESpMPO9T4hI
   CmIuE85ZH+psjhNQmxOcEl7rQW4BTFtraXfjB6h3uXcZbfpBVmP0ZgemM
   xv9cFJKGIMxC6OzSQRUosSAKgNc7iH2BoH+Of5bA25c9p5qbUzmKqAcxV
   KblxwyQVD1R8QfHqVfJhSope9SWGJLopijK214y8psYcPhFrH6vsCw8il
   l3VfGCpW3XZ4aMiMY+iNYFCu1hUsvDDqZ+THJEENuudV3J2xLq3/DIUqo
   Fx2rpPngO0FvsFG3Wvhdx/AiyFGIS36CbjiR0Q1w2lWAmZelzPxozCusK
   Q==;
X-CSE-ConnectionGUID: TX58/J+lTECqJgUxIO4u7A==
X-CSE-MsgGUID: +chx7LSyQCqZPbQIQY5HMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34410712"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34410712"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 07:35:21 -0800
X-CSE-ConnectionGUID: 2lEY/G5EQ7Ws6YWFczQ3Kg==
X-CSE-MsgGUID: Oavb0Ff9SveEtXlp3auSTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="88572040"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Nov 2024 07:35:20 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8i3x-000p4E-3A;
	Wed, 06 Nov 2024 15:35:17 +0000
Date: Wed, 6 Nov 2024 23:34:46 +0800
From: kernel test robot <lkp@intel.com>
To: Zijun Hu <zijun_hu@icloud.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 6/6] phy: core: Simplify API of_phy_simple_xlate()
 implementation
Message-ID: <ZyuMlk8VXQx7IswZ@a6d8444ee0cf>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106-phy_core_fix-v5-6-9771652eb88c@quicinc.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v5 6/6] phy: core: Simplify API of_phy_simple_xlate() implementation
Link: https://lore.kernel.org/stable/20241106-phy_core_fix-v5-6-9771652eb88c%40quicinc.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



