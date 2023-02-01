Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF4A33FA
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Feb 2023 18:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675277871; x=1706813871;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=jY9aceRMzA0wn3rFqgUEfrXi1HGUJNTGkgp6+4/alSI=;
  b=itFuz2QDvtlvCpBcwlfqvL1CyYYER5jfG7ZcKPn9zDM670eRpPqYUgoA
   vpiXlti7wzKe2KJnmwTp138A5yFHnVhc1yiPDqAuD8cvB3P6qRU+EI2CB
   7EeOskgI6M4pMV6rAsbYygw3EozjWmD3NJoDuiT607Sjc+SofHKeH8Xjd
   nNyJmC8QnrB4yC3EFjMLAbCT2b2TmeSL1y2b1+zPl3XLscNesL/6vYrsZ
   uPq3IJYeNUUXg+kZjGszFo0deHHKwitP5BnqGy6TBulR6V87Q7PwfpaYH
   /I2qu0fCixt/v2YcYb+h7wBM0KfTOeHyvChgZi3sR44Z0l0c+1l7/7U3w
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="316240944"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="316240944"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 10:57:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="753784246"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="753784246"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 01 Feb 2023 10:57:50 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNIIi-0005iU-1e;
	Wed, 01 Feb 2023 18:57:44 +0000
Date: Thu, 2 Feb 2023 02:57:39 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Kolesa <daniel@octaforge.org>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] drm/amdgpu: drop the long-double-128 powerpc check/hack
Message-ID: <Y9q2I2bvF54ioQ1a@904499574ff1>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dab9cbd8-2626-4b99-8098-31fe76397d2d@app.fastmail.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH] drm/amdgpu: drop the long-double-128 powerpc check/hack
Link: https://lore.kernel.org/stable/dab9cbd8-2626-4b99-8098-31fe76397d2d%40app.fastmail.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



