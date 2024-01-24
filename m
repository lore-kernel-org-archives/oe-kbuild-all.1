Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29FF77647
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jan 2024 13:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706101445; cv=none; b=OnK855CM0NOQg5CSYMtUS1ggsFZLWFjVGS3R8PKoJoTETqmWPdxA6aVH4use7NDK2VEtxdJuTlXRbuBBGCOOI4YLhlMR2pLFMHGQMwgyJ9ZDfMTWUuQUGCahtgnhlshqJEYCeYakX838bxgNbVhrEO0HlbjCmOxXCRBK9DhIFIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706101445; c=relaxed/simple;
	bh=VyGwH/KUq3kjku0BaQpnemZn9qYFyPLUdaFVVhGkB70=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=pSv9AjnNROdnHrRrxSCAElU593y6s/TxGoTpeiKzEAxDykVfC80z1RqpS/6mLo+7SsOfZIsaBsXy8gSeOxrm+3c3nhv87DeH38AFm9uhfRsGPxNuGOEC0ld66obn8gpa5YTrC5/G3plSas//QQa6WT2Yo2ogzEzvgI1sqEmXkJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BPECprOC; arc=none smtp.client-ip=192.55.52.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BPECprOC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706101442; x=1737637442;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=VyGwH/KUq3kjku0BaQpnemZn9qYFyPLUdaFVVhGkB70=;
  b=BPECprOCD2KqT1EHi+rPP0fCpy6uB2D7Y8BaVfXf//fYofkCxuNmuntl
   EqzbE8VR4DrT6Gz8uuhGXA0D4IgNq27fyrtmG6X+gFdoMPGta/6n0Ahyv
   M4SnHjaZAKx6Jh2WWUdn2Zu43peLIgb1s6noGvZklRLaZX/3t8608CF53
   82PotdfvmsLNkgYIcb+hg3PKWHYj26Eea8eWQhgkUpepwkID3QaxGsqz2
   8HaxrhuDueMB8OCeoO78jxBXoSo59tGXLe/36B+Iq6aydOy4s/k83rAB7
   yJ/xPqsJ/53EA1lRPkumjnLpXEiWPhqYxPSfOYg6A7pqkmwAcXhFZJUMU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="401496586"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="401496586"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 05:04:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2019278"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 Jan 2024 05:04:01 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rScv9-00086j-0c;
	Wed, 24 Jan 2024 13:03:59 +0000
Date: Wed, 24 Jan 2024 21:03:34 +0800
From: kernel test robot <lkp@intel.com>
To: Mahmoud Adam <mngyadam@amazon.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] fs: move S_ISGID stripping into the vfs_*() helpers
Message-ID: <ZbEKpvaVHrsXzISK@6c5a10f2f1e6>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240124130025.2292-3-mngyadam@amazon.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH 2/2] fs: move S_ISGID stripping into the vfs_*() helpers
Link: https://lore.kernel.org/stable/20240124130025.2292-3-mngyadam%40amazon.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



