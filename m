Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D828E3B8D68
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 01:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765589127; cv=none; b=CYWGDw9MMc4Uzfh8HZL0qzxGPVw5Qy5hFtt4xffPeKnuNtuSb1Cp5yKesw/WKYfX80U9DSyf4rT2YamYMdxVSjcHGxroKa5M9albdU5dTxqrj4iXUe+wm7u+rM23TIgL0r5fvzqfXy/lIeHEwi4rdh961XOwaJlzMEH9P1RjAP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765589127; c=relaxed/simple;
	bh=waw9BHqN5L/T5ig836ZC3KHWZ1SQDkVO415m2sxYLV8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m3LV1PpE9tNcRpCD7QAH0KjRY5cIykLU06nU3VyiNwu8xsLL0gtE1Hb/0iezmBIL4fTD6F0aY9+kyZxT8LOsjUx+saWEpFIzIfMk3x/ApoCKk3DJBiPPfP+O2KJRbPxcXaFPgRcJ7NkmQOXfHFOoDtwzHxaxP7uj7axZGbBlV0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YB93cHBU; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YB93cHBU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765589125; x=1797125125;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=waw9BHqN5L/T5ig836ZC3KHWZ1SQDkVO415m2sxYLV8=;
  b=YB93cHBUG04NqqG3PXvp+Iy60m5YTCAoI/f5bKdWF2DU8mKKdBwVqnmS
   03Ly7QVf88FE0mB1/jYBFCQgHwpufM4a8I0ptF7gD59s/z9AQ2+elsTUj
   Ta2Cg4XL3qqlNXVyyoiXPmt1GcV8v5iS3mThq98JCyxAGyM4JKf6aK5dG
   8B/Nm2S/v9hsZzwZXain6Z2xAQoN7UjdeO5cFe82zsSpMdSzwCx1+A8Ry
   tH26WLDvoHj3xenlsLGmRHUy/fi8gfrnarZWOo8bU8gUl1WfT7bg8fkYz
   ovDq4jk0VRqtvmVUDgpEgtgrJ5hIvZ3BpCqTmrq4g7qvtqTBDKI9eaJK4
   g==;
X-CSE-ConnectionGUID: EwhM8o/RQs6Qh2sIB5BAKg==
X-CSE-MsgGUID: 6isxprOURQuzrf9nEJwfjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="93067369"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="93067369"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 17:25:24 -0800
X-CSE-ConnectionGUID: ZjP4C2XFSPSxITNkqBZBYQ==
X-CSE-MsgGUID: yBJpR/rzT6SL4uqSJZ2+VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="197286535"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 12 Dec 2025 17:25:23 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUENs-000000001uS-3YZG;
	Sat, 13 Dec 2025 01:25:20 +0000
Date: Sat, 13 Dec 2025 02:24:38 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <liuyongqiang13@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1941/1941]
 net/sched/sch_generic.c:956:6: warning: no previous prototype for
 'qdisc_free_cb'
Message-ID: <202512130212.T1ptA9Fd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   df8d11fbcbb07177c2500e63d7f5a36063977596
commit: 5a1704c7f3c1f3499716b7f440efa002f6724a35 [1941/1941] net: sched: extend Qdisc with rcu
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251213/202512130212.T1ptA9Fd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130212.T1ptA9Fd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130212.T1ptA9Fd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/sched/sch_generic.c:956:6: warning: no previous prototype for 'qdisc_free_cb' [-Wmissing-prototypes]
     956 | void qdisc_free_cb(struct rcu_head *head)
         |      ^~~~~~~~~~~~~


vim +/qdisc_free_cb +956 net/sched/sch_generic.c

   955	
 > 956	void qdisc_free_cb(struct rcu_head *head)
   957	{
   958		struct Qdisc *q = container_of(head, struct Qdisc, rcu);
   959	
   960		qdisc_free(q);
   961	}
   962	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
