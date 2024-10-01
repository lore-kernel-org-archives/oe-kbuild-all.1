Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE982B9B0
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 11:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727782274; cv=none; b=oBke7xcuKKLGuq9Q/+KdF5LY0Rrng3Lsd5AU2lEbuAdv/SgcUoQScDh2HzJ5vBVVodnuMgqcE4lDNKT+29EXHH3De9N+OjE60TwR1rqnZA+x8YE2X0mqQnosFc+eTeJTbIiVuHpId53BOz/mTsMwLrDbLXKnIGnCDC8CavHAAj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727782274; c=relaxed/simple;
	bh=LuLaia9qLe/YNo6XGGhjQXzsB9UTUBb0B1ClfWTPDGE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=PsxlDSqac6w6bpUAMNTBcn4aPXrx//Qb4h27BI/D9ZrEb5MSjlwmotZRL5fVI+Skz6xSopAbp98hsE4VLxnbbW1n0hksqasv21hdtrJyOillpDvJTaNtilHj2IYrz71DgKDiMdDPz/2Da36VIS8MfApBJfqCy+ecIU04WBPQFtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kwh61Zmm; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kwh61Zmm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727782271; x=1759318271;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=LuLaia9qLe/YNo6XGGhjQXzsB9UTUBb0B1ClfWTPDGE=;
  b=kwh61Zmm7K20q5h9ZO0cLV54eWGg86gHZl1kKMHSgDF8HAeqYuO3NbN6
   fdkYsCMspT3e+buXJl8lfyRU/2uv36RyRB1QVNvA4DI+1FiCjGzbioFhz
   u4wNFVUExqcTdxXlFW0uNn4tIMnnUoXAS122h7hZQdeuCwq3stSxMElx3
   SS9926YRDgdNzJ1C4DY0jfZFcr0vyzq6z7f0DPanp/trH7x65fRhwKwnp
   bXTroz925jb43kKZF0B7e+CiaehVHnu0UpZFO0EJBqq3JCS/ff05V/U/u
   zT0VrHq9EeMTTcIKcOsoN/rChP7xvMADm9PYI4uFqZuITxTE0/mhoGtHH
   w==;
X-CSE-ConnectionGUID: 7Ez3a9MARseZPG6q5eezbw==
X-CSE-MsgGUID: GYr0KRzSTV6eP7Pay7ZI7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="38272115"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="38272115"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 04:31:11 -0700
X-CSE-ConnectionGUID: MItKLJuUTYq4MqgDmwBWuw==
X-CSE-MsgGUID: dXxZRQ8wTS+WH0F1Bu3/9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="111110554"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 01 Oct 2024 04:31:10 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svb5v-000Qbt-21;
	Tue, 01 Oct 2024 11:31:07 +0000
Date: Tue, 1 Oct 2024 19:30:13 +0800
From: kernel test robot <lkp@intel.com>
To: Anastasia Kovaleva <a.kovaleva@yadro.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net] net: Fix an unsafe loop on the list
Message-ID: <ZvvdRctr2YBQayuf@5b378fdd06de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001111840.24810-1-a.kovaleva@yadro.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH net] net: Fix an unsafe loop on the list
Link: https://lore.kernel.org/stable/20241001111840.24810-1-a.kovaleva%40yadro.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



