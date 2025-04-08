Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BA01EB194
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Apr 2025 14:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744122427; cv=none; b=RzWvuuAl9K7Uil+gC/OBOnOPX2Fca0gsvcPHXVBmzONX8Kl1+hmDMDnDY15BvmO8/2gOrOQ1kg40zASAzIsPknrzGMarFUI1cGMszBBQBGj+iOMwBRXyjmYqAfWcbfydbE7ciZ0M4V3T25XAPkU8b55vELNjxWgXocGAwAB7diI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744122427; c=relaxed/simple;
	bh=ZscHYs1mxfHQ8INbw2ucAtuufg2CzlHTwetTwQmV1sM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I/Z4mtyeUAIIWlBHDLsAl3XwJ3lisuDvJyBTWFg9h2piQaKKgh6ihmNTW/alPhPEXgBe34/WjwiOJ0dA8KNv2T8Q5vWrTXAYiVpa6MgH5SI5aYNznqJVS2g8B+1HXcIS9DeHMWv+971zHPmwFkPxh+yeaYPzKS7oj/8F5iwLxHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tkn9r+B9; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tkn9r+B9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744122425; x=1775658425;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZscHYs1mxfHQ8INbw2ucAtuufg2CzlHTwetTwQmV1sM=;
  b=Tkn9r+B9ntBhTOsUxr3oMQxRNq1kCPg10eqPMh/+AxpnYcy2tqWfYsdj
   V8zIn7ffdk93m/hWQ47Esw10IcCRQNd/2MNTX93ynxQZJcSkaZ80dQ+T7
   97ZHzJbmQGNAUTya/DgwBFa6ZPrbveEeOMoJRnEn8ZBXTuV2Wx2NWfbku
   aV321gG71xvTLL+qfhr+HRYGosWhrMdOvspuioThOLiAaLqTQPcoEprWx
   PFXexH3d/unic4ir0ShakScM4eKWvZlo2Js/j5ZZFhcAVNjqxII9Xufuq
   Y98gxYK4J4e3lAjsd4pOn5kFifv43us2VxTyswyQ3CEK3F+oE3gvxrooY
   g==;
X-CSE-ConnectionGUID: ApQNpGm/TpCCOx0FEhxq/g==
X-CSE-MsgGUID: U1oWUX10TlisAYbHg/bUtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="33162393"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="33162393"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 07:27:04 -0700
X-CSE-ConnectionGUID: 1YUNjdKOT3iUOAv7EA39dA==
X-CSE-MsgGUID: KGqe97Y/TJOXP52VH83fLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="128157172"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Apr 2025 07:27:04 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u29un-0007ZD-29;
	Tue, 08 Apr 2025 14:27:01 +0000
Date: Tue, 8 Apr 2025 22:26:41 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 9/9] kismet: WARNING: unmet direct
 dependencies detected for IMS_MSI_ARRAY when selected by VFIO_MDEV_IDXD
Message-ID: <202504082232.KqEYcPom-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   c55bd07f747cd457f58e5781279fa11a5fc0add1
commit: ed1b6dfe39ba3a1a37a242d0ef4dfb7b5ec06987 [9/9] vfio/mdev: idxd: add virtual device emulation support
config: x86_64-kismet-CONFIG_IMS_MSI_ARRAY-CONFIG_VFIO_MDEV_IDXD-0-0 (https://download.01.org/0day-ci/archive/20250408/202504082232.KqEYcPom-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250408/202504082232.KqEYcPom-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504082232.KqEYcPom-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for IMS_MSI_ARRAY when selected by VFIO_MDEV_IDXD
   WARNING: unmet direct dependencies detected for IMS_MSI_ARRAY
     Depends on [n]: PCI [=n]
     Selected by [y]:
     - VFIO_MDEV_IDXD [=y] && VFIO [=y] && VFIO_MDEV [=y] && X86_64 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
