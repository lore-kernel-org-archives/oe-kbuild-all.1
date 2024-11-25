Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FB27FD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Nov 2024 02:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732502471; cv=none; b=WgUJgWOt9OYyFVbyzFdjYB2RZtfXcqZIoYVr2QYTLOvsAq1CF+mi3+vnj5yx5xu2bXUPk6e3xflk6uZuHlf4Juk1Dvljoj8okUbHkwHVsLinSNXUCBd/HA2XqBFiJt8UhnqrUTedzOSa41wNh1VfK4sSbXUSzVxCHIFwU99wzBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732502471; c=relaxed/simple;
	bh=5E2Df6JNtLw+cWgXxgosHaSx3Nr8u6P6aBNV/PINP1I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ZSQfIOcMtMlODCNM/95PYwnmWxz3VJLHZ96neDI6xxWHq5kCXbcn2d/8QMUQZeD8peZaWcjoCGEfgRCIh5YsdJF1TBUs2I1jq3sSxUM8GXuchXyOeMIeOvmVdfjdQKbH4BzTCIRFa0Y4Uev3QgdtEzMFbExpvrSI5z0RtUWjAMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mQNA61V+; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mQNA61V+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732502470; x=1764038470;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=5E2Df6JNtLw+cWgXxgosHaSx3Nr8u6P6aBNV/PINP1I=;
  b=mQNA61V+hBSYVyuCb+4TaSqrFEsz0y0jdmTY4dLmNWCQvqldffJcRsl6
   PnCsNpEitkxoG0ceVb/2VUlhsitQM6mpNtzGk7nJIuvPNw7CBySReXZTq
   7/OICu/Z8ejTMC4PF+7EHMZsBHKbu7PyjdmR0UvwfyID5HIUnQFDBKTxV
   wuNc5NdRwrVh3uNNnF5X0S+QoptHuiYSWuDSuCGEEuQOZu+alEQLJP3Ts
   /vDIHdHXmSHfOP1wVuRxZmLQQxs+ATXIWOfezsu0LNv+cSuwRe81TCfNl
   ggrAxzOqdUPT1bxr+8RUpesPDpUGn4aPpggEaf4ISsxvmc0bzoAdPhkAi
   w==;
X-CSE-ConnectionGUID: TJDMNhLRT5Gd6KOlA5fN/Q==
X-CSE-MsgGUID: 1MfXKEoPSc+wth2GAmRlXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="36254167"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="36254167"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2024 18:41:09 -0800
X-CSE-ConnectionGUID: n2fVn/2uRoSVF/db47YN5Q==
X-CSE-MsgGUID: EcSEsP97RiKw+fjz3SLlPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="91472287"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 24 Nov 2024 18:41:07 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFP29-0005Wz-1y;
	Mon, 25 Nov 2024 02:41:05 +0000
Date: Mon, 25 Nov 2024 10:40:32 +0800
From: kernel test robot <lkp@intel.com>
To: Kevin Loughlin <kevinloughlin@google.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] x86/sev: Add missing RIP_REL_REF() invocations during
 sme_enable()
Message-ID: <Z0PjoFlVrgu3Gyg_@ca93ea81d97d>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122202322.977678-1-kevinloughlin@google.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v2] x86/sev: Add missing RIP_REL_REF() invocations during sme_enable()
Link: https://lore.kernel.org/stable/20241122202322.977678-1-kevinloughlin%40google.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



