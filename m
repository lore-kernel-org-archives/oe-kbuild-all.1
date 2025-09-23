Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C090820E030
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 14:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758639075; cv=none; b=XxLxhTYPABEk7hcYS2V7zxQX4Ssq4587cohmNeXkCv0/RfXOaYUsnWBcYe203pEcwgAl5uKQdfXVgFqqiN5KHF4RMhIKTYTFBVLIp/6V3UDEJRRavFl2wTMpJzt2nULnrSqOSJYsHR7bbGXRQLVh717fDvEYrK9657ACCfaAXDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758639075; c=relaxed/simple;
	bh=5KbQpeReOQh2dXObwe29N0T/Sd+95cxOk93zvLMruTc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ujVVKT+L9EhZUcMr783bawaFjCaMm+EpFkAwpJA/O38iW8cF3Ihvjn0Amj2jX4BUUCxEh2t2D4APXO6gJbRfWy0v4GQDod5bkzzcdI01l0S+hMM/nN/q2PT7aEaT/BvkzMYxxsZ4o6B0D4Gpe1qAKY0eiinV5fM3jWU5kxpgrOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aYJu/YvU; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aYJu/YvU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758639073; x=1790175073;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=5KbQpeReOQh2dXObwe29N0T/Sd+95cxOk93zvLMruTc=;
  b=aYJu/YvUc9bXUzflouGQTR2Vz/LAFf8db7EZYaVSw9BNEIIZkXXfIm59
   eBTQdIJfmh8sO+zwyjJxmvk9kgMKnkAChPEMPm6d+IVwR4n2k4gwMf2vx
   tcHFfjD9eIeP/MivqIUuk+qo3SS9cFLaddrGI1awJ0xER/GrSS9rdZBcc
   HLKAXGUPjnfYhWW4G06f5a39brtEFbD3nlF4QaporiJVTAYPehIobKQBW
   BuV1HkOYAMAWBLOVlj0ckOx5PnhOEfHul3tLTGleaCirV0hohlMku4bVK
   UNqyUMwBrygWNJmjluDv+tht6ZGkcOtmeSBuR6ysMsKkwWASq2Jn+JT5p
   w==;
X-CSE-ConnectionGUID: QcMk25hDQCGeQa1I4yFmwg==
X-CSE-MsgGUID: Nyk7uLYcQXm5F87U3OXAqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="78527375"
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; 
   d="scan'208";a="78527375"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 07:51:12 -0700
X-CSE-ConnectionGUID: 25WPdY3NSnODegY+E8MNSQ==
X-CSE-MsgGUID: r8UzGHRcRJi+nffW06u1JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; 
   d="scan'208";a="207711549"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 23 Sep 2025 07:51:11 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v14MH-0003D3-16;
	Tue, 23 Sep 2025 14:51:09 +0000
Date: Tue, 23 Sep 2025 22:50:23 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas Zampieri <lzampier@redhat.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] irqchip/sifive-plic: avoid interrupt ID 0 handling
 during suspend/resume
Message-ID: <aNKzr4B2VN1VaQmX@3514630e72f8>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923144319.955868-1-lzampier@redhat.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v2] irqchip/sifive-plic: avoid interrupt ID 0 handling during suspend/resume
Link: https://lore.kernel.org/stable/20250923144319.955868-1-lzampier%40redhat.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



