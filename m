Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9D61E493
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Oct 2024 12:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730032570; cv=none; b=mfqsUYThfM17Bc/6SI5fyRqvHYeafmwX6CC03dpXs8g4od2ywhGUcHpxSFgI8AVt4wm0vdRLcY5kcp+FALXNhkKmhRwEfCGVhmSYIjnooCWKXb88K2Tb1+xtYW99YXEy24wqpAgoPHKDkhpJJP7AIZgk8vMQCxrrshLzyGrMcD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730032570; c=relaxed/simple;
	bh=UCk/NWQxyHZwAnXjfMxpEmATvGT+JlmuYIwC6blKuCk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=mF55T3jRdedKeWNOv/ppQ62GH/H/T2gahZ0Jol8MNw96A/elXiC6Ooq/2ywGQPaC7N1RKYFrTbE/4qPhiGtsEFbUGII/2horKmSGETTW4kcXPMXYclF12kRCIeMgYDwS9S07iBxn2fXJLW1t4EJJZWYE2WNjXIrpzXzuHpptORg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AD7YurTN; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AD7YurTN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730032567; x=1761568567;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=UCk/NWQxyHZwAnXjfMxpEmATvGT+JlmuYIwC6blKuCk=;
  b=AD7YurTN4jpo/w3X61i5CBylVuVG9xxFa0TrJas7jBVUMBCp0h9zus6x
   9Sui0KJYNYj8KBhcBDYGii2Nje2e3Lj70F23nOplpF/raY+ZxT61m+Eyb
   u22mlb1geh1dQoZJeCT65DFQGZV0/WYAFR5V3uhCbNtZ1AWJfrpT6USec
   TFWxNWBJS/oEQptMC1c4gHAGNI7GQQC4IYp/PHEfBgDiXdf8DeiRqESxX
   lqw9+E/hkRHzoqmDLmcMfCzKy9VTrbre2E3yqUs+z0KZNnq01iF37kQCI
   DxYsomAkZlb4M8zZGZM6gB3ZDxnSx31vDLzXhMwVJ6VeH9vAtpObAIJ9z
   A==;
X-CSE-ConnectionGUID: jGeYxtoOTL2YD7iM3sKFgQ==
X-CSE-MsgGUID: U/IglkCCQ3SAqiQw2637zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="41016264"
X-IronPort-AV: E=Sophos;i="6.11,237,1725346800"; 
   d="scan'208";a="41016264"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 05:36:07 -0700
X-CSE-ConnectionGUID: Y31+veZZQaGvZP+f5uSNvg==
X-CSE-MsgGUID: O5nlxAN2SvGq0J0cTNfclA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,237,1725346800"; 
   d="scan'208";a="86479854"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Oct 2024 05:36:05 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t52V1-000agm-0n;
	Sun, 27 Oct 2024 12:36:03 +0000
Date: Sun, 27 Oct 2024 20:35:24 +0800
From: kernel test robot <lkp@intel.com>
To: Wei Yang <richard.weiyang@gmail.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH hotfix 6.12 v2] mm/mlock: set the correct prev on failure
Message-ID: <Zx4zjCYaH6NcqACS@bf9bdfd6a989>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241027123321.19511-1-richard.weiyang@gmail.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-3

Rule: The upstream commit ID must be specified with a separate line above the commit text.
Subject: [PATCH hotfix 6.12 v2] mm/mlock: set the correct prev on failure
Link: https://lore.kernel.org/stable/20241027123321.19511-1-richard.weiyang%40gmail.com

Please ignore this mail if the patch is not relevant for upstream.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



