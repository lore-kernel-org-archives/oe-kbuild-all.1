Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9832936F426
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jun 2026 22:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782255052; cv=none; b=YzQhY3pijPQm6CRw6KwisgSXTT9s5zji7nQXg9v5ORP64bci2imsj+FmOvq750eYmtaI+PTBnqF+ABJpAE6N0JGJycWcD6usnJ3Agxb0PWhk8KTff1Z6i3UrVgyI2kvl825mZG7dcgs5uaNpP76sIYrV7JS7hymNHEn+YPKnnUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782255052; c=relaxed/simple;
	bh=qej0RT7Pkq6Nud3dQkTN5EI7HPPLnqg2wucs2DbYXUo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Elwe+gdbW9pZROi/cK7lyEFHoLxIAvkvAHgFnMmTwelp7N9Dm9o7tmxVMSX1ijQ1PRZKxe7uyrNmDwVsgensWu2VormDSoiB7w2Q20j9cn87UmVCxNEJEwKLGi6bpdb9mm4AU/KFKG2fh/WqhrrjuOAjlQhrmASAoqs2NbH0qlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ixTQ+Pzm; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ixTQ+Pzm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782255051; x=1813791051;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qej0RT7Pkq6Nud3dQkTN5EI7HPPLnqg2wucs2DbYXUo=;
  b=ixTQ+PzmKtYTKu7XvexfM/fVI9f/ZrxEnujEU5HGG3yx+pfDrGPKS5Pm
   ONaoPu9xVH8uHBkhWNvGiXNp/0cfPJ4MxNfgE22oUeUQtuEkzlk9ECa8d
   1ZnJWyoR5pZmZ0encVD4o5NTlxmrSGAK8GNG/Z7DrlxAA+8KhJYHVV3aL
   Xh5AdD/0L3RGGg9MfcP5zDwGtutLLVfQC9H8uZSVTvJZLg/miopellNsv
   kNYRpu+29m9+6mAnp6Sy3meg4khvF0VktGkU+1dP0zwpcAJqxfC94LzGO
   Onh8QwhJku/Ps3kpNME/In3eBvRXj0HEJ7wNI9bsixUvHOB0BW97n30tJ
   Q==;
X-CSE-ConnectionGUID: uWDAukeHTWKWSKwoEtaYFQ==
X-CSE-MsgGUID: K9StZbUUSGyssneMgMwg0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="94128360"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="94128360"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 15:50:50 -0700
X-CSE-ConnectionGUID: dUS8Z78UTG2rNxOeWzxHag==
X-CSE-MsgGUID: +oW2I180SIS+cbH9huxxWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="273339332"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 23 Jun 2026 15:50:48 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wc9x8-000000002wT-1kGV;
	Tue, 23 Jun 2026 22:50:46 +0000
Date: Wed, 24 Jun 2026 06:50:20 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/b4-sysfs-const-attr-prep-easy 38/57]
 drivers/pci/slot.c:111:18: error: initialization of 'struct attribute **'
 from incompatible pointer type 'const struct attribute * const*'
Message-ID: <202606240616.sDzOjpk2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/b4-sysfs-const-attr-prep-easy
head:   67a3c6abb9033d2ce2a9ac12d4cfb9530148b38f
commit: e336a966dae35aa3b0795b315b543fb744b61ff0 [38/57] pci
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260624/202606240616.sDzOjpk2-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260624/202606240616.sDzOjpk2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606240616.sDzOjpk2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/slot.c:111:18: error: initialization of 'struct attribute **' from incompatible pointer type 'const struct attribute * const*' [-Wincompatible-pointer-types]
     111 |         .attrs = pci_slot_default_attrs,
         |                  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/slot.c:111:18: note: (near initialization for 'pci_slot_default_group.<anonymous>.attrs')


vim +111 drivers/pci/slot.c

e4f9ab031dc86c Niklas Schnelle 2026-04-07  109  
e4f9ab031dc86c Niklas Schnelle 2026-04-07  110  static const struct attribute_group pci_slot_default_group = {
e4f9ab031dc86c Niklas Schnelle 2026-04-07 @111  	.attrs = pci_slot_default_attrs,
e4f9ab031dc86c Niklas Schnelle 2026-04-07  112  };
e4f9ab031dc86c Niklas Schnelle 2026-04-07  113  

:::::: The code at line 111 was first introduced by commit
:::::: e4f9ab031dc86c9987c3619e97c5c7d8ad7afda2 PCI: s390: Expose the UID as an arch specific PCI slot attribute

:::::: TO: Niklas Schnelle <schnelle@linux.ibm.com>
:::::: CC: Vasily Gorbik <gor@linux.ibm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
