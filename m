Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF20B3FC2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Apr 2023 12:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681734713; x=1713270713;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=7MPELE/lPnfBgKyq4qF9xCj8deh//hL0fCNJp2u6BrQ=;
  b=anFJfrnk5bJIsXg8weysxRFTD2hR0WjpO7BATF02PyjohnMS2lMF74s/
   4BGytaLIoJmSZ+BNXUqlzSZkrcySRUnfeggHCXerlUcBEBW/X6X2LjflI
   SzieEa3cwwdnI+z57c17GV0XqLgEvTWlbohi7UtgY+zcEluB6HF/XSXbh
   IQbzH/ikdsHCANbeKeQqdQwVYgbyE0MaAnzGQVmKp2EGiSqg3u9SeEyx5
   PH8aTWqlQyF4R8FsG6tNcmQ2MWqaUXXqdG9y0CtOevDaXosfeUPR5JA5K
   NI3Q1BAJtQW3BwDwxdpweskIb2XmKZXVQY6eQxCH1AfgLBDOcefOlZsTu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="410092214"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; 
   d="scan'208";a="410092214"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 05:31:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="864978547"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; 
   d="scan'208";a="864978547"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 17 Apr 2023 05:31:49 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poO1H-000cLN-27;
	Mon, 17 Apr 2023 12:31:43 +0000
Date: Mon, 17 Apr 2023 20:31:03 +0800
From: kernel test robot <lkp@intel.com>
To: Anders Roxell <anders.roxell@linaro.org>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [backport PATCH 1/2] tools perf: Fix compilation error with new
 binutils
Message-ID: <ZD08B1j+Ps5D/pkd@96b608206aa4>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230417122943.2155502-2-anders.roxell@linaro.org>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [backport PATCH 1/2] tools perf: Fix compilation error with new binutils
Link: https://lore.kernel.org/stable/20230417122943.2155502-2-anders.roxell%40linaro.org

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



