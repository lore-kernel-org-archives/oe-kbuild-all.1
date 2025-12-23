Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF172F7445
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 06:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766471655; cv=none; b=YggtT9E7VdIQbkk/Nb1WfpqZr57BVwWQHg8Gh5AN/8zlgMr0CvB3jaPhAhNgSisuEDegw+M5vWosLYjn0goasWo+VLtT7BcLDe+NfVW8FuNDHcUXlHKMLjF7SzG3g90t0i3RihtqxzJManltJw0xnuVMYqr4APBPlQaSCU5CXPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766471655; c=relaxed/simple;
	bh=HdFdPocrhqtLIvyPqYF9dIT5W32F0ylaJq/JX2uQbn0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=rSY5hu8o61ZvnL/iX/oMYe/6bX6oAqAyNKchPtKEFCGzp2F6STZkZCpei020dzQcBggJG/Pq5BgjNxbLO3p45S0dzgdxyk32vJX7pAOk9v/3QF8KIE3+7jFIQuYhXeKYS+nxo40Lh22LcOVvgAusetRWwQ1m67uHpr9eN5HjS9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R2LsCukT; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R2LsCukT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766471653; x=1798007653;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=HdFdPocrhqtLIvyPqYF9dIT5W32F0ylaJq/JX2uQbn0=;
  b=R2LsCukTFYtmoUlM1LyM9VsJfv+2ltWBPA7eD6ABf8Cithxt96qKwex5
   b74xjUPD0wQBwOkbF4J9FYx95a6PmhUadxs2613OFntrZb5okOs3sjZYB
   LlkBvuck5nHCoM+AtmLbyScnDfCQLyaTgFOb22cxrJXXCZS8Glgo4jW6I
   vb304ZBggPDUH9BoHJJ4Ht+7UjNZ8r+W1U+OArkI9srXL3eaKOUH7hp/K
   WgFSUc1HFAt4pZ2W/MPQJoDZutTZaEmZBcQZSmG0oQ8J9n4hQBAkCSNpD
   S6sOQZyOrbdcd6u2qALO6EPxljf1OIMKFzZAat5mRH49J1Ix1DMds/cv8
   g==;
X-CSE-ConnectionGUID: +RsAQwCwTwCI7Cjt/J8R8Q==
X-CSE-MsgGUID: iAnQFnyzQIql+lJWw0Xagw==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="55891273"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="55891273"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 22:34:13 -0800
X-CSE-ConnectionGUID: RXcRGf1WQJCs9pJ8/yf/TQ==
X-CSE-MsgGUID: bpM7b7yLRwiZXrRlABnhnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="199374475"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 22 Dec 2025 22:33:50 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXvxd-000000001XZ-3QB5;
	Tue, 23 Dec 2025 06:33:36 +0000
Date: Tue, 23 Dec 2025 14:32:58 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?B?0JLQsNGC0L7RgNC+0L/QuNC9INCQ0L3QtNGA0LXQuQ==?= <a.vatoropin@crpt.ru>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 5.10] fbcon: Add check for return value
Message-ID: <aUo3mslr14jVpiv5@a397199831b6>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223063055.77545-1-a.vatoropin@crpt.ru>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-3

Rule: The upstream commit ID must be specified with a separate line above the commit text.
Subject: [PATCH 5.10] fbcon: Add check for return value
Link: https://lore.kernel.org/stable/20251223063055.77545-1-a.vatoropin%40crpt.ru

Please ignore this mail if the patch is not relevant for upstream.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



