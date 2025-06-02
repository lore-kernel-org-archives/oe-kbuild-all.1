Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA7B1FF1A6
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Jun 2025 23:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748905739; cv=none; b=dOnTteX/INGp2NFkbk9OUa3znCcYVPqtjIgh0RsRbp3zPTp0nZXNn1P7+9vGFSSkEDU8y//bD+9qrhBzoKW2/useWWHmgIfSGni9V1Sd5HHu/WNW3vb5RDUkdxNxBF86lu4eOat5FpqZLeYXOLS6w3orC4pEDdH3jZXsDMGOi94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748905739; c=relaxed/simple;
	bh=HcEvILQ/uJR4IkHWZjPTa6slWg6R3/HIlHP/gOiezrE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=blGaqhrSlQuxozy5hryTpeWsP+rKdqpa5wx6kqa6CEhXxr48x8L1Ot/dLJWdNgTUDr7RbbMSrapfW93NIO1E5iLUYes8XypA4zFbRBiGyfVuGmqddDti5uKDvHBluDi0mlx5Ioa4x7flgxG7FSYF7Ktbx7CeaYykohX/W1qSzCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fNHGDG8c; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fNHGDG8c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748905737; x=1780441737;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HcEvILQ/uJR4IkHWZjPTa6slWg6R3/HIlHP/gOiezrE=;
  b=fNHGDG8cISObZL0jIxSySoDvGS+xs3QRmD7ixiilTKsvX0zSnEv0X75D
   Lx3lo1Vkly3DE8GsSeGtKhGkjqN8EEZQCcGCCOQ5vSZLWBE2C/rsWQZTk
   qKJVinW3wp2qIuD+sgXxK5xVWhdqNpzN7nO3PGBh7t2qEQlEApaOYYamF
   iA8b6vFPbqJrUURQCY7ewHAeUtFm+NdYPNYTY/qIE0rCoVsue8Bhr3u3h
   jDwynmGDs+etJlvMUGWsZJQGCz27A23ETkhmVM4Bxvuu7mYXPmtrj7dpc
   EMhtPVkN0w0Cev/5KlTG8z/1gOpJBc6rEHK9MddOM9uItCcAFdam8LQeO
   A==;
X-CSE-ConnectionGUID: rOxvxiIRTAO3KXBGlLyE3A==
X-CSE-MsgGUID: Cp1CH8SNThWO0WnnXE1juQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="62282276"
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; 
   d="scan'208,217";a="62282276"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 16:08:56 -0700
X-CSE-ConnectionGUID: hMb3l/IkSz2CgHRpmF37Fg==
X-CSE-MsgGUID: QeCakdlyR4e6utpoXDZ8dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; 
   d="scan'208,217";a="145605288"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 Jun 2025 16:08:55 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMEGy-0001Nu-34;
	Mon, 02 Jun 2025 23:08:52 +0000
Date: Tue, 3 Jun 2025 07:07:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 0/1] drivers/md/dm-init.c:485:
 warning: cannot understand function prototype: 'char *chrome_create; '
Message-ID: <202506030706.X9TCd4qV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   21fc2218c3dfde22b522a0352bb0112b85d0fe72
commit: 3080f1eaf4b3289aeea62876753ac618bd75e57c [0/1] CHROMIUM: dm: init: convert dm= to dm-mod.create=
config: i386-buildonly-randconfig-2003-20250502 (https://download.01.org/0day-ci/archive/20250603/202506030706.X9TCd4qV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250603/202506030706.X9TCd4qV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506030706.X9TCd4qV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/md/dm-init.c:485: warning: cannot understand function prototype: 'char *chrome_create; '


vim +485 drivers/md/dm-init.c

   452	
   453	/**
   454	 * dm_chrome_shim - convert old dm= format used in chromeos to the new
   455	 * upstream format.
   456	 *
   457	 * ChromeOS old format
   458	 * -------------------
   459	 * <device>        ::= [<num>] <device-mapper>+
   460	 * <device-mapper> ::= <head> "," <target>+
   461	 * <head>          ::= <name> <uuid> <mode> [<num>]
   462	 * <target>        ::= <start> <length> <type> <options> ","
   463	 * <mode>          ::= "ro" | "rw"
   464	 * <uuid>          ::= xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx | "none"
   465	 * <type>          ::= "verity" | "bootcache" | ...
   466	 *
   467	 * Example:
   468	 * 2 vboot none ro 1,
   469	 *     0 1768000 bootcache
   470	 *       device=aa55b119-2a47-8c45-946a-5ac57765011f+1
   471	 *       signature=76e9be054b15884a9fa85973e9cb274c93afadb6
   472	 *       cache_start=1768000 max_blocks=100000 size_limit=23 max_trace=20000,
   473	 *   vroot none ro 1,
   474	 *     0 1740800 verity payload=254:0 hashtree=254:0 hashstart=1740800 alg=sha1
   475	 *       root_hexdigest=76e9be054b15884a9fa85973e9cb274c93afadb6
   476	 *       salt=5b3549d54d6c7a3837b9b81ed72e49463a64c03680c47835bef94d768e5646fe
   477	 *
   478	 * Notes:
   479	 *  1. uuid is a label for the device and we set it to "none".
   480	 *  2. The <num> field will be optional initially and assumed to be 1.
   481	 *     Once all the scripts that set these fields have been set, it will
   482	 *     be made mandatory.
   483	 */
   484	
 > 485	static char *chrome_create;
   486	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
