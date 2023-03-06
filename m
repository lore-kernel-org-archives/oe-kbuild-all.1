Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10867320E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Mar 2023 14:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678113205; x=1709649205;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3oek7fDIXFJJLVfxcSk+yHQonT1RD4GplabIw6cphl4=;
  b=Ww9ppNEKgSOUTAaUZ4sRLjK50GqQlCgosEOSuMfA2s+nnN5AfXEuiyMR
   6O6KphY8xuCe6dibWAqvHA03GxZTeYWMQXLwDFlhPbB9MjJpr9BqDEXDv
   FgtSrjfORRqn22afp8nDwRDpjCRIh7+XeBoPFa6qEPqNk6X31J5WCHB0Q
   +e3SGPqsXwVIPuQeAL4e/kBOFKs4HyytOwQgbwINqZES2qEaWYnHd/XyG
   dl9+Bz4VceYQnnHBsFAl6DQSaN9ntqTtjh8a0CltYLwQScCj2Ujz6qqSs
   st6krVyezLkzkRSYvfoT6d48Me3m7OTv0DcTxm43qSUe5VDUtG4HpwUEk
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="315224423"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="315224423"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 06:33:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="765236839"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="765236839"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 06 Mar 2023 06:33:22 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZBty-0000OR-10;
	Mon, 06 Mar 2023 14:33:22 +0000
Date: Mon, 6 Mar 2023 22:32:32 +0800
From: kernel test robot <lkp@intel.com>
To: Wanhui Sun <wanhui.sun@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	Chen Meng J <meng.j.chen@intel.com>, Meng Wei <wei.meng@intel.com>
Subject: [intel-lts:5.10/yocto 10446/30000] htmldocs:
 Documentation/output/videodev2.h.rst:6: WARNING: undefined label:
 v4l2-buf-type-type-mask (if the link has no caption the label must precede a
 section header)
Message-ID: <202303062236.GrpOsves-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wanhui,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 5.10/yocto
head:   abd42491338c1d15ac7f00baaa8490063545737e
commit: c0facb4d5ccee8c30d78de2ab1d64d8f59ce6fdb [10446/30000] v4l: Add sub-stream mask id for buffer type
reproduce:
        # https://github.com/intel/linux-intel-lts/commit/c0facb4d5ccee8c30d78de2ab1d64d8f59ce6fdb
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.10/yocto
        git checkout c0facb4d5ccee8c30d78de2ab1d64d8f59ce6fdb
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303062236.GrpOsves-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-buf-type-type-mask (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-buf-type-substream-mask (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-buf-type-substream-shift (if the link has no caption the label must precede a section header)

vim +6 Documentation/output/videodev2.h.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
