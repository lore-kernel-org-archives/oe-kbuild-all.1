Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F2627603C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Apr 2025 17:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744219771; cv=none; b=ilX09K1DaOfBF6TUrw51p6y4j/lPdmHKIMJznxn5TnIPWSJfmA3X3nqoraixqeBOVgBoWnrS21LK5Su0PbswOvAlM6vTHjupsGu97LcGg/q93XWabIsCWFKW8yZ07UNWgRfoooRcbOv9CBWq6GAqHHHp9h79nZ5gKPr7HFSlvTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744219771; c=relaxed/simple;
	bh=G1U4oUUg9FU/Ut0gg+HJ4f+nX1evwCFR4zle+aSw/h0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FgxktyBM8WsmHP1hKwz3tA6CABwwjRTdU0ngk2h8iDaGPE8ZQsjE7T+BYL8MrxdsY5cEFQ6KuGrW0UyzYuf2zVRJHe8KCJgkE68lGut2hLoGaAsI5/UBmzHQCHmGT8f3AMN5h4P36CZH/Nn1XO2iF87zZh+7jEUwmTCs1L991zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AdrhXTxP; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AdrhXTxP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744219770; x=1775755770;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G1U4oUUg9FU/Ut0gg+HJ4f+nX1evwCFR4zle+aSw/h0=;
  b=AdrhXTxP4zJsbobZonFHR5Xgb14p85YqSjClcprkBDAT2bxNHSyCSJhn
   5fNvlszownAbozIUFhXASyMaEYdfpna1bYw3fFjYN28rEPi1AHRmm+36m
   /Nbi3tm2jXxqOJkDy6/uCEbjw+Kgpmm2zq1ZhQ8Qa7GdZU76521CZlpsO
   pgKH9HGYjJxVUUkvvNDiv+7LT7cw6LMDY0SxBOQzENMog+WT+kvjZb9N5
   dPVaCeaiZ7+rhZrGscA/f22/BKDSM8GQT089sA7GhcgPaF2MQumRf32Gp
   P8CC3xBVOTH9f0WaLt6uSuX5IKRgEU+FDW5LRpmPpge8IEMv0mmgdUqDc
   A==;
X-CSE-ConnectionGUID: p0U7w9PZQcuy0OzTpYDMGw==
X-CSE-MsgGUID: FkgB86+pQsmviQiurcdhlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="68193369"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="68193369"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 10:29:29 -0700
X-CSE-ConnectionGUID: e5VLFzvrQCKhshIwZm991Q==
X-CSE-MsgGUID: v/XBdMTETTW+GtU70bQtrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="128511301"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Apr 2025 10:29:28 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2ZEs-000992-0E;
	Wed, 09 Apr 2025 17:29:26 +0000
Date: Thu, 10 Apr 2025 01:28:55 +0800
From: kernel test robot <lkp@intel.com>
To: Daisuke Matsuda <matsuda-daisuke@fujitsu.com>
Cc: oe-kbuild-all@lists.linux.dev, Leon Romanovsky <leon@kernel.org>
Subject: [leon-rdma:rdma-next 2/39]
 drivers/infiniband/sw/rxe/rxe_odp.c:383:18: error: redefinition of
 'rxe_odp_do_atomic_write'
Message-ID: <202504100139.OkND4aW6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   dba494baa69e3501ef8abc9de51ebe76877308ad
commit: 87dd32878950d46a9c2ba3d1bb457b3476486f6c [2/39] RDMA/rxe: Enable ODP in ATOMIC WRITE operation
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20250410/202504100139.OkND4aW6-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250410/202504100139.OkND4aW6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504100139.OkND4aW6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/infiniband/sw/rxe/rxe_odp.c:383:18: error: redefinition of 'rxe_odp_do_atomic_write'
     383 | enum resp_states rxe_odp_do_atomic_write(struct rxe_mr *mr, u64 iova, u64 value)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/infiniband/sw/rxe/rxe.h:30,
                    from drivers/infiniband/sw/rxe/rxe_odp.c:11:
   drivers/infiniband/sw/rxe/rxe_loc.h:227:32: note: previous definition of 'rxe_odp_do_atomic_write' with type 'enum resp_states(struct rxe_mr *, u64,  u64)' {aka 'enum resp_states(struct rxe_mr *, long long unsigned int,  long long unsigned int)'}
     227 | static inline enum resp_states rxe_odp_do_atomic_write(struct rxe_mr *mr, u64 iova, u64 value)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~


vim +/rxe_odp_do_atomic_write +383 drivers/infiniband/sw/rxe/rxe_odp.c

   381	
   382	/* CONFIG_64BIT=y */
 > 383	enum resp_states rxe_odp_do_atomic_write(struct rxe_mr *mr, u64 iova, u64 value)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
