Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC37B640
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 20:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765312454; cv=none; b=c/UHuEJfLVRImPdhb4e2pmbbQQwWb/he8AwM5FHOD5Cv6VkHDkB/UN+kBmbAKmi23JG+yNKKmjx9ovst47epQblTwmNJq/Fatijs3/3k5WocKetFSx6Hre5tkO2eFxp1uBeS5CnOYmsvOAXv/hNy9v3bBE/7HTksv0E2XO8CGrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765312454; c=relaxed/simple;
	bh=8uQwfp7z+cZdnMr1gQLYt/FJYaUoks/ZQxoh3u8KBWo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JmToVJv1Ri61tS3YYwXjNMyVyiRrAhVddHecUx8gx5kLRjzPofi0ByyACi8eBTYhrTZ7iBlb5S5q0mluKxJnGbrLnbdxV1BN6UktgNMO/zFiqKn5etZFrMNn9vJTzHFAwasLbky1CngE9vNjIxQ7qGq2zpvjMcGk4NZgEYk2l34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bpVsgNdD; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bpVsgNdD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765312452; x=1796848452;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8uQwfp7z+cZdnMr1gQLYt/FJYaUoks/ZQxoh3u8KBWo=;
  b=bpVsgNdDBUyBjMxy37xIP3PNuRG4ELpb5lSDhd/LDt6SRBMWIQvA+5tl
   OcPNFxIEAH9k56PZMkUTeQZeC1SeWvjvTrOAaHllmqmQ/35HbZ8f+hm7R
   /bgewgM1i4j3yeDHYfArA4HBh26bGaK2GPNPtjTvbtVxupxmt6/WYevO3
   tsnhM9zHMooiUBsM3jqqHhLyt+1ZvBI2kkyCPj6BJz/UH+LE2QezW3A+D
   UcReJzuWgnrOPRaNMrkZefyCI2eBynErzRKb2bJZPkU6NS175kl0045V8
   6044sG1pWdGDb42MBOGtMqjYAlNmLD7FT8LfWqLSBQ2Z/cxf98U76gk35
   Q==;
X-CSE-ConnectionGUID: N5is88Q/RLyyZu3jiMXd1A==
X-CSE-MsgGUID: Cq5rARr7QWKDsmszICj+8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="54823545"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="54823545"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 12:34:12 -0800
X-CSE-ConnectionGUID: EXJd/lyxQCWYTFKDvOKYTA==
X-CSE-MsgGUID: d3JzWvgNScGetbqPPkVGGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="195921755"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 09 Dec 2025 12:34:12 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vT4PR-000000000Mz-2NAd;
	Tue, 09 Dec 2025 20:34:09 +0000
Date: Tue, 9 Dec 2025 21:33:19 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3398/3398] htmldocs: Warning: The Sphinx
 'sphinx_rtd_theme' HTML theme was not found. Make sure you have the theme
 installed to produce pretty HTML output. Falling back to the default theme.
Message-ID: <202512092104.D3gEhdzh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   ea8b5fbcdf7f5ce2d966ae6aa4e95e2ebde6cb03
commit: 9ecc6f98e74d5553122ee564caa72dd2a1abf9ff [3398/3398] docs: Fix the docs build with Sphinx 6.0
reproduce: (https://download.01.org/0day-ci/archive/20251209/202512092104.D3gEhdzh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512092104.D3gEhdzh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: /sys/class/leds/<led>/repeat is defined 2 times:  ./Documentation/ABI/testing/sysfs-class-led-trigger-pattern:28  ./Documentation/ABI/testing/sysfs-class-led-driver-el15203000:0
   Warning: /sys/kernel/iommu_groups/reserved_regions is defined 2 times:  ./Documentation/ABI/testing/sysfs-kernel-iommu_groups:15  ./Documentation/ABI/testing/sysfs-kernel-iommu_groups:27
   WARNING: The kernel documentation build process
   support for Sphinx v3.0 and above is brand new. Be prepared for
   possible issues in the generated output.
>> Warning: The Sphinx 'sphinx_rtd_theme' HTML theme was not found. Make sure you have the theme installed to produce pretty HTML output. Falling back to the default theme.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
