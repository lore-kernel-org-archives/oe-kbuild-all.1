Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC798F7D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Aug 2023 10:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691146646; x=1722682646;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=QPNpGrplDFi/bkhbG4LeRBXgYmZRvH4AZEuR5h3iZ5c=;
  b=n+ryn4myK6rVHBvcjRlsuh8aDFCJdGm6zmdTA0njOU0uqgJmDmEAUsdG
   1HWnn4VxZH/Hd3ImzboZ4G3rn69tHqLWs9MHmRRuOpjPguVTUyR1nDq4a
   9a9x+RLXDYmbI8nOnYBWfzPn3glb+zoZdTa1oabyXFxkegGcmWPebUtc1
   tT0Jfmpc98ChOelcjJSb5a04x0JEA7tCWwQFsCjDrEn5ulF36pTZKtW61
   47AccyW4Z8Oh6vtLS7AcSUSQMfgs8i/yWz44LdaqPdE1x26lTdWNDj7wu
   dlqmDPQzpur2Ceax0pfmavWkGDznXQ5lt4nn0/wWg6CxvfwgIZBJiqpNN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="350429199"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; 
   d="scan'208";a="350429199"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 03:57:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="795376160"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; 
   d="scan'208";a="795376160"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 04 Aug 2023 03:57:24 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRsUl-0002o3-0p;
	Fri, 04 Aug 2023 10:57:23 +0000
Date: Fri, 4 Aug 2023 18:57:04 +0800
From: kernel test robot <lkp@intel.com>
To: max.chou@realtek.com
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] Bluetooth: btrtl: Load FW v2 otherwise FW v1 for
 RTL8852C
Message-ID: <ZMzZgAI8XBD+8aP5@11d7ca01dc46>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230804104735.9281-1-max.chou@realtek.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH v2] Bluetooth: btrtl: Load FW v2 otherwise FW v1 for RTL8852C
Link: https://lore.kernel.org/stable/20230804104735.9281-1-max.chou%40realtek.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



