Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF8D3EB0FA
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Aug 2026 18:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785868586; cv=none; b=I+bv8gMyp9YTcWL92bdoJus1KUEq/Ydxb9n3/KJSLw3CEOHePz95WilAQA1cP5vydXK7qq8Or74ePkYejok6P1h7CeDeLoq++tiotPJ1VS63vbDrFFwjVnZDABdqWs86Kdq7fXuqrdcMEalHNF6Spc5dDp+ym8gN6//4LKmFqN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785868586; c=relaxed/simple;
	bh=YxaqyUb6kICkTRqKcnpnW4k6UNN7lXz3Lucs647aKiA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GYbWf0mnXmpLkJmdWyRShgqlQ2uSCaJ7ARp2pML/nXwOX/fwVODrskx+wPZP63AZT0SCFP+2Ll76ZAj9ilNfJreohpwnu0mzrVfTxJntOzW3eFdGabMIARdAEZn5Cxywn3Ogjgv09vLLK9v/16u5Ey+lwmTVikFaHVv8p8V2110=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AQSctb5r; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AQSctb5r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785868585; x=1817404585;
  h=date:from:to:cc:subject:message-id;
  bh=YxaqyUb6kICkTRqKcnpnW4k6UNN7lXz3Lucs647aKiA=;
  b=AQSctb5rVSfhgKqdCkXqXqMQZ2+LGah+zedVnh6pJtdh8Uh4D8GC64BC
   1ymw6GgnF/2r1oh/nAwIE60glQrozIE6WkzJq89mjJqwqSB8Q0QZF9o1U
   7jtMdclOFVdgF2k9/3wzgKIk9cSRIKKSlcay7r/1wmNF2QqGpNU+lhzGR
   uf3y+ksDEO2geKP7VNcyAz3Q3OxM7zr3kAvvVlqwVY5pljJ2mhc0iCAku
   CaXrurBUfZLlQo6utNtEgg5d9eaz3TRV95RtPOfMQL9ETfuaSAaR27pwJ
   UR/dz3xuqdJWiXH6LcUgJsmQptuOzwt9TLQU1fYPxvC3y3dRv6s8dMBHk
   w==;
X-CSE-ConnectionGUID: jroJs7qkR9OAH9ZRXS5/Ig==
X-CSE-MsgGUID: pk4Ig1xMQtulT4nT7MCTTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="86305957"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="86305957"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 11:36:24 -0700
X-CSE-ConnectionGUID: jbUfq+BqS0qCmlT8UijGWQ==
X-CSE-MsgGUID: rgiuw054QQ69DSbyW4Xbvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="265409264"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Aug 2026 11:36:23 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrJzx-00000000ARl-0GD6;
	Tue, 04 Aug 2026 18:36:21 +0000
Date: Wed, 05 Aug 2026 02:35:25 +0800
From: kernel test robot <lkp@intel.com>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [reinette:resctrl/controls_rfc_v2 81/88]
 include/linux/resctrl.h:65:71: warning: 'struct rdt_resource' declared inside
 parameter list will not be visible outside of this definition or declaration
Message-ID: <202608050251.gDJcxiCK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/reinette/linux.git resctrl/controls_rfc_v2
head:   fbed64f80515241bc6da124585328fd5047a4a13
commit: 0e63339f4b31df77e01c52f8c33f31d2a55008f8 [81/88] fs/resctrl: Introduce iterator for enabled controls
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260805/202608050251.gDJcxiCK-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260805/202608050251.gDJcxiCK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608050251.gDJcxiCK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/proc/base.c:98:
>> include/linux/resctrl.h:65:71: warning: 'struct rdt_resource' declared inside parameter list will not be visible outside of this definition or declaration
      65 | resctrl_enabled_ctrl_iter_next(struct resctrl_ctrl_iter *iter, struct rdt_resource *r);
         |                                                                       ^~~~~~~~~~~~


vim +65 include/linux/resctrl.h

    63	
    64	struct resctrl_ctrl *
  > 65	resctrl_enabled_ctrl_iter_next(struct resctrl_ctrl_iter *iter, struct rdt_resource *r);
    66	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
