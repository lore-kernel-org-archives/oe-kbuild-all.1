Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86319140E5F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Oct 2024 06:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728282516; cv=none; b=uUhHmLt1jOs7m5NFSOg3sslxs5hv33ZFVDanHCb2Oi9NqKGbqayEoIjEa7zUBZxbZiU+uVhA2QedpXKc2wIkzImr6sGspWl2UByaXnDgabGCyuTOQjl6T7vENkiePksWxU8nu9YwKNSrKVoijKDKVcI84FHnlDmpLhuN5xWgvFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728282516; c=relaxed/simple;
	bh=hfFmoR1EgZ/nKs2QTPbM69HxjR3ft7rndrHS39W96U0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Aj5Goi07eGCJlkN4+Kl0o3/lwkO2CB9XLDBR5lVbk2U0LFFCWsC9XdGQ4YJjv/zIQM4bhzOwcjCd41GiEvr7lh55HASg2+bFeFh0gwU/ww8J4mZ2PCLD11o3RoydLgGivl/G0Lvu5MNBHFtMXEhnqS+LWOjE7v2pzAWnSf6dZMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OMXLxG56; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OMXLxG56"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728282514; x=1759818514;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hfFmoR1EgZ/nKs2QTPbM69HxjR3ft7rndrHS39W96U0=;
  b=OMXLxG56xn3d7Q7/Z54sk8yxeyqBUX48rkN165rCuQNaMyG9FaHzOzlM
   SgQPBruAltlFOjOmuP9g3q8FUGuXraRaCwM7wLsxZfH/cNBFQa2ljcTb6
   cLvLx45eSEpeauuxK+Xt/tDnNM5IpcXAS0L6jR0MfHLeG9BLCmL2rGETi
   W5xR/z3w6sgE3SpI16VzZa4c8a2QsYeNHqqnaXYVZ+1EAbVippGNRXdhE
   z8+K0+MA95ru5eYW90inEmrd16VodGf5ucBPkIPwOmDqAfpEb4rYxf9ls
   FKYEJlVwWrIR9fhLwXvZSJ+0/5a/io6TJ0FVrIq0KGG7qbjFULytfW3P9
   w==;
X-CSE-ConnectionGUID: Ap8GF71BSOy/uJOjyrPUWQ==
X-CSE-MsgGUID: 6FXXCoNzQ/mj3PeOJAtZcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="27298773"
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; 
   d="scan'208";a="27298773"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2024 23:28:34 -0700
X-CSE-ConnectionGUID: LDBIwzrCRDaB8imoCFD7jQ==
X-CSE-MsgGUID: VXhKilFKQ9Gj4FtpzIeN1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; 
   d="scan'208";a="75499858"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Oct 2024 23:28:33 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxhEM-0004fM-1x;
	Mon, 07 Oct 2024 06:28:30 +0000
Date: Mon, 7 Oct 2024 14:28:09 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Lanzano <lanzano.alex@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [jic23-iio:testing 127/127] drivers/iio/imu/bmi270/bmi270_spi.c:
 linux/module.h is included more than once.
Message-ID: <202410071402.4dk5tMFk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   96be67caa0f0420d4128cb67f07bbd7a6f49e03a
commit: 96be67caa0f0420d4128cb67f07bbd7a6f49e03a [127/127] iio: imu: bmi270: Add spi driver for bmi270 imu
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410071402.4dk5tMFk-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/iio/imu/bmi270/bmi270_spi.c: linux/module.h is included more than once.

vim +5 drivers/iio/imu/bmi270/bmi270_spi.c

     2	
     3	#include <linux/iio/iio.h>
     4	#include <linux/mod_devicetable.h>
   > 5	#include <linux/module.h>
   > 6	#include <linux/module.h>
     7	#include <linux/regmap.h>
     8	#include <linux/spi/spi.h>
     9	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
