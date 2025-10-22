Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A39817993
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Oct 2025 04:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761107459; cv=none; b=n2nrYiORv5Dt03vONVQqp8ypGYHFSnRrp96vTuwPZUO3xh1k5TpKDgo3q15+QBBh8Jj7xN1h7DvaEFbfioQM+RMA/8D7+h/yJFK2/QZ7cNT4rTikfEllpcXyYkFLhfN3987dy1OjBPbA1diCjjWuTWP2PSMDztZkZNGaTuvZgEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761107459; c=relaxed/simple;
	bh=7OkbNVSnmAOLO/oIby7zWg0TcTS/aYOatNS56pu2V60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OkzCQRdUgqIvtEhXdfyeUQMAlE37aIMynX4BMIpHKthA9TsIuxgRzWjlYevCZ+tc5QZZM16BK8dN91BXPI6/ggcuCDgDtaY5f8MW+/YZ3l4gxBa7Fm9d+Ehcr5EWjwcDlfpW63lcAT4jLq7WbkuN65Gru0LObvvHFzWxFXsN7oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=clHxhKY6; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="clHxhKY6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761107457; x=1792643457;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7OkbNVSnmAOLO/oIby7zWg0TcTS/aYOatNS56pu2V60=;
  b=clHxhKY6AAxVE9BZZqrPTBxqcJMUX5+zifbTKourbimrf6F0yCbYL7Rc
   zN9gV64/D9EEts+8dd5rd+oZVaonvxLxSvCMh+Kb6foo4I4lHSaEXY7cW
   c5wXsf4tu2Ky/Off2e3TNJoZtNvwRw/KzotOyLB74LYm/It5hiE0Qusma
   7te84Z09FqW34EMNQWvaTsAKHji+iNAnq7n8uHUIgQ/5phAl+rIR9uyfY
   NPBHTyBpX/W9M3qnD5rQRKO/baAdLv1VFbhsu4rEXlOQjVytutEBS22wa
   Kzz7LgksN6F8dwJ4CarGJGCbhOcgwJS2epNvDlrp8LJPipo19yIQlavoK
   Q==;
X-CSE-ConnectionGUID: 6idpGWFQRsuWW+ufCqzeYw==
X-CSE-MsgGUID: 2dA4GKsTS/usGjldbfCuqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63148927"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63148927"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 21:30:57 -0700
X-CSE-ConnectionGUID: q6z+CgJeSMqRQSoNOF5OjQ==
X-CSE-MsgGUID: cAajaNOBQbyHWqwG5uW/Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="214406186"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 21 Oct 2025 21:30:56 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBQTm-000C09-14;
	Wed, 22 Oct 2025 04:30:14 +0000
Date: Wed, 22 Oct 2025 12:29:10 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC DRAFT 15/50] nstree: add listns()
Message-ID: <202510221135.xClI1Bc8-lkp@intel.com>
References: <20251021-work-namespace-nstree-listns-v1-15-ad44261a8a5b@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021-work-namespace-nstree-listns-v1-15-ad44261a8a5b@kernel.org>

