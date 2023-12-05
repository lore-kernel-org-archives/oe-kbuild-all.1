Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6156A034
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 22:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cUHR7H4I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701815460; x=1733351460;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J7MOYVUUmMXw9Bbz68V78xjbparJszGQozDdKHc5IqI=;
  b=cUHR7H4IcQzlo2bciU8NmhHJb7jP9L4K+gFaLGEa0gM2v0c/vNJTe+WO
   uu9OC8rckFttW1UeOouiz3NQbIt9Y3/g6tyE1rEsCyQHNnaC4ysdZzOrS
   TDKqKeI71GfIDPOHboGsui7siDCE7sNBX/Y2x/VaImvm5QPZfV3DoW3Dq
   fNJQJgm9gVks0IkjK0sHzhNWqckNr7UOeahdNBEbKTJTaxF2nS7ywsVHl
   +B3ceRy4Y0BgidPj4TL1DtxvyXzquX8i/sc1Lmxj4rn7zS0r/RjEASxER
   j0dl3ytpxhh5VnHOz3bGL6Lx+Lrb0T6i+1sVEsxpaZ5qAMGaPfVT6RrWw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="396760081"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="396760081"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 14:30:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="19119382"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 05 Dec 2023 14:30:56 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAdwL-0009oE-10;
	Tue, 05 Dec 2023 22:30:53 +0000
Date: Wed, 6 Dec 2023 06:30:32 +0800
From: kernel test robot <lkp@intel.com>
To: Yunke Cao <yunkec@google.com>, Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev, Tomasz Figa <tfiga@chromium.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org,
	Yunke Cao <yunkec@google.com>
Subject: Re: [PATCH v14 06/11] v4l2-ctrls: add support for
 V4L2_CTRL_WHICH_MIN/MAX_VAL
Message-ID: <202312060621.h935AOSJ-lkp@intel.com>
References: <20231201071907.3080126-7-yunkec@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201071907.3080126-7-yunkec@google.com>

Hi Yunke,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus linuxtv-media-stage/master linus/master v6.7-rc4 next-20231205]
[cannot apply to media-tree/master sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yunke-Cao/media-v4l2_ctrl-Add-V4L2_CTRL_TYPE_RECT/20231201-152501
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20231201071907.3080126-7-yunkec%40google.com
patch subject: [PATCH v14 06/11] v4l2-ctrls: add support for V4L2_CTRL_WHICH_MIN/MAX_VAL
config: alpha-randconfig-r122-20231202 (https://download.01.org/0day-ci/archive/20231206/202312060621.h935AOSJ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312060621.h935AOSJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060621.h935AOSJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/media/v4l2-core/v4l2-ctrls-core.c:309:6: sparse: sparse: symbol 'v4l2_ctrl_type_op_minimum' was not declared. Should it be static?
>> drivers/media/v4l2-core/v4l2-ctrls-core.c:315:6: sparse: sparse: symbol 'v4l2_ctrl_type_op_maximum' was not declared. Should it be static?
   drivers/media/v4l2-core/v4l2-ctrls-core.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +/v4l2_ctrl_type_op_minimum +309 drivers/media/v4l2-core/v4l2-ctrls-core.c

   308	
 > 309	void v4l2_ctrl_type_op_minimum(const struct v4l2_ctrl *ctrl, u32 from_idx,
   310				       union v4l2_ctrl_ptr ptr)
   311	{
   312		__v4l2_ctrl_type_op_init(ctrl, from_idx, V4L2_CTRL_WHICH_MIN_VAL, ptr);
   313	}
   314	
 > 315	void v4l2_ctrl_type_op_maximum(const struct v4l2_ctrl *ctrl, u32 from_idx,
   316				       union v4l2_ctrl_ptr ptr)
   317	{
   318		__v4l2_ctrl_type_op_init(ctrl, from_idx, V4L2_CTRL_WHICH_MAX_VAL, ptr);
   319	}
   320	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
