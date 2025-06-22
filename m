Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890771A4F12
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Jun 2025 11:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750590399; cv=none; b=XPBG0ejF2ol4FKga5WAwWg+mcUE4dYq3d2WYbdM4TRXn465O5BkTlj9/cnIE58k1M1COeoS919n6stAlyujApcZtJ+Isgrx9DKo04lwY0Vp/mX0svIV3DvQ+xVJHVpNVCuQUP8wXvDo5k+oznRJC7oMsZN9wKbLy9gyWQTjI1mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750590399; c=relaxed/simple;
	bh=ZguUQlcHJeOhpgqC/rCem5MsfqgbtNOtYqXX67c/h5E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=QbJuLgpRPen/brWVABtDdOg+rjjakHU9bZ4NSoXzSH9O1i3rJYp9/eC0pVxeU/LDvtPT9Fdw+41OMtNcvVx6Y9jDEuQeQq09TYdIPb37U88a0WQororMC7eESrfzLBBTIS4duvyxlTg5B74/C+C6nzQGCimX3B+7p1vo/buJQcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M93VTtGP; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M93VTtGP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750590398; x=1782126398;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=ZguUQlcHJeOhpgqC/rCem5MsfqgbtNOtYqXX67c/h5E=;
  b=M93VTtGP1ev8Cxy4w+C/RlbCQA07U7Z/UtaT0pDYx62HjXo/TsDp/INh
   kfZsRt5y1esk99bgty+nmpvf1HLCoNjFfohiYTvR23FbOgDENp75t4WHw
   auXyOfMeS+ofa2WdzyTo78N0FKxnY2dUDofXoKsc7rXBsxHB1c+4QkutV
   B9JBjMtR0Cz5RMtpe0TCbMCMgVeyUFP3lDCuYC35Tuz7a0Mnr0PvvEA+/
   bU+YBuLMp1TmEH/owMS10ryq2cn05QCou9VstV1G02y+l6Hane9j2qTA9
   TF/7/h4TWByUDeejvyL3Ykjt9dp9IIpwg1o43wfyxAd8ISduPAlcZvrJn
   w==;
X-CSE-ConnectionGUID: UaRakRkEQpuYtnjuatdl6g==
X-CSE-MsgGUID: czA6VdFcQ0KAiCtJamDt6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11470"; a="64160517"
X-IronPort-AV: E=Sophos;i="6.16,256,1744095600"; 
   d="scan'208";a="64160517"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2025 04:06:36 -0700
X-CSE-ConnectionGUID: bnERbSTGSzekP0UaF7G1Bw==
X-CSE-MsgGUID: xMUSROiPTM+nHoTrFJZZKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,256,1744095600"; 
   d="scan'208";a="150809079"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 22 Jun 2025 04:06:35 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTIWu-000NE6-1M;
	Sun, 22 Jun 2025 11:06:32 +0000
Date: Sun, 22 Jun 2025 19:05:41 +0800
From: kernel test robot <lkp@intel.com>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH for 6.1/6.6] platform/loongarch: laptop: Fix build error
 due to backport
Message-ID: <aFfjhXBxxb8udIQq@125ed1b33153>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250622110148.3108758-1-chenhuacai@loongson.cn>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-3

Rule: The upstream commit ID must be specified with a separate line above the commit text.
Subject: [PATCH for 6.1/6.6] platform/loongarch: laptop: Fix build error due to backport
Link: https://lore.kernel.org/stable/20250622110148.3108758-1-chenhuacai%40loongson.cn

Please ignore this mail if the patch is not relevant for upstream.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



