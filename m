Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A08C27E06C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Oct 2025 06:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761548162; cv=none; b=UArvsN8Rps3M+ZUD6A+rrpzvz9v4lt3EhR/YzoMu0KNoyLbo3H+xg1YwK7z1l0NLU4G4VaMq/zJO+YVSqL5apOA38+hy9kAeB7R10OwbunuGU17VEe+KcuATi81GqkoTsDrxE3wgQ3Z8ncdVecsDByAeXjbuC35WkPlQgG9cMik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761548162; c=relaxed/simple;
	bh=vb0ZnpvA3usBbxYPASAaUm19xE2GVagWxrzyptkWf+o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=nM+ohpR+rb7BWVgVgF67Y68fciDt1RP0n8mr7KCngV/QuVUUUvH1dSS3DdWhg8UYDoST/WIMA5qcpMUeLCjH4xmkeYp9G3AkeYfP1WrOVdVj6+uTVqvdO+0WjZ50Gqjve8pVlVGQn8is/8LroBMFTOE5LBRgLy2EhEM9S87hIk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K0q5Mnlv; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K0q5Mnlv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761548161; x=1793084161;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=vb0ZnpvA3usBbxYPASAaUm19xE2GVagWxrzyptkWf+o=;
  b=K0q5Mnlvj0IMtX3xAGKDcCa6nicQNJozKrF0wV/OfPInoZ8TlF4yPH5q
   sxjKM1JcQlYn9xHAjZZ8x4+YwA4WAY7jGhkEgSjIg5JSh+/2AP/J8DVKU
   +VyaEf2QSwwYfpgWx0V1XkQ/H9PMZe2JZxUfu5no0+cVpUwAZdPGOAC3h
   wKdz/YZ5KfgbrIeedYnH7TyZs3BKSvB93zRDx6UfSojkXsehJ6ocHQNiE
   2rZEPuJ1McJDIIAJZyo0MLR6PSzHC5mgcYChG8JL/6yIEZQxduIkdLvEg
   vP0x3XN9s1NPjTFj5RBNxJyNsFqVRYCvJJTo11KWZ3zCiXzyI1UiQki0k
   g==;
X-CSE-ConnectionGUID: k9v9j4YTRXGT5dwxz1DBMQ==
X-CSE-MsgGUID: +bKa1wI8RQeC/YK8zmfppw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63545092"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63545092"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 23:55:59 -0700
X-CSE-ConnectionGUID: KHYiySwtR5iFrCMmyJpHCA==
X-CSE-MsgGUID: f6Ny5IhlTkeSUpGipoGWrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="189337353"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 26 Oct 2025 23:55:58 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDH91-000GZp-2F;
	Mon, 27 Oct 2025 06:55:55 +0000
Date: Mon, 27 Oct 2025 14:55:13 +0800
From: kernel test robot <lkp@intel.com>
To: Andrey Troshin <drtrosh@yandex-team.ru>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 5.10] scsi: target: target_core_configfs: Add length
 check to avoid buffer overflow
Message-ID: <aP8XUbllH_jELuC7@cf5b8cc2d60a>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027065048.2023-1-drtrosh@yandex-team.ru>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-3

Rule: The upstream commit ID must be specified with a separate line above the commit text.
Subject: [PATCH 5.10] scsi: target: target_core_configfs: Add length check to avoid buffer overflow
Link: https://lore.kernel.org/stable/20251027065048.2023-1-drtrosh%40yandex-team.ru

Please ignore this mail if the patch is not relevant for upstream.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



