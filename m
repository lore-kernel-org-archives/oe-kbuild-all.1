Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BD81EB51
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jan 2024 13:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705498688; cv=none; b=kw7Siaf4VGDk1gOzrEqDjQfhOCDPzRWoRZxWXqNKRSadivRw2MIgfNkfy5qGCMPHhlGd1ChD/EMJzlJA9p8fABSnJsi8myWIK/MvnMcX1srTsQMSuD1StL+BWeIVGN3pCCdPbLwVJ2q0KLmGSVD64XSBZHl8Kb+v58SxmDipOFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705498688; c=relaxed/simple;
	bh=fGT48Zw5xEX/HcJfmi+SxK9GweVFjsjrtkK1fkz0rAY=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=HekKXP7hGZxErlCTSEls9J+81RsJOXElSD7ZWSdfxU5D58iI29WmokxWmhD1gIK7RjvjHTg3KCyhyuJ8x6ms3fFWl9C9detfdihbLmfY6lYUhqxA8PXo2IsCnf9fE41Q94HPPCO8G20ezZU50/xvkRfnOkr2EngM6n6d0MdLdAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MchJ+yVh; arc=none smtp.client-ip=192.55.52.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MchJ+yVh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705498686; x=1737034686;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=fGT48Zw5xEX/HcJfmi+SxK9GweVFjsjrtkK1fkz0rAY=;
  b=MchJ+yVhq3bPnLghMtMAGJeonmn+e3RwLhaxN1hD3OZ1RyVgAsrRKKGK
   JiTpsb+QmQspK4ChyDLrITEs1RxncD3Yqd5v/pxPeFnTMkOtXUbZVW1Dr
   gryiIMBtDfGNt6q5OPwYdADkA3xQBAHUqZSyysSCij57Ek0T0HQNxKVgz
   aRkY5IAJv9rkqVNmTNODs3z1rfFYR2tboSiZVr8ekUdXsdUuKMO/Sr1jG
   H9RDc/pboSNT+kDqz3EWRQM4U3vCjyeCqny2VuIoztsF+CMZWsXzRyIUV
   0HVUt9KSiclZHUrPDMPokkEZNPzWG1pJfb4ouTBMd1A/gFL5q0nfuOA9X
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="397322290"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="397322290"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2024 05:38:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="43628"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Jan 2024 05:38:04 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQ67F-00022M-0t;
	Wed, 17 Jan 2024 13:38:01 +0000
Date: Wed, 17 Jan 2024 21:37:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCHv2 stable 6.1 1/2] btf, scripts: Exclude Rust CUs with
 pahole
Message-ID: <ZafYCmLzkWeqI6sF@fc6e15c3a4e0>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240117133520.733288-2-jolsa@kernel.org>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCHv2 stable 6.1 1/2] btf, scripts: Exclude Rust CUs with pahole
Link: https://lore.kernel.org/stable/20240117133520.733288-2-jolsa%40kernel.org

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



