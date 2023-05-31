Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220B21FBF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 May 2023 04:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685506655; x=1717042655;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=qUabQjz9II247iFOOabpXWHtBRce/lkLHc/UWIqTl2w=;
  b=TgkBZ0B1VO5HYCf69g/gIfts100RbIC3OmLeaDNuReQt1l4cEA5TnKUC
   f6e7f2Qg3Xkw05LeOU28JqCZ1NnhEmel2n7ZeoYl9z/ZR8TijR+T1u/Oz
   eNGfkif+9mDZxNBhkRD8SxAQBn+IO66lwjNXz9kLZESGKubL2z/ijAtZk
   +Gazbxm0AxZbybIGr1EOy7mt2QDXb6I5XiBrnHcg7tc+UypO2V0RDRwCb
   qKZIKSAa5IdT9f8fo/DlcvQObA/9AsIzGpO2Atlyj41LCCCTJIcZa2cjw
   xruK9By49I19UOA6bD9qVJ7NZ6VIiK32kd2Ow/lUWEwThcIHT2UII2Jqy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="339724548"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="339724548"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 21:05:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="831062117"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="831062117"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 30 May 2023 21:05:58 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4D5x-00014N-2T;
	Wed, 31 May 2023 04:05:57 +0000
Date: Wed, 31 May 2023 12:05:56 +0800
From: kernel test robot <lkp@intel.com>
To: Badhri Jagan Sridharan <badhri@google.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 3/3] usb: gadget: udc: core: Prevent UDC from starting
 when unbound
Message-ID: <ZHbHpMlIxKO7zwfZ@b4b7677a4534>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230531040203.19295-3-badhri@google.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH v5 3/3] usb: gadget: udc: core: Prevent UDC from starting when unbound
Link: https://lore.kernel.org/stable/20230531040203.19295-3-badhri%40google.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



