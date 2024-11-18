Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AD97483
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 14:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731939404; cv=none; b=sp34XVnm3s2vBNDmNv01VRGJgB0YTAQbPjsxvnvdJclGtd3o0kiui/8lqkKpe29ORsF8tLwiQCawSBkyuyXY9eBoscwtMD+3QfVUUUDmBJBHvnkpMbCYtA/5X/f5yZur6ZCEueV74UgBS0Unsc4WXZr14EGVoy+d9w1OBFpObP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731939404; c=relaxed/simple;
	bh=1OQk4+uNA3i6fZAFDhKn21H/IerZ8ttS6VCBl3DPwIE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZeAppMoqV4FikfWTdW26OmfJRdrrC7sUCjuGkTx75DUMHGx1hoC+32QONrBk9JJ29YNMbCUWvENG/k09NmVslphTlRlGciE5JR29QhYPE5KnFC+2XIrNITtNhBInUjBcv+w0FjzjLrdgJAhssa37nI2kni1d0Ay+Gj23DaPEmpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EiHFFy2g; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EiHFFy2g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731939402; x=1763475402;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1OQk4+uNA3i6fZAFDhKn21H/IerZ8ttS6VCBl3DPwIE=;
  b=EiHFFy2gqbmcz/RrrHJxzJNNyQDPTZLOOnciB9RBAmUuFNiflK3IxBoT
   zcHNgeI16PJYkwv7H+hRQaWf4xYjtgEw365XVh4Ws275334HI8HrNZG67
   MrnuuO+53rdy6GaMvVMAKpg4RptwjEZxwhiY7wwx4Bbp3LanVPzMOg7dT
   jIBuRQZAJVADZ3KXBwCWoMrHqj6Pv9CSJzLO2fIyKki7DGbIiSjjtZBS+
   54sT7QG+KRxR3pYP94os2codo7glSNfhJdCxMYIT6iZT8BLXx2D37qL77
   8pvDQVICON6U+UxB2nRU7i43Wlwkweq4XDkAOmMaEhXHNscgcwlxJbXCB
   g==;
X-CSE-ConnectionGUID: LtoZ4GCuTRGAHG0qusYDww==
X-CSE-MsgGUID: AOmyHL/STqSMgLKk8P8zCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="42526638"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="42526638"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 06:16:41 -0800
X-CSE-ConnectionGUID: 1J94pq++T56+/+mkWChIpA==
X-CSE-MsgGUID: ngES/Z1OToibupnsIjl7+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="89650775"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Nov 2024 06:16:40 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tD2YQ-0002Sn-1h;
	Mon, 18 Nov 2024 14:16:38 +0000
Date: Mon, 18 Nov 2024 22:16:12 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/090-spi-hid 26/28]
 drivers/hid/spi-hid/spi-hid-apple-core.c:157: warning: Function parameter or
 struct member 'id' not described in 'spihid_msg_hdr'
Message-ID: <202411182256.jTIqJd0B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   501868c5f377ff4155041d111e0bea3c499b97a8
commit: b5bba614a2b8c3b251d3471c9432d937b7a404a7 [26/28] fixup! WIP: HID: transport: spi: add Apple SPI transport
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20241118/202411182256.jTIqJd0B-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411182256.jTIqJd0B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411182256.jTIqJd0B-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hid/spi-hid/spi-hid-apple-core.c:157: warning: Function parameter or struct member 'id' not described in 'spihid_msg_hdr'
>> drivers/hid/spi-hid/spi-hid-apple-core.c:157: warning: Excess struct member 'msgid' description in 'spihid_msg_hdr'


vim +157 drivers/hid/spi-hid/spi-hid-apple-core.c

3e9720421fcee0 Janne Grunau 2021-12-10  125  
3e9720421fcee0 Janne Grunau 2021-12-10  126  /**
3e9720421fcee0 Janne Grunau 2021-12-10  127   * struct spihid_msg_hdr - common header of protocol messages.
3e9720421fcee0 Janne Grunau 2021-12-10  128   *
3e9720421fcee0 Janne Grunau 2021-12-10  129   * Each message begins with fixed header, followed by a message-type specific
3e9720421fcee0 Janne Grunau 2021-12-10  130   * payload, and ends with a 16-bit crc. Because of the varying lengths of the
3e9720421fcee0 Janne Grunau 2021-12-10  131   * payload, the crc is defined at the end of each payload struct, rather than
3e9720421fcee0 Janne Grunau 2021-12-10  132   * in this struct.
3e9720421fcee0 Janne Grunau 2021-12-10  133   *
3e9720421fcee0 Janne Grunau 2021-12-10  134   * @unknown0:	request type? output, input (0x10), feature, protocol
3e9720421fcee0 Janne Grunau 2021-12-10  135   * @unknown1:	maybe report id?
3e9720421fcee0 Janne Grunau 2021-12-10  136   * @unknown2:	mostly zero, in info request maybe device num
3e9720421fcee0 Janne Grunau 2021-12-10  137   * @msgid:	incremented on each message, rolls over after 255; there is a
3e9720421fcee0 Janne Grunau 2021-12-10  138   *		separate counter for each message type.
3e9720421fcee0 Janne Grunau 2021-12-10  139   * @rsplen:	response length (the exact nature of this field is quite
3e9720421fcee0 Janne Grunau 2021-12-10  140   *		speculative). On a request/write this is often the same as
3e9720421fcee0 Janne Grunau 2021-12-10  141   *		@length, though in some cases it has been seen to be much larger
3e9720421fcee0 Janne Grunau 2021-12-10  142   *		(e.g. 0x400); on a response/read this the same as on the
3e9720421fcee0 Janne Grunau 2021-12-10  143   *		request; for reads that are not responses it is 0.
3e9720421fcee0 Janne Grunau 2021-12-10  144   * @length:	length of the remainder of the data in the whole message
3e9720421fcee0 Janne Grunau 2021-12-10  145   *		structure (after re-assembly in case of being split over
3e9720421fcee0 Janne Grunau 2021-12-10  146   *		multiple spi-packets), minus the trailing crc. The total size
3e9720421fcee0 Janne Grunau 2021-12-10  147   *		of a message is therefore @length + 10.
3e9720421fcee0 Janne Grunau 2021-12-10  148   */
3e9720421fcee0 Janne Grunau 2021-12-10  149  
3e9720421fcee0 Janne Grunau 2021-12-10  150  struct spihid_msg_hdr {
3e9720421fcee0 Janne Grunau 2021-12-10  151  	u8 unknown0;
3e9720421fcee0 Janne Grunau 2021-12-10  152  	u8 unknown1;
3e9720421fcee0 Janne Grunau 2021-12-10  153  	u8 unknown2;
3e9720421fcee0 Janne Grunau 2021-12-10  154  	u8 id;
3e9720421fcee0 Janne Grunau 2021-12-10  155  	__le16 rsplen;
3e9720421fcee0 Janne Grunau 2021-12-10  156  	__le16 length;
3e9720421fcee0 Janne Grunau 2021-12-10 @157  };
3e9720421fcee0 Janne Grunau 2021-12-10  158  

:::::: The code at line 157 was first introduced by commit
:::::: 3e9720421fcee09b84530586b0c0ed172758b57f WIP: HID: transport: spi: add Apple SPI transport

:::::: TO: Janne Grunau <j@jannau.net>
:::::: CC: Janne Grunau <j@jannau.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
