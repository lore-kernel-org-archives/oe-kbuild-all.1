Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74B1125C1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jul 2024 07:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722152771; cv=none; b=tnV+bgS1GpoojyO8t1YdJtiZCjfGlMN+9VP/vvz9tNUS1PVn9/EkONLD4hQU+E3YwgKStjeMp8vfdwIwH5URlSxxA7G/BHLiXTQuEZQ2TTJP3RsmJkvVExZsQmfi0tzA4qxsNXo6gLzjBNYyppqfnOFRRACxdFzJC4VQS5D70LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722152771; c=relaxed/simple;
	bh=qdgUWJ4K/P+I6Z9hO0cmtH2nO5cr+50Fulora13Pdwk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jZitsxW+q76Thj3QsNTUQ/wEfeaxJOnU1gGLgqN8BZp/Z5NtzoDG2DnuhmCVYlYjIceLSzD8wRfOUJfZEVC59rOXMJfkX0Tw5BsrWMT3cJAF2TeYt52hzj12lb6fadXH2Jh+Vkn621HhL4rKhmqNGD2VvODDRkXvnZ8iZauGIWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K/knrN1I; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K/knrN1I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722152769; x=1753688769;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qdgUWJ4K/P+I6Z9hO0cmtH2nO5cr+50Fulora13Pdwk=;
  b=K/knrN1IdDpP8L1lOwWLGAw/hJxToluVvvtoRdPqT8I6RpCxegXrxSWz
   krA1vYzOjQpNfR0zZ9HTr6HN5BH77IzhYLEmJkMGnChIh/iVaPjZB67gr
   WKfzG6LFFhVj+VGdgJCEHpsFokH3+QyArgUej4Ksm356a9Utq0uTMJ7pP
   o89gRUbKCJjSDhKrb7DPQijwVT3tJrAHZp+d1sdNJy8fWU7GRdCQkJvW5
   a6eHdXfniHECveuMLBh3kcNh4tKjwkWhzLPOomQ6in3hMqcvQPvU7koQR
   B1bdVn0Z3nwOb+3HlaZ3eavyANeTVHiV3D7X5BhBH1SHNm/mHNl0hl77R
   A==;
X-CSE-ConnectionGUID: QEfdYiMgRAmEZXr8j/Xpgg==
X-CSE-MsgGUID: lU1kIYHRRyOeQi7eQHw73g==
X-IronPort-AV: E=McAfee;i="6700,10204,11146"; a="23700555"
X-IronPort-AV: E=Sophos;i="6.09,243,1716274800"; 
   d="scan'208";a="23700555"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2024 00:45:57 -0700
X-CSE-ConnectionGUID: Egj01NRQQhqMJBTSyzwAYQ==
X-CSE-MsgGUID: 6TgRB0MTQLGBJZxptynNpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,243,1716274800"; 
   d="scan'208";a="53328852"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 Jul 2024 00:45:56 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXybJ-000qco-26;
	Sun, 28 Jul 2024 07:45:53 +0000
Date: Sun, 28 Jul 2024 15:45:52 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 11557/23376]
 drivers/net/ethernet/hisilicon/hns3/hns3_cae/.tmp_hns3_cae_gro.o: warning:
 objtool: missing symbol for section .text
Message-ID: <202407281559.WpczUOhm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   0e54270d90f09583500ef61f20ffb02efafa8031
commit: 98cbed17790cdb1565119733aa422bab3b955d46 [11557/23376] net: hns3: place cae gro implementations in an independent file
config: x86_64-buildonly-randconfig-005-20240727 (https://download.01.org/0day-ci/archive/20240728/202407281559.WpczUOhm-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240728/202407281559.WpczUOhm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407281559.WpczUOhm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/.tmp_hns3_cae_gro.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
