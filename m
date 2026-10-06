Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F354C6D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Oct 2026 04:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791262076; cv=none; b=Qbkqgpaov+E5KSGKMleePA6FvGg7pNH8FBK0GX+J/GHxWG0SmRnh3K7dQZCz9husBREpPDOUrNn7gOm+P8eldIl6W4VZswH+rkFqdHufZ+WJ8Ci+26U2WQrVSJQ2HL03pK1XH9M0EKmrdfbqRxvlmI8Tdm/GenCemz9VxfFt4Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791262076; c=relaxed/simple;
	bh=oTyNBGv99KF9PBYy3pNQZ9Ld7UNz0+mPGHPDsHDgXrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e71uTkeTKh+wlVIDI+fGdNDqDRkxLDQb3KqfAmyqhSHfmXFLRxKJ5rh0o2CvhU/IWUTek8JXY73/LYbSWeGk0B8kLK56v23kkusgDiILGiMbPbKSgDdV9cLDROtpiMS/B1vTvD88extPPyIZI6ZdnvzXMSJnm+U/DAkBeBCzKQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lUl8WgRJ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lUl8WgRJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791262075; x=1822798075;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oTyNBGv99KF9PBYy3pNQZ9Ld7UNz0+mPGHPDsHDgXrE=;
  b=lUl8WgRJN458cyPdd0PDeH48h3z1LfnC8EDMVJZyVnO3jBemcvOA7OAK
   n7zVxoORqU5aa7PLNbzmQKPihl5caJ4UdlMvadusCp9x+ki22fIsSqgGq
   XBrp1Zb3bI6GohXxvZaDV4qJ9g/B7Kz1iJHUDTitbNP0WrEgab7z/RfdI
   5l8C5sI3AH+sdZPyBGIfwz0UGNg1orN3a5C99515mRijARb65yQLtnOXc
   1B9i6czO73jhWO3OVxjXCwsozcRr753uxgw/6Ny8uG/SzSzzh8dz5E7ET
   0V/IHikywZYNai9HbNbyZkZLl7zHgMmVr4g4NQLLgD/CJtaoGjOhhYXbU
   g==;
X-CSE-ConnectionGUID: qekfB2x3TT6IE1zzsS/ZDQ==
X-CSE-MsgGUID: oLgMrre5RT+pmCaXTSHQNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="88577"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="88577"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 21:47:54 -0700
X-CSE-ConnectionGUID: V+MLLb8uTF+fu3kMyIkdMw==
X-CSE-MsgGUID: pYgNTfN2TLiq5mrKus1LEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="275695217"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Oct 2026 21:47:51 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDx5g-000000001Aa-1cbt;
	Tue, 06 Oct 2026 04:47:48 +0000
Date: Tue, 6 Oct 2026 12:47:05 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?iso-8859-1?Q?Miqu=E8l?= Raynal <miquel.raynal@bootlin.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Subject: Re: [PATCH 2/2] iio: temperature: tmp117: add support for HIGH and
 LOW alerts
Message-ID: <202610061256.stF5y2PX-lkp@intel.com>
References: <20261005-add-tmp117-notif-v1-2-c6cef6fad64c@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005-add-tmp117-notif-v1-2-c6cef6fad64c@bootlin.com>

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on 551c722f40809618230001baccf219193e22fc5a]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Bonnefille/dt-bindings-iio-ti-tmp117-describe-interrupts-for-TMP117/20261005-164419
base:   551c722f40809618230001baccf219193e22fc5a
patch link:    https://lore.kernel.org/r/20261005-add-tmp117-notif-v1-2-c6cef6fad64c%40bootlin.com
patch subject: [PATCH 2/2] iio: temperature: tmp117: add support for HIGH and LOW alerts
config: um-randconfig-1000-20261006 (https://download.01.org/0day-ci/archive/20261006/202610061256.stF5y2PX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261006/202610061256.stF5y2PX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610061256.stF5y2PX-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: drivers/iio/temperature/tmp117.ko: symbol '__divdi3' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
