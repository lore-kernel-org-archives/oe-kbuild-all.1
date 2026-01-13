Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0018128467C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 20:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768334993; cv=none; b=WKO5IdQAtfkfa+IwuxepKwp0Wkd+HVUqjMiB3bsi6Hn2w1ZhXgOSfh7ZlbGqR8gazGa6Ja3I0KzQLcEJb/At4Mxks/Fcu5cAbV0Yacw/DQx3p5k9hXMXeZyHg3TrznZEfUEqfgcaAAQ45ryvz2i/l1vFocq/h4Ela9Zp2S/jnho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768334993; c=relaxed/simple;
	bh=XPPMCfK42O4dc/KyElyUK9lP1N64t5UdcdPhEMRhwTU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bp3eeTEqJYK7ZP9X+7XxCL3x5PiAaX+ESrpFTsvcxgjWMluRAYPb9kAAKDAIFQ2N3Ox5DToOGt4+EUbJZfIqjwc7z3ynbV5LSqeGGElpI4KqIjguQnhzMBLAc0gSUhjDKaWmJeLL6Ey4hq4qnpSn3JsfKCt+iBByDO2nDOsYKo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A+RSSeG5; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A+RSSeG5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768334992; x=1799870992;
  h=date:from:to:cc:subject:message-id;
  bh=XPPMCfK42O4dc/KyElyUK9lP1N64t5UdcdPhEMRhwTU=;
  b=A+RSSeG5rmSzFUQsFWaCWtwULTde4DRXDpux/uVKTfoobaYCaIxIN4dR
   oatS3AyQDXwzklOhu1fmcaDInrCnLqQJf3nW00WsBfovEDR3HiihGNSmI
   syLovj7YKiHpWLdI8SEVf7a4rDNU1fObJROmbFznB5AdIdo1MWK0n8hHt
   cyTMiYyZAfE89mkqmcfXiCVTGxRcLGPBVQHtkgnaTERL4gxsMdRbnS55R
   h+ZK2RF6aTivP2lqJ10Ki+cQzO+dhPY+Y3NNtvWmF4vX/iG1ap/USh8uo
   2o8VPECR6K6NcCsW64qATqcIVkGOtxIhQaxiZe6zu9TyCyKAJSMe6NvQG
   w==;
X-CSE-ConnectionGUID: zpCq6sWHTZi80fYWg0V6fQ==
X-CSE-MsgGUID: aO1z+DKUQ3m1XEY0k5mXew==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69790330"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69790330"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 12:09:43 -0800
X-CSE-ConnectionGUID: IQgViT0URUOIkOnYccK3rg==
X-CSE-MsgGUID: BH5BN2WiTViA0MMU6Y0G0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204369267"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Jan 2026 12:09:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfkhv-00000000FK0-2OQp;
	Tue, 13 Jan 2026 20:09:39 +0000
Date: Wed, 14 Jan 2026 04:09:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/2]
 drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:1014:51:
 warning: 'DCEC' directive output may be truncated writing 4 bytes into a
 region of size between 0 and 53
Message-ID: <202601140430.TzDq9Nwa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Hans,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   c3b1fb166d5093c1b06c91ba1cb80161ed41d5e2
commit: 056f2821b631df2b94d3b017fd1e1eef918ed98d [0/2] media: cec: extron-da-hd-4k-plus: add the Extron DA HD 4K Plus CEC driver
config: x86_64-randconfig-014-20260114 (https://download.01.org/0day-ci/archive/20260114/202601140430.TzDq9Nwa-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601140430.TzDq9Nwa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601140430.TzDq9Nwa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c: In function 'extron_cec_adap_transmit':
>> drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:1014:51: warning: 'DCEC' directive output may be truncated writing 4 bytes into a region of size between 0 and 53 [-Wformat-truncation=]
    1014 |         snprintf(cmd, sizeof(cmd), "W%c%u*%u*%u*%sDCEC",
         |                                                   ^~~~
   drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:1014:9: note: 'snprintf' output between 13 and 72 bytes into a destination of size 61
    1014 |         snprintf(cmd, sizeof(cmd), "W%c%u*%u*%u*%sDCEC",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1015 |                  port->direction, port->port.port,
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1016 |                  cec_msg_initiator(msg), cec_msg_destination(msg), buf);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/DCEC +1014 drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c

  1000	
  1001	static int extron_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
  1002					    u32 signal_free_time, struct cec_msg *msg)
  1003	{
  1004		struct extron_port *port = cec_get_drvdata(adap);
  1005		char buf[CEC_MAX_MSG_SIZE * 3 + 1];
  1006		char cmd[CEC_MAX_MSG_SIZE * 3 + 13];
  1007		unsigned int i;
  1008	
  1009		if (port->disconnected)
  1010			return -ENODEV;
  1011		buf[0] = 0;
  1012		for (i = 0; i < msg->len - 1; i++)
  1013			sprintf(buf + i * 3, "%%%02X", msg->msg[i + 1]);
> 1014		snprintf(cmd, sizeof(cmd), "W%c%u*%u*%u*%sDCEC",
  1015			 port->direction, port->port.port,
  1016			 cec_msg_initiator(msg), cec_msg_destination(msg), buf);
  1017		return extron_send_and_wait(port->extron, port, cmd, NULL);
  1018	}
  1019	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
