Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA50C52F6B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Mar 2024 07:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709710697; cv=none; b=IRQFfstjTK8G4KMYhDMTXG7u8ra+Rriizhb+9xs7deIDpk3XdkS+a+Q8OrzFCH4wpl0yiR8aWHni3a+xFopqVqKCMW7REg2s9TDEmYA6zriWE3Za3j3MFePZrT1SLftlK/z8MKXqMr++HBjPgqE4LpG85cDPbhWTcZ573+dKv5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709710697; c=relaxed/simple;
	bh=Nr+yZa+yc6Y62/kafN+uo6RJfD5/hRAlrbk7wrJGVLM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=erTRvtBMFDQAdCdvBohU4Synn5dlHWDbXqJaHlk69DJM9MECUoRxb7TIzoGDYMzBbQyPs2ZQvAI5bP+41K+TJwqyEfEfHmL/8jrq9yYaq7dFnmRMFrscI+AI37uRh84+nAAazcLWfXzXppCfVqfPSG8qGsFThLBGRQjOeFQ9A04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UdOMChgE; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UdOMChgE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709710695; x=1741246695;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Nr+yZa+yc6Y62/kafN+uo6RJfD5/hRAlrbk7wrJGVLM=;
  b=UdOMChgELCyAGCjB0Erv2SCNnkj4nme5XsStOLqg7Mfyc7nsqu6zjUHT
   pQ1UlCtNaHkN/7R4yMQpmZUUxxiQH5zOZGvdtzfJbyi9gYKEG1I2NvcWE
   GF47crCLeiWU0ozJ1niD0NeUNb0hPOHV7nCWRara3w74XMRrc9pdociE5
   YrjCERheFg63ksemi5OF2JS0YHYXlKUhS7vYC0Rew7uKs15RYBTYi7mhH
   pux7jcXZM4yHuDAdtzzpc2X3/lSxGHrzYZJI31Kc16PG+1cA18CFQeXVp
   DooJkUFcY6yRyrbQJIOuHEIyThkcs2D4y1eiJ/4VMy+WFSN9ZeBICKxU0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4479312"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="4479312"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 23:38:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="9530375"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Mar 2024 23:38:14 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhlqu-00042D-0u;
	Wed, 06 Mar 2024 07:38:12 +0000
Date: Wed, 6 Mar 2024 15:37:38 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:card2-trigger-order-2023-02-28 28/33]
 drivers/of/property.c:618 of_graph_get_port_by_id() warn: unsigned 'id' is
 never less than zero.
Message-ID: <202403061545.m0akdfAZ-lkp@intel.com>
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
config: powerpc-randconfig-r071-20240228 (https://download.01.org/0day-ci/archive/20240306/202403061545.m0akdfAZ-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403061545.m0akdfAZ-lkp@intel.com/

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
