Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A181CFEA9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 15:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729782844; cv=none; b=j7hs3FKmClZOad1AVqlKWpLhlYJ1a3fOJQtfnDekY7cy/5CMbexZ6pRWFRbN9h0Wg/mzxclMQ/v8I6ctuZTeLTZBjLU4cVr9E+60FnXaiyo1olS8FW/HTj7fyd6+KO4k+/+3eah+ZUYX3ayLOVWWrz6N9+3uXyHqxalO9upIyZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729782844; c=relaxed/simple;
	bh=++0kBQ1ZSUUu9gZ+EDoHAK4cJZ/8UbNIKsuXnIXNHtc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=rPYW1K8Fmndb5xZuyxKd+T9q4xfcYd+vxi2yfNwNh+mdXojE7OtXEg6xEKj+y6B0eFYCRwJms39lfWDupbH/6x1LirC6gAOibQX+f6KWkZPd4op0hXRi6C0DSd0kpuzK3JmpkR8cZyuOD5rnphjnx3HNi5+RUoPnUXy7MfyAUfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a+u9YbIN; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a+u9YbIN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729782842; x=1761318842;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=++0kBQ1ZSUUu9gZ+EDoHAK4cJZ/8UbNIKsuXnIXNHtc=;
  b=a+u9YbINUgAGaNO8vuwgpqLexRPGgh7zbT3N0ttq7LlpuTmMdxn4rPiI
   Xl6TP632JmgAqUmmsiByhEyeuK9XGV71O8O9H45WcM2ZQEJfPb526uKCR
   PZlVGG+K1iv+XoCpUB4ghF2QOl5AX3I1LBtgM9E8R/dyHlgxX7eTtHZ46
   hnYhVy1Yt+uA+G+wbB8+J4jqwxInUDimkUpdXMnKGVj1Li0VJs1lP73MF
   y15grZek9prZFVY6XMZ+TW2nUvz/qMtwi642sfejQh9VkJhJm99hZ8fHs
   BfqCXRvL1oQ2qLejRy8P1TUgI5k8Ko8R7S6gkHtR2pbpldhQ7RVmpuh7D
   w==;
X-CSE-ConnectionGUID: DADGZU3MSIWE/efNO3pJug==
X-CSE-MsgGUID: iOGLU+CxS06BNWA/NwlxuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29579270"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29579270"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 08:14:01 -0700
X-CSE-ConnectionGUID: /w5U3xY/QXyzuQV+52Javg==
X-CSE-MsgGUID: q7RvvSoVRIqa+H/hXh139A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="85223450"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 Oct 2024 08:13:59 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3zXB-000WZd-1W;
	Thu, 24 Oct 2024 15:13:57 +0000
Date: Thu, 24 Oct 2024 23:13:43 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH hotfix 6.12] mm, mmap: limit THP aligment of anonymous
 mappings to PMD-aligned sizes
Message-ID: <ZxpkJzLe_iZ1LXp7@0218aad26cb2>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024151228.101841-2-vbabka@suse.cz>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-3

Rule: The upstream commit ID must be specified with a separate line above the commit text.
Subject: [PATCH hotfix 6.12] mm, mmap: limit THP aligment of anonymous mappings to PMD-aligned sizes
Link: https://lore.kernel.org/stable/20241024151228.101841-2-vbabka%40suse.cz

Please ignore this mail if the patch is not relevant for upstream.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



