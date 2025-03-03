Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA351F03EA
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Mar 2025 09:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740993027; cv=none; b=lQOZJ0x5X9+eVPnrkle1aoUdJAQHAn9hXJZFxtlPIWBIh/w5FaEUagP2fR2arkCOD3HzCQ4Aq4fA0Bbb8U7dVVuNVlPPJqRICEEpJcUJy+nGcQkEt7iZ3PIvsvwNyYIB2Rd55GMgLeDw/GpwScN9VWpCLKLGxJeTTEqbof66qus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740993027; c=relaxed/simple;
	bh=NNB0/+xd2F+ywniPlCdjkD+pEk62hmacpCM4V1nknAw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=EuwGlzGwI3A6sAlNPjB6fRZ9s42Os2K30kiV+5CZJN3ZcezeHC2gnlb0ZlUP5E65FA649pGd9PM42hngHUesRVo2qkiZAgKU06q2bMD7YUe9xhfGdezKsvmoim3WdsWrsrW41HQ6/qVWdIWiS+wWMFWlzJdiyS4AbZLOPlDkwAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e68S1B8i; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e68S1B8i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740993026; x=1772529026;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=NNB0/+xd2F+ywniPlCdjkD+pEk62hmacpCM4V1nknAw=;
  b=e68S1B8ifj90iLPLbOKp9oMnkn24sHt6/BwV1FvWLIrIRZEpcVDMK6C3
   OJ+Hj7uoSkZeVfEHja3N26FAf+onEwsbi4A8gYqRCXbxy6Fkqfee/JDD1
   PSBeJ2OHig6NzD3z3mGs7Z8KI3h/pYwwp8+9Q1ppLVRgUQJnmZ743tmkc
   nCibR3QzDkI2KqG+hB1Q1qmD2I4SIa/Fs37Gx+iri1xQhrovb97qLiPol
   M1Fr5Bv92yd2YsMQ94cKQtM0EUTXS8u3BduY22mnBiSS9XTyg9NzNRmlq
   lyykxCeWIeqIXTQ2QXB8pu9WsayJXC5se1rBJ/Pt5CiNkh7DTQWrOcGJu
   g==;
X-CSE-ConnectionGUID: 9kHcEsDsTsSmWBbxisTS9A==
X-CSE-MsgGUID: ksZR+dodRWG+lA2nFQS/3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="41033221"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="41033221"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 01:10:25 -0800
X-CSE-ConnectionGUID: W2sCFRNtRuOFLAGNJ2xz5Q==
X-CSE-MsgGUID: 9ET04r+WT/6/bFWagjYJ9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="118132055"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 03 Mar 2025 01:10:24 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tp1oc-000IFn-2W;
	Mon, 03 Mar 2025 09:10:22 +0000
Date: Mon, 3 Mar 2025 17:10:05 +0800
From: kernel test robot <lkp@intel.com>
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1] remoteproc: Add device awake calls in rproc boot and
 shutdown path
Message-ID: <Z8Vx7bh7y__AxcPG@aca137f0053c>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303090852.301720-1-quic_schowdhu@quicinc.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v1] remoteproc: Add device awake calls in rproc boot and shutdown path
Link: https://lore.kernel.org/stable/20250303090852.301720-1-quic_schowdhu%40quicinc.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



