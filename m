Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BED1D3578
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Oct 2024 07:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730271967; cv=none; b=bGcv9E+pIbwxsTw6iV/5Bb8/qIfY2d4NVfjBs/fUvHLWyEccsV8bJr1S19q4oZ+EdzVazvBQ7AwDXqeY99IsmZWBNds9Px+o/2q2WBQG/W8BSI1dwVUpLl8/Nj//oRfjxxXaojIlqEaOvFAX28a+lce2HJkqWv+XgIlzjwbmd/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730271967; c=relaxed/simple;
	bh=+EuOAYZmza7wRHd943IlL2weGdDAsOAXlsD1MHLa5lM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gs5xhqyp266I1FChBJtz6WYzdArRdwOP7Lh3qJgI4gStNbMxbBmTYarsoD6nwY+TIeDEdT9FBFcQuvkuswrh+Uv8Dn069j7/NnaKAB32wsc8ywHx6YGMvGQO8MtqotauDcuFvneIdovVgLvSfX+vhMWRN8LzRrWi1tTe2rT3PEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TGOR4+kc; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TGOR4+kc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730271965; x=1761807965;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+EuOAYZmza7wRHd943IlL2weGdDAsOAXlsD1MHLa5lM=;
  b=TGOR4+kcKJCbx2RggTE+vtU2Ej015eyyZFQbFbW29a3ymlECLH0Bum/j
   yoErO2V05WWGPlQu/nuTkobYNe8QRBYyHOIlH5zj/KagOFiMVxsscNjOI
   kBnTeCXol/pu2irz0cmL7SkT/gIQiRo9Hn5qbfNumjyRkkgMb1n3QNJy9
   nDwNFZRZnquHu45Cymuia6DqAgzb3zVkUxNogWOgdtZwubo7AOWO4yW3e
   o86+/0BHtjWpA3O45o0H8Go7CCsGzlyKqw0kKDQxlgBWj0e1KFwp2U7Hn
   y4PkuZSGy3sYbtKaM+9MBnCX9aaWylP+c7TVo1OVpNgyq+LCfxEFjT3ZN
   w==;
X-CSE-ConnectionGUID: rDvL4MI6TmyYirghgI2Iiw==
X-CSE-MsgGUID: mxbR4+YyRMWmDrQoCoLJEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47418806"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="47418806"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 00:06:04 -0700
X-CSE-ConnectionGUID: aOkTgQLyRH6IRlom6+9wVg==
X-CSE-MsgGUID: ZYBY9DKeR9S5tm36hAvufw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,244,1725346800"; 
   d="scan'208";a="86158631"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Oct 2024 00:04:57 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t62lD-000ec6-14;
	Wed, 30 Oct 2024 07:04:55 +0000
Date: Wed, 30 Oct 2024 15:04:17 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 142/158]
 fs/bcachefs/btree_trans_commit.o: warning: objtool:
 bch2_trans_commit_write_locked.isra.0+0xe14: return with modified stack
 frame
Message-ID: <202410301401.4CUsa5mI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   a72b227c02fc0cdd653f481a43efda9566421357
commit: 451d6611136c76544ec74b5c7c155d36b8e4c197 [142/158] bcachefs: bch2_trans_verify_not_unlocked_or_in_restart()
config: loongarch-randconfig-002-20241030 (https://download.01.org/0day-ci/archive/20241030/202410301401.4CUsa5mI-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410301401.4CUsa5mI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410301401.4CUsa5mI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/btree_trans_commit.o: warning: objtool: bch2_trans_commit_write_locked.isra.0+0xe14: return with modified stack frame
   fs/bcachefs/btree_trans_commit.o: warning: objtool: do_bch2_trans_commit.constprop.0.isra.0+0x230: stack state mismatch: reg1[22]=-1+0 reg2[22]=-2-16
   fs/bcachefs/btree_trans_commit.o: warning: objtool: __bch2_trans_commit+0x48: stack state mismatch: reg1[23]=-1+0 reg2[23]=-2-16

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
