Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC5732D440
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 05:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765862423; cv=none; b=ruJjrKhppZxcvbNTeYWlGmB3CXQZjXkzkZtJTXF8xqSUYc2dPLOTidYXCbdK/qgzc8T1vDsDFQSEGP0uSstylu6gp4bqYADW+lcl4+iJUbeSSYfkFcDH3g0gNd8jOtb6JWnkdPo9jAEBpv+BnnU++JnWP/gAI/it9v7XZYFW+eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765862423; c=relaxed/simple;
	bh=xE1dhCsdlPenvPb/QwLxKPIL9ggriBZhbOJquY4jLUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FdN7ia/cTXaSkH8C0DENhxGZAVxbfHc9vufxCkcZfONVQiXR7CH7SYyZU4ASc63697y85c4vKeJUNBaggosqQdj7dr8yUu+Uv/XWv5jYJRU6U3qBpV5i9oLMoU6zbxwBfkufexK2s76M4f1lRb2ZqlEL3xY5505+rgLVDG35Xpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KtehXGa+; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KtehXGa+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765862417; x=1797398417;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xE1dhCsdlPenvPb/QwLxKPIL9ggriBZhbOJquY4jLUA=;
  b=KtehXGa+kQIwVnbwvN0Jc29m4jBemQMDA9Ri0fA+X8mdV3HNYdCx6Vbe
   YWuLVzxJtYNn2WVMj9+jRb3fTtOIXmTPDeiE3QfuAx3LtaEBnbsFEBVd7
   QXN2VFofkC/+GBIlOYGlmE/KeS20cDvgwE/e5umHd7EzKfGhCI3xIv1oz
   oEnUDT//BXpZM893JBW5pmSOek6ndvxosQ8UITugRTtYmgoDsD40UDw5F
   E5gVTNdGCe4rf6QmtnLOYl/DGi4Yq+isbqDbfwZ9rmkitUooLtWxqOHn7
   V2yQnHL/ByaiFqQQGlwMvRuqcKTi6lhSYKpZVf85DBUiRmejovATjyClY
   A==;
X-CSE-ConnectionGUID: EojYAjDpRzGl5gN5zydCCg==
X-CSE-MsgGUID: KKeUfQ3dTtazHHFU3BBoIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="71404175"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="71404175"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 21:20:14 -0800
X-CSE-ConnectionGUID: rNZx0CiUTtCYXIYnN27CqQ==
X-CSE-MsgGUID: Wsb/7tfDR4q+03zf9hrv/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="197811430"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 15 Dec 2025 21:20:12 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVNTm-0000000031U-2s3b;
	Tue, 16 Dec 2025 05:20:10 +0000
Date: Tue, 16 Dec 2025 06:20:03 +0100
From: kernel test robot <lkp@intel.com>
To: Dharanitharan R <dharanitharan725@gmail.com>,
	syzbot+422806e5f4cce722a71f@syzkaller.appspotmail.com
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, dharanitharan725@gmail.com
Subject: Re: [PATCH net v2] team: fix qom_list corruption by using
 list_del_init_rcu()
Message-ID: <202512160610.CtwITAzk-lkp@intel.com>
References: <20251210053104.23608-2-dharanitharan725@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251210053104.23608-2-dharanitharan725@gmail.com>

Hi Dharanitharan,

kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Dharanitharan-R/team-fix-qom_list-corruption-by-using-list_del_init_rcu/20251210-133429
base:   net/main
patch link:    https://lore.kernel.org/r/20251210053104.23608-2-dharanitharan725%40gmail.com
patch subject: [PATCH net v2] team: fix qom_list corruption by using list_del_init_rcu()
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20251216/202512160610.CtwITAzk-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512160610.CtwITAzk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512160610.CtwITAzk-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/team/team_core.c: In function '__team_queue_override_port_del':
>> drivers/net/team/team_core.c:827:9: error: implicit declaration of function 'list_del_init_rcu'; did you mean 'hlist_del_init_rcu'? [-Wimplicit-function-declaration]
     827 |         list_del_init_rcu(&port->qom_list);
         |         ^~~~~~~~~~~~~~~~~
         |         hlist_del_init_rcu


vim +827 drivers/net/team/team_core.c

   820	
   821	static void __team_queue_override_port_del(struct team *team,
   822						   struct team_port *port)
   823	{
   824		if (!port->queue_id)
   825			return;
   826		/* Ensure safe repeated deletion */
 > 827		list_del_init_rcu(&port->qom_list);
   828	}
   829	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
