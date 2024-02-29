Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EF72916
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Feb 2024 23:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709250722; cv=none; b=bMsbtcB4uHJArOM2umO+ejoeGboSEmqcEnBg4SkGem44wKKWGC39oJBRTIlimxn24i9pzFJzWiZ7KqsD7WcNBEVl8ZyQaGfms6LGYy6BhTit600pnsltONTGxY2qBv0FfYzdrhLuCRsfxQscz8d3VRzsvaQgJ6FJBW2uPgQTvW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709250722; c=relaxed/simple;
	bh=r8k1NPUPw/Fj2VoqL6lDNqhcZI6e7BK9xkIPeXR4pro=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=txqwmwJs3s7IY6//cmnWYvh0hu+C4S9W/8reac8M1q4D1/yqO2kkzoBITmBSq757UxeHUdn+ZtWqU1HtV5Wv8Yhpuru0wKF4PQXsDQz+JZf9q2qM1k+2SpTiK8CLypNaa3wEPdoY6MPXjjnZR22/Wq5Qjpc9bieXz+X4nkFC6Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NeC4hTll; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NeC4hTll"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709250718; x=1740786718;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r8k1NPUPw/Fj2VoqL6lDNqhcZI6e7BK9xkIPeXR4pro=;
  b=NeC4hTllo5KvZ8cTS7BrSteHGCnvwHzF/WQV2fcSyE/fkfuw2sJKGzoL
   E+x0suTFSiMKps/SV7RPWU4XXRWAHzhH2pnygGn5o8pVEPKIc4OBh97Tr
   f3t0d1+JxRyrRs2QZMLzL2XuV2E9I27u6TG37BszEKrMYYF39vPvRCDXx
   Du1QK+5QXnC/aNUCfd99PZU+ErJVOSmHzVzyXqu8IhWNqYyZ4L2juyo0/
   5BTYPWKlQzC5TzwFSqCCtIleTGPMKBG8rpYvXBUYvb7FZ00IPo9E/Kgf+
   EAOYliQ9AFTwEUS+W73Z6xse3njUv6d2xcUCnsR0LSeevMkQRxYXYwmeF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="14405148"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="14405148"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 15:51:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7922488"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 29 Feb 2024 15:51:57 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfqBR-000DMj-0e;
	Thu, 29 Feb 2024 23:51:31 +0000
Date: Fri, 1 Mar 2024 07:50:37 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:card2-trigger-order-2023-02-28 28/33]
 drivers/of/property.c:618 of_graph_get_port_by_id() warn: unsigned 'id' is
 never less than zero.
Message-ID: <202403010727.ETPPAf9c-lkp@intel.com>
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
config: powerpc-randconfig-r071-20240228 (https://download.01.org/0day-ci/archive/20240301/202403010727.ETPPAf9c-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403010727.ETPPAf9c-lkp@intel.com/

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
