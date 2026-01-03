Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFE9145A1F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Jan 2026 21:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767477417; cv=none; b=qcYdAoOfrieZmac5qOu45eRecQrxN6ay0VBLpNhwHU1aKtVuJ1mtepNTnH+SrkYsb2SuMcHu1QdttguaEkTEGdrX7pvZVvA28wOn/0Qn/lIpzZZxE8qOBn4eBCem8O61k40n1ToTc05Lj3xSoMLVeVvkvuVARNXyk/dfvkK6qsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767477417; c=relaxed/simple;
	bh=5FKSffymmJnTGILRGNLa1iY4Mk1Fuw1L/vWDyTyDo1s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DQEEyn565w3SZjRpEBiNjhzrWw9dVMfkqJsCl6Xr2D2i53Fe2nIaXx/kFvlcitLZGsmd/dCnQDKCIRPyCh8u5XjTVtGaGSHYJEHlkmqVQLDZRJeVvQQpuvZ7INjgt+lol0bVB2lnV4tkv/4U5xxFDlilLU1mNS0SoFy0yy51a9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lmr7Geva; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lmr7Geva"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767477414; x=1799013414;
  h=date:from:to:cc:subject:message-id;
  bh=5FKSffymmJnTGILRGNLa1iY4Mk1Fuw1L/vWDyTyDo1s=;
  b=Lmr7GevabpF6q0gdggWrUk8reiAdKUyIAq1ihipjIXdXLdOGQAn3Vz9A
   8QITm1TFips7YKaI5qQo2HgJb27wun8wm21nZpznaxra36TUklHr2LS1b
   IX220yBPwTwWtvmVYXAYONfOk4MkaSDduQSFO2X3zRHfUcF4BOyme9GgW
   9rT2/bYEauQmr9DPBMkeaT/TJBSnc8PxMKO6QoZ9qoaD1/ZYDF9ReFGRd
   3FWvjku5Tym39ZeJciLp1TAhAslsiffQqHOzGzq/FTjlnN5LQA36JCiRD
   N6zjbqBbW2AVhSunoQJeIJPARWUKPAN+wIUBn5bOlxiqtKMft5CZWrngT
   w==;
X-CSE-ConnectionGUID: qrX8R1xqTSyJl7NEKLmrig==
X-CSE-MsgGUID: b+7VcS7QR0CQW8QrG2iRSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="72763851"
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="72763851"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2026 13:56:54 -0800
X-CSE-ConnectionGUID: uL5gEKLHQku6tMFlqo6vEQ==
X-CSE-MsgGUID: Vh570ciMRE62OKCPwEmnZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="233175878"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 03 Jan 2026 13:56:53 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vc9cA-000000000G9-3U7v;
	Sat, 03 Jan 2026 21:56:50 +0000
Date: Sun, 04 Jan 2026 05:56:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 1/1]
 drivers/net/dsa/microchip/ksz8795.c:820:5: sparse: sparse: symbol
 'ksz8795_port_vlan_prepare' was not declared. Should it be static?
Message-ID: <202601040558.0s6sWo8S-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   a0f93b828ee5433c5b427d8122a6dda0b514d985
commit: 5033d5e231551162e7830c6cb42851b37ea4ff65 [1/1] net: dsa: microchip: ksz8795: Reject unsupported VLAN configuration
config: arm64-randconfig-r122-20251224 (https://download.01.org/0day-ci/archive/20260104/202601040558.0s6sWo8S-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260104/202601040558.0s6sWo8S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601040558.0s6sWo8S-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/dsa/microchip/ksz8795.c:820:5: sparse: sparse: symbol 'ksz8795_port_vlan_prepare' was not declared. Should it be static?

vim +/ksz8795_port_vlan_prepare +820 drivers/net/dsa/microchip/ksz8795.c

   819	
 > 820	int ksz8795_port_vlan_prepare(struct dsa_switch *ds, int port,
   821				      const struct switchdev_obj_port_vlan *vlan)
   822	{
   823		struct ksz_device *dev = ds->priv;
   824	
   825		/* Reject attempts to add a VLAN that requires the Remove Tag
   826		 * flag to be changed, unless there are no other VLANs
   827		 * currently configured.
   828		 */
   829		if (ksz8795_port_vlan_changes_remove_tag(ds, port, vlan)) {
   830			unsigned int vid;
   831	
   832			for (vid = 1; vid < dev->num_vlans; ++vid) {
   833				u8 fid, member, valid;
   834	
   835				/* Skip the VIDs we are going to add or reconfigure */
   836				if (vid == vlan->vid_begin) {
   837					vid = vlan->vid_end;
   838					continue;
   839				}
   840	
   841				ksz8795_from_vlan(dev->vlan_cache[vid].table[0],
   842						  &fid, &member, &valid);
   843				if (valid && (member & BIT(port)))
   844					return -EINVAL;
   845			}
   846		}
   847	
   848		return ksz_port_vlan_prepare(ds, port, vlan);
   849	}
   850	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
