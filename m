Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757811F938
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 23:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790985099; cv=none; b=Suuuc4s3jKJ1kUHRjMOVcvvKoJ31ZhCRT6CZUrn+Q2N/SvGj9DbJYdRmcfMoFbsHwqhTVG3tJmvtjanZbyHqMMW1YAnL/jAjzP4b0jPdJArhh+o74zw0YRbVh8jIad7Dy5pjSiHItibccPWW62yNPHA8CAeZNRZR6I90d7NXMiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790985099; c=relaxed/simple;
	bh=HUlD/FjCSFvIRCNr22eIOuK2K4NrRRt3n6NimA1dutI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mRZ6zbVtL+KpRO9R66iQyVLUr/qm0cgiRSSf6uRkrsk39fIQvztDtzjjpqykfXGKOQq3bFQXrcRy38J3YRw1OSfDbZTSChaZpUxNHpbyMJ7oCVWV99A3NXIVHm03WkPNRpBq4592d85Q0HWpNflUSoliWY7Le8hKX/99ovYiVME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CcxUVkF4; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CcxUVkF4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790985097; x=1822521097;
  h=date:from:to:cc:subject:message-id;
  bh=HUlD/FjCSFvIRCNr22eIOuK2K4NrRRt3n6NimA1dutI=;
  b=CcxUVkF42TgLTnHr4Rp0nTGC08laACXrr2IwD5SEKBwTmg8ro2v5jH3v
   +6IDi6PPYAHIeX9TMSrext5qODdOXZpDdJ+aUyYdh4o3w3ETBu1kZO/Cw
   t3DA7HuwBvau3ugkfkVdUCm2op8MyVmlgu3qp7obg8RmZ4XUIpE3fj0jT
   Z8of+kH/JZ3mQFgBKWwZHJUxZUSSHJjpObaJXAP0n83wlPErthKXyWpX7
   Y8N8ClC8M+sXB0Qk8Sn+xju3s/RydSOHizWANDvnYP05hgSmTos42CMDJ
   eDzaMayY3NbIGianZPdoq+efwOuNShBenBXf1j8E0Tom1IJFR+NQ4rmJI
   A==;
X-CSE-ConnectionGUID: NHlh/jqnTZ6ZIRW0fohJOA==
X-CSE-MsgGUID: eeRw0KUSQxGjG6TpkEP8LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="79314698"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="79314698"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 16:51:36 -0700
X-CSE-ConnectionGUID: Nmp5QjdST+2gHdhY5ewYQA==
X-CSE-MsgGUID: XxJXffHSS4KoBdJR3U/Pvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="275904988"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 02 Oct 2026 16:51:35 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCn2K-000000000pP-16Io;
	Fri, 02 Oct 2026 23:51:32 +0000
Date: Sat, 03 Oct 2026 01:50:36 +0200
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_acpi_support_v1 82/84]
 drivers/acpi/property.c:1995:44: warning: unused variable 'port'
Message-ID: <202610030122.dLkViI4M-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_acpi_support_v1
head:   c27eb336790d72160ea5ab7997d0dd01bb230e96
commit: 07c38c2b100fdff5878133f41eb7875af40ab366 [82/84] ACPI: property: Add device graph support
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261003/202610030122.dLkViI4M-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261003/202610030122.dLkViI4M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610030122.dLkViI4M-lkp@intel.com/

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
