Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA6A19C552
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Feb 2025 06:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739860662; cv=none; b=L0sKK+Nyrgtx6m9N3eNBOH2bz60HgZqm4sciwIWvz8lP464otrvzSbSLGSC0l0hDDfPt13XGJu3IDe7h/t3N2cGR6b2sQakf7n527F7E3xrroyoJx4CHAZNlISp66RZD8iKTkCX5DF1y6LhZzXbqITz25Fjaysxbu9SNMuzlDdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739860662; c=relaxed/simple;
	bh=SzdOeTiG0eZX/amX1Lh6NVvvA6u4Yo5lhiiG8eWfp2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iAAzsXtRrUXpB6/KI5sBCIqrUrnWIN0VD1DN8moEEMKvDU+aoDzBuStv6OQDXVnmbBftlTxvQGSWiqvxELppTJAU2s0Xn/dE/6L3JnQMlBXmQwjj0M0D+ds5djXs5VquLzhUr4lPnRHpZ1m2Nvns7ZL5Fheo2Lgvm8vXSj7tp4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nCVFFhCm; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nCVFFhCm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739860660; x=1771396660;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=SzdOeTiG0eZX/amX1Lh6NVvvA6u4Yo5lhiiG8eWfp2Q=;
  b=nCVFFhCmdk5qh9B5Ug/K0Wsl/pvKpOUln16MNQqWgsoPF+ie28jRd3nR
   IH+awJZC/w04aAIY18TcvbIdEKMyuewNVKzwHsh97iIE7bK8lXw7KTcAB
   vNIhKve6ycBiYc95GYDNapkBDcQX88GL9vtrM2eGj/WAxOMeLXsAtWsPc
   00ZifoePrWm6kBqUMaxdTtKg4q92n3DU/70BQKfrHlzGuN8ujVuE2QKWy
   /0HECofhRsEHv5X49FXU6Powl6TPo0Xfn3J4L05fC+DzD1h0QSreQG5HG
   7sSuth9/qVKE3365PVZFwmScMRAO0d9tCLdqWHSga4O/IX1S7BDE1cJUu
   A==;
X-CSE-ConnectionGUID: MZ650cuSSHGg/aYBSn28Kg==
X-CSE-MsgGUID: 6vcP+ra8Q7SmwoRg01pvEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="65899022"
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; 
   d="scan'208";a="65899022"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 22:37:39 -0800
X-CSE-ConnectionGUID: e+YM2BdXSruw+A9yaTkASQ==
X-CSE-MsgGUID: k7Z1LevkQjyfXRkjxJJkqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114770621"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 17 Feb 2025 22:37:39 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkHEd-0000Ex-23;
	Tue, 18 Feb 2025 06:37:35 +0000
Date: Tue, 18 Feb 2025 14:36:54 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/sysfs-const-bin_attr-final 29/29]
 include/linux/sysfs.h:293:10: error: 'const struct attribute_group' has no
 member named 'bin_attrs_new'; did you mean 'bin_attrs'?
Message-ID: <202502181418.aeH15ZWT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/sysfs-const-bin_attr-final
head:   cdb55c2d6c381787e77159486c9d41a86906b2df
commit: cdb55c2d6c381787e77159486c9d41a86906b2df [29/29] sysfs: remove attribute_group::bin_attrs_new
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250218/202502181418.aeH15ZWT-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250218/202502181418.aeH15ZWT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502181418.aeH15ZWT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kobject.h:20,
                    from include/linux/energy_model.h:7,
                    from include/linux/device.h:16,
                    from drivers/s390/cio/cio.h:6,
                    from drivers/s390/cio/chp.c:24:
>> include/linux/sysfs.h:293:10: error: 'const struct attribute_group' has no member named 'bin_attrs_new'; did you mean 'bin_attrs'?
     293 |         .bin_attrs_new = _name##_attrs,                         \
         |          ^~~~~~~~~~~~~
   drivers/s390/cio/chp.c:221:1: note: in expansion of macro 'BIN_ATTRIBUTE_GROUPS'
     221 | BIN_ATTRIBUTE_GROUPS(measurement);
         | ^~~~~~~~~~~~~~~~~~~~
>> drivers/s390/cio/chp.c:221:22: error: initialization of 'const char *' from incompatible pointer type 'const struct bin_attribute **' [-Wincompatible-pointer-types]
     221 | BIN_ATTRIBUTE_GROUPS(measurement);
         |                      ^~~~~~~~~~~
   include/linux/sysfs.h:293:26: note: in definition of macro 'BIN_ATTRIBUTE_GROUPS'
     293 |         .bin_attrs_new = _name##_attrs,                         \
         |                          ^~~~~
   drivers/s390/cio/chp.c:221:22: note: (near initialization for 'measurement_group.name')
     221 | BIN_ATTRIBUTE_GROUPS(measurement);
         |                      ^~~~~~~~~~~
   include/linux/sysfs.h:293:26: note: in definition of macro 'BIN_ATTRIBUTE_GROUPS'
     293 |         .bin_attrs_new = _name##_attrs,                         \
         |                          ^~~~~


vim +293 include/linux/sysfs.h

3493f69f4c4e87 Oliver Schinagl  2013-07-14  290  
46ad057245912f Heiner Kallweit  2021-05-19  291  #define BIN_ATTRIBUTE_GROUPS(_name)				\
46ad057245912f Heiner Kallweit  2021-05-19  292  static const struct attribute_group _name##_group = {		\
92d6254f581200 Thomas Weiﬂschuh 2024-12-05 @293  	.bin_attrs_new = _name##_attrs,				\
46ad057245912f Heiner Kallweit  2021-05-19  294  };								\
46ad057245912f Heiner Kallweit  2021-05-19  295  __ATTRIBUTE_GROUPS(_name)
46ad057245912f Heiner Kallweit  2021-05-19  296  

:::::: The code at line 293 was first introduced by commit
:::::: 92d6254f58120011c93610b4cb7def214409731d sysfs: constify macro BIN_ATTRIBUTE_GROUPS()

:::::: TO: Thomas Weiﬂschuh <linux@weissschuh.net>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
