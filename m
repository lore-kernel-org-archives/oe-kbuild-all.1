Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5739820A5CE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Oct 2024 08:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728636550; cv=none; b=CN1yp0WH/eSy4xcmAKY0SH2Jx8VHELJWn39+nQoHJ/7u8G8uJviJygB0o80UK0Fa/TUqbyy9iS7xUAhO3Mvhbg3lemGmuHByUGMAcmxITh3uI6n0jH3G+XcVgcD/pMVRonzvq8Q0t8jqhHZtGXEb0NECZu3zz6WO5q7af+amQH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728636550; c=relaxed/simple;
	bh=EXOCECms7I4r/hJfH1/FY0jOm6ArAm+qCokHzmI4JHM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d6+isMUTCvh3TbiqXsQkKLUui//h2VRVlIOQW9pAwsIHQ7FvMQLScljxpzRkYqsanzUQa/ZIc6OdVRDh8JqeXNBfNyMzh9eui+xE2MFqLFCVD7DSgOtJNhYUJhFQwrTwJoB4agTIhlMKpK9DaAGwh2FlrgLGDHwL5IzrqngxH08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lgdW82Zr; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lgdW82Zr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728636548; x=1760172548;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EXOCECms7I4r/hJfH1/FY0jOm6ArAm+qCokHzmI4JHM=;
  b=lgdW82Zrdj74bQfQa+ZgVQEd6U+if/lI7CRieyA1anlG+5twyB+gVL3A
   2XFWrOwDaZoVUCEEEvNVY0aGBAhUSuXJjbBq5P7SQunfMfPJOzAVF4eIu
   pCoZjntoNxrPRGBa0RZxaQHmQQ+bNQehFlf6UoxPX2ufWsncIh/onLjco
   Z/GH5MNU6i7hv08ovPVxmswnfVtTXqI54ugc1w0AW6MgNCptbcbZZVXnd
   s9d1IjsiCsjgtCTaNtDam8RoHgao4h9Bn6fiFgvr64wsJLBfp01gNOI7B
   6RMp74cXf/glKqRcqCPhDFnkfwFrOv6XLDwPllcwW4vxE9Vbql10EOOsw
   w==;
X-CSE-ConnectionGUID: djyTFrdTTli7yo5OZj8i3g==
X-CSE-MsgGUID: 9S4usx7cSGKiJ+YafZWfyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="27974474"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="27974474"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 01:49:08 -0700
X-CSE-ConnectionGUID: P+YYn9LlRFSKF33XMRJ6Tg==
X-CSE-MsgGUID: dK62ssfVTUyYsyDzRuvy0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="81671607"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Oct 2024 01:49:07 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szBKa-000C63-0Q;
	Fri, 11 Oct 2024 08:49:04 +0000
Date: Fri, 11 Oct 2024 16:48:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <duanzi@zju.edu.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 20512/23827] drivers/md/md.o: warning:
 objtool: md_seq_show()+0x1087: unreachable instruction
Message-ID: <202410111657.HXras3Wj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Logan,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   9b2f1457c730cd7915663ac5d9ccb849f2657714
commit: a89f484219c9ea217d26908f16037d1ab55d4f17 [20512/23827] md: Ensure resync is reported after it starts
config: x86_64-randconfig-001-20241011 (https://download.01.org/0day-ci/archive/20241011/202410111657.HXras3Wj-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241011/202410111657.HXras3Wj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410111657.HXras3Wj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/md/md.c:49:
   In file included from include/linux/blkdev.h:16:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/md.c:320:6: warning: variable 'cpu' set but not used [-Wunused-but-set-variable]
     320 |         int cpu;
         |             ^
   drivers/md/md.c:2231:24: warning: variable 'bi_rdev' set but not used [-Wunused-but-set-variable]
    2231 |         struct blk_integrity *bi_rdev;
         |                               ^
   3 warnings generated.
>> drivers/md/md.o: warning: objtool: md_seq_show()+0x1087: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
