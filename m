Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CB62C182
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Dec 2024 07:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735457111; cv=none; b=NT+I+GOct8JwMRNahS1NH3pGf5KVQSHOWvBACfLx63KtjOpmb7RMT99+LBm6s4qr24jUoIiKiXEmFf5rzzCGQcHHmG2wfmgut1s9T9CzpxbcAm5CvHyMMmHcTDS7vqGbb7FxUAaQuwmoqD+4XAzTAKypF7AbOXFvOvSXHAHKiTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735457111; c=relaxed/simple;
	bh=OUPCJ3B0rNiv9DTFSu8lwpO/wJ/bSRvlUXtFBm8eRBU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=unflOG+VlWt0cFdDK05C4uodXgCJhV8fO/6iXI0WGk2P0NVhdM2GqSiHk9aoPuIT0zUE9rOubdjVOSUBK22jdtWE61odiilUkouU4+Sh9rXZQMaIeW1loEx3YlGSU2KYlLc6Nn/AGX1ytF1564v5pRZD6HmInNk0o4WA3Hxzkr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=elvW4jrz; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="elvW4jrz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735457108; x=1766993108;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OUPCJ3B0rNiv9DTFSu8lwpO/wJ/bSRvlUXtFBm8eRBU=;
  b=elvW4jrze5OLs5qGtO27IfEMzg3RHtQ562UQ/WO2MikZLzeIIo94YMP/
   Zw1feEi3YJHESO5SYE74Oqr0iHVAA1w0PLuCCZQz3/bAAO6Cxvsus2lq0
   N6CmggVXLUPPpCItRIp3cA90ZZo19S/BRWNK5zHU+WcGyQgHgQ8NqjRqi
   le5DVBJkxqkB87fyGDYk4mSGuQs/fZyiz/javrTASbhR2Y9T5Ck7HT9/p
   uOPQIbSRYgOWQ4gB+6OsJ12sidInhnotOuSB7IvgSahtDCE+BynkOZYX0
   YUn46xJ/ycIDCEdzzCSIHRFSJdhe1Yk8kmtJrKFspRHXjAyvQhEFG0YFz
   g==;
X-CSE-ConnectionGUID: 10xEIy39RFWPFK2SNCdE4A==
X-CSE-MsgGUID: //6j44eLQ6SFVWKdU8Maug==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="36004190"
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="36004190"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 23:25:07 -0800
X-CSE-ConnectionGUID: QCgaMQSwSNGuKqGZwVNHHA==
X-CSE-MsgGUID: JzAAkcJ7RpGEPYNuW70nqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="131344903"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Dec 2024 23:25:06 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRnfb-0004YM-2n;
	Sun, 29 Dec 2024 07:25:03 +0000
Date: Sun, 29 Dec 2024 15:24:58 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:1014:51:
 warning: 'DCEC' directive output may be truncated writing 4 bytes into a
 region of size between 0 and 53
Message-ID: <202412291544.dM7D6yQz-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   059dd502b263d8a4e2a84809cf1068d6a3905e6f
commit: 056f2821b631df2b94d3b017fd1e1eef918ed98d media: cec: extron-da-hd-4k-plus: add the Extron DA HD 4K Plus CEC driver
date:   4 months ago
config: sparc-randconfig-001-20241212 (https://download.01.org/0day-ci/archive/20241229/202412291544.dM7D6yQz-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412291544.dM7D6yQz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412291544.dM7D6yQz-lkp@intel.com/

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
