Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F2279CD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Mar 2025 00:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743295119; cv=none; b=h0+qcfRX8B9HheE3BDRWh3DTymXCSdTlsus86wleG4sqHS0H9TPq0x/eqVf4j5P6tr7lXmzppWyk+HRrvQSCDtF7GMOQG2hC3JIp4ujLgEUUwIh7RyOB78/Wg4gi5GhVztsl2CUpgPQNEoQurWRexc63lySMzn3zHihcFOT4Ap8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743295119; c=relaxed/simple;
	bh=WO5FMS8kbpXGy7RXv6RQa6IJb/8q/1RyuHgH7E6XOkI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=q0AnrIq6S6EBbiTt8L2BwxJR8vXECLagqO3OXCNk/6i8eBfSO9a1WIJo/KAmYpbtcE6230oT2YM1pTgR9OCYmWk4/A9kiGbsYUlBbm5a7VYABBD54CRBrfzsOPVifSYEFTgvJmOdReWVVU2vKKXV3p4BwHUipd+1vgCb6weoyTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I8U4njPO; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I8U4njPO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743295116; x=1774831116;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=WO5FMS8kbpXGy7RXv6RQa6IJb/8q/1RyuHgH7E6XOkI=;
  b=I8U4njPOzQE7GKLZRMgINQ/7WfxR1r2AipP9Iuw8y5xyzneEKy3+ZDMx
   O4lhi3KH9vgx4NS+amHVnEUlnl9TQVYXhbOdmPaqrww3juFFYMBxMSzkM
   qc6j4WZbYg4WdHI/1KIh29JI1uS/6zD2txHZ6kWa04KR9AeRRHx3Jo1hv
   UFq7qnpMnPjjJht8g1QHEApUyv6jxfejWh066zGGSi8Ei9at1YfhabH2p
   3OEKwyW6ugYRSipxGT9kFjvbeRU8+by8UM1u/jQS8zDATUnaEgpQwciE1
   42g6k+KLIautNqJnmXqVnmVh35ZWaRXPfdXv+h/itBhozazhlGB/86EDD
   A==;
X-CSE-ConnectionGUID: wqqorSRGTC+LXsnCfEZ9Sg==
X-CSE-MsgGUID: vIsJqL5tSj6kEr3UVQKlaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11388"; a="44534949"
X-IronPort-AV: E=Sophos;i="6.14,286,1736841600"; 
   d="scan'208";a="44534949"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2025 17:38:36 -0700
X-CSE-ConnectionGUID: p5e6QtJ4SpaqQppTa0QEog==
X-CSE-MsgGUID: ILQ+Jzw2RPmJ58FDfOFoeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,286,1736841600"; 
   d="scan'208";a="130613367"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 29 Mar 2025 17:38:35 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tygh7-0008SD-0K;
	Sun, 30 Mar 2025 00:38:33 +0000
Date: Sun, 30 Mar 2025 08:38:07 +0800
From: kernel test robot <lkp@intel.com>
To: Ryo Takakura <ryotkkr98@gmail.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 1/2] serial: sifive: lock port in startup()/shutdown()
 callbacks
Message-ID: <Z-iSb0ryR-tiUCj0@42be267012b8>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250330003522.386632-1-ryotkkr98@gmail.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v2 1/2] serial: sifive: lock port in startup()/shutdown() callbacks
Link: https://lore.kernel.org/stable/20250330003522.386632-1-ryotkkr98%40gmail.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



