Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46CFA47
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Sep 2024 03:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726110150; cv=none; b=GGzi6AF1CeOpq4EZ3yCW6+FKAJ5iN7QlUt8eF2GokM5V+B3OP2aSQS7aFwLDwTh7gxvNirWqod8xbcOuoxJDk/XQmthENNI0TgRYW6gK42j6zYXP+vQCMb/aS537nYdzKLGY0B+DQsUp03FXzChBQ44gfzmjNxgl9oxJyOCT+pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726110150; c=relaxed/simple;
	bh=9MeCgRVAvizHKconAD0ure7wUjg/yRrKKzHT1BqpShw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=KzDWPL5erFH8nTEYYcww90d8Nk5Nc5bYeKLVwV9RWYkgmjWF7skaROQDffNSXu90+kUQiUUiZdaJiKhq69G3U7E902JFCZs2bs0yvH2pb/9eAop86zY3TflyPDtBM/vSIEx7KmGkqb7NqWJ2gHJtuuumD34Eg4AXn5QW9m/xsQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=izpp4X4F; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="izpp4X4F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726110148; x=1757646148;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=9MeCgRVAvizHKconAD0ure7wUjg/yRrKKzHT1BqpShw=;
  b=izpp4X4F517bk/XA53uGDVy+jQkyAk1ZHml2Cpk7Qbwo1lcClnDB1Zcs
   TAe8+e8p8AReKdP7kkxcooAxfLL/hOXWm872j0AOiw15o0TSN+zJ3EyJl
   71PxWicFqPH6V4OBo8gflRtSkXzDu6WVc4xg9t+4OagF+17nI6P0Q18at
   VbUr8/OaSyi/ChYEyjBPJZq3lrUXxHpdUbXXTcJ8bqYFbwOjOzuMW3Tju
   vklhY3BAu72YybY7uJFDoc1f2lRHmqucST+e2oQZphZ2nzahVl2mzW8iL
   +b0Vby0H7kCzBJAge97CYtel8qKQ9063K213fWOIB4r4TphQEHBOgaa6z
   A==;
X-CSE-ConnectionGUID: dNqMuTJbRc6j8Yiq5t0grw==
X-CSE-MsgGUID: 1yqzlD7ZQ1GpnM8vouCvOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="27860679"
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; 
   d="scan'208";a="27860679"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 20:02:28 -0700
X-CSE-ConnectionGUID: 4CTDho9DQhWr4/osXgRSMw==
X-CSE-MsgGUID: D8Q5wje8Qpa/RJk5nSSIvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; 
   d="scan'208";a="67555655"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Sep 2024 20:02:27 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soa6D-0004QI-0w;
	Thu, 12 Sep 2024 03:02:25 +0000
Date: Thu, 12 Sep 2024 11:02:23 +0800
From: kernel test robot <lkp@intel.com>
To: Gautham Ananthakrishna <gautham.ananthakrishna@oracle.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC V1 1/1] ocfs2: reserve space for inline xattr before
 attaching reflink tree
Message-ID: <ZuJZv10K_wByMfNm@93b49dda42d7>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912025858.849533-1-gautham.ananthakrishna@oracle.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH RFC V1 1/1] ocfs2: reserve space for inline xattr before attaching reflink tree
Link: https://lore.kernel.org/stable/20240912025858.849533-1-gautham.ananthakrishna%40oracle.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



