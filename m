Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830FD3546E7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Aug 2026 18:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786731880; cv=none; b=pG7w1ePaZCXPBf2TpkbVpcUfDWO+Zeybk+LR4cTrCszuqx9x7pukOz9/tAfveh8jzt146PjxhLR4YRlgZM7cD/0Tc8pkB7fmVYRCW6HNGRNFQzGG4GRheeggUe8/BXnUoQYke3vztJilI4NPWoAkjd+YCohBdOZALmwM7ShjgbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786731880; c=relaxed/simple;
	bh=yausceEDzMwyB6O2U80OPCDEIHJ+tQBrzpLjhDOEVp0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oFPUZpH2jevBiz7ejd4ePN6FtCU0RgCVAQr3EBHlLXcqFsMlIuEh3BpSKjjDy9Z6uSfm2b2SRujeKNEJAsYGv+xKghrI8SLrCU0XYsdOCbuai70bCQYJm5uLgg+C/3xGkEKatakbn8CFzlt7zfa/qr96fsBhD2X6InDHckbIZ3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W2/dA4y0; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W2/dA4y0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786731878; x=1818267878;
  h=date:from:to:cc:subject:message-id;
  bh=yausceEDzMwyB6O2U80OPCDEIHJ+tQBrzpLjhDOEVp0=;
  b=W2/dA4y0iI6TpgwEeOQvce5Qr17KkEnH5vW6tIll02xf4ncVjVMl3MH9
   z+pXq/mox89eMAUEmYMGoqr4bmMtWZjfCxf1ot/qUzW5Inb6qGXOIBhZm
   o6xAPtgsk5VjYJSfAQZTDczCExALwGaNVH8CYwCQklRbrGtPOAUjZdOPG
   3xVb2HdxSxqSrNBxq3INQiRc8xVOCi04yOLr60jPteYPpJlnoCOo6h2L8
   bd7f1nB0BCa8hMtlqvaXiA2pMLuHgtER7GK9iCwnm3lxQPskqGPfPH2jh
   L4WmeVKx8NLOH8BKdHtuOX3Y9vbW/CwCO7u5RtsFO0GwZyzo4zly35wtV
   g==;
X-CSE-ConnectionGUID: UmjTHav1T1iJEW1ZJ73j7w==
X-CSE-MsgGUID: 40ubRvX5SiSN9tyxWzTNhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="87335473"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="87335473"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 11:24:38 -0700
X-CSE-ConnectionGUID: /Q85m6NSTN2zClekp3X3Ig==
X-CSE-MsgGUID: u/anTpi1Q22XstAnWNzf4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="269479977"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Aug 2026 11:24:36 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuwa1-00000000ZoE-3fXC;
	Fri, 14 Aug 2026 18:24:33 +0000
Date: Sat, 15 Aug 2026 02:23:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 0/1]
 net/ncsi/ncsi-manage.c:726:33: sparse: sparse: cast to restricted __be32
