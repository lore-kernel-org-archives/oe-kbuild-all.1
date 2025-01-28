Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1193B1DED67
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jan 2025 08:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738054281; cv=none; b=NKQvWxZK+NBlpyXdYfNkjhFtqga5Jgzd+qm7Fhjr/8PhWc7mY3cp0lEr9nKVRJGg8s0FsrMD+ztPM0HDLhdh6S8aYtfF4vgm3CM6UkV8UdsNSL3x5ycAHGewKHu8JIbRG61+ZSx9Jkkj75CW9bza+BllMvTexl/16tAfZVjcTkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738054281; c=relaxed/simple;
	bh=A+Q8O0o26jlQCvbSgY1s0bS35Mbjzz2jRwm0usJi3dM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=qnxCQdPK44nagtbLXOmMRm9X+L7fw4Jn9WZxFsevIE1xF77c0i/9xSsvA2fUwN5YrG62wczXdsHjbCJ3tOsOMnu5ZhDRlJBnyQ0UaLQxZ6K5yIsSYKB93OAp4SH7kW0vRyeAuwYiEom/DGjfTxWMtEHv0lQ9qTJi6xLVSnDCK1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XyqQl3+w; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XyqQl3+w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738054280; x=1769590280;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=A+Q8O0o26jlQCvbSgY1s0bS35Mbjzz2jRwm0usJi3dM=;
  b=XyqQl3+wav+yhRBNyPzR/Bfbo+ngvZGSZ2tCXmduTdc9wy3uxG0Q9TzK
   IKPgL+gKNc+AWwq4FTJYqybHRE9/XOxDU7P/1bULZkXeh9mgiSKI6RIgy
   mbkDshtv6/q4r2mK0IzrXTSqzwk27PonLLD0DaHY5gGE78Uyte27T7HF0
   OOTZF1GxVA0XlZsVsY/tCMprrkdmWkDiDiOMQW2QW5ryUeb54xP9KlEyN
   iMre+NTH6mRu7OTQipfysNX5IHabmA9H+sp0qUGsd1ag2mjBL3MhRitiV
   y7xR6X5OLwPMscTlnQ9tbR0efTfTBhulkt2hDSAoIrkgIvXDFzryrCqAI
   g==;
X-CSE-ConnectionGUID: VZiZGyF6QNm0sswzGDOghQ==
X-CSE-MsgGUID: m0X6dux7R7WtGHBGAVImmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="26129875"
X-IronPort-AV: E=Sophos;i="6.13,240,1732608000"; 
   d="scan'208";a="26129875"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 00:51:18 -0800
X-CSE-ConnectionGUID: 8tNA1nh/RI60yr5ArAjXNA==
X-CSE-MsgGUID: /mGIgVTlTEqQ4Y9LfPDldA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="113649185"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 28 Jan 2025 00:51:17 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tchJS-000hcJ-2e;
	Tue, 28 Jan 2025 08:51:14 +0000
Date: Tue, 28 Jan 2025 16:51:08 +0800
From: kernel test robot <lkp@intel.com>
To: Hyeonggon Yoo <42.hyeyoo@gmail.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6.12 hotfix] mm/zswap: fix inconsistent charging when
 zswap_store_page() fails
Message-ID: <Z5iafG5Y7LN88lEh@fbd72656772d>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128174938.2638-1-42.hyeyoo@gmail.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-3

Rule: The upstream commit ID must be specified with a separate line above the commit text.
Subject: [PATCH v6.12 hotfix] mm/zswap: fix inconsistent charging when zswap_store_page() fails
Link: https://lore.kernel.org/stable/20250128174938.2638-1-42.hyeyoo%40gmail.com

Please ignore this mail if the patch is not relevant for upstream.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



