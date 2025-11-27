Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A79124886A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Nov 2025 18:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764267767; cv=none; b=FX73yGFOkviJ6a7fqgPFfYuKXOOZve77bco4U8QmgtYY0RID8yyziWa7g642R4l9MaPdb4dRzVqRPuCWqmAu+qu2TE+2QFe981bJXCvO/e+xtoLd/D3WfrfCHbA8KFjAz+521cuIqgkyijPWWRunuZEhylluZ14qDHcuzahQXF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764267767; c=relaxed/simple;
	bh=tE7Yq5ldoNbJ9WyLf2b4mOZV0lwPxU3IHx5AAecTQ5I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hQ7da91XvcutUxy7+W4Xhg17VvkOEqdJSsIbFeBuWZ15SrtyohlTqAKAm+IzLxSS5v7/MNuM179MvGapNfl/lPwzjg17vM3/snnzNXWqaU49f6vWLmUyQaLHlnOat1VX1zsqv1ZlyNNdioCtw9u7fJ0SrFgtMOK5Ixh6GwNs2rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jvG2dTGK; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jvG2dTGK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764267766; x=1795803766;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tE7Yq5ldoNbJ9WyLf2b4mOZV0lwPxU3IHx5AAecTQ5I=;
  b=jvG2dTGKLyVLxs1Ig/5ulCQdhKrkXxIIGLg7cEBXZo+HKcsfcTXvlG8a
   es0bL2G1vXp2w74/hX/2lEPnK/ZhI1yXnWrEpDExwcHolKrYFtcfNEGuX
   1u9XdRtwdH7OKTdxfnM7V/BAG4QeF9s2M/tCyqYYjtSi/eAyjYYt1VQiI
   ziG0OgJ+rwA8nfJ+ykYe4mL7KkMj6pBrpPy3v8WW2ssh5Y4P/XvJJj611
   eUAHK8X1iv/nOyBTBtxnQV+cHi7//vThGbN6EM3dd83z3XDZ6OAQSoc6T
   WqlfgV6wAqW5cB6zNiaNzh5RClqxHrmQQv99I0xbYDnC2Rxg7cKbbsgTX
   Q==;
X-CSE-ConnectionGUID: Ci41aiNATY2pz2epoas0lw==
X-CSE-MsgGUID: 7NJ2bG0ZSUO1LQrO0AMspw==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="77421505"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; 
   d="scan'208";a="77421505"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 10:22:45 -0800
X-CSE-ConnectionGUID: PtHCr3LaSEyY9ck4hbGQ1Q==
X-CSE-MsgGUID: J7jkHeLeR8mmGg0dFlwRNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; 
   d="scan'208";a="192414117"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 27 Nov 2025 10:22:44 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOgdd-000000001oP-2okB;
	Thu, 27 Nov 2025 18:22:41 +0000
Date: Thu, 27 Nov 2025 19:22:30 +0100
From: kernel test robot <lkp@intel.com>
To: David Wei <dw@davidwei.uk>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Borkmann <daniel@iogearbox.net>,
	Nikolay Aleksandrov <razor@blackwall.org>
Subject: [cilium:pr/netkit-iouring6 1/2] net/core/netdev-genl.c:1123:5:
 warning: no previous prototype for 'netdev_nl_bind_queue_doit'
Message-ID: <202511271914.gOQcRs7y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git pr/netkit-iouring6
head:   7bfb4fc5f460441d05b483647e4f4c59c4afaeb1
commit: f54fd4a1c99a85d283ce07ebc4505d09a28b28f5 [1/2] net: Add bind-queue operation
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20251127/202511271914.gOQcRs7y-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511271914.gOQcRs7y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511271914.gOQcRs7y-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/core/netdev-genl.c:1123:5: warning: no previous prototype for 'netdev_nl_bind_queue_doit' [-Wmissing-prototypes]
    1123 | int netdev_nl_bind_queue_doit(struct sk_buff *skb, struct genl_info *info)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/netdev_nl_bind_queue_doit +1123 net/core/netdev-genl.c

  1122	
> 1123	int netdev_nl_bind_queue_doit(struct sk_buff *skb, struct genl_info *info)
  1124	{
  1125		return -EOPNOTSUPP;
  1126	}
  1127	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
