Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7ED5BE4E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 04:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720672326; cv=none; b=TwrIrt91o2HcJhNSkxebE0SzWHVXzOwSc2xeZIYrQ/63YXpf7Izb/ukZaXf1jbErpJrjf7TIxzSug7DWyrqd64Ybay9bMFUm70MlcU9mCaUssI9o4GR1Rr00HeGZAKiqHQaMFadwQ+vqKOcRObeNBbH8kvHIDXcZyldbw/zAI1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720672326; c=relaxed/simple;
	bh=2wL8HGRY7DUP5MIZReLyQZbrO1yxV65cyBn0vzR2ww8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=gc/8whiXB9jufvLYCCckwPG7DQCL7i4OTFgp5qXdYGr/nMN9tIVu2j1usT0ye/5k0llZdMeBBMj0MsVdv2OS2qpM1lS8l1Tis8vM+6KDT3ZFVZUeJbIBkva6mwYYXiHne+vLVT0wEGgy6CGi/rtIkEFs3yjaFDtnBHsZM6f43Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kiw0qdRU; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kiw0qdRU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720672325; x=1752208325;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=2wL8HGRY7DUP5MIZReLyQZbrO1yxV65cyBn0vzR2ww8=;
  b=Kiw0qdRUl06ab7DdXQe++VwMprOWhxSRJ+MgCz45c6xG4AArPp3y62iU
   G39oRRJlYfbn13gPN2Pfj2X5Qx+LWiGq+AdUmRlunxeQCaaC1IME+T1VE
   BQmI5NTKTSG/i5mvbdecoY+IlwmWnBPdB2So8trr4FkqW6w2JSfiTlotm
   JtjfIutjpLLpeiGO6pp39fn6fczRfWgeeSMC9DGdVyJSn98pQqakZDWMd
   6/Ms4IWjaepltrLI+7eOVwe4RuTIT2QzkY4fiV/oa3zhtMZ0H/iw+xWbN
   WAlzXeqPTb7xRn3COeaQ9iIAy4WVHyeLpTYtU1jIj79J/p8HA/dpatOCi
   Q==;
X-CSE-ConnectionGUID: 8XTt08tMTWyRtkLbOPqsIg==
X-CSE-MsgGUID: zinD6qE/STilvEx+JJc7cA==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17871320"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="17871320"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 21:32:04 -0700
X-CSE-ConnectionGUID: ozal0EhISaCSQ0j8S2pM1A==
X-CSE-MsgGUID: MHon9vjPSgCKBwro6NYgzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="79152390"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Jul 2024 21:32:03 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRlTN-000YmE-1j;
	Thu, 11 Jul 2024 04:32:01 +0000
Date: Thu, 11 Jul 2024 12:31:18 +0800
From: kernel test robot <lkp@intel.com>
To: Pei Li <peili.dev@gmail.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] btrfs: Fix slab-use-after-free Read in
 add_ra_bio_pages
Message-ID: <Zo9gFtIM67Zs33BW@6724a33121ae>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240710-bug11-v2-1-e7bc61f32e5d@gmail.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v2] btrfs: Fix slab-use-after-free Read in add_ra_bio_pages
Link: https://lore.kernel.org/stable/20240710-bug11-v2-1-e7bc61f32e5d%40gmail.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



