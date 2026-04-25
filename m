Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361791F5825
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Apr 2026 02:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777084750; cv=none; b=OoQ9T9xnGJgOjIMoYU9plxRzO+qtqNTsDCi7I+M4JVI7X20bZRhWrtOTp65qZ7bf38eLiLhSg0fqik071fNyu6Oe0hW9cBuTmcagmP2oeS05cywWKoId1VUo/AKb21QlTsiQVxZsevRqUXY1k2pOwckb50tMhIbQQn8EB9MfuuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777084750; c=relaxed/simple;
	bh=844hxxt1/9W2G71d0nf6kNPFpAWc87Fd840XWHRq3mo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZWYd7/DcK01iOMkyW4i5ybKJVfKwUX00GMujR6II9uva5tUzD0RRAJWrPEc0D1qvaGjD5Ufe+sxOZs+UePvGyoJRJst+Gz3jDXRIbK5Mcjp/qn2aRPI8d+Z84Sj6J/Z3B9RNmzARRRcbolqRxdZRpDqx865SeRx6sdL8Lnj6PhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RPvfvaYY; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RPvfvaYY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777084748; x=1808620748;
  h=date:from:to:cc:subject:message-id;
  bh=844hxxt1/9W2G71d0nf6kNPFpAWc87Fd840XWHRq3mo=;
  b=RPvfvaYY+LEbaNdZ4+v0QPKxZL2iwzuIUL3/O+IM0RW+jYzU3ZPPrlSx
   ADroRDtMToy9t/z19HiHrKxP8QRbMcrcgbbuiMu19UjYshHUzSCrSBzse
   7Q1g86WWwSNQNI76EjNKkUk59CuxjvFKrm2gePUzxq1+bLjvPpcNiL8s+
   BCK7xfyVu3hDqvgQriMxts3qhCN+fb3SfqeUz6J1HgrwtPqUJdfFgbvMg
   O8Oz/7vGBDnHjtCzwpsXOY1INE8aBfvMZhJEC+r8LcEYKrdLsSujXTq+t
   pBxrO1WAHh1jC/xx8TUr74mFyZW3zXXamVM+eYz3HrDGk73Hs1EYuYEv6
   Q==;
X-CSE-ConnectionGUID: 3Ko8/awYT0icdf+UVqVGcQ==
X-CSE-MsgGUID: 8H7+gS8JSV+6oB200UikHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="78126302"
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; 
   d="scan'208";a="78126302"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 19:39:08 -0700
X-CSE-ConnectionGUID: /gLBLj+oQLqFKbNHSp38YA==
X-CSE-MsgGUID: ZfpCiMFxRxOZRwU1SkEFyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; 
   d="scan'208";a="237077214"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 24 Apr 2026 19:39:06 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wGSv9-000000006Mj-0wJv;
	Sat, 25 Apr 2026 02:39:03 +0000
Date: Sat, 25 Apr 2026 10:38:53 +0800
From: kernel test robot <lkp@intel.com>
To: Oleg Nesterov <oleg@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>
Subject: Error: Invalid compression type
Message-ID: <202604251019.I1WrmeGq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   27d128c1cff64c3b8012cc56dd5a1391bb4f1821
commit: 975776841e689dd8ba36df9fa72ac3eca3c2957a sched/isolation: Make CONFIG_CPU_ISOLATION depend on CONFIG_SMP
date:   1 year, 1 month ago
config: sh-randconfig-r053-20260425 (https://download.01.org/0day-ci/archive/20260425/202604251019.I1WrmeGq-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260425/202604251019.I1WrmeGq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 975776841e68 ("sched/isolation: Make CONFIG_CPU_ISOLATION depend on CONFIG_SMP")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604251019.I1WrmeGq-lkp@intel.com/

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
