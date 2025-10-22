Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3D91DB375
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Oct 2025 20:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761165320; cv=none; b=cumnKBu9fbZigyLnWkSjzcSe1aXJXTj1R3ZS70jA6s5Y8z4V2O+s7/6LM8v5zCYFjzEohmRCVF47t/MB45psDfN1QLqZRhPru6jeyr5c0tjzAyDyLWXBOJPkpak7X6aOjVl6FAGlz1Won9fNdriQVGVuqvOIbdvBAilJFq1paSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761165320; c=relaxed/simple;
	bh=NfS4FU/V3dtqhGqnji0/0iqCKTBoaEVvFSkUsxNMB4M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EyTxue1cJkWWd4rkcqkGRGY+VMbXkU+aCys9/T8Qsuhk965Ko4u19KJj0ln0Z/QIAMi6z6DLqtSYTibEOHY9fmkLvFQe1Btcd742Tw7+sAt6E8LXsCQ/KtQVD7fGKQ2dRNtK//MTeUr9uIo7R/T1Sk5c4LqPI2rtcGixdVh5W4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BKgWKAtF; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BKgWKAtF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761165319; x=1792701319;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NfS4FU/V3dtqhGqnji0/0iqCKTBoaEVvFSkUsxNMB4M=;
  b=BKgWKAtFLZOHsZu7FndwPRbZ8R3HyD/JL6e97YQyOiSxmS7XeuUhaQkq
   ACHZe8wca6yOafdJMhDKItJjFO2kvvG8UDi3us/1HZN3n2RDzaACdzG8x
   ZRFhSk4mMvyKIyNoCYcI8ytVIy6rnOP1t836dIQ/kwAGOBmpnndgKFkwT
   8jzHOv2MKqVWHEqDj+rG0xeWhTH6nYgV9Txv9j02zfkr+9+yvl99e/QVe
   RAbV9blVdtcaz1bvUy3vAWOaZmaSBIqJuwAltn/6GKYKG1s2V0drncEq+
   kHmwzDMKlceJrCdYwt3n+BVNUY/nr2hx9nRqaVIC7vyVgnp1T9kfi6Sga
   w==;
X-CSE-ConnectionGUID: xUx8RXYfTs+LlsNcxhQauQ==
X-CSE-MsgGUID: HVzvL7tDS5isQigDgU7Okw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74673214"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="74673214"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 13:35:18 -0700
X-CSE-ConnectionGUID: vmmowhRxT1qY2xpyfVWwHQ==
X-CSE-MsgGUID: Nvr7o1sNSQu1R0yZhUb/WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="207631830"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 22 Oct 2025 13:35:18 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBfYB-000CiJ-2D;
	Wed, 22 Oct 2025 20:35:15 +0000
Date: Thu, 23 Oct 2025 04:34:40 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:pinctrl-v1 4/9] xtensa-linux-ld:
 pinctrl-pic64gx-gpio2.c:undefined reference to
 `pinconf_generic_dt_node_to_map'
Message-ID: <202510230424.eu0JCE03-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pinctrl-v1
head:   e7c3beef266db8d0c6d94aca5e7aba57c1fcd056
commit: 586afdcca4f5a6d3e5ce6f3d470abbd1b09c7304 [4/9] pinctrl: add pic64gx "gpio2" pinmux driver
config: xtensa-randconfig-001-20251023 (https://download.01.org/0day-ci/archive/20251023/202510230424.eu0JCE03-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510230424.eu0JCE03-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510230424.eu0JCE03-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: drivers/pinctrl/pinctrl-pic64gx-gpio2.o: in function `pic64gx_gpio2_pinmux_get_groups':
   pinctrl-pic64gx-gpio2.c:(.text+0x1e8): undefined reference to `pinconf_generic_dt_node_to_map'
>> xtensa-linux-ld: pinctrl-pic64gx-gpio2.c:(.text+0x1fa): undefined reference to `pinconf_generic_dt_node_to_map'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
