Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A20250289
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Jun 2024 23:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717977529; cv=none; b=LeaKxAVNHDNIaX3lLZuvayvtpArnOYxdPmMH3AAYTZ5VhGw1QHFEHRD6pmbXCUvqJuxFxJJ5haJq5qkBqmJtVR2MpcIVyOQUfWMpJ1E6p/RIA+VJAA7AKFAnbq+M/kRZu1aNPtm+lhl1nZbo6RY3SQO8SXYCkT18vSae9YqM4xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717977529; c=relaxed/simple;
	bh=nmX3SXhTnGtah2hv0H9Jc66nQfb8EO9AGW1Y2Q/7ugg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b4QJceS/aPC1SC7YxDZFDFE3D3u+d/3R59kwKyQy+QGNwTGufUTOGOHEYkeb9XphPB0Y5kZAqMqDtbzfh22BRSD8am7VuDuoNhX83Rh/NnkB1JEHDLjH5iXTA7HplN2GbyFeNvT+8d+WLE1y5ToHWUE4giGVq5kph4GXLuAsAA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZpNdjkVg; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZpNdjkVg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717977527; x=1749513527;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nmX3SXhTnGtah2hv0H9Jc66nQfb8EO9AGW1Y2Q/7ugg=;
  b=ZpNdjkVgpa5+HJ4+guDXBuwT5xYUd0xNfmsHFK1yDapU7yQmSI2t4oUh
   qOZ+gWxF0EuhCiagbTA365O/Sy4rDY68jTb6qXFZY1PjGnOy5BAblWCyo
   elzvpQfukjBMUJ0sgs7UNZHQb1blO8dzrJTZmTXPKAQtJHh7qlxoLkut7
   3PkdPxgMGb1lg5fUuxJbYpyTK3tU3AhXFMnkA+1mx0XxHRSjwQWggImR9
   oUMDNNwmnpenNiDDl6LE1OR2Tcpp7gal0zyxqbsxrjEzf41/MstvtgYKr
   PvZ5aTI9i99SRm5sxJW9TGo6CyoYt560wYen18s3jd2DG4albt7dbUmYA
   g==;
X-CSE-ConnectionGUID: +GAaSoR7Qr+R8N3k9zt9Lw==
X-CSE-MsgGUID: UJzjHY+jS5Cy+2NHmeYXQw==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="26029966"
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="26029966"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 16:58:45 -0700
X-CSE-ConnectionGUID: 2htOFg5GSt6h5VnnJ3bqFA==
X-CSE-MsgGUID: zuk4DbZgRVCrqI5OSFlSiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="44016185"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Jun 2024 16:58:44 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGSQr-0001gk-25;
	Sun, 09 Jun 2024 23:58:41 +0000
Date: Mon, 10 Jun 2024 07:58:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>
Subject: [ti:ti-linux-6.6.y-wip 18/61]
 arch/arm64/boot/dts/ti/k3-am62p-main.dtsi:1202.21-1205.5: Warning
 (graph_child_address): /bus@f0000/dss@30220000/ports: graph node has single
 child node 'port@0', #address-cells/#size-cells are not necessary
Message-ID: <202406100701.80FTW1dk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.6.y-wip
head:   504c87f7f0af17421d2bb08aa33fc8f0f3191a8f
commit: 710e42bc226d2985143455a73116008f7778f23f [18/61] arm64: dts: ti: k3-j722s-evm: Add display support
config: arm64-randconfig-001-20240609 (https://download.01.org/0day-ci/archive/20240610/202406100701.80FTW1dk-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240610/202406100701.80FTW1dk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406100701.80FTW1dk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-am62p-main.dtsi:1202.21-1205.5: Warning (graph_child_address): /bus@f0000/dss@30220000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +1202 arch/arm64/boot/dts/ti/k3-am62p-main.dtsi

20eee37e20900d Aradhya Bhatia 2024-06-05 @1202  		dss1_ports: ports {

:::::: The code at line 1202 was first introduced by commit
:::::: 20eee37e20900da5e67503b8bb74f871e097ab65 arm64: dts: ti: k3-am62p-main: Add DSS1, DSI and DPHY-TX

:::::: TO: Aradhya Bhatia <a-bhatia1@ti.com>
:::::: CC: Udit Kumar <u-kumar1@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
