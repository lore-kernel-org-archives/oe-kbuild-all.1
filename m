Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1543433F3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Aug 2025 12:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755348511; cv=none; b=bdAAGQ85eT05LZeaL6EOTqAcCy76tYlpZUSy6tO2UzTk8RNP8vM/CBMP+efPZ8fjvfUBl5p4zD4j/bsVkBd7WJ7ZFZBuCVZAYBLVYRe1/+fSY3F/n2ymRJ3FjHemLQefF4Qh2SJFTuexs/wj9+47bLORtoB147v/1rWDY+g0jdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755348511; c=relaxed/simple;
	bh=yDvcaA9X0JJfj+qhGE6PQ32qQvwSGKog2fLwSlq5KV8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uXwGIEFacu1InIQTW6s+ebnItlU1YD3y5JkXeo5Ih/XYem8XR5d8NV3zZmdcqsoHYzRhxiiWWCnfHW5o2jcpEOw2i1cLkcAjDQnXRZsHb6+gWPE525qbTcY2VNrAKYCcmLRDjgyBPVerP45psfWe0EVtuItoQRKDl0kn5ACjNwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RIJE/yCE; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RIJE/yCE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755348510; x=1786884510;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yDvcaA9X0JJfj+qhGE6PQ32qQvwSGKog2fLwSlq5KV8=;
  b=RIJE/yCE6Aid9e1Dp/uFwSELmRDS61CPOtEkUicBCO8kWS0MtuOmJxKr
   opbBjCoBg+gmjzUEt2JlQpgE+eduBSOybOr3zM/Bc7FPZWQkUaDxuQRQD
   zUdWVKlbtUEO4dOfmtK+KPkZbWSTo5jTCagB3eu2IjR7paaW4YfuC9/GV
   ilhhTpfHcHTlBErvGoBvR/3RAYB9Ip3SRQ73GYDi+udBC+HEBTyC222oO
   WdRdKaVbNUbJsEDYOuWVWvTivZz0mbFBpj5s91FsUuR9GJZOWH+XMuw3Z
   qKZHjyKMcWgx3WAjLzoc7UgKWhsmE5JBW1vz1Ck4bYimvSnv1rMudeBgm
   g==;
X-CSE-ConnectionGUID: PyhgQY+ZTdq7AMeMJRtSPg==
X-CSE-MsgGUID: 6hfa+dHRQ5GBiwdSn+9N7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="61276846"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="61276846"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2025 05:48:30 -0700
X-CSE-ConnectionGUID: u6x51sPXRMSUoECfjUcLjA==
X-CSE-MsgGUID: 0GW5CUfPR5i8IdoP7jG56Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="171653302"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa004.jf.intel.com with ESMTP; 16 Aug 2025 05:48:29 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unGKg-0000jn-1e;
	Sat, 16 Aug 2025 12:48:26 +0000
Date: Sat, 16 Aug 2025 14:48:22 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:1014:51:
 warning: 'DCEC' directive output may be truncated writing 4 bytes into a
 region of size between 0 and 53
Message-ID: <202508161401.D5Xj0ins-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   3f3a5c5e782d183bab668b1bd992e6812494f798
commit: 056f2821b631df2b94d3b017fd1e1eef918ed98d [1/1] media: cec: extron-da-hd-4k-plus: add the Extron DA HD 4K Plus CEC driver
config: x86_64-buildonly-randconfig-2001-20250816 (https://download.01.org/0day-ci/archive/20250816/202508161401.D5Xj0ins-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250816/202508161401.D5Xj0ins-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508161401.D5Xj0ins-lkp@intel.com/

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
