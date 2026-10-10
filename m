Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2221D381C4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Oct 2026 00:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791591163; cv=none; b=R4kPS3rua5/MDVIrB/Bfh8YdDwBEJkX98tq1+Bm2+nuL2PbJhbb5r9hdqJrUJxuzUTP9COw1bt4LL0nqEpzE97tzr/OexRwZsxpMsdwVYTDmXOej7Ijs4Zafi5fMJTjzij9G2yQzTMDu0nG/Nuf52we88+dmeS0onna9puv6+pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791591163; c=relaxed/simple;
	bh=i8YHYfy8EUbuhGNl6zl7me5CyegzKdzvGUOyCD1ZMXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uwbadRW4FqZxiiHV5jg8gMbzFScupLF6rDIf+V43bDziT/64ATWoni3pf2WlEDCUR6KivGSvhIu9ZzQs+DAW1HDwxCJcnHrfIPoGRonJuqt9IwE2T+VB4zgJcvlEXirYdw2wXEmCctnkaXsGTjy7As6nM4rHDLZPPbOBjjoIeP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BFIzMNJ1; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BFIzMNJ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791591162; x=1823127162;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i8YHYfy8EUbuhGNl6zl7me5CyegzKdzvGUOyCD1ZMXE=;
  b=BFIzMNJ1cQ+iXLEyxqb6zvuse9vJJVCHtktGQYx4k/YqYOIaUDRFUBg6
   88hORZth1SZp4kd58GovoDE1cxN/Twr6EvwJ7jF2V6LZixQuTfw9jKTcI
   U+625wPzfRMzX/0ommsgZcAW4y2rQU1EarUv77+ubcwNUdekHI6RvHoNE
   qeJzAnbAIB7mTpPxyuc0dxJiwSgFeCfWJKsqbQfP4zYxbBm1+9DswPW+i
   eraJPbVpu9wle51ORshMmqlPmKgOowrERvbJ7x67Ta62FCMjorsVsR8qe
   p7w9NpW6ZAI4+hpVbu3MO+sAHqIn2ufp5eT9FaVG+j8b3OTOpZOREK0oh
   g==;
X-CSE-ConnectionGUID: x9wBcHa7SWGAVwH5FC4qxg==
X-CSE-MsgGUID: KSQzMViSQYCl04rbRxlgAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="491785"
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="491785"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 17:12:40 -0700
X-CSE-ConnectionGUID: 74dYt6zmQqOUvFdZXxPlXw==
X-CSE-MsgGUID: UtRTYAyXRVuKYcVUMN53VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="558177"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Oct 2026 17:12:38 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFKhX-000000006KI-2ma1;
	Sat, 10 Oct 2026 00:12:35 +0000
Date: Sat, 10 Oct 2026 08:11:54 +0800
From: kernel test robot <lkp@intel.com>
To: Wong Boon Jhee <wongboonjhee52@gmail.com>, netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, horms@kernel.org, kuba@kernel.org,
	Wong Boon Jhee <wongboonjhee52@gmail.com>
Subject: Re: [PATCH v9] net/ncsi: Fix use-after-free in NCSI teardown
Message-ID: <202610100849.jz6h7nql-lkp@intel.com>
References: <20261009082201.1424955-1-wongboonjhee52@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009082201.1424955-1-wongboonjhee52@gmail.com>

Hi Wong,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]
[also build test WARNING on net-next/main linus/master v7.3-rc6 next-20261008]
[cannot apply to horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wong-Boon-Jhee/net-ncsi-Fix-use-after-free-in-NCSI-teardown/20261009-162201
base:   net/main
patch link:    https://lore.kernel.org/r/20261009082201.1424955-1-wongboonjhee52%40gmail.com
patch subject: [PATCH v9] net/ncsi: Fix use-after-free in NCSI teardown
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20261010/202610100849.jz6h7nql-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261010/202610100849.jz6h7nql-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610100849.jz6h7nql-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/ncsi/ncsi-manage.c: In function 'ncsi_unregister_dev':
   net/ncsi/ncsi-manage.c:2101:61: error: 'nc' undeclared (first use in this function); did you mean 'nr'?
    2101 |                                                       &np, &nc);
         |                                                             ^~
         |                                                             nr
   net/ncsi/ncsi-manage.c:2101:61: note: each undeclared identifier is reported only once for each function it appears in
>> net/ncsi/ncsi-manage.c:2084:23: warning: unused variable 'flags' [-Wunused-variable]
    2084 |         unsigned long flags;
         |                       ^~~~~


vim +/flags +2084 net/ncsi/ncsi-manage.c

  2078	
  2079	void ncsi_unregister_dev(struct ncsi_dev *nd)
  2080	{
  2081		struct ncsi_dev_priv *ndp = TO_NCSI_DEV_PRIV(nd);
  2082		struct ncsi_package *np, *tmp;
  2083		struct vlan_vid *vlan, *vlan_tmp;
> 2084		unsigned long flags;
  2085		int i;
  2086	
  2087		ncsi_unregister_dev_prepare(nd);
  2088		for (i = 0; i < ARRAY_SIZE(ndp->requests); i++) {
  2089			struct ncsi_request *nr = &ndp->requests[i];
  2090	
  2091			if (!nr->used)
  2092				continue;
  2093	
  2094			if (nr->flags == NCSI_REQ_FLAG_NETLINK_DRIVEN && nr->cmd) {
  2095				struct ncsi_cmd_pkt *cmd = (struct ncsi_cmd_pkt *)
  2096					skb_network_header(nr->cmd);
  2097	
  2098				rcu_read_lock();
  2099				ncsi_find_package_and_channel(ndp,
  2100							      cmd->cmd.common.channel,
> 2101							      &np, &nc);

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
