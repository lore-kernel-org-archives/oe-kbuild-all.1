Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4191DA2FD
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Sep 2024 14:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725461487; cv=none; b=kFfJDHbGifhACpUYOCaT6mml/03eOpLYLTtXQx0u8SUsiOEOZzEcXPhldrSuldn/b+fbWALP2NDWnJxkIE81Arn4HNcJpDNjE055U7RbwjpAluiFCmH1zgFrQZPOv0XfhXmJP5XnN30SeRqtx7ztMXrHs33wvPsBAE+UQcZEv/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725461487; c=relaxed/simple;
	bh=FCAPqs4G05hrqJAmmykNRSLlAJ2YYbmgxj2kMs1AJ1s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=jjYOnfvAfMDu5tn1efrPvH/AXnsh/td4im1UDfgUQIKvamVC2smj3Oyj/D+5a8n75lc1VsnWZN6YBFl2HDm6L4pTGmA+smhu5nzZU8R4p32glYUSy9zsCPVNw3zul83nNgcvn4ox90SUJjJhDtphl5sH3wG3XpLsY1navNLvs8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UNwMDw35; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UNwMDw35"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725461485; x=1756997485;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=FCAPqs4G05hrqJAmmykNRSLlAJ2YYbmgxj2kMs1AJ1s=;
  b=UNwMDw35iFWEy53mHIQ3STb6yyjRTfWkTUf4+vIOvJo1j4/hcWWa3B4p
   YAGvcnAcMlXb5TRbcepEpuz3fV8/DiOvO9vFMs04myAC26OrDvH/uhVpq
   dN06pfI1yZPvxEtcfYBluonKGHnFWWYjGfJOKo5iev9/z53RiB68GZV4V
   b6cYfR57GeGcIH5Ay2SnrhzTMFnIVvYMpdxKZ24GUo7wZtPAX6WHNW0eC
   zilsViJMTCzlvJ8b5hpnplDK6+368L6gewbaenMDl0h/Siqa4nZaDSCDX
   BZZmzWw8UzURAcKBvZDSuGk+ixy2GiMn7p+ssa0cpTf0glLB2Pu1eA1dR
   Q==;
X-CSE-ConnectionGUID: Ihg0a02dQWGdHCtqqlaz2Q==
X-CSE-MsgGUID: Ul1jZL9OQFWroo2kVcEltA==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="28013822"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="28013822"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 07:51:24 -0700
X-CSE-ConnectionGUID: P2ETf2G3SAaf4Pirp/QuFg==
X-CSE-MsgGUID: LAT5FjN7Rs2XT0C+415cVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="102712706"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 04 Sep 2024 07:51:23 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slrLt-0008E5-02;
	Wed, 04 Sep 2024 14:51:21 +0000
Date: Wed, 4 Sep 2024 22:50:22 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandra Diupina <adiupina@astralinux.ru>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 5.10] cifs: Fix freeing non heap memory in dup_vol()
Message-ID: <Zthzrh91Z3w48KII@e904a05aed35>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904144832.28857-1-adiupina@astralinux.ru>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-3

Rule: The upstream commit ID must be specified with a separate line above the commit text.
Subject: [PATCH 5.10] cifs: Fix freeing non heap memory in dup_vol()
Link: https://lore.kernel.org/stable/20240904144832.28857-1-adiupina%40astralinux.ru

Please ignore this mail if the patch is not relevant for upstream.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



