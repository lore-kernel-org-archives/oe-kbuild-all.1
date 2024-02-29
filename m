Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420FF25765
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Feb 2024 23:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709249487; cv=none; b=RSDf8TuaTfNckH/nMInPF6MaRyur1qyZrb0RkwV+ZRHL/1q3U5BSUtX3Xr/LeBNhZlxXdnOQNTnlLEMB87b9ywWvn0Z6yDZPhjQM0m4D1EC8TE1RlmbpUsWvFVjY3qxdF3gJP0T8tb/ovwkVcO+AKb+LxDekAnJ5kQvORNHUX1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709249487; c=relaxed/simple;
	bh=9rcMuYIAB+/3roOxSn7rcaNKoCwJLMpbYrjbDa2WiyU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=MpRZcAcaJTV4YNChR/wh79ksyMzaSw9C+HhYE6L/oknZ/lKYTWq6drIduXqRJv288C5QrecRnYbqlpC8XHQFxIjinT7drKaPCZYeHVY87GxcSaDZsiMm1psgZonebC2cIBBoHiVwzsI107dyUpuBk98vCB5VnoOUcz3hq2eaDtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B1NACDo8; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B1NACDo8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709249486; x=1740785486;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=9rcMuYIAB+/3roOxSn7rcaNKoCwJLMpbYrjbDa2WiyU=;
  b=B1NACDo8NFXLrt9wZpMMFARZikjjK+/vrESY3w3R+f7vmPv0wIYsELVK
   fQwCM1tbxb1IYbUg2Amd/v5PAOHz0hOOMtsV+asYw/iWdD8HnGJ3vxA+o
   543yKxJI3PUKLGYmlpRrBvX14hp97Gr7qSsCuKZztWvMV3rNyJP1lB52f
   LFMCf6L6+UVwuTPmxopYIahJ65fcfw8qNQRGS6xRKSJF8tYsKRtJ0mCzq
   BPFsuwBLlhhQpgH2l9guqzeUudX7YwRvPPUvbbXtpV3+wN/jaxzVMNS/q
   lJ0TB3nhA/zoNAGrHnFe1xlLAG8EWScnHmkChjODClAJuzo7Ggb7b84p2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="29193694"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="29193694"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 15:31:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="38836440"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 29 Feb 2024 15:31:22 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfprW-000DMF-2E;
	Thu, 29 Feb 2024 23:30:58 +0000
Date: Fri, 1 Mar 2024 07:29:44 +0800
From: kernel test robot <lkp@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 1/4] drm/i915/gt: Refactor uabi engine class/instance
 list creation
Message-ID: <ZeETaFIQEtSmkKB9@fdb2c0c3c270>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240229232859.70058-2-andi.shyti@linux.intel.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v3 1/4] drm/i915/gt: Refactor uabi engine class/instance list creation
Link: https://lore.kernel.org/stable/20240229232859.70058-2-andi.shyti%40linux.intel.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



