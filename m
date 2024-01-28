Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6849F2D044
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jan 2024 17:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706464719; cv=none; b=ku53DInWLd8H02AvShQ3YIJYFsU/S3Rw09DdUQH5isOQUMWuE5pxoT4mRlN+jCJpC8388G7WQW2d68TNd7ogQWBTZWcqyZrwMelG42BCFvVGmAV44IrD/80ZTLGMQvK2puOjjc8l4pthjEgFL5ECxaIALROc5PHjPIK86ipbdBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706464719; c=relaxed/simple;
	bh=akdPPGcEqtZNelKJyP8K84v1nUM/627s+ULL9WAgBbY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FQOvV9pskKkLkpQJ7UvI/47vrTBioMJa0LXOgfE81rD1dEY3afq3xFZC/1s7BKeYaBrDgEwzQoAQ8ujs5XLqQGVHDiDhEhDxMeRymK7sw74/Y3BfgQD4MwwKGl6OLimn/90sud7XIsP/kZj4YJ4fzD2YzB3H0kOM/RRl3JFqKjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q0RqDmTM; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q0RqDmTM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706464718; x=1738000718;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=akdPPGcEqtZNelKJyP8K84v1nUM/627s+ULL9WAgBbY=;
  b=Q0RqDmTMuaNpUOflVHbtJmB+Trl3AAdmasJ0d5JlmhWXf6SY6GiB2ecn
   bqpdsYDBsmUcPfyTgrsgFnUOw5DCJHjjMmeShuCvYERoc6bG3uZAfT1Ar
   HCMlxHQwYGx+c5zXinmwWcpCym+s8n9vCeEbRPNw3YHNIFDIQQBa/pITD
   8+mYASDHqeE1w3am7dYYTeJ+GdUw35qGqEELXLGkEBFlWN1kpT3wgvS6K
   jgsCQJC9G3SUJzyUAmk/9D8J0wMko8mgTQREkAibXV8bzkqXYPqediKd7
   WhnZTo1ytoVpOugpSc8NfmXYZ9NraiEoh6KsBaqQWDBxYCpXPqudPJzFc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="2683749"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="2683749"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 09:58:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="737165939"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="737165939"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 28 Jan 2024 09:58:35 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rU9QP-0003cu-1m;
	Sun, 28 Jan 2024 17:58:33 +0000
Date: Mon, 29 Jan 2024 01:58:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jmondi:pispbe/media-staging/be-upstream 7/7]
 ./usr/include/linux/pisp_be_config.h:476:13: error: C++ style comments are
 not allowed in ISO C90
Message-ID: <202401290119.q4hvrRch-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jmondi/linux.git pispbe/media-staging/be-upstream
head:   e1ae55c1c7105b10788c4b50c4185e82c309fdda
commit: e1ae55c1c7105b10788c4b50c4185e82c309fdda [7/7] media: raspberrypi: Add support for PiSP BE
config: i386-randconfig-012-20240128 (https://download.01.org/0day-ci/archive/20240129/202401290119.q4hvrRch-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240129/202401290119.q4hvrRch-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401290119.q4hvrRch-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:32:0:
>> ./usr/include/linux/pisp_be_config.h:476:13: error: C++ style comments are not allowed in ISO C90
     __u8 edge; // enum pisp_tile_edge
                ^
>> ./usr/include/linux/pisp_be_config.h:476:13: error: (this will be reported only once per input file)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
