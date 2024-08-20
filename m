Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E4228E8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Aug 2024 07:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724137763; cv=none; b=meCtWXgVUDxZqYhHRL/LL2iCeP4OU58B88wAb+qUgdPGs0Hzhk8WqhUDUhBe6CxTbgxebF6tzlDf1e59K5PHtnIwC5CHEckCDL6nnmc57Z1S+FO/T/EwVEiY5OhFPHH3vN2cTpkrlzOFo+A/ZykQRDTPUt/+hr/WMFv+xtgE8Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724137763; c=relaxed/simple;
	bh=CUB05UZ4gQJ0F8k2H41VhZ821aKIV26RGgmYLh8ulcw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rb38MhdYjJJEwc52BrDChN2Uq8VRMV/rG/9a2CPvvEz2/phSUj8wKdkt0C+nwlynoaRrChih3DxT9e/InSzrR33L+3wiWY/7mN0+VZ8QIr73GsAb2ICopbooql/1h05ZQElNEBwvSh3yfgYJHM1RtghnHVLDNrGgAPwbw9tzmVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aWYmHhy6; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aWYmHhy6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724137762; x=1755673762;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CUB05UZ4gQJ0F8k2H41VhZ821aKIV26RGgmYLh8ulcw=;
  b=aWYmHhy69F90CJj/EbBa5hkOkyTJ/hSQbOZIz9eKs32sDzcMkz+Hz+OX
   rAzVRO/Nw5HqVkC94b8YZ9H18qgGZmEQSXjHZ0CGrSrggQ3Dz36s0p3H5
   l7+67ISCbYmC3k1aXCAgGil7G+lEfhWB4L3fGDDz4HxBfS37cAfy0IfAi
   xU+tH5PCj+aff1kqThNxX5RkEPaSeIazpewzJCInutJX1sxh17lNb+mTi
   jDdhNlIyr3LEStjLjlOFVcwsTd890ZrBNt8JT+fPprvSX0jwc/pqHrmyi
   zSMxwGwr7mxasJRMDjelKsyRVsqK21O+DiplYJmsOMh/ff0xAYe0MMsaU
   Q==;
X-CSE-ConnectionGUID: 6TBoF/8hSbaS+Pite7qT5w==
X-CSE-MsgGUID: CR6KydNZRNqmiWwiiM9ETA==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="26216499"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208";a="26216499"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 00:09:21 -0700
X-CSE-ConnectionGUID: RmhPnvl0QaCI+V37GQSXlA==
X-CSE-MsgGUID: mw1TJcdtSHa5p73sT/wY2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208";a="65454926"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Aug 2024 00:09:20 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgIzV-0009pG-2v;
	Tue, 20 Aug 2024 07:09:17 +0000
Date: Tue, 20 Aug 2024 15:09:06 +0800
From: kernel test robot <lkp@intel.com>
To: Tahera Fahimi <fahimitahera@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Subject: [linux-next:master 5281/5508] security/landlock/task.c:126: warning:
 Function parameter or struct member 'scope' not described in
 'domain_is_scoped'
Message-ID: <202408201505.lEgLaz8N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bb1b0acdcd66e0d8eedee3570d249e076b89ab32
commit: 07227e4d8f520114358aa841cd50a11795d92a36 [5281/5508] Landlock: Add abstract unix socket connect restriction
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240820/202408201505.lEgLaz8N-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240820/202408201505.lEgLaz8N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408201505.lEgLaz8N-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/landlock/task.c:126: warning: Function parameter or struct member 'scope' not described in 'domain_is_scoped'


vim +126 security/landlock/task.c

   112	
   113	/**
   114	 * domain_is_scoped - Checks if the client domain is scoped in the same
   115	 *			domain as the server.
   116	 *
   117	 * @client: IPC sender domain.
   118	 * @server: IPC receiver domain.
   119	 *
   120	 * Return true if the @client domain is scoped to access the @server,
   121	 * unless the @server is also scoped in the same domain as @client.
   122	 */
   123	static bool domain_is_scoped(const struct landlock_ruleset *const client,
   124				     const struct landlock_ruleset *const server,
   125				     access_mask_t scope)
 > 126	{
   127		int client_layer, server_layer;
   128		struct landlock_hierarchy *client_walker, *server_walker;
   129	
   130		/* Quick return if client has no domain */
   131		if (WARN_ON_ONCE(!client))
   132			return false;
   133	
   134		client_layer = client->num_layers - 1;
   135		client_walker = client->hierarchy;
   136		/*
   137		 * client_layer must be a signed integer with greater capacity
   138		 * than client->num_layers to ensure the following loop stops.
   139		 */
   140		BUILD_BUG_ON(sizeof(client_layer) > sizeof(client->num_layers));
   141	
   142		server_layer = server ? (server->num_layers - 1) : -1;
   143		server_walker = server ? server->hierarchy : NULL;
   144	
   145		/*
   146		 * Walks client's parent domains down to the same hierarchy level
   147		 * as the server's domain, and checks that none of these client's
   148		 * parent domains are scoped.
   149		 */
   150		for (; client_layer > server_layer; client_layer--) {
   151			if (landlock_get_scope_mask(client, client_layer) & scope)
   152				return true;
   153			client_walker = client_walker->parent;
   154		}
   155		/*
   156		 * Walks server's parent domains down to the same hierarchy level as
   157		 * the client's domain.
   158		 */
   159		for (; server_layer > client_layer; server_layer--)
   160			server_walker = server_walker->parent;
   161	
   162		for (; client_layer >= 0; client_layer--) {
   163			if (landlock_get_scope_mask(client, client_layer) & scope) {
   164				/*
   165				 * Client and server are at the same level in the
   166				 * hierarchy. If the client is scoped, the request is
   167				 * only allowed if this domain is also a server's
   168				 * ancestor.
   169				 */
   170				return server_walker != client_walker;
   171			}
   172			client_walker = client_walker->parent;
   173			server_walker = server_walker->parent;
   174		}
   175		return false;
   176	}
   177	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
