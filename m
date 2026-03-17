Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACBC39A062
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Mar 2026 08:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773737061; cv=none; b=Z1qIQHJ3GDgvbdAc8qBIa0rxyD1u/00G/Ex0+i+F1KOhxLclDXzxjnvKFbNq86gYNtAy7pgGhOl2gHqgieKfrLiumW/rGPJisA6qTO3WxUVhbyAMI7/55kc3Ljj5A84ZZuJusxi/H1gaCI6VougMfok7qDHi35hKIh305ptntwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773737061; c=relaxed/simple;
	bh=pzj62WcvC75xKQfz0SYq61dDcfCMQb2l33LDV28AkJM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kJDlvFuTBSojQRPrAEtPp5S3Xo4Whbw4T9UL4CSTZmqZjhTfIsk5DEsqHHjBfAppofqNE/b9iRWkV0n9Qt1nKRj0KpNc+YxSMJxbHcvpvG22uxfTQfLcTdhTReKoUsbeLybGb+l7pnLQSayXzC99gO7XFKm4Bn/m6mlYoUsv3Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AHT6FFtH; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AHT6FFtH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773737060; x=1805273060;
  h=date:from:to:cc:subject:message-id;
  bh=pzj62WcvC75xKQfz0SYq61dDcfCMQb2l33LDV28AkJM=;
  b=AHT6FFtHLA7bjhXUH6DkZxXC2hNV2mzTioUTrhOq5XILg1AGV8SE8VvK
   GAzYXi/9vHn4NKhKk1KY0Se6JhGxS8y5QYeR8nvlv01giY7EgUVO29UpP
   m9NTMZGMei0ILSdDv5b54pz1HDcGq1uOmVewRzZok6/M9POVeAZdnse1a
   /ppM4a/qq3UwR0mVkNJ2aA9LqctgLmA4A9qpX7D8DRULOF0KoGqFPF6EF
   Jz0UhBKmEIiwM1hl8FDF3hTALj3uhyLhxTP70W7jTF6TXnvFSpKPNLxlF
   3NduvlQBxaDqZacqnPKh1mHmPixwVyrRmwCcqOpnLKlbr+ngPlnPpNJXh
   Q==;
X-CSE-ConnectionGUID: s5PSxMCXTc6L934HgYYsiw==
X-CSE-MsgGUID: ikLuU7WAS4a9e/EnKeUPyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74946568"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74946568"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 01:44:18 -0700
X-CSE-ConnectionGUID: fMT6uTWtT1el9fwfpWejyA==
X-CSE-MsgGUID: apXTZcK+SYCiSnGVyMeVHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="221432361"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Mar 2026 01:44:17 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2Q29-0000000004f-2vLH;
	Tue, 17 Mar 2026 08:44:13 +0000
Date: Tue, 17 Mar 2026 16:43:33 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>
Subject: Error: Invalid compression type
Message-ID: <202603171502.jxXK5hxQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2d1373e4246da3b58e1df058374ed6b101804e07
commit: f47c1b77d0a2a9c0d49ec14302e74f933398d1a3 clk: Move clk_{save,restore}_context() to COMMON_CLK section
date:   9 weeks ago
config: sh-randconfig-001-20260317 (https://download.01.org/0day-ci/archive/20260317/202603171502.jxXK5hxQ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260317/202603171502.jxXK5hxQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603171502.jxXK5hxQ-lkp@intel.com/

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
