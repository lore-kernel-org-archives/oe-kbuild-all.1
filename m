Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6386F524D4
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Apr 2024 07:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712562192; cv=none; b=QRAjxBklhNqW2zM2RjGstjKFhPltcecwogxwegr8ipiu1SryINEXgUahWFb/+dz0a3MkZe7fp9KFxwQFbdnyZT1r8KIh9oq9N0VRVknZACCg649em4xbRz6LeAs9anQQ1kQW/xJWhx8w4JwJrhW/Bbu9OljlrjZmRtqITQVmRVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712562192; c=relaxed/simple;
	bh=hGKx87mS30I6i/SFRTfaedfwCqJqwxWtgPG/H2yCvWs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=YSKbxQjJ78vEbOMDnFvP+VzCzHvMjm+vYgmGvUlU/17BNieA2TM9wl7nxxReKakI672t6JdJIeJsL2sjfw+2XtuERdf0ojaFNJUmpslJ98Ho8aeIzk8N+E25VORrMHPQnUG9HdNFkxZYTWFL4mae4r62eVe2lTjJUueXMKmaalM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UbSWyoFT; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UbSWyoFT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712562192; x=1744098192;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=hGKx87mS30I6i/SFRTfaedfwCqJqwxWtgPG/H2yCvWs=;
  b=UbSWyoFTRzM5clKWxfpiJ3mU45YISQKXpy8e+n36E9YQ15WDiLMV5Zbo
   gZrMUBovjjFWRhCjqsO8HiYwIkrjkst7bT7jZ5JqXU/gKcZ1u9kt21h4Z
   tpQwkxRvuJjPRgsw0CA1Yi15F1ocmF3sEzw7BgR75E1Xps0exRauDmF5e
   4JrnsHMqQjM1osVrb0eNlP5iTmqBLiZsmER2dOTTcJdWbHJ7QmKMSoggT
   xNjevVyKTbeHf6qknevFMAA6T053hpeIWXGMpG43CTk1F3wWuL7JVss+a
   vemssivJYQrbq0GCD0KCVH6XmLZ3dXbpordO73vPROn5pqsb3kZRtxaH9
   Q==;
X-CSE-ConnectionGUID: j+j/B3HoS62y8ZBy4cDvdg==
X-CSE-MsgGUID: x31WyFf2QvaRCLlwz9QxjQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="11600430"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="11600430"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 00:43:11 -0700
X-CSE-ConnectionGUID: XrnmOACKQhGQJt+f9iuh1g==
X-CSE-MsgGUID: v63TopqOQSOKj5RsHxGntQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="42975662"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Apr 2024 00:43:10 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtjel-00053U-1u;
	Mon, 08 Apr 2024 07:43:07 +0000
Date: Mon, 8 Apr 2024 15:42:22 +0800
From: kernel test robot <lkp@intel.com>
To: vsntk18@gmail.com
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 02/10] x86/sev: Save and print negotiated GHCB
 protocol version
Message-ID: <ZhOf3gYfasVSd-wR@92629a18465e>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240408074049.7049-3-vsntk18@gmail.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v5 02/10] x86/sev: Save and print negotiated GHCB protocol version
Link: https://lore.kernel.org/stable/20240408074049.7049-3-vsntk18%40gmail.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



