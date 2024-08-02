Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8680C256D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Aug 2024 09:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722592027; cv=none; b=EfBzNLmijt7bdDAi/O1BQSlSX//VzKzX04sAXW8BqnT6Y9NYMj9zbnZ+vafiPqJkJWbBu7bvSdQIB1J2rSuZAHqeXxNODWdfFcCGAHQZpKAj9mQ1VZ2MAHJxehGdSCgXJYC+R4dVNbuKgInZXonbMUhkC5oDFBzX0OYnERNRo7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722592027; c=relaxed/simple;
	bh=/en7QzOEerNTzqWXeODT4DRUseKIhiJGMP6dfs2iYsc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W3sAbKNYynmY4M9qkKSnK22drSIYd01wu4X5CbGe8eLpQ2bZVXZCebjcvZcFmn6nD7VjYd/aqgIZp9uhBy6c20/0f726azJke4fL/ajFMYYBy5QMwgChosi9Rn2rxpurkQkaGU1DK8waunAw1ftepakW+28bkDHNNQcl0V4vSw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M7sHVCBv; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M7sHVCBv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722592025; x=1754128025;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/en7QzOEerNTzqWXeODT4DRUseKIhiJGMP6dfs2iYsc=;
  b=M7sHVCBvwRxBJ5+sdTM8dJve8Yszr7C46/ltHYdYEhhrwiPTIhn9irIB
   iaqMwLtcf/tAgXmPcTywlosFNp5AmQb1pn2nsBMF5nskg1hgGq/tpEnAV
   MoGMFZQyQoppesFLlNLKzHR2bPTqrOXgfzpy9D99aqfWf7wu+lX+W42oI
   Uo/yWMNjdLF11O4OEnKFiXZPuQ/OZd98qJ3IPyl/Aq3u6CWK866EKl0Bs
   ZsV6phiQ8EX1OBigjxQ/l2xGDbyN2xNk9RZi14O+PQSq09sjn6SMencfG
   1iHbtViH30oLIp4ltIzdz/0bDBDKbSwdp//7bcKjXVkqqL+IC4Mc7cbTQ
   g==;
X-CSE-ConnectionGUID: cETBq3uWQNSqJdraISTlMA==
X-CSE-MsgGUID: LieBJb5RQPC7Fmt+Sgw2jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="38105891"
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; 
   d="scan'208";a="38105891"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 02:47:05 -0700
X-CSE-ConnectionGUID: PXrYtv+BRcS7fXCeuomsCQ==
X-CSE-MsgGUID: 5WC84UaiS8yY6RXM/Fvvgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; 
   d="scan'208";a="55583177"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 02 Aug 2024 02:47:04 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZosH-000wbf-23;
	Fri, 02 Aug 2024 09:47:01 +0000
Date: Fri, 2 Aug 2024 17:46:48 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hverkuil-media-tree:extron 5/6]
 drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:1008:51:
 warning: 'DCEC' directive output may be truncated writing 4 bytes into a
 region of size between 0 and 53
Message-ID: <202408021703.aofQ0dlW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git extron
head:   1685af4ec94f45de230eb603bb47bf4b985a1f1c
commit: 64403b1cf011de24701c54aa5c71fa3897b3a920 [5/6] media: cec: extron-da-hd-4k-plus: add the Extron DA HD 4K Plus CEC driver
config: x86_64-randconfig-103-20240802 (https://download.01.org/0day-ci/archive/20240802/202408021703.aofQ0dlW-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240802/202408021703.aofQ0dlW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408021703.aofQ0dlW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c: In function 'extron_cec_adap_transmit':
>> drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:1008:51: warning: 'DCEC' directive output may be truncated writing 4 bytes into a region of size between 0 and 53 [-Wformat-truncation=]
    1008 |         snprintf(cmd, sizeof(cmd), "W%c%u*%u*%u*%sDCEC",
         |                                                   ^~~~
   drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:1008:9: note: 'snprintf' output between 13 and 72 bytes into a destination of size 61
    1008 |         snprintf(cmd, sizeof(cmd), "W%c%u*%u*%u*%sDCEC",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1009 |                  port->direction, port->port.port,
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1010 |                  cec_msg_initiator(msg), cec_msg_destination(msg), buf);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/DCEC +1008 drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c

   996	
   997	static int extron_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
   998					    u32 signal_free_time, struct cec_msg *msg)
   999	{
  1000		struct extron_port *port = cec_get_drvdata(adap);
  1001		char buf[CEC_MAX_MSG_SIZE * 3 + 1];
  1002		char cmd[CEC_MAX_MSG_SIZE * 3 + 13];
  1003		unsigned int i;
  1004	
  1005		buf[0] = 0;
  1006		for (i = 0; i < msg->len - 1; i++)
  1007			sprintf(buf + i * 3, "%%%02X", msg->msg[i + 1]);
> 1008		snprintf(cmd, sizeof(cmd), "W%c%u*%u*%u*%sDCEC",
  1009			 port->direction, port->port.port,
  1010			 cec_msg_initiator(msg), cec_msg_destination(msg), buf);
  1011		return extron_send_and_wait(port->extron, port, cmd, NULL);
  1012	}
  1013	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
