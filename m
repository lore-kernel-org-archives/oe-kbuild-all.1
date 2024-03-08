Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9671DA3A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Mar 2024 23:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709940547; cv=none; b=Rx3PpGL7uA+iDkQkofYXeTqei7iHw+QXyFCobhb0LHHhEDCZ89o7bkyWAY9JPkgnuoVNKVhqZhyaWLdoFtinE7OSOGMUVRLfGtbDZe5nmOrOxb6isgZm9vD4Jq3/fiuShniVLC0bQyZ+nsHYebvAMvpnBE7WXKdywHIoKlbIwWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709940547; c=relaxed/simple;
	bh=CytUUAFu0naG2Bsmx04R4ft4yjsqqDoG1z6gj44o1qs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cdhU0O31hemLeW72zrxu+BvwOAYChK8Ge71HiMonZVC/SJX+0CRET9kyBA2TsB5/aBEYK+Q75o5c+868R+XG553SlkZoKDx/nNmh2mD5TeROQ5EjCRWRt+C4rpJjTjPU7FomAaT3ad4jiu9D+oIHSelEPT29Lk7fW/gKDDRFpqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LUeDXBEO; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LUeDXBEO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709940546; x=1741476546;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CytUUAFu0naG2Bsmx04R4ft4yjsqqDoG1z6gj44o1qs=;
  b=LUeDXBEOV61kqtf4S4OmeT+zlQQVjHJlwRmcckQVlUnS9CBUB3P1JCtd
   6WlA6sSiYKqaJNx8ujzS5v4AOZ8hz6141sL9dV47Ry8EaL7JhG59FbY00
   ayI0f2szEPuQuQQG5fpx4vYm4LJjCcYhZpgzm1si3kRKD/7MtLMB85QY0
   /LC872tzcBOqsGKH49oDjWi1C/iyMrHn6B3Q+hBp+WN95IklSzEJOAGJc
   Ll8s+3bFNb9m4kLzZDfQSeQ7yIFnuaQcTo8aeva/cCWYNVoesGjEwBFdA
   ivNzkjZyAOa3YiLJ6Ux0cqMZW/RUfm+IptmDADBgOuTYNQUQO8rqG1UJ1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="5275484"
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="5275484"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 15:29:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="10692117"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 08 Mar 2024 15:29:04 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rijeA-0006np-1p;
	Fri, 08 Mar 2024 23:29:02 +0000
Date: Sat, 9 Mar 2024 07:28:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:card2-trigger-order-2023-02-28 28/33]
 drivers/of/property.c:618 of_graph_get_port_by_id() warn: unsigned 'id' is
 never less than zero.
Message-ID: <202403090745.jpO6MjvZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux card2-trigger-order-2023-02-28
head:   7954e5e1bfde7e92159d3cc1922b94fbd5957915
commit: 306307b7761c3666ffe63b9ecf2eac74629a8139 [28/33] of: property: ignore id check if id < 0 on of_graph_get_port_by_id()
config: powerpc-randconfig-r071-20240228 (https://download.01.org/0day-ci/archive/20240309/202403090745.jpO6MjvZ-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403090745.jpO6MjvZ-lkp@intel.com/

smatch warnings:
drivers/of/property.c:618 of_graph_get_port_by_id() warn: unsigned 'id' is never less than zero.

vim +/id +618 drivers/of/property.c

   602	
   603	/**
   604	 * of_graph_get_port_by_id() - get the port matching a given id
   605	 * @parent: pointer to the parent device node
   606	 * @id: id of the port
   607	 *
   608	 * Return: A 'port' node pointer with refcount incremented. id is ignored when
   609	 * it was < 0. The caller has to use of_node_put() on it when done.
   610	 */
   611	struct device_node *of_graph_get_port_by_id(struct device_node *parent, u32 id)
   612	{
   613		struct device_node *port;
   614	
   615		for_each_of_graph_port(parent, port) {
   616			u32 port_id = 0;
   617	
 > 618			if (id < 0)
   619				break;
   620	
   621			of_property_read_u32(port, "reg", &port_id);
   622			if (id == port_id)
   623				break;
   624		}
   625	
   626		return port;
   627	}
   628	EXPORT_SYMBOL(of_graph_get_port_by_id);
   629	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
