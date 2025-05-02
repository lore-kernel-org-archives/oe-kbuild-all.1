Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93192BB13
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 May 2025 07:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746172543; cv=none; b=oeLr2HlBEtnga9KKk5TK7NmgLDooHhSc9wN/SVJBiSTwYR//FkGRJbGuILX5jz1myZfiWvclHXxfpBwpWzyNYughhKyo84nl+tRH/6i6hWhx+uqjhVYNsk5DBsQVGPjc5bA2q4mBVv6Sw4QpNyvEkEq77Y2VHamWz6jM6soB3K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746172543; c=relaxed/simple;
	bh=SivnZ0Jt0yWmNzX05a8D1eIKf2Z/IFiLMMfre0XJtc4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J1c/Z/EJCQZnCaCbywh6ZFrsOvv8/2hK9ci43kEqM7ZjIi7HTE+7LIwBIfLknBN23WKaS1SXKgYUZSNLH0JTPiSDXFmvib5T454xCrvhe/OP6AAfFPLg/OkZG8VPuB9Un4CnIkXUnPkMIw2nQ+yYOX4sc55UpwrF+7NCe7MRnoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FKMwsCEC; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FKMwsCEC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746172542; x=1777708542;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SivnZ0Jt0yWmNzX05a8D1eIKf2Z/IFiLMMfre0XJtc4=;
  b=FKMwsCECQPELdSPuFLEW6/Ikak3OsRpucB716jrwfLZnb04ItgRL2D7d
   AUjeH9W7D4XrZEjtIhqjsBD5SOiVwKm8MXmuErc+tVUcCXF1aFWM07/Hg
   bk/SzFy0l2zVOUC6agk5MnoK+MPHRvsO9UZSir7D5cNK1Lqdd263eeSWU
   C02iP/6MSZ0NpMnATeMtGo0hu51BU9mPVOXSZFqiMJfTzOUXRsfeN1IwY
   ZlV8udqY4BtpSszSZ7qTmThYCe1uf5ARSD5zF6L2VDgGvIWs0qNJX9+pv
   HzytvEUPaunMR23nYOIHu7sm0SvgWvvfu04L3v5oMvKfIE4TqYp60LduQ
   Q==;
X-CSE-ConnectionGUID: 0S4B/+qiQTmN4sWjaf5bOQ==
X-CSE-MsgGUID: TzgnicbuT4ivvj7Bh4EaxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="51664530"
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; 
   d="scan'208";a="51664530"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 00:55:41 -0700
X-CSE-ConnectionGUID: 5IT8oI/nRsWbmDyp5EBpJQ==
X-CSE-MsgGUID: iE2f1f3aTAOjP+KV+xG5nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; 
   d="scan'208";a="135551259"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 May 2025 00:55:41 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAlFC-0004c9-1J;
	Fri, 02 May 2025 07:55:38 +0000
Date: Fri, 2 May 2025 15:55:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-put-folio-assert 132/132] ERROR:
 modpost: "bcachefs_shutdown" [fs/bcachefs/bcachefs.ko] undefined!
Message-ID: <202505021519.T8K6p9Mo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-put-folio-assert
head:   e7acf15b702df37aa3571cc28a8f2dd39b80b20d
commit: e7acf15b702df37aa3571cc28a8f2dd39b80b20d [132/132] pop assert when freeing page after bcachefs shutdown
config: x86_64-rhel-9.4-func (https://download.01.org/0day-ci/archive/20250502/202505021519.T8K6p9Mo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505021519.T8K6p9Mo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505021519.T8K6p9Mo-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "bcachefs_shutdown" [fs/bcachefs/bcachefs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
