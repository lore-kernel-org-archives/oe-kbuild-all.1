Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE3444369
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jul 2024 10:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721124711; cv=none; b=abBvQmyA7MOI6umcPi0WyEyt3+rLMJHhRqZMwg2FR9uxFGabSPgThGbX5aU3UxNZ0QQEuPhqHuUk7CwrQ326EY2nP72mpGtVTaCbNqNkEcnukIYLu+f1rj0HtSiLYUsG7qKXRMzDmaZaaFaB6qe1qNc7Fg9b8iuc6OqISgqvdM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721124711; c=relaxed/simple;
	bh=j0AETOJp5nud31QiyxiRoZnyFSz7TCB3y5w71U5iaF8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=CeQh6AisCGu9aQOPD84w6AlM6NNYoHuTNMxt9CtS7/y4sYjqVOfnTNhG9fvfRlTCliMwtmGjfIxHXABCXurvzn6LEn/Y84ThG0yh09nJJncu19Ucsj4uAiob/xjuXTqn5x7d0KffwSSyTVRzZfkj5Q00GVP58z/5jmxvyDZzQq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Emt59K5a; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Emt59K5a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721124710; x=1752660710;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=j0AETOJp5nud31QiyxiRoZnyFSz7TCB3y5w71U5iaF8=;
  b=Emt59K5aER05bf4enW4ZONvr7zufFkrN/5V54LoEXHkbYs9L82lSUdfz
   qnfmUDUdL/mz8VLS4rjYpZ3fnHHaIEPIMYCO9ax1wRPRhuu2JIJDtPLF9
   BHJ8iHLE06ZfplZZkv5sNCtKsgDYR4eJ79C5/nmb+P5hl9CtuKL67lscG
   I6RUKFnAiUuws0npaAh2kIAndcfErnAKLuEE+yiMqpJI+RHcnVyFNVLh2
   nsPLkNE8BfmoDw17AgNhLC9AEWzad7EC8WqmOInijy5foaHZ305qiQ5dz
   MUKyneZzPiCiB9mDQEx7gR9kdY4l81qw3mDPrY1z05a+A6c51W+OtlDbc
   w==;
X-CSE-ConnectionGUID: u+XLin58SLKMn2lK5I8tPQ==
X-CSE-MsgGUID: E1OFJevVQqiKQQXhl7EaXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="41077304"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="41077304"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 03:11:50 -0700
X-CSE-ConnectionGUID: +fbz4jt3QUuqYC1kvoUrbw==
X-CSE-MsgGUID: ySaUktapSYij5aqB7BokOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="49883367"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Jul 2024 03:11:49 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTf9u-000f78-2q;
	Tue, 16 Jul 2024 10:11:46 +0000
Date: Tue, 16 Jul 2024 18:11:09 +0800
From: kernel test robot <lkp@intel.com>
To: libaokun@huaweicloud.com
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 6.6/6.9] ext4: avoid ptr null pointer dereference
Message-ID: <ZpZHPWgCV-J8oKXR@6724a33121ae>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240716092929.864207-1-libaokun@huaweicloud.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-3

Rule: The upstream commit ID must be specified with a separate line above the commit text.
Subject: [PATCH 6.6/6.9] ext4: avoid ptr null pointer dereference
Link: https://lore.kernel.org/stable/20240716092929.864207-1-libaokun%40huaweicloud.com

Please ignore this mail if the patch is not relevant for upstream.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



