Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECC052F6E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Mar 2024 09:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709889649; cv=none; b=N4I7DdK77pIz9Zykg7ZuTlSA4UK/nrIG29HNHUginm1S90hzI94BsI2G8/XTKRXUu1ekabPma1SEZgWLSYK8qrqayXz07nAYNRg6EiXl4iC3yVm00y85U880xnTDKju5h8Nr2WPTv865gxZkIYpNiYkb1TIUda83hV0Ag6C0iF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709889649; c=relaxed/simple;
	bh=tOmjTWGzSQoBS7OAhAZSlTAAvA7F6hgtzWOdIeARHO8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YIKup1YdJT7nxmJp+zHBnUKeQfhFKVPfHl64ni2QdwcELZ/FYS9CIrl3PntAQuWo67Dd0g2eezaooy/4cxw2EE5LjrPelr1eNWJRxyK9p3URW30lXCDyvDp8VYZ2G0UAfBaX2GHhp/y9PDKblj7iYD0WSdh1tucUooZvz4UIHUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n8OCQD8t; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n8OCQD8t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709889647; x=1741425647;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tOmjTWGzSQoBS7OAhAZSlTAAvA7F6hgtzWOdIeARHO8=;
  b=n8OCQD8tfiyRuHpHVEpj0tgZS9OYlnVUjsjku/wdYuab1e6x0rpdSTq1
   RIpABVfdJmuKbSS1xKySe0jk3r0oYUpIsLDlWIIy+Ra0p395coLmoEn9A
   AJt9dnEl+ZW0yAufd3DZmvRREYQK8DixXvcilN0KHvpDnkf+oubWXoOv+
   CclQCbUnMqiL9NzqTNfHuEBmFl5/itlVBKIujyfmZxdVvkThmNGj4uolk
   ufkKzIyq/8H8pLskIwP28YA0E50TrW1ScXe0qDkmJWMxUOklmW9yy+sxY
   pDCCQlKIBYAHdNiBCOx2LwQXtpvkxazZLMT3r0Jo+XANqoLZoczdE0m3F
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15168812"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="15168812"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 01:20:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="10289927"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 Mar 2024 01:20:45 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riWPD-0006Ej-0Y;
	Fri, 08 Mar 2024 09:20:43 +0000
Date: Fri, 8 Mar 2024 17:19:45 +0800
From: kernel test robot <lkp@intel.com>
To: Phil Elwell <phil@raspberrypi.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [jmondi:pispbe/media-staging/be-upstream 15/143]
 clk-rp1.c:(.text+0x210): relocation truncated to fit: R_NIOS2_CALL26 against
 `rp1_get_platform'
Message-ID: <202403081702.xKVuHKE1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jmondi/linux.git pispbe/media-staging/be-upstream
head:   b7b928a1ff80dc548d6f5c1b8c00b2082212e38e
commit: e816c18ae317e9fef655662b2187f72f1cd00f2f [15/143] clk: Add rp1 clock driver
config: nios2-allyesconfig (https://download.01.org/0day-ci/archive/20240308/202403081702.xKVuHKE1-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240308/202403081702.xKVuHKE1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403081702.xKVuHKE1-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: drivers/clk/clk-rp1.o: in function `rp1_clk_probe':
   clk-rp1.c:(.text+0x210): undefined reference to `rp1_get_platform'
>> clk-rp1.c:(.text+0x210): relocation truncated to fit: R_NIOS2_CALL26 against `rp1_get_platform'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
