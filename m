Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC55749C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 09:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709457169; cv=none; b=ML2dRIfLgeGD4ixPZY8sEQ7w1SnZg0IxPQ/M83hmuAPHPHeih738qY+zmrL07OXKgD1pSm/EbPZ4rUhxGCQBovaotjGB/KSBr1JXOwFvcdNSyW8Zwy386cSGk45MxBa1XraMNmN0JNX5rpRgby8uhj0O5Qmye3PrPNmzoD1NnQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709457169; c=relaxed/simple;
	bh=8eEiGZe/V3JLjakU6OkrK2x3skO6EZhTy6yNfvOGp9c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=toFjZzPqsqpxlLtOF5D6eU/DAMTjSmW7j1LDvVbSHD55bCSna/JPHckKgKwduhhL9/9Y0ezOmJOaPsRLBntE7Bvpy/OMczRx1vysVI0BWZCVcs3JiZEQNV+aU20Lq70oo1pvUX4rRbQVmegZZgd940Rc5of2be7IdcxWVE4/FAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cUuV1Qh9; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cUuV1Qh9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709457166; x=1740993166;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8eEiGZe/V3JLjakU6OkrK2x3skO6EZhTy6yNfvOGp9c=;
  b=cUuV1Qh9jgwqRNSXROvr4m57GWWImM0UWDzKO64rjIQ6Z5Ss5O6VCVkC
   T/7HDoIe7ORguq5C7QL3/Feo6M5gZtH3ZNE+u2avKKnNBTIHyYqaH03ju
   +CpJjyaBRVGtwbqxZBCJ3NIMaMlVhneZbaHItaQCr5YoB7gaO5hRUbIAG
   yaCEh0NGSczf4Q8LM15F5SfUQk8PylBd4tm5ROPdJQ3NUsn7HYllVLe1M
   YkNCLqYpASv/WhxlnEE52WxVe5Wwqg755GUzhaOwBxzjL7l8KCFnKm49H
   9w/nup2dcKXlExDjdQdXoViEkDF3RF1pHLv3UW6IIE4Xd2Y7TTJreRSFu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="15366977"
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="15366977"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 01:12:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="13364640"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 Mar 2024 01:12:44 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rghth-0001e0-1f;
	Sun, 03 Mar 2024 09:12:41 +0000
Date: Sun, 3 Mar 2024 17:11:52 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:card2-trigger-order-2023-02-28 28/33]
 drivers/of/property.c:618 of_graph_get_port_by_id() warn: unsigned 'id' is
 never less than zero.
Message-ID: <202403031704.pw87PL3z-lkp@intel.com>
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
config: powerpc-randconfig-r071-20240228 (https://download.01.org/0day-ci/archive/20240303/202403031704.pw87PL3z-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403031704.pw87PL3z-lkp@intel.com/

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
