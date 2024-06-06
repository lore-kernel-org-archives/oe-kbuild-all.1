Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE48197A6A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jun 2024 17:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717695444; cv=none; b=unG1ZM8tTvg5zY/foZU16EnX1Rh6f/ps0glQ+sgIxv4rQZRc2BR1+eYvyyMG5G+muH/+wpS3WAyR61/dWMxz90zoYE80/lt9XLXBP7OiMl+aIgFTco0lQXvC8WWYPDjVaSZHocjcoIhM5DEPqtrIT9lQ3zuzOpZlRlJFlyhoYQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717695444; c=relaxed/simple;
	bh=Xq7AlYcTsFGZq9zzJntTdYPBsvI8RqxCH+Q18VulpjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L1VrYddjrpd5oTrBRBwyp2rJcz5g+4+z1mtZLR40mQcjnafO4io39A28OICBtlEej9Nk/OuBAMh80tB1R/oKZRmaDXk2M8pCG76atLwFtAMoXOl8b6gvjLzk7XEBVnYfLQ5XRk/Uy6njGJmvtmbImR3VUY4rf/8FD5aMF3oRQMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MwicCyd5; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MwicCyd5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717695442; x=1749231442;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Xq7AlYcTsFGZq9zzJntTdYPBsvI8RqxCH+Q18VulpjM=;
  b=MwicCyd5eMTi6bynFnxpDnDDGBQewQg7tt4cD4Ul2Orr/J/kKi1r+1VU
   g4o5yT4iC2ix+5jsOyjvtkXa4ZR4jgNWP+QH424MbdIiqpvhG7qfv1FRT
   NiA9aYpQ/uY5k8htPCK2d/PFXnjlyeN3zUMria9UZJi0JL0MsPNK1VkHF
   zYCIBZ/io5hKLiGW6b+ftRJ3tagLE6ggGh8XpEsCVfFJa1inzqHT49Tis
   i7Y1AKbYJc+GhPcckUuGxfS+wyb9EQPkytlMAC7qAa/rAumSWypnIinJI
   2lADvUROAOOMD6F7KR2Ruq2qG4FZNAsOECvkgQEI7prTsFHHhmTjbSrbP
   g==;
X-CSE-ConnectionGUID: hgGes352Rvmc6Wcc0fZlGA==
X-CSE-MsgGUID: p0deIX4PRXKQf1i3IVZgww==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="24957738"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="24957738"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 10:37:19 -0700
X-CSE-ConnectionGUID: kE0EiRfnQIu57fQDVJILWw==
X-CSE-MsgGUID: qKUpZdo+Q8eEizd2F+jxrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="38494004"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 06 Jun 2024 10:37:18 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFH35-0003VK-36;
	Thu, 06 Jun 2024 17:37:15 +0000
Date: Fri, 7 Jun 2024 01:37:06 +0800
From: kernel test robot <lkp@intel.com>
To: "David E. Box" <david.e.box@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH V3 1/3] platform/x86/intel/sdsi: Add ioctl SPDM transport
Message-ID: <202406070139.OuAQ54mW-lkp@intel.com>
References: <20240606011617.557264-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606011617.557264-1-david.e.box@linux.intel.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c3f38fa61af77b49866b006939479069cd451173]

url:    https://github.com/intel-lab-lkp/linux/commits/David-E-Box/tools-arch-x86-intel_sdsi-Rework-Makefile/20240606-091801
base:   c3f38fa61af77b49866b006939479069cd451173
patch link:    https://lore.kernel.org/r/20240606011617.557264-1-david.e.box%40linux.intel.com
patch subject: [PATCH V3 1/3] platform/x86/intel/sdsi: Add ioctl SPDM transport
config: x86_64-randconfig-161-20240606 (https://download.01.org/0day-ci/archive/20240607/202406070139.OuAQ54mW-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406070139.OuAQ54mW-lkp@intel.com/

smatch warnings:
drivers/platform/x86/intel/sdsi.c:795 sdsi_spdm_do_command() warn: unsigned 'rsp_size' is never less than zero.

vim +/rsp_size +795 drivers/platform/x86/intel/sdsi.c

   768	
   769	static int sdsi_spdm_do_command(struct sdsi_priv *priv,
   770					struct sdsi_spdm_command __user *argp)
   771	{
   772		u32 req_size, rsp_size;
   773	
   774		if (get_user(req_size, &argp->size))
   775			return -EFAULT;
   776	
   777		if (req_size < 4 || req_size > sizeof(struct sdsi_spdm_message))
   778			return -EINVAL;
   779	
   780		struct sdsi_spdm_message *request __free(kfree) =
   781			kmalloc(req_size, GFP_KERNEL);
   782		if (!request)
   783			return -ENOMEM;
   784	
   785		struct sdsi_spdm_command *response __free(kfree) =
   786			kmalloc(SDSI_SIZE_READ_MSG, GFP_KERNEL);
   787		if (!response)
   788			return -ENOMEM;
   789	
   790		if (copy_from_user(request, &argp->message, req_size))
   791			return -EFAULT;
   792	
   793		rsp_size = sdsi_spdm_exchange(priv, request, req_size, response,
   794					      SDSI_SIZE_READ_MSG);
 > 795		if (rsp_size < 0)
   796			return rsp_size;
   797	
   798		if (put_user(rsp_size, &argp->size))
   799			return -EFAULT;
   800	
   801		if (copy_to_user(&argp->message, response, rsp_size))
   802			return -EFAULT;
   803	
   804		return 0;
   805	}
   806	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
