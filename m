Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3B0366076
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Feb 2026 15:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770650844; cv=none; b=QC2qumx88xpGe6ccDHBnLFPJr57HSdbrnKssoP6z19tByT1mCLIAtAPkB/pSHMLHcxsWk40gETgzRG4LIt0eBav6ueJRx042m/SyrQX1FAHk0FbkxUa+ptomhtcyhdxRXhAg07+VER9IrT8glEs711qRJ5SqPjom+FWSIPaDlUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770650844; c=relaxed/simple;
	bh=ZnCdqjjCTMi7z6KbKkg7DGYVJkejRKluI70s6OCbk80=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VZHQkDCrflBBjALfYFce1G3JUxw4u9aiv6ma/yEjj+s8NcqAoQKfoYvPGlYTg63nFMALlnMHJgSae+z+r+e96zZTDIDW8vtfOcJGv8aZKJilj/81V9UhFxwlC2KjOGjt0NtgcUW9Rpu0kfzPFka9JOsLkxtyZ9vvIwAanmnLyRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m98bexvx; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m98bexvx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770650844; x=1802186844;
  h=date:from:to:cc:subject:message-id;
  bh=ZnCdqjjCTMi7z6KbKkg7DGYVJkejRKluI70s6OCbk80=;
  b=m98bexvxCf68xGZHlqj51ruSFOZoGFB7WdpKTTIpvfjIRxP/oCCxCP6Y
   1cEqg+3Cq7XA0mij1W9rk+AAxvoW4oXfW+pO43Lo8uxJSVyInYBHO3B5t
   NodRV5CslOLM6DQCRAHxQ6AC99VL7HFdMvyjx6QTYo0MUmOa7K2kOzAmr
   sHHaTnTDlwfjlBnt1gOy9cyaXLlWjP37VjwGywvQNxh2DZ/olIO2KgYDk
   CnTHUPQ6d49svTeY+XSMEvuZHLkSGqTisC5axDPsZ6AeRowRAHIoYjNn1
   h+6K+nLn3bx6B19eRKXkY9DmAP2PSTY2i2d8zvP9ZGfPx+h4CmbkLfp5z
   Q==;
X-CSE-ConnectionGUID: tAv90Y3cRS2bvoG4EhEI3A==
X-CSE-MsgGUID: 8M0WYBNJSaO6cvl4FPcjeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71749489"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="71749489"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 07:27:24 -0800
X-CSE-ConnectionGUID: kmRNxrXiQBC/d3v3+n+QLA==
X-CSE-MsgGUID: rrRq0m3jSpSSYSkQ7nrnVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="211677231"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Feb 2026 07:27:22 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpTAU-00000000o4G-3luS;
	Mon, 09 Feb 2026 15:27:18 +0000
Date: Mon, 09 Feb 2026 23:26:26 +0800
From: kernel test robot <lkp@intel.com>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Subject: Error: Invalid compression type
Message-ID: <202602092349.6Xa61Ocr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
commit: 6b6e03106163458716c47df2baa9ad08ed4ddb0e spi: amlogic: fix spifc build error
date:   4 months ago
config: sh-randconfig-r063-20260209 (https://download.01.org/0day-ci/archive/20260209/202602092349.6Xa61Ocr-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260209/202602092349.6Xa61Ocr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602092349.6Xa61Ocr-lkp@intel.com/

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
