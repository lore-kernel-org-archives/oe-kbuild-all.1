Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44DE3148A7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Nov 2025 11:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763465122; cv=none; b=VQS0ldAJnMezU/ZdqQNd/KUUbYhljnSrOhmnTnIx31jK29yITauq8v+M//DM7na8Hbt7ezKDpELViEpvc5uaI+7Ly4tuHS9zI3cMZ3hynARxc955AUebYhzbNCPE8wwK2RkKzceagGwrHvrihdmH08j80sGHkcnoCUaRWUbDkzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763465122; c=relaxed/simple;
	bh=DWBN1L3I6POnCTToG/ZCn3EPFg6qcUuO1AIjY0RY8sU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OwN2UXzVmoZ3uPhCP0xUBsXZHG/Govx/SGby81gMog1Be0LUnUmTrxqjfLFEd11ZtP9Z8kEK24X9ml0M68K+Jd/iSbm/93b1GVPYquoYvd/4CvLFFzEeMQyYK0vwaW80nO93Uz/n7OpQLgBzi4sjvoEWaLHT6+3YTopJnZdbg0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WisRr4YE; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WisRr4YE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763465121; x=1795001121;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DWBN1L3I6POnCTToG/ZCn3EPFg6qcUuO1AIjY0RY8sU=;
  b=WisRr4YE8l/xBBClD98Q8k9MVWAVg8zbycq/nlSgTkUHet+zQurM3wkx
   f/RfS6x+4GMVHgWAbDBYFe2ARajU4KIYrw2Vuxhfuq5JOtSVxuy2gqsUx
   Q5GlpzxbilbKWb3scohBGdD2zp4tfP4PMZsS5nOb4luQlBJJEdmjOHZcT
   P+/Gwb1PhjtqRbD3fW1i3jIYfM102AbstWYU8tu4aLFgEqIK4PROB1rc7
   CoGXNyIBHF/qxbopEWlIZDXLZUvhUwj/TWwbAptu066UZ12Vc0zEhx4UD
   Y8hlhV9O76Cli8Rk7eiOxfOzDtby/Hm+urHtW+IhAsR0QVMycBWjHvpWZ
   A==;
X-CSE-ConnectionGUID: +0jZ1G+jRd+Z3HoILcu3ww==
X-CSE-MsgGUID: y50V1Z4rQiOzdphknIdwIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="76836244"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="76836244"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 03:25:20 -0800
X-CSE-ConnectionGUID: inzGqWIPTtWw7ut6Zsk76Q==
X-CSE-MsgGUID: 3UTtdkRXSSadG3OE3H4WfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="190024553"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 18 Nov 2025 03:25:19 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLJpk-0001em-2f;
	Tue, 18 Nov 2025 11:25:16 +0000
Date: Tue, 18 Nov 2025 19:25:06 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, tianzhensong <tianzhensong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3214/3214] net/ipv4/tcp_input.c:7198:25: error:
 'struct tcp_options_received' has no member named 'ums_ok'; did you mean
 'smc_ok'?
Message-ID: <202511181912.iiOiNVW1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   72220f090cf216491c25f4fe87c974ea97eb4e19
commit: 62eb2012d814e530839ba9ccf4146712701f486a [3214/3214] net: Add a new protocol family AF_UB
config: x86_64-randconfig-r111-20251118 (https://download.01.org/0day-ci/archive/20251118/202511181912.iiOiNVW1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511181912.iiOiNVW1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511181912.iiOiNVW1-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/ipv4/tcp_input.c: In function 'tcp_conn_request':
>> net/ipv4/tcp_input.c:7198:25: error: 'struct tcp_options_received' has no member named 'ums_ok'; did you mean 'smc_ok'?
    7198 |                 tmp_opt.ums_ok = 0;
         |                         ^~~~~~
         |                         smc_ok

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD_PUBLIC_KEYS [=y] && CRYPTO [=y]


vim +7198 net/ipv4/tcp_input.c

  7184	
  7185		tcp_clear_options(&tmp_opt);
  7186		tmp_opt.mss_clamp = af_ops->mss_clamp;
  7187		tmp_opt.user_mss  = tp->rx_opt.user_mss;
  7188		tcp_parse_options(sock_net(sk), skb, &tmp_opt, 0,
  7189				  want_cookie ? NULL : &foc);
  7190	
  7191		if (want_cookie && !tmp_opt.saw_tstamp)
  7192			tcp_clear_options(&tmp_opt);
  7193	
  7194		if (IS_ENABLED(CONFIG_SMC) && want_cookie)
  7195			tmp_opt.smc_ok = 0;
  7196	
  7197		if (IS_ENABLED(CONFIG_UB_UMS) && want_cookie)
> 7198			tmp_opt.ums_ok = 0;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