Hi Christian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 3a8660878839faadb4f1a6dd72c3179c1df56787]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Brauner/libfs-allow-to-specify-s_d_flags/20251021-200829
base:   3a8660878839faadb4f1a6dd72c3179c1df56787
patch link:    https://lore.kernel.org/r/20251021-work-namespace-nstree-listns-v1-15-ad44261a8a5b%40kernel.org
patch subject: [PATCH RFC DRAFT 15/50] nstree: add listns()
config: x86_64-buildonly-randconfig-002-20251022 (https://download.01.org/0day-ci/archive/20251022/202510221135.xClI1Bc8-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510221135.xClI1Bc8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510221135.xClI1Bc8-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/nstree.c: In function 'do_listns_userns':
>> kernel/nstree.c:503:24: error: implicit declaration of function 'to_user_ns'; did you mean 'i_user_ns'? [-Wimplicit-function-declaration]
     503 |         kls->user_ns = to_user_ns(ns);
         |                        ^~~~~~~~~~
         |                        i_user_ns
>> kernel/nstree.c:503:22: error: assignment to 'struct user_namespace *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     503 |         kls->user_ns = to_user_ns(ns);
         |                      ^
>> kernel/nstree.c:530:42: error: passing argument 1 of 'ns_capable_noaudit' makes pointer from integer without a cast [-Wint-conversion]
     530 |                      !ns_capable_noaudit(to_user_ns(ns), CAP_SYS_ADMIN)))
         |                                          ^~~~~~~~~~~~~~
         |                                          |
         |                                          int
   In file included from include/linux/cred.h:11,
                    from include/linux/nsfs.h:8,
                    from include/linux/proc_ns.h:8,
                    from kernel/nstree.c:4:
   include/linux/capability.h:149:55: note: expected 'struct user_namespace *' but argument is of type 'int'
     149 | extern bool ns_capable_noaudit(struct user_namespace *ns, int cap);
         |                                ~~~~~~~~~~~~~~~~~~~~~~~^~
   kernel/nstree.c: In function 'do_listns':
   kernel/nstree.c:664:42: error: passing argument 1 of 'ns_capable_noaudit' makes pointer from integer without a cast [-Wint-conversion]
     664 |                      !ns_capable_noaudit(to_user_ns(ns), CAP_SYS_ADMIN)))
         |                                          ^~~~~~~~~~~~~~
         |                                          |
         |                                          int
   include/linux/capability.h:149:55: note: expected 'struct user_namespace *' but argument is of type 'int'
     149 | extern bool ns_capable_noaudit(struct user_namespace *ns, int cap);
         |                                ~~~~~~~~~~~~~~~~~~~~~~~^~


vim +503 kernel/nstree.c

   485	
   486	static ssize_t do_listns_userns(struct klistns *kls)
   487	{
   488		u64 *ns_ids = kls->kns_ids;
   489		size_t nr_ns_ids = kls->nr_ns_ids;
   490		struct ns_common *ns, *first_ns = NULL;
   491		const struct list_head *head;
   492		bool userns_capable;
   493		ssize_t ret;
   494	
   495		VFS_WARN_ON_ONCE(!kls->user_ns_id);
   496	
   497		if (kls->user_ns_id == LISTNS_CURRENT_USER)
   498			ns = to_ns_common(current_user_ns());
   499		else if (kls->user_ns_id)
   500			ns = lookup_ns_id(kls->user_ns_id, CLONE_NEWUSER);
   501		if (!ns)
   502			return -EINVAL;
 > 503		kls->user_ns = to_user_ns(ns);
   504	
   505		/*
   506		 * Use the rbtree to find the first namespace we care about and
   507		 * then use it's list entry to iterate from there.
   508		 */
   509		if (kls->last_ns_id) {
   510			kls->first_ns = lookup_ns_owner_at(kls->last_ns_id + 1, ns);
   511			if (!kls->first_ns)
   512				return -ENOENT;
   513			first_ns = kls->first_ns;
   514		}
   515	
   516		ret = 0;
   517		head = &to_ns_common(kls->user_ns)->ns_owner;
   518		userns_capable = ns_capable_noaudit(kls->user_ns, CAP_SYS_ADMIN);
   519		guard(rcu)();
   520		if (!first_ns)
   521			first_ns = list_entry_rcu(head->next, typeof(*ns), ns_owner_entry);
   522		for (ns = first_ns; &ns->ns_owner_entry != head && nr_ns_ids;
   523		     ns = list_entry_rcu(ns->ns_owner_entry.next, typeof(*ns), ns_owner_entry)) {
   524			if (kls->ns_type && !(kls->ns_type & ns->ns_type))
   525				continue;
   526			if (!__ns_ref_active_read(ns))
   527				continue;
   528			if (!userns_capable && !is_current_namespace(ns) &&
   529			    ((ns->ns_type != CLONE_NEWUSER) ||
 > 530			     !ns_capable_noaudit(to_user_ns(ns), CAP_SYS_ADMIN)))
   531				continue;
   532			*ns_ids = ns->ns_id;
   533			ns_ids++;
   534			nr_ns_ids--;
   535			ret++;
   536		}
   537	
   538		return ret;
   539	}
   540	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
