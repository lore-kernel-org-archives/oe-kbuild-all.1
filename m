Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B7D19ABAC
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 21:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733778836; cv=none; b=LpXJurQOA+N9HZ1N1qAgbZ3Divxpjn2jMqt3KlOxEQu2MpbwfMd+mZ3O7/i2JKQTeyiuxfiNJrQldlnrmtUjFtnpdZckbqB8wLm5F8+Kno9IPo/DdsdmFwjjCRmypc1sPwxVF5tZxoX2WsENw598wUvttlF/gRj5U2TBuJjz7PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733778836; c=relaxed/simple;
	bh=XfTDQRWvpB9LqasNeyrDse5prX4npB2RyBL/G9FYNMY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s2neIg0qQnID/2HSWgDYOX4l5EGz5i1h3o4Z1NylZKNGp2xaO283LUKgpOiTwCaTSxLfJ6UsGbRDMTikNxktxBc37bKqXF4ZKVG5YOvU+jeKq5JqVdqIVPnfyf/R4G4T2Vcy7/0nLpm3kWVbMgFPdBM1MrnY7dYrFua3Zgh3WuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cDjTtage; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cDjTtage"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733778834; x=1765314834;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XfTDQRWvpB9LqasNeyrDse5prX4npB2RyBL/G9FYNMY=;
  b=cDjTtageJwxx+tD00ijKVL60SV4VIvzdbQo9wFhcqAqFexqTQ1COiQoX
   lsUhHNNenFwj1ETwHUSzfBKCFQMutuZ2Z6UvQF3vWl5HFp8IkpeCYw3Pm
   OoxCQ1zVoSk5n7G6nDDwq7PLS/3exrI2PYPc6YcDPRh9Endjh8qmBvB5y
   jWRV4VNi5dGtXHa8OWDmvEBY0LG3XpERPJ8q+rmavMMeYH5tOH0wtA/ma
   8+n8VTgS9ntm6rORra1a20wGxgqq5IXBl+PTQ6w25uTsl3E9NMI0TdB/G
   XeDrPll1ZBdc/OblE9ftzrO1JwSPRRi8Fzsl7yb9Q/SCJU4hw5TxCsHKt
   g==;
X-CSE-ConnectionGUID: 7I/RfHy4R7CM1thh6CmuGw==
X-CSE-MsgGUID: 2+ExolUYQcCciaepxxaruw==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="45500284"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="45500284"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 13:13:53 -0800
X-CSE-ConnectionGUID: zvDApJW4RTuUzry25bo28g==
X-CSE-MsgGUID: yEXPMjeqTNSB8TG/i4X8lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="95389226"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Dec 2024 13:13:52 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKl4f-0004p3-2g;
	Mon, 09 Dec 2024 21:13:49 +0000
Date: Tue, 10 Dec 2024 05:12:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, "gu.huiguang" <guhuiguang@mucse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1610/1610] rnpm_ptp.c:(.data.rel.ro.local+0x0):
 multiple definition of `mac_ptp';
 drivers/net/ethernet/mucse/rnp/rnp_ptp.o:rnp_ptp.c:(.data.rel.ro.local+0x0):
 first defined here
Message-ID: <202412100554.9O1I0kbd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   db988390007bce595dba0dfd782c610578e26d2d
commit: 5deaf74c4b3edcf88f67f18aa352690deb9dc212 [1610/1610] drivers: initial support for rnpm drivers from Mucse Technology
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20241210/202412100554.9O1I0kbd-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412100554.9O1I0kbd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412100554.9O1I0kbd-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/net/ethernet/mucse/rnp/rnp_mbx.o:(.data.rel.local+0x0): multiple definition of `mbx_ops_generic'; drivers/net/ethernet/intel/ixgbe/ixgbe_mbx.o:(.data.rel.ro.local+0x0): first defined here
   loongarch64-linux-ld: drivers/net/ethernet/mucse/rnpm/rnpm_main.o: in function `.LANCHOR3':
   rnpm_main.c:(.bss+0x110): multiple definition of `mpe_pkt_version'; drivers/net/ethernet/mucse/rnp/rnp_main.o:rnp_main.c:(.bss+0x60): first defined here
   loongarch64-linux-ld: drivers/net/ethernet/mucse/rnpm/rnpm_main.o: in function `.LANCHOR3':
   rnpm_main.c:(.bss+0x114): multiple definition of `mpe_src_port'; drivers/net/ethernet/mucse/rnp/rnp_main.o:rnp_main.c:(.bss+0x64): first defined here
   loongarch64-linux-ld: drivers/net/ethernet/mucse/rnpm/rnpm_mbx.o:(.data.rel.local+0x0): multiple definition of `mbx_ops_generic'; drivers/net/ethernet/intel/ixgbe/ixgbe_mbx.o:(.data.rel.ro.local+0x0): first defined here
   loongarch64-linux-ld: drivers/net/ethernet/mucse/rnpm/rnpm_pcs.o:(.data.rel.local+0x0): multiple definition of `pcs_ops_generic'; drivers/net/ethernet/mucse/rnp/rnp_pcs.o:(.data.rel.local+0x0): first defined here
   loongarch64-linux-ld: drivers/net/ethernet/mucse/rnpm/rnpm_ptp.o: in function `.LANCHOR1':
>> rnpm_ptp.c:(.data.rel.ro.local+0x0): multiple definition of `mac_ptp'; drivers/net/ethernet/mucse/rnp/rnp_ptp.o:rnp_ptp.c:(.data.rel.ro.local+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
