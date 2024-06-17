Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3C028FC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 22:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718664919; cv=none; b=jt04/EL5voi9KpTRv5uyCL3YiqumciC71sY+lyuImKDd/BZAsVO0sW4wPAvmBMC+MS5UequA60OUTkh88Wo21KllaU8DTsKNJgbcj+r+3a8sx9jeXWIAAHDxv8TLN84K41hVUyLf3vCFl13b+NAnnjIkbPQbZAzLkzcXhTymdnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718664919; c=relaxed/simple;
	bh=Tif8D2wp20T7CeXFqkg2/OobayI1WZwCun93i7fPHGs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kMAK5GbpMZmSPvJ4Av6pU6r3TYam/gol+VVY/LoT04PmTuWKtW0AtxrVjnbEMkYHVWLRm0vAVSQEdSoXVr/yro1kVXIXEAwD5M4PGFaGDvcBZm03JSfKlVR+cEATV8+ACDhSB/MzY9Q7BelJRzhY98PNpCeqvTVuw0xbdpn88nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NIGg0hJU; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NIGg0hJU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718664917; x=1750200917;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tif8D2wp20T7CeXFqkg2/OobayI1WZwCun93i7fPHGs=;
  b=NIGg0hJUCrynvsABButYIVE+Ggvf1GPCO48RnQCccZpf+pFvAYa39xm/
   3XUJOiD2Q25jE/RExzQ0nwpNp2/5spqsH4L+Yos8SKLOHFs0CXcDGeEPq
   QBO4PK55vnDks7jtjiDDXRwYpwoAD60HWWOW8xnO7833zA15rLjFfCSof
   ZAX+yCHnzXQhWkdF+NbVbppbRbhQg8lVOwUZ0zJU8qCPNHXq7AgVkH+6K
   Z3w2/xCFDeEl7T3KTL5ZoxNNnwgXH7OnjM0RAeG5rswnDAh5FhuaOapwo
   q5eqrSZikEGXaTM9T8tMEIue2glfnzkCIJ5DYo5qxfuezwqRZ1v/3YzWG
   w==;
X-CSE-ConnectionGUID: dI+e0U3uRjGvi+53SJ9t9g==
X-CSE-MsgGUID: W7Rul/J9TeSz+rC31Cm/Mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="26927457"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; 
   d="scan'208";a="26927457"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 15:55:17 -0700
X-CSE-ConnectionGUID: uhwXgQ0kT0iEmi+t1aWdzA==
X-CSE-MsgGUID: fZAezx+zRf2nJE3gx+OjbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; 
   d="scan'208";a="45879962"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Jun 2024 15:55:15 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJLFp-0004yN-1r;
	Mon, 17 Jun 2024 22:55:13 +0000
Date: Tue, 18 Jun 2024 06:54:47 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.19.y-cip 3958/9999]
 arch/arm64/boot/dts/renesas/r8a774c0-ek874.dtb: Warning
 (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used
 in node /soc/pcie-ep@fe000000)
Message-ID: <202406180646.axcSDXxF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip
head:   80b2464ae89aaaa73b7a2daa3526c1ed9971ab5a
commit: 5d63770a26dcbf9965903c2df51f1aaf176c53f8 [3958/9999] arm64: dts: renesas: r8a774c0: Add PCIe EP node
config: arm64-randconfig-001-20240609 (https://download.01.org/0day-ci/archive/20240618/202406180646.axcSDXxF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240618/202406180646.axcSDXxF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406180646.axcSDXxF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a774c0-ek874.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
--
>> arch/arm64/boot/dts/renesas/r8a774c0-cat874.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
--
>> arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
