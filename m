Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8557220013A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Aug 2025 16:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755017512; cv=none; b=D6yIwOxww6x/Ktt4B0PlTLGzl/OAELdlkD9XJDKDtrk06I0hJht2DSPdai3JYMFWQMoO2b2YGArrWFKJTi8PbcuR6mcsSXiAHoXocrpRdAb3B9NdfrfCz6DxO39vjOzNTnhtUOg2sYxP7roaDbYkLpOdGnyoQ7vbV2ddf458L8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755017512; c=relaxed/simple;
	bh=VPkOVqnzFO2ABPyCFg1g8uNYOcDIt6PNhitx9Qdc8so=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=QSZguDrDJSjRmj7+YiCqFuePNjY+TV1ST90Udjo94tbqWdICnjxpC2NYKuDuO1jhdzesir27YiVwSfYj+Hi3uKbyRQ+hI5KXMSrfJb6tbI3Y736jksFJMiFrrg621ebCIKYexnU1vd8pD4s14XUWKziRVpkbsV1wV7pom9TyT/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nbTAeYK6; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nbTAeYK6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755017509; x=1786553509;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=VPkOVqnzFO2ABPyCFg1g8uNYOcDIt6PNhitx9Qdc8so=;
  b=nbTAeYK6dvly6Lsyuva7ZTmMWG/iR+y9vF6sxhsk2gbgZzGCg6GWmbYw
   04NUD99a5zHlDYR6f8bP5uXEJpoZXAJnRV1m05gbIeCuQO4zmUYDNf22P
   eru5SPOM+SNHyAdUBQTYzU6oCeuZOincUstbTq7fD2f9GYzKn151j/13f
   72DVyCJEdvMUQaQwJVP0e4Nq8MOgIBCXiyBbKO7htO0HjfED58NxpQ6dz
   +y4ESMs0MRe9JAVXYT2C3E860CvKvrnbWj8dX1aszDGDen9VlNWNmLax7
   oIwF7LEtrLPp7qy9WoLBQMrNdKHgtMQVo8KYU9DNfWrpM8VOGgZFp10ZF
   w==;
X-CSE-ConnectionGUID: 1YCrooTQSpicEUtARklc0w==
X-CSE-MsgGUID: SopaL822R0SNqgvbCzJh/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57363303"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="57363303"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 09:51:49 -0700
X-CSE-ConnectionGUID: xgR2LzoIRRedSbdcnC0Jvw==
X-CSE-MsgGUID: eHIg1iNnSOyGbF8ij1XQUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="165428302"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 12 Aug 2025 09:51:48 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulsDx-00071U-2V;
	Tue, 12 Aug 2025 16:51:45 +0000
Date: Wed, 13 Aug 2025 00:51:11 +0800
From: kernel test robot <lkp@intel.com>
To: Davide Caratti <dcaratti@redhat.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net v2 2/2] selftests: net/forwarding: test purge of
 active DWRR classes
Message-ID: <aJtw_2QDgGle8-ze@5748adc2c864>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <489497cb781af7389011ca1591fb702a7391f5e7.1755016081.git.dcaratti@redhat.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH net v2 2/2] selftests: net/forwarding: test purge of active DWRR classes
Link: https://lore.kernel.org/stable/489497cb781af7389011ca1591fb702a7391f5e7.1755016081.git.dcaratti%40redhat.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



