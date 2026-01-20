Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBAC31D366
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jan 2026 10:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768903619; cv=none; b=fge2XOBzu7/Lug/q0wICWIvFDZIsSlkPCKW3vNQt3Jac7iNWDiD9yLbEzbePJJokwQEQlsfnmgF2XUoiHK2VePXyArTPBXFqPtTmoUgmCXhlhZJ9HR/0pZzKaTV9jsX4G8E7wVVPMT5Iy+s1t6O5H/yQ6/YKArtUOMoV9ozrFV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768903619; c=relaxed/simple;
	bh=ZfdRKUyvjJmkNQcuOAo2pc0ij0ysYxYiaEvuZ7NxhUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aQkXxrhzp2NK7AvMpTc6raS7tCzYWCu2H+V7owJyEK6f4M26HRzh1Q8lwNANBdPZTK8WRWo98pyBl6dQqVSiAyOZpP04GHsg412wFDk08G0yfntCWV3cSkRqrHYlQokUPeZlNOTRDr3ZItuHMJ/1or6ngZa2NJjz4y026tNEBN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VMeACIUe; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VMeACIUe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768903618; x=1800439618;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZfdRKUyvjJmkNQcuOAo2pc0ij0ysYxYiaEvuZ7NxhUw=;
  b=VMeACIUemL52X/jDJruvCv3v0PXZf/lyYqrtM6gum9yh6SctEbfirKPQ
   JBzmsr5Gf3kSqLBqsgnW2kf4i+uMGmA0NGPpslAgPgrEW+MpOUjok8paj
   rrkCpLIpjQ6QWxFwCFAwxh0Um6FZEJtaS7rmXu2BA51oZdDooKDgNzbJZ
   CrjnD+Bn6Z8tUNiVr9DrugWgR0lfyhtvDVWUynZa0vP5Fk+KBWLC6DBv/
   mzhqkKZBPODKiYT5zx7rajONz7o5sbOPk9fMtCZXB9fOgZJjxRg7aEbns
   AebgLZxEIQ+iweK1of+PT7rMI3ALs3SoKyZngYkSJGIOf7ApGNoUYq+JY
   g==;
X-CSE-ConnectionGUID: XbGfP3C8SAeGDaxrlhMhqA==
X-CSE-MsgGUID: bSO567WaQeu5GHPeyBnsPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="72695360"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="72695360"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 02:06:57 -0800
X-CSE-ConnectionGUID: RH0OGAKKTNejgBxJv3hV+g==
X-CSE-MsgGUID: pWlNfn/SRimB3tdTXOy5rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="210225300"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Jan 2026 02:06:53 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vi8dO-00000000Ont-39kq;
	Tue, 20 Jan 2026 10:06:50 +0000
Date: Tue, 20 Jan 2026 18:06:25 +0800
From: kernel test robot <lkp@intel.com>
To: Petr Hodina via B4 Relay <devnull+petr.hodina.protonmail.com@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	David Heidelberg <david@ixit.cz>
Cc: oe-kbuild-all@lists.linux.dev, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Petr Hodina <petr.hodina@protonmail.com>
Subject: Re: [PATCH 2/3] iio: light: add AMS TCS3400 RGB and RGB-IR color
 sensor driver
Message-ID: <202601201721.SsgdtZmN-lkp@intel.com>
References: <20260119-tsc3400-v1-2-82a65c5417aa@protonmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119-tsc3400-v1-2-82a65c5417aa@protonmail.com>

Hi Petr,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b]

url:    https://github.com/intel-lab-lkp/linux/commits/Petr-Hodina-via-B4-Relay/doc-add-Device-Tree-binding-for-AMS-TCS3400-light-sensor/20260120-012240
base:   46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
patch link:    https://lore.kernel.org/r/20260119-tsc3400-v1-2-82a65c5417aa%40protonmail.com
patch subject: [PATCH 2/3] iio: light: add AMS TCS3400 RGB and RGB-IR color sensor driver
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260120/202601201721.SsgdtZmN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601201721.SsgdtZmN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601201721.SsgdtZmN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/light/tcs3400.c:82:18: warning: 'tcs3400_gains' defined but not used [-Wunused-const-variable=]
      82 | static const int tcs3400_gains[] = {1, 4, 16, 64};
         |                  ^~~~~~~~~~~~~


vim +/tcs3400_gains +82 drivers/iio/light/tcs3400.c

    81	
  > 82	static const int tcs3400_gains[] = {1, 4, 16, 64};
    83	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