Message-ID: <202608150242.f83aO5Hf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   38d7d173c4d30d37dceca1892b2891a4e385335f
commit: 7329bc66b4a03e63d8c191eeb7c342a1c13f96fa [0/1] net/ncsi: Simplify Kconfig/dts control flow
config: i386-randconfig-062-20260814 (https://download.01.org/0day-ci/archive/20260815/202608150242.f83aO5Hf-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260815/202608150242.f83aO5Hf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608150242.f83aO5Hf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/ncsi/ncsi-manage.c:726:33: sparse: sparse: cast to restricted __be32
>> net/ncsi/ncsi-manage.c:726:33: sparse: sparse: cast to restricted __be32
>> net/ncsi/ncsi-manage.c:726:33: sparse: sparse: cast to restricted __be32
>> net/ncsi/ncsi-manage.c:726:33: sparse: sparse: cast to restricted __be32
>> net/ncsi/ncsi-manage.c:726:33: sparse: sparse: cast to restricted __be32
>> net/ncsi/ncsi-manage.c:726:33: sparse: sparse: cast to restricted __be32
   net/ncsi/ncsi-manage.c:750:25: sparse: sparse: cast to restricted __be32
   net/ncsi/ncsi-manage.c:750:25: sparse: sparse: cast to restricted __be32
   net/ncsi/ncsi-manage.c:750:25: sparse: sparse: cast to restricted __be32
   net/ncsi/ncsi-manage.c:750:25: sparse: sparse: cast to restricted __be32
   net/ncsi/ncsi-manage.c:750:25: sparse: sparse: cast to restricted __be32
   net/ncsi/ncsi-manage.c:750:25: sparse: sparse: cast to restricted __be32
   net/ncsi/ncsi-manage.c:773:25: sparse: sparse: cast to restricted __be32
   net/ncsi/ncsi-manage.c:773:25: sparse: sparse: cast to restricted __be32
   net/ncsi/ncsi-manage.c:773:25: sparse: sparse: cast to restricted __be32
   net/ncsi/ncsi-manage.c:773:25: sparse: sparse: cast to restricted __be32
   net/ncsi/ncsi-manage.c:773:25: sparse: sparse: cast to restricted __be32
   net/ncsi/ncsi-manage.c:773:25: sparse: sparse: cast to restricted __be32

vim +726 net/ncsi/ncsi-manage.c

f40cac4e708365 Ivan Mikhaylov 2021-07-08  716  
cb10c7c0dfd9e6 Vijay Khemka   2018-10-16  717  /* NCSI OEM Command APIs */
cb10c7c0dfd9e6 Vijay Khemka   2018-10-16  718  static int ncsi_oem_gma_handler_bcm(struct ncsi_cmd_arg *nca)
cb10c7c0dfd9e6 Vijay Khemka   2018-10-16  719  {
cb10c7c0dfd9e6 Vijay Khemka   2018-10-16  720  	unsigned char data[NCSI_OEM_BCM_CMD_GMA_LEN];
cb10c7c0dfd9e6 Vijay Khemka   2018-10-16  721  	int ret = 0;
cb10c7c0dfd9e6 Vijay Khemka   2018-10-16  722  
cb10c7c0dfd9e6 Vijay Khemka   2018-10-16  723  	nca->payload = NCSI_OEM_BCM_CMD_GMA_LEN;
cb10c7c0dfd9e6 Vijay Khemka   2018-10-16  724  
cb10c7c0dfd9e6 Vijay Khemka   2018-10-16  725  	memset(data, 0, NCSI_OEM_BCM_CMD_GMA_LEN);
cb10c7c0dfd9e6 Vijay Khemka   2018-10-16 @726  	*(unsigned int *)data = ntohl(NCSI_OEM_MFR_BCM_ID);
cb10c7c0dfd9e6 Vijay Khemka   2018-10-16  727  	data[5] = NCSI_OEM_BCM_CMD_GMA;
cb10c7c0dfd9e6 Vijay Khemka   2018-10-16  728  
cb10c7c0dfd9e6 Vijay Khemka   2018-10-16  729  	nca->data = data;
cb10c7c0dfd9e6 Vijay Khemka   2018-10-16  730  
cb10c7c0dfd9e6 Vijay Khemka   2018-10-16  731  	ret = ncsi_xmit_cmd(nca);
cb10c7c0dfd9e6 Vijay Khemka   2018-10-16  732  	if (ret)
cb10c7c0dfd9e6 Vijay Khemka   2018-10-16  733  		netdev_err(nca->ndp->ndev.dev,
cb10c7c0dfd9e6 Vijay Khemka   2018-10-16  734  			   "NCSI: Failed to transmit cmd 0x%x during configure\n",
cb10c7c0dfd9e6 Vijay Khemka   2018-10-16  735  			   nca->type);
cb10c7c0dfd9e6 Vijay Khemka   2018-10-16  736  	return ret;
cb10c7c0dfd9e6 Vijay Khemka   2018-10-16  737  }
cb10c7c0dfd9e6 Vijay Khemka   2018-10-16  738  

:::::: The code at line 726 was first introduced by commit
:::::: cb10c7c0dfd9e6fd3d69ced98b05cbd198c48cf6 net/ncsi: Add NCSI Broadcom OEM command

:::::: TO: Vijay Khemka <vijaykhemka@fb.com>
:::::: CC: David S. Miller <davem@davemloft.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
