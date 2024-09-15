Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E542CA6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Sep 2024 14:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726411251; cv=none; b=XjZviiJAU0jbt6MBZfpDAR+DmdDLvtIzIcBKYI6FXtJsfasTTz2jBVYemES68fLKLnGjhuA+p5G9eS2DwA6X6n1H7rNUlGkpGq4LusoXO+uDzIryd0xXejOOBfAj1nlLNSnNNB2K/fsJuxOXLRl1CCwXrZkGpjPuaq57Wt+02RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726411251; c=relaxed/simple;
	bh=al9uvuMS1ZTN7CaTqvEQIOedJtSCnin2SKnYlJKq+uE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l/92BzeSis4TQjW65pelKcsn1z4Vg4Dv00TdUP4rZUMOmg8om40gvsfntjXi7Bwm5UNXATE1pJaTpPS1EacO1naFA8oBR6va02E2HpShC8ZPEXx6z+x4Z+/TPe/kFyjlQsSttR4X0Ak3WvuueY79rXZ3PVjYSoXz9w2t/1KLYJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iQlI9nE6; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iQlI9nE6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726411249; x=1757947249;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=al9uvuMS1ZTN7CaTqvEQIOedJtSCnin2SKnYlJKq+uE=;
  b=iQlI9nE6kfrq6/LHVb37EDuTbyGIeC/cyH2Gk4FvM7dYArWBCPR0zPvo
   fqSiw34GTGhnthXpiOFQhSVwgwDC261VzKikHBJvzNrb/N3PcfhAk5Nui
   VZoWBA+xr/+oypHLuoTYM5lW7QwpsOyAXwX+t3E7k/GHYhVeYRvyDXb9f
   +a6TAlbsVy5EeJAjv4gZTIhvpwiP4ged0GZvXREUsTYhsiFcCFzq/POHD
   g9jA5BPfNhaBWw2/QvpNkxpTLf4XDjxJmaTOHNMDOoL1l7zHpC1SPaLnB
   mll6hHN8Z9hLqVMDmH9PdXwYzcmc3jIwc4L8dLwUamezuiDzjud4Czv7R
   Q==;
X-CSE-ConnectionGUID: KrRSZyF0RYiL43oo+iHO3Q==
X-CSE-MsgGUID: djHk7R+jRiWXqRocv4Zk0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="42771638"
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="42771638"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 07:40:48 -0700
X-CSE-ConnectionGUID: uQTssEtoTrOfcim0Y2pEFw==
X-CSE-MsgGUID: pU9uFn8kQkyDeqC5fyr5rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="99316567"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 15 Sep 2024 07:40:47 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spqQf-0008kS-01;
	Sun, 15 Sep 2024 14:40:45 +0000
Date: Sun, 15 Sep 2024 22:40:42 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2key-v8 11/11] ERROR: modpost: "tpm_buf_read"
 [crypto/asymmetric_keys/tpm2_key_ecdsa.ko] undefined!
Message-ID: <202409152237.wGgqfwwj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2key-v8
head:   79e909153c0a5ac21c2c5c0d4eac9229b3408178
commit: 79e909153c0a5ac21c2c5c0d4eac9229b3408178 [11/11] keys: asymmetric: Add tpm2_key_ecdsa
config: csky-randconfig-r061-20240915 (https://download.01.org/0day-ci/archive/20240915/202409152237.wGgqfwwj-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240915/202409152237.wGgqfwwj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409152237.wGgqfwwj-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_simpleondemand.o
>> ERROR: modpost: "tpm_buf_read" [crypto/asymmetric_keys/tpm2_key_ecdsa.ko] undefined!
ERROR: modpost: "led_init_default_state_get" [drivers/net/dsa/realtek/rtl8366.ko] undefined!
ERROR: modpost: "devm_led_classdev_register_ext" [drivers/net/dsa/realtek/rtl8366.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
