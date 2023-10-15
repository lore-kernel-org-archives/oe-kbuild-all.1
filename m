Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C0B125A7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 20:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VEtNmp5p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697401847; x=1728937847;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hcu0RP2a+AxNaqbXsAf1nqdncLu5SYoPtP5wCdK1Hk0=;
  b=VEtNmp5p5EGyXg+wH4S4v5RvNUvH02+nWWjYrVs+RtYvh9W2kjVEeQvW
   zb/smi8Ht17R/bdWuKjuRAHCgmpcmkyyHM3pZy+aAFBFkeKrFDbwUhGXx
   61lEUZhn1EMZNObYYwOY5RgQgf1sjl5mn/cFiDPOb432p0vy/Zi73zzF/
   ZSiiMXpedSjke3tGyKrrP4zOHPScp59qhUz03FRW3dPrTKsguiBJ6IAl4
   2hSTdNVdZXacCc58wlvB8rQUKOf+3SQEfmY3B7ixJ8K81drmDcNIjD1Ju
   58Tfu5x8HKp1sZcbA3FMzCJMJZUi4x3gsTrv6t3OL7i0+A3XfsDh+LwWd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="365677707"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="365677707"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 13:30:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="899244946"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="899244946"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 15 Oct 2023 13:28:47 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qs7l4-0007mF-1C;
	Sun, 15 Oct 2023 20:30:42 +0000
Date: Mon, 16 Oct 2023 04:30:21 +0800
From: kernel test robot <lkp@intel.com>
To: Joshua Hay <joshua.a.hay@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Alan Brady <alan.brady@intel.com>,
	Madhu Chittim <madhu.chittim@intel.com>,
	Phani Burra <phani.r.burra@intel.com>,
	Sridhar Samudrala <sridhar.samudrala@intel.com>,
	Willem de Bruijn <willemb@google.com>,
	Pavan Kumar Linga <pavan.kumar.linga@intel.com>
Subject: [linux-next:master 4288/12130] idpf_txrx.c:undefined reference to
 `tcp_gro_complete'
Message-ID: <202310160401.RIcVn63P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e3b18f7200f45d66f7141136c25554ac1e82009b
commit: a251eee62133774cf35ff829041377e721ef9c8c [4288/12130] idpf: add SRIOV support and other ndo_ops
config: arm64-randconfig-001-20231016 (https://download.01.org/0day-ci/archive/20231016/202310160401.RIcVn63P-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231016/202310160401.RIcVn63P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310160401.RIcVn63P-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/net/ethernet/intel/idpf/idpf_txrx.o: in function `idpf_rx_rsc.isra.0':
>> idpf_txrx.c:(.text+0x2dc4): undefined reference to `tcp_gro_complete'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
