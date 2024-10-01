Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4FF15E90
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 00:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727742407; cv=none; b=Yn9guxKTAOsysuqRHpS+s5DS9s4hMFGJO1lxnsg5drW/qtI2btTyLkLSNhc5xjcnfVkxB2+D62UhSraUtjCljp6L5jiWK6xyvSyq+z3wWMM3FZ6FDqBqyMgeNJCuAbUyOJykqONgKYTP5M6RzxoEHcuwU3amjhhzwI21K/X4bl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727742407; c=relaxed/simple;
	bh=GRstGh88CKhWBeZYBvRFmii5LqNpCmTvCKEi1vd9Foo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=O3BNwEcnbHOR1UVRGQ/KgS6VpPP88La1PbrYZ7I/AnDEaynzcdFprNCdaLodGZxUYPK8GBoKiz11Rjg769VpIDu5MiDP4SzfuE9QNKRDicHR8Jx+iNILRzk/NtFLygXfn3TN04OSpjZWhziLzsnrTEh79g3f5+mjlW1XQmaAnb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e/vL7cWp; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e/vL7cWp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727742406; x=1759278406;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=GRstGh88CKhWBeZYBvRFmii5LqNpCmTvCKEi1vd9Foo=;
  b=e/vL7cWpMwuJXyYiimEER/WXq9kYOKtQfunPHWVu740b2yUGNaqqK9Uj
   eIY3AmX8XTGd69cWX7GZLBSKZWLd2nw04cGrVxIse4WJBJKjn+LpTXpXl
   5atLuxUH22FwxZy33CwHDHYOGBB2BpUODsWmH7lb5CKtGlPwKMVkrDlst
   eViT5ksQdOcpocCP+d6M5kOBAIsEnDinkLqd/HIWzriLcRjIZIFkgqA2d
   xbgHxH3vHwjF58Fi8dQxbrlHkd8Y0zJq5kJBH2ecmHg9SORXBy5JMDaQj
   rKGhl6Dou5Ba3uEDC26imCyX9Vz2W1PX6uldPcZL91k+hLNbBn+kDSbTY
   w==;
X-CSE-ConnectionGUID: J93Aod07S6225Zbsi/XWkQ==
X-CSE-MsgGUID: DfTbhud5S4iE2ZJgpiy7pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26735112"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="26735112"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 17:26:46 -0700
X-CSE-ConnectionGUID: jQqS32JzQkev/KLKzvHVMw==
X-CSE-MsgGUID: TxpikNV1R56U6alFmZvfBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="73146325"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 30 Sep 2024 17:26:44 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svQiw-000Q57-1l;
	Tue, 01 Oct 2024 00:26:42 +0000
Date: Tue, 1 Oct 2024 08:26:31 +0800
From: kernel test robot <lkp@intel.com>
To: Gax-c <zichenxie0106@gmail.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] ASoC: qcom: Fix NULL Dereference in
 asoc_qcom_lpass_cpu_platform_probe()
Message-ID: <ZvtBtyJcW30hVXae@5b378fdd06de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001002409.11989-1-zichenxie0106@gmail.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] ASoC: qcom: Fix NULL Dereference in asoc_qcom_lpass_cpu_platform_probe()
Link: https://lore.kernel.org/stable/20241001002409.11989-1-zichenxie0106%40gmail.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



