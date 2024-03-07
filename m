Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4503A63C8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Mar 2024 04:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709785427; cv=none; b=n6IZ9cTIvgtPUppdiUDmnlRpYOw22Z9l88QCRJ+98giy3jfOowqYah+la1aouyzqOFg8dCEd4C9YZeppbX+AjFfoprVNANLszJn1xkLsxEqYWsUgB9/5v2cY+YL/5OEFuP0MMmUseKkU/Zfk+vNjginqCnXe/vgi7m+mFql7L/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709785427; c=relaxed/simple;
	bh=h1FMUuyzsvltqgo5mYkwNi1N4Dg4oRaflCxqfSYA1eA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KduQYNS2fnN2je0lkAitIao6992XNKqSPkARlmMCv7pd9fbFa895mT+sHm6S0aygNvG0g4/WAtTwNd9opRwagau4Kxe127F39HTSZjkULMl7qXttxOMKFNGr/1cRqw1tIvsmicKT/hpNZp0GtEfGWvTXJZc1B5UdMg3YpeLK0eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fglhGihw; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fglhGihw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709785425; x=1741321425;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h1FMUuyzsvltqgo5mYkwNi1N4Dg4oRaflCxqfSYA1eA=;
  b=fglhGihwpmH9nosCSO+prD3xguyQN2PO2BPzCAWNafUna01bI5jdIbxL
   2zxGReQbacCn7c66W7hYg4WSfKzW0tp9et6GbjDwNeuZ9lpr3EUXvwLx8
   XUgv0XCOiUyAT+p/fKVM7tiMyoJLiAepGINd8SDKaqBwp1CQe5rckxdcS
   sidIpF5YCfmraIjaW18MS+Wr22BKtDfrcMTZA2gRJdx6gRhC6uYF21NLq
   GETYAeTeC244h0lUBvcLqVH1V2h60SztsT6gBCQwn1rD0j7txZlO2l00o
   4/zxZ92Ywp87yc7Bcabpjpnk4Vo2jNrKYKMQTSpim8KQMNRcK5E2nKuq8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4606585"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="4606585"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 20:23:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="40872417"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 Mar 2024 20:23:44 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ri5ID-0004nd-0N;
	Thu, 07 Mar 2024 04:23:41 +0000
Date: Thu, 7 Mar 2024 12:23:16 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:card2-trigger-order-2023-02-28 28/33]
 drivers/of/property.c:618 of_graph_get_port_by_id() warn: unsigned 'id' is
 never less than zero.
Message-ID: <202403071247.TzSuqPcx-lkp@intel.com>
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
config: powerpc-randconfig-r071-20240228 (https://download.01.org/0day-ci/archive/20240307/202403071247.TzSuqPcx-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403071247.TzSuqPcx-lkp@intel.com/

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
