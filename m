Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6B8143878
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Apr 2024 22:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713996576; cv=none; b=M8gLkIW4v9iMhoTom5Srww/wsPSgkAqzaU/YduRXnH5N8E13lJKmVPRVYLQZ2H/1irRUARAS6daXurr0m5jJEOuvC7a8BS9EFKALRb0rC7es65Wl8c6d+eyuYXUs/pLMLVRHxiqwjjH1G1AqOMMMZxnpsuVor9mK9wmRv1KA3pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713996576; c=relaxed/simple;
	bh=GE24nokqUZjXIZ7Ezpd+YFNK9/6KJA+VnWtR+WU000w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eZZTxiWZnbzn7aZ8/yi6ZMc1CsPm6fKcmUW4Jno4zsFwSfpHee5rnpibvvhxSRHJ/rZ02UgR5xq3fkRWQtZPBhxa/jit0kDJqrR3IRsWm6swOGGmJtj9uD+pJeYaaR4YTKqDIwFC1vHa5K91wPBX2JKUFca47J0EYTOnjAi8YFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RfH+zbCM; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RfH+zbCM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713996575; x=1745532575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GE24nokqUZjXIZ7Ezpd+YFNK9/6KJA+VnWtR+WU000w=;
  b=RfH+zbCMz6WZ00ha6f0UZE8PFJQ5vo4wFq+XDXp473cJTJ9ahXcDbGyd
   UKpqQLZnkgfTkNaD1JiWjGhXZGXwNvEwaPplJFk6xc9kD9i5TXmWEgbva
   ZIxQsZBuk8w/RVy17Z+qnWoIGbataKvIOYEtYaJdFMKkhMo8u9X0ybhLE
   YvXo90XqNtmy7XL439E8urRWQwjozJ6efVqgve2eFQUToWEFGjp/t92AC
   niwIIgjFu3Woalys6ihH6VmIGTxSXHiicp++l6TtZFYEeWu4Gqm4mwL04
   AWyvUWidoVxmoInP/X0npnIhiEmOnbfNkvPa4lcZfayD6uG+DDLilXb5K
   g==;
X-CSE-ConnectionGUID: c+A/UAwdT5+aTr4tWdegcg==
X-CSE-MsgGUID: sfMqYodoRomMhvY4f3/Kag==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9873282"
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; 
   d="scan'208";a="9873282"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 15:09:34 -0700
X-CSE-ConnectionGUID: HP/nbDZJThyg3OatEDrHBg==
X-CSE-MsgGUID: H/LRFDCJSx6oQDUzbpjyLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; 
   d="scan'208";a="29331785"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 Apr 2024 15:09:33 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzkny-0001iW-0h;
	Wed, 24 Apr 2024 22:09:30 +0000
Date: Thu, 25 Apr 2024 06:08:56 +0800
From: kernel test robot <lkp@intel.com>
To: Nuno Sa <nuno.sa@analog.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Dragos Bogdan <dragos.bogdan@analog.com>
Subject: [linux-next:master 6544/8170] kismet: WARNING: unmet direct
 dependencies detected for REGMAP_SPI when selected by AD9739A
Message-ID: <202404250558.HmgIruu0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5e4f84f18c4ee9b0ccdc19e39b7de41df21699dd
commit: e77603d5468b9093c111a998a86604e21a9e7f48 [6544/8170] iio: dac: support the ad9739a RF DAC
config: x86_64-kismet-CONFIG_REGMAP_SPI-CONFIG_AD9739A-0-0 (https://download.01.org/0day-ci/archive/20240425/202404250558.HmgIruu0-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240425/202404250558.HmgIruu0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404250558.HmgIruu0-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for REGMAP_SPI when selected by AD9739A
   WARNING: unmet direct dependencies detected for REGMAP_SPI
     Depends on [n]: SPI [=n]
     Selected by [y]:
     - AD9739A [=y] && IIO [=y] && (SPI [=n] || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
