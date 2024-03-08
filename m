Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AB05E065
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Mar 2024 20:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709929564; cv=none; b=gA+Xo83YZGfCCZ0N7jzuTwaq2tQhJybaX2gANdHPlnKy4l9NapsQCBRyQ1JvnsPaCQL4pHhE4hOFi+eI6SzyBQWvRQIfAU0ebvdrkVkactPja+pT7tbozytuqhn2f5OnfzoholkkL93zDpdhq32usrlPhYdn61OjlEvFytC0Xfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709929564; c=relaxed/simple;
	bh=CFEIiLdV3OWqKes2ws9QfABD/kubasmZ7sRV+beoEA4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=NunvAMepdBt5OqbwNREBw0rkui7mpPB5IgOwbhi4qwbonc9Z+IrWOJxQA6qUTsfAqIMlKXK4HVhY0klLJWDWnnkzXD09LgdMGTsHksdak6eDanEHr5SB56ziJLySzBcyjUNeHnFqI8u8SoXwWBzDFlJws7JRofWa6AGKRsKUL58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lzK5IAPW; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lzK5IAPW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709929563; x=1741465563;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=CFEIiLdV3OWqKes2ws9QfABD/kubasmZ7sRV+beoEA4=;
  b=lzK5IAPWUjLMoJMaxgjhJB3MQqea5Ue7JNtgY+dMniyXzN6Pa05KRrOT
   2cN4sjpn+Tb/6b0FiSEQ9Uw0pj6D6h9ut1IDSjxJDYku9bGAeVUtDKhZC
   RRWOl+LAdHe8iLVZs+kztQR6Q6Ko7v08lng4/VqPhAsPXsrrCcWG5NGHN
   EHrQ8xwoSVXGxvrNp3TUogTxxZoMEyrE/T59JIcXDf8oqD8l9EQiEx3Tq
   evdP28XWjnxr5x+QsP/ziAqipbTp7Cojz/RF46Z7Hno1uRGxTbG+LQ/fr
   DTCqYLstl1EPmO8jZR0wk6PIANwRUq7GTCNLeSSZ0cJ8G5KzGsHoWOu9p
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="4785180"
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="4785180"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 12:26:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="41537653"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Mar 2024 12:26:01 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rign0-0006gF-2V;
	Fri, 08 Mar 2024 20:25:58 +0000
Date: Sat, 9 Mar 2024 04:25:37 +0800
From: kernel test robot <lkp@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 3/4] drm/i915/gt: Disable tests for CCS engines beyond
 the first
Message-ID: <Zet0Qav27e7nQ-gr@28e5c5ca316a>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240308202223.406384-4-andi.shyti@linux.intel.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v5 3/4] drm/i915/gt: Disable tests for CCS engines beyond the first
Link: https://lore.kernel.org/stable/20240308202223.406384-4-andi.shyti%40linux.intel.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



