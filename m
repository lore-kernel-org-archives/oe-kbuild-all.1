Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21E54F61D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Mar 2024 23:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711667549; cv=none; b=TRltNsXhMC7sSClPPWF/Z1poOT4RAEK4qwT2je5590hcqw8KrvrYuhAgVrXwF8QvOzU3zT8W8gXimpq7iiZdc32NW7qw+5gXsEb9HbqQ7c6MzEfWdtQwgEYl38osOWrLc57gBmf912Ti4f4EHx+YKalnrA4SDKZxg5658FhLUU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711667549; c=relaxed/simple;
	bh=kvQpcZ3xK+CDZOYS7vWHp7DVDye6wdtec232R9ccAlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O6EE8oAG2cx6JEUuTQ16RfNDfNNZ7/17v+4fmLvlHwAoTjRujqYzvD9UoqdnExm1CrjTswJGLht0hZ0GSHqZ2vqLFmSmXWRa/L00vsFDJlij3L2MgoCQAAzRTopsrgm0pgY1ls7jCYcLH+TJ7utPSrzPWAtPH8Z/iZmu3/ZA/X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A1uLtysL; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A1uLtysL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711667548; x=1743203548;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kvQpcZ3xK+CDZOYS7vWHp7DVDye6wdtec232R9ccAlY=;
  b=A1uLtysL2DAaZQ47/Kup/zSRqB3EVYuObYxvMjgWmJo5J1CNKjS55yWe
   zfXG/1AxiUfufND3kl2Qh6g0cxJ3H5dWd4XHXmrFJ/3xCx8ied51/iRZN
   1BhoE51Zn9jMZ9lql1pQA3U2I1s/JDbsq/YJD1gDR8NqPjaoinU6Y/36L
   H5jCRGena6BS+FKP2j997dwr1r22Sqpua/+E4V/UlrLeIDTUx0P5huLVl
   fgTIV4XRvCwZ+8CUDFsAflasv26x8RRknW2HZF4YbN+xaB53Cp9ppXtAG
   By5CAXWkPLaoKyj8NbOkm1RCJNyy0CNN92PcNrqZoJjBSfbNeLW1Ml1yK
   w==;
X-CSE-ConnectionGUID: 2NC4By9LTSGwORHHJ181cQ==
X-CSE-MsgGUID: fLatZAc0Q+q/F7Nd4iJUUQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="6748777"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="6748777"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 16:12:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="17438323"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Mar 2024 16:12:25 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpyv1-0002bu-1L;
	Thu, 28 Mar 2024 23:12:23 +0000
Date: Fri, 29 Mar 2024 07:11:52 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v19 RESEND 2/5] ring-buffer: Introducing ring-buffer
 mapping functions
Message-ID: <202403290705.yKDOV4uu-lkp@intel.com>
References: <20240326100830.1326610-3-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240326100830.1326610-3-vdonnefort@google.com>

Hi Vincent,

kernel test robot noticed the following build errors:

[auto build test ERROR on 7604256cecef34a82333d9f78262d3180f4eb525]

url:    https://github.com/intel-lab-lkp/linux/commits/Vincent-Donnefort/ring-buffer-allocate-sub-buffers-with-__GFP_COMP/20240326-181048
base:   7604256cecef34a82333d9f78262d3180f4eb525
patch link:    https://lore.kernel.org/r/20240326100830.1326610-3-vdonnefort%40google.com
patch subject: [PATCH v19 RESEND 2/5] ring-buffer: Introducing ring-buffer mapping functions
config: sh-randconfig-r121-20240327 (https://download.01.org/0day-ci/archive/20240329/202403290705.yKDOV4uu-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240329/202403290705.yKDOV4uu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403290705.yKDOV4uu-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: kernel/trace/ring_buffer.o: in function `__rb_map_vma':
>> ring_buffer.c:(.text+0xffc): undefined reference to `vm_insert_pages'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
