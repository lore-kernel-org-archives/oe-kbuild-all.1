Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069303D3CE6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 04:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792383498; cv=none; b=Zhv/hnMzA0i4W+n1LseoaKCS+X80PKyUd1aKmCep/y7kUyPXt3EvQJskDFxLEPOinY5I7hCVbh5k7dsyKmAAfXZ3LVZP/7JdAiZwQMiQOqQDXwOxwdVtqYHTV03PDvNcqmBkiQwJnwSBY4u6EOSFXYdqgknZcs/r4GujM34lbSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792383498; c=relaxed/simple;
	bh=NqpYoA/c02cbc2vl6CONl/5uaNToIMrb9KFcAnf54Uc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XEOoRN3J5jXVLiBAe/eTwUyrgRBpgTEMj00jV7vOeS+6Bm+5s2R58DdmEmjDEGnDEYz4Hv/NFYL75uv5mUtOZL1qlv8BfP/HaFaHTBE4EEk7VQqhIproSckOmeH+52xDDYf2RzsuhPK74+iWPmWIbzX2IrjEEJdlYecWSAXRMpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DNcOJTwf; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DNcOJTwf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792383495; x=1823919495;
  h=date:from:to:cc:subject:message-id;
  bh=NqpYoA/c02cbc2vl6CONl/5uaNToIMrb9KFcAnf54Uc=;
  b=DNcOJTwfcBV5DWGYizQoV2+BdvB93PKaw6iBj73Ei712DUR5ww6d1Jxw
   z7njlSdwSPgWk9OslHZuEQ+0l/FP/e35XiYgPImfQBsf+gsX6vRS+wXl0
   D7rvl8aPqcNhDoeDRcGU5faHqFJ9tlkfv7lhGX7/xo4D2pGbtDHEkuJ7A
   7JlDzra3FtsuyIsmkhQsSGlz6OYkrvrf6juuQ23M62qPHSbC9Z/LQluYJ
   csikbN5G3rBy9+VHQVUUVuGZriDWekM4CZ6V4MkZaKIA4Vt4cbn8uEfDj
   HZoLrBgaaBvBiKQIUaRmi6/dsbt29fgcywVjHBGrNWBjPlkag/7n5qc9q
   g==;
X-CSE-ConnectionGUID: zIaqYMdgTf2qWPwVya7qlw==
X-CSE-MsgGUID: sXl789FPQBWZbHrMRBanOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="963171"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="963171"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 21:18:14 -0700
X-CSE-ConnectionGUID: knBr+EdCSOO/5kLRfA2vwQ==
X-CSE-MsgGUID: 3lsCn9kOSw+CdHMDxeLozQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="2369237"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 18 Oct 2026 21:18:11 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIep7-00000000LGO-3Ua8;
	Mon, 19 Oct 2026 04:18:09 +0000
Date: Mon, 19 Oct 2026 12:17:11 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcain:hexagon 31/82] Warning:
 drivers/rpmsg/qcom_glink_native.c:130 struct member 'open_work' not described
 in 'qcom_glink'
Message-ID: <202610191240.NnpZwUOb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git hexagon
head:   35ab1dadb94646b74469738c1741f68e8c6aac3d
commit: a4310ab4ef4371948e163b1696ae14880866aef1 [31/82] rpmsg: glink: auto-open channels listed in device tree
config: sh-randconfig-1000-20261019 (https://download.01.org/0day-ci/archive/20261019/202610191240.NnpZwUOb-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610191240.NnpZwUOb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610191240.NnpZwUOb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/rpmsg/qcom_glink_native.c:130 struct member 'open_work' not described in 'qcom_glink'
>> Warning: drivers/rpmsg/qcom_glink_native.c:130 struct member 'open_work' not described in 'qcom_glink'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
