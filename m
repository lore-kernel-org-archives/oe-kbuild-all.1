Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81F6201003
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Oct 2024 09:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729245207; cv=none; b=TIPBQUwdIReGVxWIN/oandqfHvshbZ03HoW21mysc1qbna+EB5eyZJNkwDsgyNyFlOBxzRDna36Agin/IT5tEAvNfp6BcXfpMfZE9t+c6Nq+9D0R9f1IvhBgNp4a2aO9uiUPil8M+4fT+mHT/Ql78hkAkGirtqQvGPHmur9SFgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729245207; c=relaxed/simple;
	bh=f3Fvwalzig4Xw7bYWqFWf5/T+480AGCq/fMgFd1CL3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=e/MyfL7MlySDmbFKZxFUw87ewYfN8Xeym7TFI6oIqfE5XlXm7QfgHxbS+V+G3gG8yr7rfEMiQMFSdNmQIr/z9sxnBGeqqKXVWebF6GHZfsnjoUsUgpwJr5n96Wc9SuzUAD8yJdbDaDhYZurH8F97f5TyjW8Osy/A12IzC5NLI8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GyNlub/m; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GyNlub/m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729245205; x=1760781205;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=f3Fvwalzig4Xw7bYWqFWf5/T+480AGCq/fMgFd1CL3Y=;
  b=GyNlub/mCct1dO7/WcOUF27EwFQGgOU5mxr1SXnC9e1NQBdHFCOMaAoh
   GBXwXTr7w2sk5yTlWqeKJ1S0rfWFUxYWqgWX25RdxqbmvjM1wkYBxrDgh
   qWRiJ09MMuXDQCFxuqYy4Rg4MrjZRK/i1OuicWNF2rFiTLPdLi8pIXg11
   vPdPMaTxHcgcXXx9E3CTvfLHX5tDlrhRTOCdso1WRhWRT7vp97Cxkoas9
   nJrjkkMTG3p+RbaZNXkOSWnOlWnGdJouaSR55Bc7CQCnJyW2wCVSqoe0Z
   gaOCJRtujESA5jJycM/OqkxapqJTugu502fRqdSz3l5OFwDnrIhwS7K/o
   w==;
X-CSE-ConnectionGUID: MmQC71XgRVWV2jGBzSoqAA==
X-CSE-MsgGUID: xg0VfsdSRQiIGY0TGweftQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="28862488"
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="28862488"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 02:53:25 -0700
X-CSE-ConnectionGUID: ON8/I0P2QpOK8NoZhrfjNw==
X-CSE-MsgGUID: /fccewSBSluHARbSyXmTqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="109641206"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Oct 2024 02:53:24 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1jfc-000NZj-3A;
	Fri, 18 Oct 2024 09:53:20 +0000
Date: Fri, 18 Oct 2024 17:52:35 +0800
From: kernel test robot <lkp@intel.com>
To: Daniil Dulov <d.dulov@aladdin.ru>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 5.10 1/1] iommu/amd: Prepare for multiple DMA domain types
Message-ID: <ZxIv469lHr06zCCO@594376e94b8d>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018095122.437330-2-d.dulov@aladdin.ru>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-3

Rule: The upstream commit ID must be specified with a separate line above the commit text.
Subject: [PATCH 5.10 1/1] iommu/amd: Prepare for multiple DMA domain types
Link: https://lore.kernel.org/stable/20241018095122.437330-2-d.dulov%40aladdin.ru

Please ignore this mail if the patch is not relevant for upstream.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



