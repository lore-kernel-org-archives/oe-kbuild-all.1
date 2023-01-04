Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85B07C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Jan 2023 03:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672802564; x=1704338564;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=hEiQu5M7KRBrCwlOTg41k2EiCqS+1FDwl6Uwzcfrw/U=;
  b=CrBvnKr8DeQmjIaZ2dBDwXIo5MgYfYPnIpxSc9VjmR7bccYFMiCr0x4H
   679iday56gLJT3d78Zn1BwgyXs4tv+NzJ1f90lQsl94YstP1o1jIzxtKJ
   OoHzsVgDuA0k7zXwM7/NmCaG+jLxTG/kZ8MlKJPo7xaTLprsi5Zoh2fF4
   nZyRRWs96UFb7nwnkBkidcW0og9GisnvHejG6coeRP/dCfMLPuNTAcTIr
   lXKNKO5hliGFoUq+N4RMD2JfLq9Ss+fXguEB9GAz3W8uMIDxVtwhY5tMH
   /OtvN+qC5CnO2yfq/VdKxAa95m5/CFWytM1qam0AZAs+J3hfiBgvObUb4
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="301509292"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; 
   d="scan'208";a="301509292"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2023 19:22:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="687394038"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; 
   d="scan'208";a="687394038"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 03 Jan 2023 19:22:42 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pCuMT-000T69-2D;
	Wed, 04 Jan 2023 03:22:41 +0000
Date: Wed, 4 Jan 2023 11:22:32 +0800
From: kernel test robot <lkp@intel.com>
To: coolqyj@163.com
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] mm/filemap: fix page end in filemap_get_read_batch
Message-ID: <Y7Tw+Ii0ehUUpNJT@143a5a8bd1f0>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230104032124.72483-1-coolqyj@163.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH] mm/filemap: fix page end in filemap_get_read_batch
Link: https://lore.kernel.org/stable/20230104032124.72483-1-coolqyj%40163.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



