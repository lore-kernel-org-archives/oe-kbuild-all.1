Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6F93BB31
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Nov 2023 19:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="btI9jtZH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700162174; x=1731698174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lyCeh57vtbBCapeU6p2x//ntccp+r/FUJCNn0PP72/o=;
  b=btI9jtZHAT/WilABoS7NoQuwx5t1CQxA40E06W6FCqiewhtXAMZDZtwP
   TQGZlN6RRgYIfbLFw72MKO2EPOjwGTZHP9pIA4n1RABQ2zpel1u2KEosB
   zea5O8LbRflQ8rQLzZ7XIrK4abB9ORLB4nXPENlEsR1j1Slbourv6XYtY
   TBp14i4/F0VteERB02N4mKZT9NAP4HbacCjyfofz7V/Hs4TziIBWpgX+u
   4C0SxaZtd6l8wczigJUcVKWs6I1Qb7htAo5kBDXM9ash5/8rWUSCljUtM
   Cox1sfyy08N3Erv51NofS1/zEyf6QTWPddXADmkJtTVRLJA3I/BmHIDy/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="376206828"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; 
   d="scan'208";a="376206828"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 11:16:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; 
   d="scan'208";a="13663794"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 16 Nov 2023 11:16:11 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3hqT-00020l-02;
	Thu, 16 Nov 2023 19:16:09 +0000
Date: Fri, 17 Nov 2023 03:15:32 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: [rmk-arm:aarch64/hotplug-vcpu/v6.7-rc1 41/42] kismet: WARNING: unmet
 direct dependencies detected for ACPI_HOTPLUG_IGNORE_OSC when selected by
 X86
Message-ID: <202311170355.clgJKgUc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm aarch64/hotplug-vcpu/v6.7-rc1
head:   7cd0d2ba4b60697c90c4328a7377ce411568299e
commit: 14c87bb96df0d5d15ee8cea9114bcc9183d5dc4f [41/42] ACPI: Add _OSC bits to advertise OS support for toggling CPU present/enabled
config: i386-kismet-CONFIG_ACPI_HOTPLUG_IGNORE_OSC-CONFIG_X86-0-0 (https://download.01.org/0day-ci/archive/20231117/202311170355.clgJKgUc-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231117/202311170355.clgJKgUc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311170355.clgJKgUc-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ACPI_HOTPLUG_IGNORE_OSC when selected by X86
   
   WARNING: unmet direct dependencies detected for ACPI_HOTPLUG_IGNORE_OSC
     Depends on [n]: ACPI [=y] && ACPI_HOTPLUG_PRESENT_CPU [=n]
     Selected by [y]:
     - X86 [=y] && ACPI [=y] && HOTPLUG_CPU [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
