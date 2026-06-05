Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0792FF672
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jun 2026 01:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780622043; cv=none; b=O/NgFZrKg6JxIKr72qDImE9ALqO1MsVnxWbJATZO8tpyrtX7OwTulrhbItLEtr7VJ8DADTp0Zg5/bP8AwvNsIp6L59dOsev1hAwpqdluo+EPBcmUSpS8v8ysx4qjQSCoCgnHjUjvVngzSOHcutAr37WrIsDSokLstcITf0yoS/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780622043; c=relaxed/simple;
	bh=PKo6nU0RJbbfixnFoba9fc3BFmeat7PfizDFu0a0szU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GWefETStFnq2lJvDrbmI3hMPW/P4CnRwsc8QtrrcB+Y47FEPgP+77wQAXlqzXSVkEzjT6EczOch631o3tESsjPbYTJKzIUpaLDgVWUu+sQFFCw+Pz+npoapi2osQ9jaPwXamkyDkZOtkWr7UMZcRe8JLCGsUd3sPiMS5XGZQfgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ksklrfEm; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ksklrfEm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780622040; x=1812158040;
  h=date:from:to:cc:subject:message-id;
  bh=PKo6nU0RJbbfixnFoba9fc3BFmeat7PfizDFu0a0szU=;
  b=ksklrfEmU+/xXgsyDSPqfeLcmvCce6HziYJTl+wZvK2NsWXWLVBFWuZ/
   3lpnUKWhibLEH5qYrmDuBPm7FrisM+elZMFG4OcHQXlDOSiSvW6fDeAo8
   7NqrjqFUVdp9Lxg6dRuqsbE0C6n72DGgefx84IrZOf6CDGydWdIIU/3Ii
   lorCFmyJwXzuNmgWfmHjf1gBVKMvzq+EAQkGpx9NqeAqDy70vrYuXIxQV
   59AIfHkv1IdA8AoC0jvWQt07FT7yxwfr8pFX1TYTMRGvgvLK3wiYxnRmD
   YL8rFBpX/Uap0J1fy5fl1YhPPBs5rShFNYKPZbdMUjqJ5hL/jmYmtZ/zp
   w==;
X-CSE-ConnectionGUID: c2Zzn8OjSOGj21OcHkgngw==
X-CSE-MsgGUID: hd5Ww1cUQz6/gWMAoFVPFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81435738"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="81435738"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 18:14:00 -0700
X-CSE-ConnectionGUID: Z3WO7o+WTxeEebHVQ/QrzA==
X-CSE-MsgGUID: HLT9uO05TTejrSKhBnOWUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="244816579"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Jun 2026 18:14:00 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVJ8G-00000000FPK-3PvH;
	Fri, 05 Jun 2026 01:13:56 +0000
Date: Fri, 05 Jun 2026 09:13:11 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Gladkov <legion@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [legion:sysctls-v1 30/31]
 net/netfilter/ipvs/ip_vs_ctl.c:2616:16: warning: 'ipvs_init_net_mode' defined
 but not used
Message-ID: <202606050935.R1shzb0N-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/legion/linux.git sysctls-v1
head:   7c8f50dd793cb0314002e78bb70e3bfd0346e606
commit: fd92ceb8623ece84961aef90c6de3d1d3dde8c21 [30/31] sysctl: use ctl_field in IPVS sysctls
config: sparc-randconfig-002-20260605 (https://download.01.org/0day-ci/archive/20260605/202606050935.R1shzb0N-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606050935.R1shzb0N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606050935.R1shzb0N-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/netfilter/ipvs/ip_vs_ctl.c:2616:16: warning: 'ipvs_init_net_mode' defined but not used [-Wunused-function]
    static umode_t ipvs_init_net_mode(const struct ctl_context *ctx)
                   ^~~~~~~~~~~~~~~~~~


vim +/ipvs_init_net_mode +2616 net/netfilter/ipvs/ip_vs_ctl.c

  2615	
> 2616	static umode_t ipvs_init_net_mode(const struct ctl_context *ctx)
  2617	{
  2618		return net_eq(ctx->target.ipvs->net, &init_net) ? 0644 : 0444;
  2619	}
  2620	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
