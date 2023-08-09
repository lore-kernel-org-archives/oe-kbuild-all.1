Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC33C214E3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Aug 2023 16:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691598795; x=1723134795;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=LVlHBeINvP+Af/RAapRpeWCgtcWBzcpWLuoWQVhZnVE=;
  b=RJir9kg1kBmdNKcgtPp35GXISz7ZCInCMdcGdwWBn2mTM507ULSmYtV+
   PjHm/V5ljV+SkvsKhoQFFy1ytZ5jDtEQG6wDQTpYuST+knRvqvGD35ksq
   VtfTxgIwn6O9olDXk7LDrZGpovs/pA/gSK8vGRRkU5uf3UA09ujSPJOVr
   sOQf2+RoP6Pj1724XLKfWaoQP3ehIuFeVntpT2gTUsm2J4pu8vzvMLEWs
   oGIkYBdMSxlt658hAZh12neAziB5R45VLOiEnNPokvcTDrceRq93AvywE
   aQ0MhU0DmMzNxWxMxDAeBZqEJklWIDxOQz/Hv4I0JK1IwEoycpy6SwZso
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="371159410"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="371159410"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 09:32:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="875328485"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 Aug 2023 09:32:42 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTm6x-0006G8-0G;
	Wed, 09 Aug 2023 16:32:39 +0000
Date: Thu, 10 Aug 2023 00:31:39 +0800
From: kernel test robot <lkp@intel.com>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] Documentation: stable: clarify patch series prerequisites
Message-ID: <ZNO/a5at5umehbti@11d7ca01dc46>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230809162941.7769-1-hugo@hugovil.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH] Documentation: stable: clarify patch series prerequisites
Link: https://lore.kernel.org/stable/20230809162941.7769-1-hugo%40hugovil.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



