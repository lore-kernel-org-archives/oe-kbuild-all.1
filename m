Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A662609C5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Sep 2025 22:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758753626; cv=none; b=LZjRQLGfBBx5mYe7Y65XLjmMLC3bf8ZGR5jWgrjxrjzwBt/tc5J+s2qm3R/OrcBwgiEVUSY8No4fgNA4+hK5ZuethM4AwUQxcdIv8zBjHJBQ9lNCrnX3Zy7kWvkpmpWRMII8UCRS6so8zhJZkYD60nQkQ8SlMD6iC3hTh6Xhvsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758753626; c=relaxed/simple;
	bh=MCOjST1alWRkGHrYvRBtFCnBMnj9EfPpsorNR89KwlU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BEuPKQ+H+SJAGoLP34q/XrlzjLP5FDufXctuF7aSm+/YZo3r703YICc9kWIU4i0qmEGqlUEJaAGJYiedAcm/eQ0HoWup/K2gPAu/fOl03mqgTbO/GEf4ATg1NKK5OuJyOB1Nd3kro8r0x/avMoCYvQcJobxgv0acBB5sqwWFxAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zc5YQbR/; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zc5YQbR/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758753624; x=1790289624;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MCOjST1alWRkGHrYvRBtFCnBMnj9EfPpsorNR89KwlU=;
  b=Zc5YQbR/n/LCOD944RTdzSZEp2oTCIjZc7gY3jX6aCevvl2bocjSMvzP
   Bv3/+5cIOpErYN3DDgsBx7Jd1mgGNL5rCA4c6/Rsjh2TehGEB5nJVbkjf
   cQnhT/YA5HNDGHgiS9PBengd52Zs1Q7dg1GjNzc2KwAgx8v5DI8HMhZcz
   oWeHOjCp/7KAwCjGtPTA5p6IRAW2dEIy7pjxp/z7uTb4mdtBLYczGGPU3
   IDY26UAxLJtokrp0g1nIgSfBBmv7ayq+NeSIo2JDIsNF4PMzLemqKmnbO
   lwVN6ZcoG4r0fON/iJhYeFZD0pNm8hpkMzVm8l75zUxM+Acbd5hrcfpid
   w==;
X-CSE-ConnectionGUID: rNpaDCdkTGSB4b1VgzKvuA==
X-CSE-MsgGUID: LGiGyea4Tma4AiamsBMMzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="86508962"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="86508962"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 15:40:23 -0700
X-CSE-ConnectionGUID: uMoFIsJsRFSMqGPiVcCSVw==
X-CSE-MsgGUID: 4rEv7CMNRC6bgC1DTPytTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="181163296"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 24 Sep 2025 15:40:18 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1Y9m-0004cb-2Z;
	Wed, 24 Sep 2025 22:40:14 +0000
Date: Thu, 25 Sep 2025 06:39:19 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Amir Goldstein <amir73il@gmail.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Jeff Layton <jlayton@kernel.org>, Mike Yuan <me@yhndnzj.com>,
	Zbigniew =?utf-8?Q?J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>,
	Lennart Poettering <mzxreary@0pointer.de>,
	Aleksa Sarai <cyphar@cyphar.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, cgroups@vger.kernel.org,
	netdev@vger.kernel.org, Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH 1/3] nstree: make struct ns_tree private
Message-ID: <202509250641.QU55kXeK-lkp@intel.com>
References: <20250924-work-namespaces-fixes-v1-1-8fb682c8678e@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-work-namespaces-fixes-v1-1-8fb682c8678e@kernel.org>

Hi Christian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d969328c513c6679b4be11a995ffd4d184c25b34]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Brauner/nstree-make-struct-ns_tree-private/20250924-193826
base:   d969328c513c6679b4be11a995ffd4d184c25b34
patch link:    https://lore.kernel.org/r/20250924-work-namespaces-fixes-v1-1-8fb682c8678e%40kernel.org
patch subject: [PATCH 1/3] nstree: make struct ns_tree private
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20250925/202509250641.QU55kXeK-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250925/202509250641.QU55kXeK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509250641.QU55kXeK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/nstree.c:17 struct member 'type' not described in 'ns_tree'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
