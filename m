Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072411E0083
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Dec 2025 08:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764838320; cv=none; b=Her7Wz5uVVS7bP/lYulivVeXkJpEFBDmzX/JP2caLGbpHVVKQu52uBUVD35MoronuaEoPQadxsdot+hl4JrnCykExc3a8SudDzEnWl3GkqgmyS1XA/Uc46uY7wt2dTLAN9UrwiFB0eQ0HJJF1XZfhtCc2hdSa1vgDHy9NfwuNkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764838320; c=relaxed/simple;
	bh=wbZo8yUw+KRyBH2RUKhBF7b6YFwCGxKXnqAnxg9mJ0c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=YvJYOCyuJJvXvXWCAOlyMY++iMyqQ17cTKVVC9L7baoMXs4YbVjGjGlqvLSBIPVs3GKhl9Su7URuTRaaF2a09U11wzFRKqvgdG1LPSd5ab2jX7TibY+AGDflHxh+e3A4C4t6olf8NIw0EpvfRN/z3tdR+fVqsY2FNQlwx/x7akU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PzfLNTa2; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PzfLNTa2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764838318; x=1796374318;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=wbZo8yUw+KRyBH2RUKhBF7b6YFwCGxKXnqAnxg9mJ0c=;
  b=PzfLNTa2o5Vfg9rcvGpXd3SrUCYzYJJwCInGQ4bgAVGI0/jfDgQp1hg1
   5sRpraLoI0bR2oz25IrbVwMcbAE3Y9nL8piBvWuZu//LY2tkBfINQNwk3
   a7drl11M1FeQ22vuHuj0xRfl7zZd0taREU7AaGTG6XTmnq2f3b9QGEI3Y
   X4E2yEUZIiLcVQo5EOhgYVwO4XQgyuz9ZXyBWyX+HWWz2V3kvv8nNs7S7
   jRkYRvCmoHnkI7J4YD4wtifeg7q8jfOCrdHvFVsrZs5O4XGY8gSt4rEAk
   97CSswGUKdWz5bPu/oOFejajZxQR8su/15P/GVlqqaCtYphUrCza5e5jD
   A==;
X-CSE-ConnectionGUID: NELcEIQ1S4yYCT2Vf1qqbw==
X-CSE-MsgGUID: c6ZGqLbuSCKvGULTiziLOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="77469719"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="77469719"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 00:51:57 -0800
X-CSE-ConnectionGUID: F5L9AeIQQIijt2A8pLGaqQ==
X-CSE-MsgGUID: YXBf+9rsRAa5lXcjdkSh/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="199350866"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 04 Dec 2025 00:51:56 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vR546-00000000DbR-1tFl;
	Thu, 04 Dec 2025 08:51:54 +0000
Date: Thu, 4 Dec 2025 16:51:04 +0800
From: kernel test robot <lkp@intel.com>
To: caoping <caoping@cmss.chinamobile.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] net/handshake: restore destructor on submit failure
Message-ID: <aTFLeMIeYcIif13W@0bc2809ec63a>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204084757.1536523-1-caoping@cmss.chinamobile.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v2] net/handshake: restore destructor on submit failure
Link: https://lore.kernel.org/stable/20251204084757.1536523-1-caoping%40cmss.chinamobile.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



