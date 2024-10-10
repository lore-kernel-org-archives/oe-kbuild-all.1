Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3061192B9E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Oct 2024 16:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728578245; cv=none; b=cfwsq65YJG9VEnHV3KBbpD1dLrqpnuatfibO2Y1KCIAl8hLYs02187vzdujQv3ALl/KX7vYCWL6WldugtucN5ejUXO9KMxDIrmenGbB999ntD/P7IJg0EWELmOdC2JEVnVfrM05E2F62n4RGtFZ2sks0EygcbdaFGhm1TMT0zDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728578245; c=relaxed/simple;
	bh=yWdQl8FZCcFoSDH+IkAxraBgAnN+U3U/KJRBsZPHGvc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=AWUYTVteUpw0iHMmpfV54z2r8UlSIfP6+JpBa5xb0SV+UCi8Z5KyCffpQOTBN17kQf/p+OMyLKVyUldjG+cda+tPezk04dxgZ8/kFHnBkPK91C59M+TdwHxwPfUMjm47MVwJQRIS7t+bF3xKUvqk6eWrr/FNu9qYOfN9lHuMKW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kgOOqJDf; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kgOOqJDf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728578244; x=1760114244;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=yWdQl8FZCcFoSDH+IkAxraBgAnN+U3U/KJRBsZPHGvc=;
  b=kgOOqJDfWA+s4BXi1Gpr0jkDGUJnFCAmg9cDt9zK7xP/FRC+5kLJMVET
   tjd6qVjHaUib612FnCWRSsE87STNKCfV9B5A2kCJJZTuDt7wCjDtBjJyg
   eIrgP4LsOGC9f3K3q3+5CrbS83WD88ZyeZwemOr8ogJxGYp/zRcg2w9vn
   QhdS/Jo5cuL4PNTjfVYLhXckE+qBPol2WTpAfCbyv731f2+N3T0GhsgZQ
   DyzbtM0DekXS0JovGf8sgHSm8MpLZa7Yv5jX597WkH9UEflSdVT0ANi0O
   9IB7UORVdmAA2huKx0D5IaiFHCO+HZimlraKGrWSegIFKcQtG2ITUCrNj
   A==;
X-CSE-ConnectionGUID: DaTPF9aTRxm+MfdOX69XsA==
X-CSE-MsgGUID: DOJuRCd5QbG6iewPQWfsrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="38597602"
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="38597602"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 09:37:23 -0700
X-CSE-ConnectionGUID: 9aeXE4fASKOAxLxj71uQRA==
X-CSE-MsgGUID: Ka7qOI1uS7iEst7vo+Zmqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="76738397"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Oct 2024 09:37:22 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sywAC-000B19-0H;
	Thu, 10 Oct 2024 16:37:20 +0000
Date: Fri, 11 Oct 2024 00:36:39 +0800
From: kernel test robot <lkp@intel.com>
To: Anastasia Kovaleva <a.kovaleva@yadro.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 2/3] scsi: qla2xxx: Make target send correct LOGO
Message-ID: <ZwgCl3kbp3K3LOTH@d65bb508a7d8>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010163236.27969-3-a.kovaleva@yadro.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v3 2/3] scsi: qla2xxx: Make target send correct LOGO
Link: https://lore.kernel.org/stable/20241010163236.27969-3-a.kovaleva%40yadro.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



