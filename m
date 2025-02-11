Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B991BD9D2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 09:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739266669; cv=none; b=QAc5UekQm2xl+6lPiYRx49/jmsbDGKXNZXPpv8n0OkLFVil2o0MEdbOE8WgnlrS+xn3c7qExaEqhaT7qJlEGjQMh9fjzlL4BK44kO+69MpgKxhw5XzQfQ3j4Z2ORLoEvN4Z/HdHBghvXXdxTd9gMVWVRRmVu8Z8ztmnXIEmmVcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739266669; c=relaxed/simple;
	bh=Yl6wjdgXG5IEpWDbNPG0WUAovYqfgR8vLDuRHAeGawM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=EmtDt1BA3AdV1tMUvDFwXEE7FEgJyyIqIGZqQiQLSACby0+AmKJY8uhELNIiPWmS/df6WVdJg3PEGmRNVq4eNA6Nh5DII8I1IlNEo8XF9W5MbIQ9Xvh1gw1HTtHzAuefWI/a796C1PO3XmN2LsliDneegs6bs8IPkOABsos+NsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pr39fyiw; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pr39fyiw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739266667; x=1770802667;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=Yl6wjdgXG5IEpWDbNPG0WUAovYqfgR8vLDuRHAeGawM=;
  b=Pr39fyiwf+sdtsepihOaR+5UfABun1kil7ynW6GcirOSRoedzU4I2xMY
   U4LCmID83QNTvyfuMnvqn7sqj3iafbn9EvKhBOR2EOZ7vqJ3JbwqBEzdY
   xT/WhMeIHQ42rBw+6ixixeZ30MRDmJZirIxSrt3Gevgx6HLcF6o+NnWcr
   PkDFOItiEjgdXLOgy66Dp6IYbjy+mN30kxsQ0smOVIUB4wpUnBgrXxheY
   etKG79Ahkw0fryFFedP6MOU/2l7uhabYrNNtvLSVYZ0gQk/3LTHZUi7wv
   FutiQ0f+epdMqvnAU/WFQHhlln5xwKbuJwthX6aKerDHqDUef1/t7oixV
   w==;
X-CSE-ConnectionGUID: 5oqTEriITWuVsDDyOyaTfQ==
X-CSE-MsgGUID: 7vSsVUCnQ121/4KZxPIRZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="42714365"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="42714365"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 01:37:46 -0800
X-CSE-ConnectionGUID: JFSnM2UvTMOBFlkt2BFsjA==
X-CSE-MsgGUID: xOrhcNm7Ryil1ggAEIEZsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116546052"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Feb 2025 01:37:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thmi7-0013yZ-2S;
	Tue, 11 Feb 2025 09:37:43 +0000
Date: Tue, 11 Feb 2025 17:36:51 +0800
From: kernel test robot <lkp@intel.com>
To: Max Kellermann <max.kellermann@ionos.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6.13] fs/netfs/read_collect: fix crash due to
 uninitialized `prev` variable
Message-ID: <Z6saM2SXMRbj3iOQ@a4552a453fea>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211093432.3524035-1-max.kellermann@ionos.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-3

Rule: The upstream commit ID must be specified with a separate line above the commit text.
Subject: [PATCH v6.13] fs/netfs/read_collect: fix crash due to uninitialized `prev` variable
Link: https://lore.kernel.org/stable/20250211093432.3524035-1-max.kellermann%40ionos.com

Please ignore this mail if the patch is not relevant for upstream.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



