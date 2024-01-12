Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E88139F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jan 2024 03:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fwkdmPdX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705029579; x=1736565579;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/UUNLHeSzE+Ajpd6Jrni1sTZC/tg/dUCoSBPcpIvhhE=;
  b=fwkdmPdXOIMaQmPAvWPJcLSAOneioKWrmzkp2n434IkAX3vDHh12/QiX
   AZwSYCpWNyY8OKR+k4uD9AQ/b7V2Is1GFpBmQ1xFwaclj4hwwAwU7NRZC
   hZfnp0vb1LfRnmZnQN1cZmllbL+oIktX3kXUSJD+DroXa8nET9M1EYZKn
   GF5PxbAx+4HKi/BlGhI8aY5odajysmY5DKZgMwOvXnVb5v8rnVVgKxhgu
   iUsSX1hjF4/78kg4D2UzazNqfwDPrXpkw2JH79MCEMKdQBkUycEBTRxKd
   5cpXzswr5Ypb4IDD/uuXGPpihUODSxy6CLzYJbG7j+EPFWkmK/j46tN5K
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="6432600"
X-IronPort-AV: E=Sophos;i="6.04,188,1695711600"; 
   d="scan'208";a="6432600"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2024 19:19:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="955984502"
X-IronPort-AV: E=Sophos;i="6.04,188,1695711600"; 
   d="scan'208";a="955984502"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 11 Jan 2024 19:19:36 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rO850-00090Y-14;
	Fri, 12 Jan 2024 03:19:34 +0000
Date: Fri, 12 Jan 2024 11:19:08 +0800
From: kernel test robot <lkp@intel.com>
To: bingbu.cao@intel.com
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 12/17] media: add Kconfig and Makefile for IPU6
Message-ID: <202401121130.sazingY6-lkp@intel.com>
References: <20240111065531.2418836-13-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240111065531.2418836-13-bingbu.cao@intel.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[also build test WARNING on linuxtv-media-stage/master linus/master v6.7 next-20240111]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/bingbu-cao-intel-com/media-intel-ipu6-add-Intel-IPU6-PCI-device-driver/20240111-184826
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20240111065531.2418836-13-bingbu.cao%40intel.com
patch subject: [PATCH v3 12/17] media: add Kconfig and Makefile for IPU6
config: x86_64-kismet-CONFIG_IPU_BRIDGE-CONFIG_VIDEO_INTEL_IPU6-0-0 (https://download.01.org/0day-ci/archive/20240112/202401121130.sazingY6-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240112/202401121130.sazingY6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401121130.sazingY6-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for IPU_BRIDGE when selected by VIDEO_INTEL_IPU6
   
   WARNING: unmet direct dependencies detected for IPU_BRIDGE
     Depends on [n]: MEDIA_SUPPORT [=y] && PCI [=y] && MEDIA_PCI_SUPPORT [=y] && I2C [=n] && ACPI [=y]
     Selected by [y]:
     - VIDEO_INTEL_IPU6 [=y] && PCI [=y] && (ACPI [=y] || COMPILE_TEST [=n]) && MEDIA_SUPPORT [=y] && MEDIA_PCI_SUPPORT [=y] && X86 [=y] && X86_64 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
