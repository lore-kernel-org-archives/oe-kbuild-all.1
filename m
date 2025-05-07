Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF50D28136B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 14:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746629084; cv=none; b=R7jm6ME2doplZEuZeSh/KZkVMDNNNllY2a4flGrS0meCFzPwOQu/1xHKGpH2xyRKqSI2kElc53MFZeG9KlniHrG0mXPI0/tMHBlNiCVYWefxHkd1cd7uVFLtKglrkn0p6niVQ4Ue/kGuQ5iAgAcc32eSJxKpwxwAV9Ix3AZkdQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746629084; c=relaxed/simple;
	bh=n8EI7E6Dz6AzwEes/6/LRkBeJ5KMDspkzsKY7QNj+H8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=pkHMVJ9XZzjGdfWfo3UXibjGqbckR20KHmC3LLU24Ffk35Hz7v9fQ0TBZcEVOwivSwR1IRe2qaxCSvHxCaBYgCSEcabuBLnNfN6fu/75dE+AKtgm6PXnwtDoV0IF15Db3d5HgXbB8kaJloFTDgif1cLT8C/DjLBOGeYAJgRALMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OdFbB+hN; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OdFbB+hN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746629083; x=1778165083;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=n8EI7E6Dz6AzwEes/6/LRkBeJ5KMDspkzsKY7QNj+H8=;
  b=OdFbB+hN2bOwRGuK+6Hia9jwN9aqM7NbBETTI6/BjCjMDhbE8G8erade
   T/3/XyUeGruot/xJr2oYnMDVV54cWPWhjuhz/6KxSYw6FkdW1ykdsw2kA
   erevkFAmjs73MEY+Nh+ILhZf2BTf5eI9VmHvUgSSAJkW6+0PZH4htL9Gj
   PDd69UI1qs5WfCTwPVJLD29w/T7a11205OzTUxpcq7ztv02kumqA3bU3h
   jlKnKSSdTYndL/bLHKVxdI+dBNNtsm2kd+Yn23uTmWKj26a3KinYYjOTp
   F+sRjdZelagCNmDuKEuI3QhX7I0GmE7Bo51c7VOpHdHUeevo9pivLT8CL
   w==;
X-CSE-ConnectionGUID: 1E6ZpIkMT7Wwmpe4G5mSPw==
X-CSE-MsgGUID: bh/mcYDGSH6ygSWCjti2gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="65893901"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="65893901"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 07:44:42 -0700
X-CSE-ConnectionGUID: 6jczajH8Sl201PDxomnKCQ==
X-CSE-MsgGUID: NmJqAWPaR9aZSVLpZFutNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="136001085"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 May 2025 07:44:41 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCg0l-00080T-01;
	Wed, 07 May 2025 14:44:39 +0000
Date: Wed, 7 May 2025 22:44:31 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/3] udmabuf: use sgtable-based scatterlist wrappers
Message-ID: <aBtxz_RNTlOc1M9b@908e72e18855>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507144203.2081756-3-m.szyprowski@samsung.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v2 2/3] udmabuf: use sgtable-based scatterlist wrappers
Link: https://lore.kernel.org/stable/20250507144203.2081756-3-m.szyprowski%40samsung.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



