Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735F21A9F82
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Sep 2025 03:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757216590; cv=none; b=lW9D9v2Ck35xikP1L9f3/j9WSlaOoirLQXjCjVBeah1goMunMmXhvX/xezDx3m8/gs5lnJGdM7nU49SFk7yZMfYKErE6CbAV4/pd8+lI9LIZo9y4cQHymKsqY3yQOtLmsIII5Q0e/r+gRhYfovFmBZ4NJMBG9jvDRONvvLKtKv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757216590; c=relaxed/simple;
	bh=EmoIZ6x2JkkGsvZvoJvyjb6Uau4ghlOR3ydbGs4pByE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=P7UW8fpmhyZCdmkp5sFn/1vV60UOIqTfSUHItVqi0yHJ1RXx4hn+M2m4HFvGhLgHBkoEnEVwUeUgUIXGHPUDHqYTtHt/F61gn69muh8AcCveZjngA2eik/gbNW77IoUAkHDckk4bRO0obRxyycqNc5vuaV61gbBFgRkTftv7A/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YxWWn7QB; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YxWWn7QB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757216590; x=1788752590;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=EmoIZ6x2JkkGsvZvoJvyjb6Uau4ghlOR3ydbGs4pByE=;
  b=YxWWn7QBg1wYqECLddu9k/3sjxilTml3ClGhIkoFxJY6OehTv8mSPa9d
   QKEXd0InYbaQOiMkz7qr4s1n6eAYQXrdmDr0wCt3iURNrYib8Zjeg0rnp
   nBmrnd9VWc+6C4zOs65vQs/aOw4eERQshCP6NpfszeW5HyTD4eo7uXp0t
   jwuoUvGM77itJNkEWNKK0zBgZXrXs0983w4q3SeiBwW5FEVoWY4379WBg
   O3HU+IuK8AgxaeFwLllgMiJDDKGAL80arKIfHfnjtVOrYbCgTpXNhY14P
   3yyujoLSYfjoL7/rgSYZ2fYagHB+2FMRK90b+1AXlm6EsBwc9Ve9Jjlo9
   w==;
X-CSE-ConnectionGUID: 3zSYSrXZQkmBE26XWHm3pQ==
X-CSE-MsgGUID: sRwr/W4/QxmXdJOdRMKtuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59439270"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59439270"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2025 20:43:09 -0700
X-CSE-ConnectionGUID: YTpK7AluRz+xjsgsqk+j0w==
X-CSE-MsgGUID: PLbBC9T6TCKREzwwP/sYVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,245,1751266800"; 
   d="scan'208";a="203434392"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 06 Sep 2025 20:43:07 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uv6Iy-0001zf-2o;
	Sun, 07 Sep 2025 03:43:04 +0000
Date: Sun, 7 Sep 2025 11:42:41 +0800
From: kernel test robot <lkp@intel.com>
To: GuangFei Luo <luogf2025@163.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] ACPI: battery: prevent sysfs_add_battery re-entry on
 rapid events
Message-ID: <aLz_Mb2YcWzoUccu@c9fd1d3328ad>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250907033925.223849-1-luogf2025@163.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] ACPI: battery: prevent sysfs_add_battery re-entry on rapid events
Link: https://lore.kernel.org/stable/20250907033925.223849-1-luogf2025%40163.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



