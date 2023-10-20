Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E05246670
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 06:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y+4RLSGF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697783756; x=1729319756;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EM0aOQykaoBQicO82s9UxeKNylee4yOa83dJis6sG/Y=;
  b=Y+4RLSGFqaBbC5Oh54FdrD68J/7Iz0VrO3xGkIlD/JWQzkClKMtMqNYH
   IEbsqlX5pDqU07NlAG3QLLwKB1yH1uvLmArl/ja9Pvb4w5gIW0TXut+KH
   qCEtkPfPyt4WhJfFeeZGdMecMGx8d8LmQq209Exw2pJvrdiOkWZwrcd+t
   PK9Ua/BAJa8ysZQP+8NomCmgToLw4yWKRNgioZ9cbGWJALn5/QOjHJUW4
   a4JM+dUDnmFJnDHy6ePPEGFaGAJ+XIm8OYV91301XHgpW84EN9c7l2DZm
   DlQeuLchVES/+xA8E6afhLbEND23Pv/I8wEWPX9EA3StmOMCvn+PxL8u1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="371511663"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="371511663"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 23:35:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="5287919"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Oct 2023 23:35:55 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtj6t-0003AB-2u;
	Fri, 20 Oct 2023 06:35:51 +0000
Date: Fri, 20 Oct 2023 14:35:09 +0800
From: kernel test robot <lkp@intel.com>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH bpf-next v2 1/9] cgroup: Make operations on the
 cgroup root_list RCU safe
Message-ID: <202310201402.OTBQV3GJ-lkp@intel.com>
References: <20231017124546.24608-2-laoar.shao@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231017124546.24608-2-laoar.shao@gmail.com>

Hi Yafang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Yafang-Shao/cgroup-Make-operations-on-the-cgroup-root_list-RCU-safe/20231017-204729
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20231017124546.24608-2-laoar.shao%40gmail.com
patch subject: [RFC PATCH bpf-next v2 1/9] cgroup: Make operations on the cgroup root_list RCU safe
config: um-defconfig (https://download.01.org/0day-ci/archive/20231020/202310201402.OTBQV3GJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310201402.OTBQV3GJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310201402.OTBQV3GJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: kernel/cgroup/cgroup.o: in function `__cset_cgroup_from_root':
>> kernel/cgroup/cgroup.c:1389: undefined reference to `lockdep_is_held'
>> collect2: error: ld returned 1 exit status


vim +1389 kernel/cgroup/cgroup.c

  1362	
  1363	/*
  1364	 * Returned cgroup is without refcount but it's valid as long as cset pins it.
  1365	 */
  1366	static inline struct cgroup *__cset_cgroup_from_root(struct css_set *cset,
  1367						    struct cgroup_root *root)
  1368	{
  1369		struct cgroup *res_cgroup = NULL;
  1370	
  1371		if (cset == &init_css_set) {
  1372			res_cgroup = &root->cgrp;
  1373		} else if (root == &cgrp_dfl_root) {
  1374			res_cgroup = cset->dfl_cgrp;
  1375		} else {
  1376			struct cgrp_cset_link *link;
  1377			lockdep_assert_held(&css_set_lock);
  1378	
  1379			list_for_each_entry(link, &cset->cgrp_links, cgrp_link) {
  1380				struct cgroup *c = link->cgrp;
  1381	
  1382				if (c->root == root) {
  1383					res_cgroup = c;
  1384					break;
  1385				}
  1386			}
  1387		}
  1388	
> 1389		WARN_ON_ONCE(!res_cgroup && lockdep_is_held(&cgroup_mutex));
  1390		return res_cgroup;
  1391	}
  1392	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
