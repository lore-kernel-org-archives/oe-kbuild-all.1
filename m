Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE4A2E22BE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Aug 2025 11:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755516675; cv=none; b=iiFgRuPWq/I7oYWlkjDtifBXgJEv8KZUuG+k9zGLZTfvhm8Mce5NzLjLZy7BhKduZzAGIOWx2k19MHIJTw5o2c7FMTfdpOS9EHi7/2rU+3naId9geYvOX95WWHZPyp1kAGLl0ZwQQHWRvK7OKqHxhTKrZlllCve8S+uEQhFNhmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755516675; c=relaxed/simple;
	bh=O+lggR3p+A5qGwr6MCxsE4+Iok9qgYiekHmf2JSP8A4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=pHWbsEQ8MRvopLqnGpDq0pE0AIefADof/ho0a2dVgwPlpGgNbeLeIPjA8f4CKufqmXlPT4Tgzp2yDY5L/MvRPpK11LoD3GaNAfRNq73rq3fRZf4etLMzxn0BhvTSimhhcwGcaD2bLBw/kXKMOVlKChI1kHRs5lFeZNGc1xeXDss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZZy3unE3; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZZy3unE3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755516674; x=1787052674;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=O+lggR3p+A5qGwr6MCxsE4+Iok9qgYiekHmf2JSP8A4=;
  b=ZZy3unE3gLtl1/w87PhwpNwDYCFL36DX+uVCzs9jXxS8DDvSSq3LNJ8/
   a9+X8jo7RhJnMKWX5zUEtJnKZ9I3WxBSJes4MVD/foa8CiGV6/Yj0IoS5
   HpyEhZqnZ+WtM0vbyYb7fkEGo5viDb2HuMIZr7JLf9LRoNNnvy90oB29u
   KbHDNg7iEfv9hqgr92D8Teaq+4gonVGI6uTVnU/XlCu3PODmNnXGFWUWb
   ZvUSJD0dw1AbK3MO1DR156spkv9j2B3H9BBZKfNKpanmDl/CvOctTkyun
   lBvpsI5GxE5rUG9ARKKqhTbCW47/iTnIm2uN+feAu8NA/jlOs/z9irm9k
   Q==;
X-CSE-ConnectionGUID: c9Yc+glfSS6WWrlQkJ9rJw==
X-CSE-MsgGUID: OeYL5FyTTKSIvxEf1N1LIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="80317386"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="80317386"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 04:31:14 -0700
X-CSE-ConnectionGUID: cUFRx6S4Tv6Bop19ItLeZw==
X-CSE-MsgGUID: UesJ1KI+TF2+pva6I0JKBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="166784294"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 18 Aug 2025 04:31:13 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uny50-000EBv-1K;
	Mon, 18 Aug 2025 11:31:10 +0000
Date: Mon, 18 Aug 2025 19:30:15 +0800
From: kernel test robot <lkp@intel.com>
To: wangzijie <wangzijie1@honor.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] proc: fix missing pde_set_flags() for net proc files
Message-ID: <aKMOx_fh0lXoMNF2@769e0d9fd271>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818112428.953835-1-wangzijie1@honor.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v2] proc: fix missing pde_set_flags() for net proc files
Link: https://lore.kernel.org/stable/20250818112428.953835-1-wangzijie1%40honor.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



