Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2F4C284
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 19:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678391320; x=1709927320;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pcJgu8uJtzYmRF34MqUAgySR8kl+KKvrtNZ3gcOlzOA=;
  b=N5Vh4IZkx8NLwR1JQSWBv9fopLr8US1ifrvIxiN+eB64SqrAFOmbJyLM
   oyGMBVJUyiBr3BqYPOF+hgVk4xE1dnvluYmatzn85K5QTKrSD33bpm7Vw
   GxDW3DavQ/ZsgWRKzaxrvaUmODaNehSYIvzSC8xqDUrU9newdR5QtHfdx
   lWpqGiBs9w7BKAI7u9Z1Kwh/Jx2ZMny8Uocr/06CNePuNxnUlrOSVEIx+
   MnQ9TTc7cWWPMDi6ajDabvSEszgsNKadHZFyMH7bhnbWezEipbbo1szzW
   iK7X/SX9OL/JuQw+L0PUbEfvL02cuShpaxhbucBOHCf6+w695JjhZ9lRR
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="401412220"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; 
   d="scan'208";a="401412220"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 11:48:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="654902244"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; 
   d="scan'208";a="654902244"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 09 Mar 2023 11:48:38 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paMFh-0003BD-34;
	Thu, 09 Mar 2023 19:48:37 +0000
Date: Fri, 10 Mar 2023 03:47:58 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] docs: usb: Add documentation for the UVC Gadget
Message-ID: <202303100339.eoqe1zbR-lkp@intel.com>
References: <20230308165213.139315-1-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230308165213.139315-1-dan.scally@ideasonboard.com>

Hi Daniel,

I love your patch! Perhaps something to improve:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next lwn/docs-next westeri-thunderbolt/next linus/master v6.3-rc1 next-20230309]
[cannot apply to usb/usb-linus]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Scally/docs-usb-Add-documentation-for-the-UVC-Gadget/20230309-005314
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20230308165213.139315-1-dan.scally%40ideasonboard.com
patch subject: [PATCH] docs: usb: Add documentation for the UVC Gadget
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/4a6bb99a4b603eb30758a1941ddbb827c6f95a7b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Daniel-Scally/docs-usb-Add-documentation-for-the-UVC-Gadget/20230309-005314
        git checkout 4a6bb99a4b603eb30758a1941ddbb827c6f95a7b
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303100339.eoqe1zbR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/usb/gadget_uvc.rst references a file that doesn't exist: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
