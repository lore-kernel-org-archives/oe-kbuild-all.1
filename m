Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60875155A5D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Apr 2024 21:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714080920; cv=none; b=npmu7v2ViiPGovJ3szMOaZOzZQZYWB0vUT/ERWa6mBUFxJte+9rcSbNnGMPtl+0zH8jFyhDxaXNzoiC/qVJBXw6bbCqy54c4yyDNZQKBZRGTymaTsA5c4OF+vsPKXivxG9Gvfk06enpFCLhxopD09DZZp7CAPDFbYO9OpPUx7nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714080920; c=relaxed/simple;
	bh=9V2QXWPhhXowx0euWho6q5G0NHoHG0l9abH9BBQkLzM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l3J1E0ri1gqjDKPFHNFWluZB1GzI5OWnliFKyqMgn0WOlkneCi+B7sf1I31F/B9SCqSYpjYRkZBUt6crV0QdoktHLIeJunnDyi93yZZ+mKjYCt7O+6wjZDodi4g77UI2wxLDGV1vI2tP28FXF0ygCLQJsqI3bi5lBu491YCCJEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fn/zN9fn; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fn/zN9fn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714080918; x=1745616918;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9V2QXWPhhXowx0euWho6q5G0NHoHG0l9abH9BBQkLzM=;
  b=Fn/zN9fnpmmwichZEcGc8fu079wsnRSUkHp5GYKuzvMv/H1qni0Gvypc
   rReJFdFjkd1Hz+H9sxHjIsI+2NsODlGffPJ8hRgFqTjCqi5K11OVyOuEF
   nxJ8maxtvf8syX+7Zq/dRZvf7UqcQ7SaXNYwPPU3CMRYPJjFHXBp4yuNs
   IeGoZe+abmlrNBMe9kArhl+E0HipwKeQ3NcHVHV63o3izvlXpnQoYcAh7
   5m/8cHFmMuo9Stf5ecpAf0I9U/j5KN4bySkJEZgre2A6aS9yMC9mdfC8L
   O1YpVem45PUUZQ/Q+9ITpphsC9caZXfND0u+R9QJ4VYzZYoZNdLb3/kkI
   g==;
X-CSE-ConnectionGUID: djRq4yKiRt26kPNMwanODg==
X-CSE-MsgGUID: o+RHXkGhTfayTypvj6RBMA==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="10017911"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="10017911"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 14:35:18 -0700
X-CSE-ConnectionGUID: udJIeTkDTd+UApnn4zsYhA==
X-CSE-MsgGUID: HBPbtx0mR9+5kBcsnJSf5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="25217790"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 25 Apr 2024 14:35:17 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s06kM-0002tk-1o;
	Thu, 25 Apr 2024 21:35:14 +0000
Date: Fri, 26 Apr 2024 05:34:47 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <j.granados@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [joel-granados:jag/sysctl_remset_net 2/9]
 net/mpls/af_mpls.c:2692:18: error: use of undeclared identifier
 'tabel_size'; did you mean 'table_size'?
Message-ID: <202404260545.Yszcsx8x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joel.granados/linux.git jag/sysctl_remset_net
head:   0601b5211d4d02b83c06047608e6ab7023379071
commit: f01da46a76f68d2c13bb9d16e00324de5af560c8 [2/9] net: Remove the now superfluous sentinel elements from ctl_table array
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20240426/202404260545.Yszcsx8x-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240426/202404260545.Yszcsx8x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404260545.Yszcsx8x-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/mpls/af_mpls.c:2692:18: error: use of undeclared identifier 'tabel_size'; did you mean 'table_size'?
    2692 |         for (i = 0; i < tabel_size; i++)
         |                         ^~~~~~~~~~
         |                         table_size
   net/mpls/af_mpls.c:2676:9: note: 'table_size' declared here
    2676 |         size_t table_size = ARRAY_SIZE(mpls_table);
         |                ^
   net/mpls/af_mpls.c:2696:13: error: use of undeclared identifier 'tabel_size'; did you mean 'table_size'?
    2696 |                                                tabel_size);
         |                                                ^~~~~~~~~~
         |                                                table_size
   net/mpls/af_mpls.c:2676:9: note: 'table_size' declared here
    2676 |         size_t table_size = ARRAY_SIZE(mpls_table);
         |                ^
   2 errors generated.


vim +2692 net/mpls/af_mpls.c

  2673	
  2674	static int mpls_net_init(struct net *net)
  2675	{
  2676		size_t table_size = ARRAY_SIZE(mpls_table);
  2677		struct ctl_table *table;
  2678		int i;
  2679	
  2680		net->mpls.platform_labels = 0;
  2681		net->mpls.platform_label = NULL;
  2682		net->mpls.ip_ttl_propagate = 1;
  2683		net->mpls.default_ttl = 255;
  2684	
  2685		table = kmemdup(mpls_table, sizeof(mpls_table), GFP_KERNEL);
  2686		if (table == NULL)
  2687			return -ENOMEM;
  2688	
  2689		/* Table data contains only offsets relative to the base of
  2690		 * the mdev at this point, so make them absolute.
  2691		 */
> 2692		for (i = 0; i < tabel_size; i++)
  2693			table[i].data = (char *)net + (uintptr_t)table[i].data;
  2694	
  2695		net->mpls.ctl = register_net_sysctl_sz(net, "net/mpls", table,
  2696						       tabel_size);
  2697		if (net->mpls.ctl == NULL) {
  2698			kfree(table);
  2699			return -ENOMEM;
  2700		}
  2701	
  2702		return 0;
  2703	}
  2704	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
