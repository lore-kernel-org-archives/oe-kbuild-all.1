Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D2538F97
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Nov 2024 00:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730594166; cv=none; b=VPBJtZSntfMMv4SvW0CEMQ7ACaIrFaYy4Mnp35/Q0Tc9ekosS1E1+e8jCE2ISnMeDkftqCCttDN/qVWUbumVobbuxDm7qYKXz1QNmZUAI0NKC+nKiZqJtWG18D/JQHR3QzyBI30Bi4C1KBnFyYlW6AvXh1kzjpBhWc+UEsiNdn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730594166; c=relaxed/simple;
	bh=nbe2E/kuz23KVMB6pU+e7/bekltIcp6hB7K5xEPwvbs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P4apb3B1J86d3f98xZ6Q/LxP7ixmPxH3vQLSF6gG024hnjhn6o2+tdzcSXWPgZPhKLUVxdBxePXTTZawNe/geG0aeEv6lnIiDRmhjLoI6GoyU+MuE+N6q8399FIDDyq/ETN2CItVThE7POo+NBHmHabN9asqNaYAOFR4PlY0NWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FRNPYArQ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FRNPYArQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730594165; x=1762130165;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nbe2E/kuz23KVMB6pU+e7/bekltIcp6hB7K5xEPwvbs=;
  b=FRNPYArQrWIdchKK9PhoKCGF6PoAEGRak+r7GaS2/SiEizNI13J4Hzdn
   eM5wgR5Jue50mX0SMxEsLs0o1AKjMqK7bxbhe4E52x9FeBc7l8USONbc7
   JfWQMQNOAh/Azgln4oJgHCPHjxxR9ZKWkqTgOHa1djmRCHDQM0e+m07oJ
   dWl9c/W383bZK5aGdgkDEwoED6rDtnJ2JEGc1kirGB3T80rfVqSAWFaNt
   90HleGxd8vZNC9cNHb/wOqEeWmi15wjJMdjI+qggQ9zRhZ+plI+b0cHuY
   QuIjeeEbT995G68ftkdPovK2Nzs6YiLDtLuLasPVgOCsrPE8r+Uyd7Lvv
   Q==;
X-CSE-ConnectionGUID: p4EY0m+wQPu7c2CHM9IJFA==
X-CSE-MsgGUID: ouLuj4i7T8WV7qHyobfHDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34013732"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34013732"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 17:36:05 -0700
X-CSE-ConnectionGUID: QBDG08ftRfSHNGKW6HeHtg==
X-CSE-MsgGUID: ra3//Z2eR8eA27zLBKYklw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,253,1725346800"; 
   d="scan'208";a="84116251"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 02 Nov 2024 17:36:04 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7Ob3-000jVl-0z;
	Sun, 03 Nov 2024 00:36:01 +0000
Date: Sun, 3 Nov 2024 08:35:40 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:pci/apple-host-bridge-hook 7/7] ld:
 drivers/pci/controller/pci-xgene-msi.o:undefined reference to
 `msi_lib_init_dev_msi_info'
Message-ID: <202411030800.ovh6XHbu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git pci/apple-host-bridge-hook
head:   4109e0e2e9d3fb7de4ae6f3bade444cdc07c9b9a
commit: 4109e0e2e9d3fb7de4ae6f3bade444cdc07c9b9a [7/7] PCI: xgene: Convert to MSI parent infrastructure
config: i386-buildonly-randconfig-003-20241103 (https://download.01.org/0day-ci/archive/20241103/202411030800.ovh6XHbu-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241103/202411030800.ovh6XHbu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411030800.ovh6XHbu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld: drivers/pci/controller/pci-xgene-msi.o:(.rodata+0x2fc): undefined reference to `msi_lib_init_dev_msi_info'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
