Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F401494BF
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 May 2024 06:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715235126; cv=none; b=ZO8iyKMSZAiLZsnjc2RXb384u49UsjA4XM5vFOonH9z2FpQsu11VLf+Yf9m/sxbDSHVU9hWLE7VY6guMA2dU+YepQLg4JEd2zUHzpD3TB39YqeOo4ZPDj18YhTWXT07fALdB8XeunI9cfPWWXMPyaWX2Blgt33j5uoFHsDmPYzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715235126; c=relaxed/simple;
	bh=kt415/BYdj6nnQbZy2107UHj5qf3fLlxWZY60NUzFJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iULdyKmcj8W+sSmS9qFKB7oG8sKRQrMuT39qiTnOJa72Y+PqRXCOXdujRUFGZOuC9U8yyXVjfYsMXeVh/H+2eC4Sox7c5eKy9r37957gK2EpbmEa76z/IRL6T/gxD47YqSZF6wJr5D2yISmLhnXNKQwMfn/vDjnlNbH4Zvw7gKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KvZmxOKC; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KvZmxOKC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715235124; x=1746771124;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kt415/BYdj6nnQbZy2107UHj5qf3fLlxWZY60NUzFJk=;
  b=KvZmxOKCH3ddMrGPUrnJCqbUaBTM0QUGr01r5STYaCNVdvgwjhENauIn
   kyXWGpJADHb53z4m2F2VCEjJwujsiXOHmJw/i0hj/fv/WFl4shHuqsYbB
   MQvwxTzg8PniA6b4kmGm9ddZ27LnaEWNXFHGrJsC62kVU6cvElahzMu7u
   /zXCyPJQv97l1nwQA3zKx2AUWXGl0bly8q5msRem+jG0YaMNAHJLnEGMR
   frBYS+9IxxVgm+L3rIOdXFvYQca+dOR1e0SfldOVw8hMcy0hPTRGlRXwh
   8RZ4cqljgiTJfLvRaozuAVDrHcYYvDAIbqNJlWVTyymJCE6O/xse2f56o
   A==;
X-CSE-ConnectionGUID: TvlVQss0S5Kat9McsYvMmg==
X-CSE-MsgGUID: 30pY62MZTqufv9/5pJQq9Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="22530095"
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; 
   d="scan'208";a="22530095"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 23:12:04 -0700
X-CSE-ConnectionGUID: dHelW6KtTOyMIMz9mcgRQA==
X-CSE-MsgGUID: WId4gxlKQeqiBN7b4RoMbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; 
   d="scan'208";a="52333890"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 May 2024 23:12:03 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4x0a-0004Vo-1T;
	Thu, 09 May 2024 06:12:00 +0000
Date: Thu, 9 May 2024 14:11:19 +0800
From: kernel test robot <lkp@intel.com>
To: William Tu <witu@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC net-next] net: cache the __dev_alloc_name()
Message-ID: <202405091354.2Bdd0B0X-lkp@intel.com>
References: <20240506203207.1307971-1-witu@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240506203207.1307971-1-witu@nvidia.com>

Hi William,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]
[also build test WARNING on linus/master v6.9-rc7]
[cannot apply to net-next/main horms-ipvs/master next-20240508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/William-Tu/net-cache-the-__dev_alloc_name/20240507-043305
base:   net/main
patch link:    https://lore.kernel.org/r/20240506203207.1307971-1-witu%40nvidia.com
patch subject: [PATCH RFC net-next] net: cache the __dev_alloc_name()
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20240509/202405091354.2Bdd0B0X-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240509/202405091354.2Bdd0B0X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405091354.2Bdd0B0X-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/core/dev.c:295:13: warning: 'netdev_name_pat_in_use' defined but not used [-Wunused-function]
     295 | static bool netdev_name_pat_in_use(struct net *net, const char *pat) // eth%d
         |             ^~~~~~~~~~~~~~~~~~~~~~
>> net/core/dev.c:277:13: warning: 'netdev_name_pat_node_del' defined but not used [-Wunused-function]
     277 | static void netdev_name_pat_node_del(struct netdev_name_pat_node *pat_node)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
>> net/core/dev.c:264:13: warning: 'netdev_name_pat_node_free' defined but not used [-Wunused-function]
     264 | static void netdev_name_pat_node_free(struct netdev_name_pat_node *pat_node)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/netdev_name_pat_in_use +295 net/core/dev.c

   263	
 > 264	static void netdev_name_pat_node_free(struct netdev_name_pat_node *pat_node)
   265	{
   266		bitmap_free(pat_node->inuse);
   267		kfree(pat_node);
   268	}
   269	
   270	static void netdev_name_pat_node_add(struct net *net,
   271					     struct netdev_name_pat_node *pat_node)
   272	{
   273		hlist_add_head(&pat_node->hlist,
   274			       dev_name_pat_hash(net, pat_node->name_pat));
   275	}
   276	
 > 277	static void netdev_name_pat_node_del(struct netdev_name_pat_node *pat_node)
   278	{
   279		hlist_del_rcu(&pat_node->hlist);
   280	}
   281	
   282	static struct netdev_name_pat_node *
   283	netdev_name_pat_node_lookup(struct net *net, const char *pat)
   284	{
   285		struct hlist_head *head = dev_name_pat_hash(net, pat);
   286		struct netdev_name_pat_node *pat_node;
   287	
   288		hlist_for_each_entry(pat_node, head, hlist) {
   289			if (!strcmp(pat_node->name_pat, pat))
   290				return pat_node;
   291		}
   292		return NULL;
   293	}
   294	
 > 295	static bool netdev_name_pat_in_use(struct net *net, const char *pat) // eth%d
   296	{
   297		return netdev_name_pat_node_lookup(net, pat);
   298	}
   299	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
