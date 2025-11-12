Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6D8352938
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Nov 2025 18:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762971931; cv=none; b=cztyJWciLU2+3fPHPCxi/110lk367TcUrpShvlPfa5LcHOcZYgEPfRXSlDhJkHtNPVXmojeHqG8j/Hx22LUcFqp4k6tOQLuWFygTWzKeCQ/HLKXM8MDCb9snhLreVf/nKUsBlGRI6T7fUpI2a1RqTrBP8WUeXLzORrCygSQgOC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762971931; c=relaxed/simple;
	bh=TPzWlqtHOWvWLR1lRgTp9O+8zpwW0nqY3yrQMInkpOc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=YqV5DzioZzNgAK4ivREGIxP/j1J/6hCK4QhZjtd9GBs9iXa7d3CJNFa/vrTv8u2koiR7uDKck6/8CMqFbb7Oey079U9MWZx01IaIE6q2NSbtpc2ksi/27bEpmnYRAPRmdV5L0oEVInvdZpTpR5Wnu3aaGkjv0rgwEjmZrPfXWgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mGxThRx8; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mGxThRx8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762971929; x=1794507929;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=TPzWlqtHOWvWLR1lRgTp9O+8zpwW0nqY3yrQMInkpOc=;
  b=mGxThRx8KoY70CIW9/eQI87tiiAHRayGNMjKkz95SaYRB+TVsxFjkxlk
   JGkTINmQJWCQL0QikLuGh+K0R5wQsnX5cynVpGkKhjQRna039POpl4gmy
   SaMyrtOdT6aZbeX8qfyX/G0psAjDmTxgvzsiZDYKy03oiiSkKi9///kHr
   80PE0nEnVsaFKmTf7L0HCu4RQCvnQAgInphn/Ipm3nXADhuHmdmXCibWv
   I6kwe+/Sdrwd1zkDiC474VWcks/yntn45/Vjuc/h9Pf4Er+a1PSs1zg0L
   k6sP6L6fyYSNtfzG9WPJAQs2QG4N60oPJlocSk6WKKoOrVOL1OI18LtNu
   w==;
X-CSE-ConnectionGUID: YbaGeJcuR8i1cfht6IODnA==
X-CSE-MsgGUID: 0XZqUQNSQMKQZZ02N4vlKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="68677541"
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; 
   d="scan'208";a="68677541"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 10:25:28 -0800
X-CSE-ConnectionGUID: y/s9U4MmSG+eHG6fBbaGAg==
X-CSE-MsgGUID: NIz5zMczToqsSPjcjvICSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; 
   d="scan'208";a="188577400"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Nov 2025 10:25:27 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJFX2-0004WV-39;
	Wed, 12 Nov 2025 18:25:24 +0000
Date: Thu, 13 Nov 2025 02:25:18 +0800
From: kernel test robot <lkp@intel.com>
To: hariconscious@gmail.com
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] ASoC: Intel: avs: Fix potential buffer overflow by
 snprintf()
Message-ID: <aRTRDrpOiupksM0_@2b6d71d08b4d>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112181851.13450-1-hariconscious@gmail.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v2] ASoC: Intel: avs: Fix potential buffer overflow by snprintf()
Link: https://lore.kernel.org/stable/20251112181851.13450-1-hariconscious%40gmail.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



