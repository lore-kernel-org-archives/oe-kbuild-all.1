Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F088F1F937
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Aug 2023 17:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691083788; x=1722619788;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=/m479Gf9DM8UvN+7iA752rTQD0/JRdzJK0yMI+eJ4xs=;
  b=cwE8Jlr/fgC0BYy9EtcrscQWohPXjloudhOejiSs9H52GBCaHWR1TJ0V
   EEchaCSsktbL4wyhZ5niIbzOUsZXIWf3xtKoAwHHfQ9fooLZ4p2EVUL7T
   zJQckxl3Lua2OEQ35GzPPNtLWBGaiCDJH/4c4wUuUHN1wDXz47Xc9IyKw
   VMqrU/u39l5B+DqotEjCp0NNslIE7jWIVD9842+7l6eHGbJ+44CkzkSy/
   fkma2BZH8nlKH2rL5UfzsYNIm1PEJC8MvuOJnOulxHdHWq6A0l2TzLVWL
   RuMl05bN/dxwUYCSbfx76dmLnsqY3qNg257pGNNgTgIle9mFdwxk9+9ua
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="369940317"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="369940317"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 10:29:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="873032614"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 03 Aug 2023 10:29:47 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRc8t-0002Fn-1i;
	Thu, 03 Aug 2023 17:29:43 +0000
Date: Fri, 4 Aug 2023 01:28:45 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 2/6] mm: for !CONFIG_PER_VMA_LOCK equate write lock
 assertion for vma and mmap
Message-ID: <ZMvjzYln81BVcxjy@11d7ca01dc46>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230803172652.2849981-3-surenb@google.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH v3 2/6] mm: for !CONFIG_PER_VMA_LOCK equate write lock assertion for vma and mmap
Link: https://lore.kernel.org/stable/20230803172652.2849981-3-surenb%40google.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



