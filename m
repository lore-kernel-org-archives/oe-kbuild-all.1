Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499C044398
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Nov 2023 22:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZtXglfco"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701208978; x=1732744978;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=Bzsxc1dUICg1Vhw8VrTeoSIPB8poDOQR29TGkACiujQ=;
  b=ZtXglfcoBvWX0Cb1Gyq+FNGHG43bfqHLCnS7YXVZTT/JbD1+gu2DsUud
   ofByWtKPtNMWh4j9P0ut3QAfuMD7Oh1lwG1YgMOzvRvn3tKomr912ZxXU
   h+rXanvpoPUfIphH9d9JnaIcL4Lx547FysfC6Oa7yhxo+zWr+7uFa1SjG
   BLaMGoD6vSLcCf5VMP0suG2a9J4rteIYNIxHM5eSGkebvqJAbA8VC1sHn
   qltHyfTUFyWZAXn2k0DQKs7FhJmYQysVM3b7tASRzDU4EcTDZuj4c0Anu
   0yLKPOdTOFOBB8COqf+DXqqciKffCtnPQ/tz6cVtkPIcEWHo12Yxy/CDf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="391903584"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="391903584"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 14:02:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="859582301"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="859582301"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Nov 2023 14:02:56 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r86AP-0008Am-31;
	Tue, 28 Nov 2023 22:02:53 +0000
Date: Wed, 29 Nov 2023 06:01:01 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <cel@kernel.org>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/8] NFSD: Refactor nfsd_reply_cache_free_locked()
Message-ID: <ZWZjHVscdrNKXRLv@520bc4c78bef>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <170120877882.1515.3190174495040446432.stgit@klimt.1015granger.net>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH 1/8] NFSD: Refactor nfsd_reply_cache_free_locked()
Link: https://lore.kernel.org/stable/170120877882.1515.3190174495040446432.stgit%40klimt.1015granger.net

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



