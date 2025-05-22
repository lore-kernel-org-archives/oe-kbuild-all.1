Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716A733DB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 May 2025 09:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747906529; cv=none; b=u9PIS3peLCSRtgX26Jc0UTaj3/vwiG2K1gG6tFjOclO0suVmRYBAjUfn9w/LtjY/KZVPIyY7+jTo5czLdOoWkJvvaDWWyRecsHO1nrlEwtaDr2Hgn5cLzvvvXCEvlzD1tGm5QOszoHHDE5HxkGfHcUFCX6FRBHHWILk5khhlVH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747906529; c=relaxed/simple;
	bh=Z/k9wpWTaUoOMLhtPtCMs2jMnEQe9GDOpd7b/E9IePI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=AAea4IsFzedsr0ys23X261LDahLF7Mdd2Lb1ZgfGVC8ylmZWcWIjoascgQMYevxhi6A1RFQpv/T7ti+wxi1oPW+xKsPNQQ5rLd7B0fig5a7MEEQ+w2vP9Jz5VXRmGIhTyHFNIgGNEeMfAYsOpmuDvg87/PusYrQNUo0W2d3rw1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PJ6tXJk3; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PJ6tXJk3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747906529; x=1779442529;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=Z/k9wpWTaUoOMLhtPtCMs2jMnEQe9GDOpd7b/E9IePI=;
  b=PJ6tXJk3mvMlFVUbRvteRk2+LzilhQ47HBA5ShqGKjBiGMaGqye+ZnNh
   6bjbtUgcLtSJ9F6mO74h32HiUEdpwDuYqg+3enyD5UMAOFzvPEYTyhzip
   SKWK7JFP6o5qtwuloMCnnKgamiD0kdVL+STYfibAD0QBTmKy1aj5/WOIM
   rsmHdOxbff1l/N6mLqUuJaszjaU0BGCcZ4J/38WuOfBunF2IUzW7g/9Uy
   dCj1IDqfEWQcIfgFPy3qJWFwafTXcA+VWUCIldaPadbzWCj+WoJ2Ov0DG
   5xqHBHQCATdOElu4fwTQ27ChkYHTushuaa09AteoUTVcsrNISNPly5PkX
   g==;
X-CSE-ConnectionGUID: GrS/xtXoR7iwLkC8bqeSAQ==
X-CSE-MsgGUID: rxUwzjXWSna+lNfsi4uPRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49037744"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="49037744"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 02:35:28 -0700
X-CSE-ConnectionGUID: ppsBbAwVQhyI4oISmn+LdQ==
X-CSE-MsgGUID: 31ScKA/4Q2OOa2hif9UjlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="140920542"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 22 May 2025 02:35:27 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uI2Ki-000PAu-25;
	Thu, 22 May 2025 09:35:24 +0000
Date: Thu, 22 May 2025 17:35:22 +0800
From: kernel test robot <lkp@intel.com>
To: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] iio: common: st_sensors: Fix use of uninitialize device
 structs
Message-ID: <aC7v2lguq9ZXLr97@99c60fc626cc>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522-st_iio_fix-v1-1-d689b35f1612@gocontroll.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] iio: common: st_sensors: Fix use of uninitialize device structs
Link: https://lore.kernel.org/stable/20250522-st_iio_fix-v1-1-d689b35f1612%40gocontroll.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



