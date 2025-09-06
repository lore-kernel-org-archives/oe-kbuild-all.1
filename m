Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6B722C339
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Sep 2025 03:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757128970; cv=none; b=CMEhU7/4X+HQnziB8fyL7abj3+dsKJPpUUFcsxDEBw2my1cipHePnZHTk2RDxO9fH6QwhMZgd1ZtaW8Nt517E1Lhd32h05dWWQAiEQ73vgHBlSUrEsP6A66XWKmP8vHv4O73I3V2uGdiW8YpSV/xVdGhtn5wLAn78Bujnu/MIls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757128970; c=relaxed/simple;
	bh=KObDRXggQqG+V1kipTtid3AfkhMbWNyRIQO9r5bBZaU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=TIP8w/NCMgWcqt9TW5U8BGThIW7tAiKAWUFd0LpjDUx06ev7nj+LlC+yX2nZPPQsiMSXP6bqqvbY2lQIHhPUwq0zO4erhoS+5NENuRSgxQ8mebUbbIN+R0ICeyNfToKx1bVds5bNmKUdo58W9NdW/QGTD8u7ImkISvDAtAtAJGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IUfHmY/w; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IUfHmY/w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757128968; x=1788664968;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=KObDRXggQqG+V1kipTtid3AfkhMbWNyRIQO9r5bBZaU=;
  b=IUfHmY/w3/8FDDVt2QWyC9rmiOHuAcsZNP/yEVCtytw9w6c5OjU7A1jd
   avNMxq1I9UR+xNCMVLg34PvV5Gktv+5Y04xI4jqMp2W9lRVLVDc/+q/jq
   gPEIkEVTZl86HaJYzjEOUYkMF4TNGp7aVP1YKZgY1k9UUBza9OvymGURp
   MJQMuT2F5Fyx5V4faj7WSv4Mkx1RNhvIcxDqnNGTFXa4Hlufq9GfzFPat
   E0FjDYm2gxxonPt/gWGumg/tPK8Xk1f+3ejm8x2/P6NFszMz6DvqZfFXs
   uY6E/fPw2Uij8s0NSZwaj/J3T0zncJWNqDTWLfoqr6Enh8Ak4FAptWu8q
   w==;
X-CSE-ConnectionGUID: O8JPHfwKRyiBlJSyH613qw==
X-CSE-MsgGUID: tP1amCkRQA6J/aHX138RIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="58514501"
X-IronPort-AV: E=Sophos;i="6.18,243,1751266800"; 
   d="scan'208";a="58514501"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 20:22:47 -0700
X-CSE-ConnectionGUID: xjdogmciTZSIIJkZERrK8Q==
X-CSE-MsgGUID: /mLWqu07Rhiiou8bvSDbZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,243,1751266800"; 
   d="scan'208";a="172668344"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Sep 2025 20:22:47 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uujVk-0001A3-1J;
	Sat, 06 Sep 2025 03:22:44 +0000
Date: Sat, 6 Sep 2025 11:22:41 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Guerrero <ajgja@amazon.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] mm: memcontrol: fix memcg accounting during cpu hotplug
Message-ID: <aLupAVl-DSxOXuza@b7823f61de85>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250906032108.30539-1-ajgja@amazon.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] mm: memcontrol: fix memcg accounting during cpu hotplug
Link: https://lore.kernel.org/stable/20250906032108.30539-1-ajgja%40amazon.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



