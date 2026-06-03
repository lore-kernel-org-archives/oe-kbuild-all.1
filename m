Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8213730148A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jun 2026 19:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780513506; cv=none; b=Kth3FNcFprdzMperG1an810Eyu/LlgBMn5yChOFaz4m0OxqqhV3D5nWICuo3EgElDNWLyGu1ml/wEih1qH1mWqeBiPruoqd+3EyCn20KsL0QG6BqhTjBLocI/TrCf1arnz8O+xrMwjT4fGvmtdQ0AjIIHxaUSbH7qKJzdTLifJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780513506; c=relaxed/simple;
	bh=jIx8N8V6yJ0b5gZq8wWZAm946jpUfNr0aE38RfCaz6c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XIgdHT6IJLCb9jaKKzr0BHvTvSueQoiHSp4JBRjyPk4wkPvrp/01EjuqMMdDDfTo7DIdXacDxrx1g5pcDZFLhLbmUX5jAmNOvZI+9Csx1O1PikhE4AIlBh7OVNnR6wyzVIufs4C9eceX9WHLlvxNupzRNQEHFOpRErmk2youGpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NsUck3uL; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NsUck3uL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780513506; x=1812049506;
  h=date:from:to:cc:subject:message-id;
  bh=jIx8N8V6yJ0b5gZq8wWZAm946jpUfNr0aE38RfCaz6c=;
  b=NsUck3uLetYWXn7yELAFQ0cp/6H4lptUqCQ8EtPkq3y/cjiZDtNgqe5+
   fxHF+y8hucK3TcaVU6nxSwuiGUWea5Z+RvxyqnUEybUBLbzK7r600yxp0
   DztK2tT7QLegs+CEBup0uDaWLVppIwv0djCsLuOYfXH/kNu8tt7USBtzw
   9p48ivJAtsEHZKGsAbeYYrsNwIH583Ruv0+sQdr37joFIO1rfvxjTCpmf
   +rjw/dH2kaYFYekkN958ys3izeBAhdUoDTWy9oILrXMRVuBMpP8LACT7h
   2zKUi0Jkz+nxCkX2IMxuAXAS5Sb2ZT76h39kfAfj1uRr0mAQGAV5gS3cO
   g==;
X-CSE-ConnectionGUID: by2VpcvtSSKtB+ZAvUz0Ag==
X-CSE-MsgGUID: u5FhUAkWT5S9H+2+bN3lCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="81395618"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="81395618"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 12:05:05 -0700
X-CSE-ConnectionGUID: EQ6AEV0gQGODcUcgjhIStA==
X-CSE-MsgGUID: Vg32UksXRL6cMNGZ7k2/AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="249410939"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Jun 2026 12:05:03 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUqtg-00000000Dn4-1CIV;
	Wed, 03 Jun 2026 19:05:00 +0000
Date: Thu, 04 Jun 2026 03:04:07 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jon Hunter <jonathanh@nvidia.com>
Subject: Error: Invalid compression type
Message-ID: <202606040244.Yx0j1YrV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
commit: 916aa36042db8ee230543ffe0d192f900e8b8c9f clocksource/drivers/timer-tegra186: Avoid 64-bit divide operation
date:   8 months ago
config: sh-randconfig-r061-20260603 (https://download.01.org/0day-ci/archive/20260604/202606040244.Yx0j1YrV-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260604/202606040244.Yx0j1YrV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 916aa36042db ("clocksource/drivers/timer-tegra186: Avoid 64-bit divide operation")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606040244.Yx0j1YrV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: Invalid compression type
   Usage: /usr/bin/mkimage [-T type] -l image
   -l ==> list image header information
   -T ==> parse image file as 'type'
   -q ==> quiet
   /usr/bin/mkimage [-x] -A arch -O os -T type -C comp -a addr -e ep -n name -d data_file[:data_file...] image
   -A ==> set architecture to 'arch'
   -O ==> set operating system to 'os'
   -T ==> set image type to 'type'
   -C ==> set compression type 'comp'
   -a ==> set load address to 'addr' (hex)
   -e ==> set entry point to 'ep' (hex)
   -n ==> set image name to 'name'
   -R ==> set second image name to 'name'
   -d ==> use image data from 'datafile'
   -x ==> set XIP (execute in place)
   -s ==> create an image with no data
   -v ==> verbose
   /usr/bin/mkimage [-D dtc_options] [-f fit-image.its|-f auto|-f auto-conf|-F] [-b <dtb> [-b <dtb>]] [-E] [-B size] [-i <ramdisk.cpio.gz>] fit-image
   <dtb> file is used with -f auto, it may occur multiple times.
   -D => set all options for device tree compiler
   -f => input filename for FIT source
   -i => input filename for ramdisk file
   -E => place data outside of the FIT structure
   -B => align size in hex for FIT structure and header
   -b => append the device tree binary to the FIT
   -t => update the timestamp in the FIT
   Signing / verified boot options: [-k keydir] [-K dtb] [ -c <comment>] [-p addr] [-r] [-N engine]
   -k => set directory containing private keys
   -K => write public keys to this .dtb file
   -g => set key name hint
   -G => use this signing key (in lieu of -k)
   -c => add comment in signature node
   -F => re-sign existing FIT image
   -p => place external data at a static position
   -r => mark keys used as 'required' in dtb
   -N => openssl engine to use for signing
   -o => algorithm to use for signing
   /usr/bin/mkimage -V ==> print version information and exit
   Use '-T list' to see a list of available image types
   Long options are available; read the man page for details

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
