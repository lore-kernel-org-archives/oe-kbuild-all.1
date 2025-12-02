Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C15020E005
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 17:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764697666; cv=none; b=TL8fQ2uhVfGbcHhdpI7atl7sqK/QBaCY7DuXLjX6nZPXZVpErn43epTgkHMtxNfQnm9TieREkgJopwhn+z6vHGnReTO4WhbfQFDlu5UdIrKZ8JAvJlbHS1p/8qtfl2zhFu/FpNJuSZoIrowTy8AOpIck+7FCCT0sD/D3kJJE3fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764697666; c=relaxed/simple;
	bh=ab2jY2uWAQszPetion9+fBof8OWjyf5ORiyxOEn2i2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=DfgiTFfRAP26T6mMy3+zgfufkCD1S4nxCwHm+MjASbAlIcJIpRTHxtz9+VrSsRJc40HXgQkK0XnKg9rfi20iy8MemY3JBHfo+Gzvlz6DasxkS4RrR3+Aiscsr+WRYGJthh9aIAN16bF9g2N+X05mQatNORJcilr3Sz0zqD+/xWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bDuARO1P; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bDuARO1P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764697665; x=1796233665;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=ab2jY2uWAQszPetion9+fBof8OWjyf5ORiyxOEn2i2Q=;
  b=bDuARO1PZHI8o43MNb9Nvw0Sk58DSyG0fj0ZQEv+a4RgPtqL8WomS4Wk
   Bf6pzSl91ICLmPOQBgUpBI8Tw9TFZwVXpm0flYUv+G0cJI4zu3DF3ov3Q
   ZtLjNaq6Xd455YW5qY0RUfwtLv9JD3AAjbvyxsUjO9Es8FVeYZgw7l8kn
   twGaH3L1o/RzsOLOpJ+XkafAevfftPJl24FQl8qRL1m7373ibAGuHgbHu
   SlsNgw6Uwsp3CaPOZWimiZt4q1meFI0CrNCwBY6MzDnAuOOv5dOh2My65
   mswrQqu4UJ6dqnxjzclXQ0ClY7tbMT/nfslziU5JKz79gku1P/i1WGf1f
   g==;
X-CSE-ConnectionGUID: DXPOjQOkS3KwL5lQiaZpfA==
X-CSE-MsgGUID: Ox2FgT8aRSa5AvD9au+y2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66618781"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="66618781"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 09:47:44 -0800
X-CSE-ConnectionGUID: /1pOKUTETf+HgfPOM1QGNw==
X-CSE-MsgGUID: RLf7yxY3Qi6Y4iHST1QxZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="198854600"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 02 Dec 2025 09:47:43 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQUTV-00000000A4f-2qKB;
	Tue, 02 Dec 2025 17:47:41 +0000
Date: Wed, 3 Dec 2025 01:47:24 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] cifs: Fix handling of a beyond-EOF DIO/unbuffered read
 over SMB1
Message-ID: <aS8mLD1V0GM1RwzA@656a63d76ae5>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1597479.1764697506@warthog.procyon.org.uk>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] cifs: Fix handling of a beyond-EOF DIO/unbuffered read over SMB1
Link: https://lore.kernel.org/stable/1597479.1764697506%40warthog.procyon.org.uk

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



