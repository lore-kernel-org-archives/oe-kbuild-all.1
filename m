Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCCA128819
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Sep 2025 02:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756868070; cv=none; b=ERhB3zm6YMrhnehY+aDlDs7GWD7EKkeM+YyAWIx96IxkoghJw9VQtMUifqXrBQg6ITlW1qQl2gbMX47jQeqRJ/FM7v4dlNUbrv1Yf+ZqJOaRPT2u6Cvz7XlWIPciBjNvCjn8sTA9Ymj9ugDERURa1+7xVI8CGeRtKfUVXPNvZyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756868070; c=relaxed/simple;
	bh=9qOYXHccmgI9JaqIIXjbgrLpGRBpHjfbFjVUvyeeRfs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Iv2/c24dBDuSFbbUpF+4OSUhjf1nwnHOWmmmkBJTG2cw3KMIcpXGQaFthhN1XAjLczqC7KvAD3AX06i2/Zna2GpeQEToRldKYhfemUXS/R2pbkORdOEJL9pjWT+X/8m5Itq/eOeBduhnvjdPhcLKlwQUCad8wT9HQY3yCBJa7XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jEQX+4kt; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jEQX+4kt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756868069; x=1788404069;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=9qOYXHccmgI9JaqIIXjbgrLpGRBpHjfbFjVUvyeeRfs=;
  b=jEQX+4ktgt11rg6u1jKwTrI0Rswl0Nd+1AS6zbh2n+m8krlTtomNiaR1
   mAnsKiOxBHEG74Mp6uozafDBrGEUvVCXJAu+rVU7DxkK5osbw4aQkSzkb
   ATsJCPZhtRbozb4SPsDjxmG48oW/LlG+xlK1rOusQGJeEqHN9T79U/2ya
   8EmTzaZclaVEO96E0EVkKEXvvFsqAEI1FpdoiO1Ie5eapAaqxUFZtv0Z5
   2FtJHvQu1dhhZSZOdxYrhueytSpQj5Mgpu78T9TzGqkIiXr+4j6UQrayV
   5zZwKRh4QJFDBMTesX6pXtNZtCjKNyf3ptMsVliinEFv0tfZpReifn2iA
   w==;
X-CSE-ConnectionGUID: VaemOKFsT3ifMGLDPtQJ5g==
X-CSE-MsgGUID: FYWGksFiR4qIWOmZbrO3WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="62814004"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="62814004"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 19:54:28 -0700
X-CSE-ConnectionGUID: oON9fRhuRDyMfKGa9qB/KA==
X-CSE-MsgGUID: tzIuy3BnRjWYZ1hV1LpBGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="171427866"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 02 Sep 2025 19:54:27 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utddg-0003Hn-2E;
	Wed, 03 Sep 2025 02:54:24 +0000
Date: Wed, 3 Sep 2025 10:54:06 +0800
From: kernel test robot <lkp@intel.com>
To: Abin Joseph <abin.joseph@amd.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net v3] net: xilinx: axienet: Add error handling for RX
 metadata pointer retrieval
Message-ID: <aLetzpf_cdd8EOBn@c25d56e612e5>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903025213.3120181-1-abin.joseph@amd.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH net v3] net: xilinx: axienet: Add error handling for RX metadata pointer retrieval
Link: https://lore.kernel.org/stable/20250903025213.3120181-1-abin.joseph%40amd.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



