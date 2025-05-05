Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E8A1865E3
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 May 2025 03:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746416206; cv=none; b=TOO8Pln8HfdeF1b56NfqDhZuB+lS3F8Ct4H6PdPZtoROT/ARGKcuAzchX4YTqtKurcQL+VVxahOkHUIC+Q7+yglc2mNbJn3cypObs71a5FYzb0gquWAD//otFqLYl8ywq+33aGPwGh8IKQXUzlcZV44PFTM3lkaNL5HXYUpQsf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746416206; c=relaxed/simple;
	bh=LqY+ZsVFiDMShzfJsZlYwj1VjZDSIUQygm2FcZcsmHo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=DaSTYFf6ApSl9YEDjVkew85ov9VXmqmNHJY43OYtk0LQiBedG8uaGsItjEcll1L1H5tP+D6YjVUcJcOCsHxu/OINACF5C5W+l+tElanykZefy81JgNngrONIc5Qpddgk/5ZmSj7GuIS7YVY+RT5D4zLvowYnkn1a+WXwEKwh8Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mXDBoCWT; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mXDBoCWT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746416205; x=1777952205;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=LqY+ZsVFiDMShzfJsZlYwj1VjZDSIUQygm2FcZcsmHo=;
  b=mXDBoCWTB7c89IymKXdT3S4FnYCuMlVIf2eaiIBYjRMSgUS4lLVr1DoG
   mAFs4KeatirGkY83qc/ueCLLhtlfb2N6oIfA3Jx6ozBb8tbcAVdXNvggt
   3Lyah5hEtQC3xMhX0g0zTZczg1m/zJ4uAHzKc25B6padMLrnZgyErJyLD
   SlNmiuBTzkUQBmNzelhIvt1Vsq8oFqxEm9mLVPVEKhBBnCXkORi0SGrcx
   XRP5QGj9bYPeshqRdX/aPwPOW/U+Qy5Kkc8mvDYeeOahPfEqQv7qMK3Ql
   oLX4KICQSZIdz8g9X7G+bQpOZOg47fFapHSQ9/LJdYrKFowLrDLXJ2kH+
   Q==;
X-CSE-ConnectionGUID: 7NkSpVMSQm+FnOYJDnJAnA==
X-CSE-MsgGUID: ERHfF/2yT8KOdRieT8h6Hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="51830580"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="51830580"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2025 20:36:44 -0700
X-CSE-ConnectionGUID: GivGozg0Qnm/Osm2WWKbbQ==
X-CSE-MsgGUID: pj2599elRPy1HOAq/qTHSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="139135124"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 May 2025 20:36:43 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uBmdE-0005R7-0k;
	Mon, 05 May 2025 03:36:40 +0000
Date: Mon, 5 May 2025 11:36:26 +0800
From: kernel test robot <lkp@intel.com>
To: Ashish Kalra <Ashish.Kalra@amd.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4.1] x86/sev: Fix making shared pages private during
 kdump
Message-ID: <aBgyOsMvDRW9yYE4@92092d2942b5>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250504062642.144584-1-Ashish.Kalra@amd.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-3

Rule: The upstream commit ID must be specified with a separate line above the commit text.
Subject: [PATCH v4.1] x86/sev: Fix making shared pages private during kdump
Link: https://lore.kernel.org/stable/20250504062642.144584-1-Ashish.Kalra%40amd.com

Please ignore this mail if the patch is not relevant for upstream.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



