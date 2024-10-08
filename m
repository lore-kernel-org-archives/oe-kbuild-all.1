Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F0F1D6DA3
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Oct 2024 12:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728388985; cv=none; b=lXnVfQaeVNrMepfHE7RWneh90Vorkc6vt3gQYNT9pfKuO5Ykv0ehVjykC1mNUp1cesj/1zjS9im9E5J9DzrJZ5OgAogZUUj0h1Itv4uWcgnPYopjFBOdOSW2WL40MvEoDj5haCpzAuV5HbuEJpSVpsNfrLddk6tsyD8BZxbBh68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728388985; c=relaxed/simple;
	bh=4BynC4xx6/iz708HSZVmW6Q2++1As3Kdu0YHuw5enZE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=r74PHSYNA28nAFL29FVlV/Uqi+h6EALCc0bepodSq9kpENsCiNWL7Jj+d4yNouvYpfiXH0FT7INWrbvjprEqbEF4+BYcYDe2WJv2h8j3aGuqpO2P5RJE8iWKeCkz3wdp3iyMvZdcZ8Y7EXV4NM7lBnmpRzVRjnz3D2114NOfX/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h7sP336Z; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h7sP336Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728388983; x=1759924983;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=4BynC4xx6/iz708HSZVmW6Q2++1As3Kdu0YHuw5enZE=;
  b=h7sP336Z4CByyXg/zxC+bD0ql5LeQMwkyg+lRJNPD9+ngpYBcQ9NM4dx
   vuQP3DtA/YFNz0A0+OHcqwUTgXizrmaD08lI3kh6XvSWcnPUWSl/wnmf3
   DPSVNzkdVt4Cydehio4BcuBwSETNLx+JdUnHVWaRrwma7R7nmmyOBhMYd
   KVoyFFDO0CEeITuHHIgVupTJAiuAwnlah3A1UJNPREKIH5wTaCM7QadMG
   v440IWQtF/pFmoD2Z6oddJkL8P/2EEFomj70p1yhEJacnDgUO8zX50bSW
   cybzm+AqVZeQn+hAWzQ80Asrghnq1DJraUGF+c1zwinpnYYdPG1EMS5LN
   A==;
X-CSE-ConnectionGUID: D90If/N4TIyliyIwV8yo1g==
X-CSE-MsgGUID: ks3cP3gSQW2aHaZTs+uRcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="38232113"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="38232113"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 05:02:56 -0700
X-CSE-ConnectionGUID: r/sX2KfcTpqA2+2Nv6FeyA==
X-CSE-MsgGUID: xpOqF85WTzul08fbL/DdGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="99151180"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Oct 2024 05:02:55 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sy8vV-0006LQ-1F;
	Tue, 08 Oct 2024 12:02:53 +0000
Date: Tue, 8 Oct 2024 20:02:37 +0800
From: kernel test robot <lkp@intel.com>
To: Yonatan Maman <ymaman@nvidia.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 1/2] nouveau/dmem: Fix privileged error in copy engine
 channel
Message-ID: <ZwUfXTlTbAk3UWSw@b1422e034610>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008115943.990286-2-ymaman@nvidia.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v4 1/2] nouveau/dmem: Fix privileged error in copy engine channel
Link: https://lore.kernel.org/stable/20241008115943.990286-2-ymaman%40nvidia.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



