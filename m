Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794081013;
	b=GRuyJ6BrKcsGPXDdDZbu2F7Va45ikQz3SnHrzM7cVxzg5G7L8kDWHVOQNPG3Uu44+7rz
	 EoG30k59Yeu+fzheyp/UyeITdExethUQ+UYjr9d0VpwtsGZz2d4pbbVHWcGZss8prmhzW
	 qM9SMuzVPKxWPXgcXvHOjigbZB+Y+5zhXFEqXhJ5cLJMxJk6Vn1lG6LQek0F+sFYZayM6
	 aGS0b5DLfUdqjyYJpSDtaViuEKs2bcxa8TpediaHYzFkTAcq5/cnqg3gaGoj/FbyyUT/O
	 o6W3umZVR4b33bTJx+ZbExmkbR/S/486Hmw4Szmgctv+KwXaMHt8eyjNByaqgZUqu4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794081013;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Kq7O+6zpGaY+mD1Yc4cHb9GYY3cBUbbRuJy76l/1qV4=;
	b=jTfZ+Sc4T8fkGDVzpHIyrE7NqrRJpUhoTzH/aLa6/x4Eoo9S7NBT3z7MnVg2/TeiKDGG
	 yW3nNd5Zrvz63gCdR1n0fJU3TFsP4SRa+BDn02amOseTb4ARziOrr3hhkGv884oWmL1FF
	 vn7yrCFN2OIRipxm5B9InO0NE9fejLFybdetaE81Ni/5tnVoTScRwuhjdiDmiF2dtQ6Io
	 H8q1wyBoQBsYL9w34Sspc8K2EwhCSBmB6RRoHru1P4crQZ5QtrWgWUySEIxfimgI7Uo1M
	 MTm0EJcFsZYRxE4ng7q3JVZs3u6EcWQs8S2dXGnsfrxZe8hxnUoj2H6H+TCy7nul7Kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YB6qzo1N;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF275606A32F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Nov 2026 19:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF275606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YB6qzo1N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794081011; x=1825617011;
  h=date:from:to:cc:subject:message-id;
  bh=VHF9SEoWYciH/Q4c0572tWPOlK7oc6lbaeSSVXGOIT4=;
  b=YB6qzo1NyuMR9xHQTUrhDyOX+ldfgVdpRUKwKIFnbWheLPw/45073Xe0
   OS0WIiNTGQkp79OdoXigzRAUZiYprjWn5+D7S6Hsr6LAoMjvzSmu0WH7R
   txsMHF+kfIzVPtcYwLD/i5qdcfScotiGM7ZpSIJloeEJbWHeXxMLr0PL1
   q0ZbIrnfAllZkZ8Nz2aEEaHBTy9GMsRgbJI2rbxEv7NRdhbdLzw4J9zY+
   77QTgHkX6olKAzrp8Jg6hxJtUoEflvhlVEi9mf5X+Voq6Tz04LF1Hvj/c
   VZSRT2EUx+hzRJIIvJZNkPc/ZWvTbMnA72HgreD3wmW3/wAaK64tfPjd8
   Q==;
X-CSE-ConnectionGUID: 0OSo1e/0Sp+Cqv+hHMEbJw==
X-CSE-MsgGUID: FArOCKTMTDyqFbns1gOlQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2856775"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2856775"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 11:50:10 -0800
X-CSE-ConnectionGUID: L1oVmoaiRzCfOJRmgqE+6w==
X-CSE-MsgGUID: en8tQJGGRzStA22/PeNlog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7869348"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Nov 2026 11:50:08 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPmQQ-00000000rUR-0n1l;
	Sat, 07 Nov 2026 19:50:06 +0000
Date: Sun, 08 Nov 2026 03:49:24 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_acpi_support_v1 83/85]
 drivers/acpi/property.c:1995:44: warning: unused variable 'port'
Message-ID: <202611080308.3DPXwR5T-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/avpatel/linux.git riscv_trace_acpi_support_v1
head:   5f0fc23f88cf06b249de0a44544248099edb14ca
commit: e2ce2d8b5b121298f8d3caf875c1cfed7b64f80e [83/85] ACPI: property: Add device graph support
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20261108/202611080308.3DPXwR5T-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611080308.3DPXwR5T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611080308.3DPXwR5T-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/acpi/property.c: In function 'acpi_graph_get_remote_directional_port':
>> drivers/acpi/property.c:1995:44: warning: unused variable 'port' [-Wunused-variable]
    1995 |         struct fwnode_handle *ports_node, *port;
         |                                            ^~~~
--
>> Warning: drivers/acpi/property.c:1993 function parameter 'ports_name' not described in 'acpi_graph_get_remote_directional_port'
>> Warning: drivers/acpi/property.c:1993 function parameter 'ports_name' not described in 'acpi_graph_get_remote_directional_port'


vim +/port +1995 drivers/acpi/property.c

  1981	
  1982	/**
  1983	 * acpi_graph_get_remote_directional_port - Find a port nested under a
  1984	 * synthetic "in-ports"/"out-ports" root node
  1985	 * @fwnode: device fwnode
  1986	 * @port_nr: the desired port number
  1987	 *
  1988	 * Return: the port node on success, NULL otherwise.
  1989	 */
  1990	static struct fwnode_handle *
  1991	acpi_graph_get_remote_directional_port(struct fwnode_handle *fwnode,
  1992					       unsigned int port_nr,
> 1993					       const char *ports_name)
  1994	{
> 1995		struct fwnode_handle *ports_node, *port;
  1996	
  1997		if (!ports_name)
  1998			return NULL;
  1999	
  2000		ports_node = acpi_fwnode_get_named_child_node(fwnode, ports_name);
  2001		if (ports_node)
  2002			return acpi_graph_get_child_prop_value(ports_node, "port", port_nr);
  2003	
  2004		return NULL;
  2005	}
  2006	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
