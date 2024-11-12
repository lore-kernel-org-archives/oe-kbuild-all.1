Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECC121C192
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Nov 2024 23:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731455616; cv=none; b=plEsQ9Tnco86FTkMalvNv2XpW28fvZP3xwHRWpVI3hk8CxIz5NgPeUszGOZF2EwU2fLdsTx07cTQFxdGyqLYPSRGLKgbDpsJJjIoK0FFHMpqVcPYPL5GZoizpPjUOhQSblpU37y6+Yd0C1ZRFgNLeP22EeBG1YwZHjxA7i0U5Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731455616; c=relaxed/simple;
	bh=1iGzqigt47bXsGjFo4BNZ+3OU9eCj9hR6h9/qZTH5/8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=NKZMfIU5Ntu0bEXNStvFxi24ztcLl9AOBsAo4FJZrrjtvoKx8O153Qj9NGuoEqNBjGXZB1Lb6J7YbqVYHGfDbjMzFI7x8mvo8DSLa9hgQOk6Nqr57v1dWbXeqyPhFYKertaBBr1YSlj3JxIg3VDxD6y+cUdmbIpcL/c+5UErmxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L2vwBWIM; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L2vwBWIM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731455614; x=1762991614;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=1iGzqigt47bXsGjFo4BNZ+3OU9eCj9hR6h9/qZTH5/8=;
  b=L2vwBWIMXRAmwu2dpIk4xiY5rwM+7NvQRQCftaBXi/QYow8tDQfGHyDi
   iBunBv/fAkO3AVDygQRhEG+HsF7dZpELp+IdFzeEu5SCumf9pfP4MtBNx
   Tev8bWpqbT9eNWSavrf9+FGwFEUBQ70m8IN95wwViRAOxZNHKKW6VWPyu
   SSgW4nTq/pVcAzKE26TdZKKLbels2Rk7hCjKXMe8xgIcx0dqAVT47CX5o
   yBTORWNft5Kyg8lEINppFBO013hMExi1vCYxnqiUKBjSDKF0b+fjleQ/F
   kOzhkKVQ2UF+ga6WpF6vYLv/yqEecZXqydy4B//Uob6mdRGuV/a1hDl5A
   g==;
X-CSE-ConnectionGUID: twJbr0qwTFyYc7vd4dDsbg==
X-CSE-MsgGUID: 6jremMGUQJSCfUNKK2JHRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="48831690"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="48831690"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 15:53:34 -0800
X-CSE-ConnectionGUID: bpbye+LeTNC55BtAFdUg2w==
X-CSE-MsgGUID: dzdiTPWTSJyTNXFclb2A+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="88104711"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Nov 2024 15:53:31 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tB0hN-0001qT-08;
	Tue, 12 Nov 2024 23:53:29 +0000
Date: Wed, 13 Nov 2024 07:52:58 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Makhalov <alexey.makhalov@broadcom.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] MAINTAINERS: update Alexey Makhalov's email address
Message-ID: <ZzPqWm-YO9lFYcfU@541d46c0cbaf>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112235013.331902-1-alexey.makhalov@broadcom.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] MAINTAINERS: update Alexey Makhalov's email address
Link: https://lore.kernel.org/stable/20241112235013.331902-1-alexey.makhalov%40broadcom.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



