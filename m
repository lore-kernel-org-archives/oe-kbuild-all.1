Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2241910F5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jun 2023 07:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687505524; x=1719041524;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=6i6aS5or0UbyJjQKq6Mwkei167b+Q8Ja8wfDrpOhhhk=;
  b=D5A2C/TlmWVhtXu+IUnhz0Qr79su1G33bZbLtQrlSUAgV9z08+GSM0l6
   80EWHqhegYf7WRsoOyFh44XCgbh4UHR1YDrIY+/71WOYK+KPmUODy0u/z
   vpcf4tHZtP62CGV0vld5cUp/bjhCpu4KpMHVfCMHpwcjmtLpLrOwtVjFN
   LoMv7s7UdKeqRpXcPYJH2l0kJgRn1WdsWgV7qQ3zgJ4GelyjGjj1at8aR
   +F5+H8DIZu0wIDUotldaO1ZKlTjmRwXENFO7bIZMqLoa17SMfSJZ7b5pO
   VJkln8Sst3cG+o9J9hqyLvZmJYCZelZIVBg3M4gwPAazaLY8oBZjKlJ2l
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="358200555"
X-IronPort-AV: E=Sophos;i="6.01,151,1684825200"; 
   d="scan'208";a="358200555"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2023 00:32:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="961878180"
X-IronPort-AV: E=Sophos;i="6.01,151,1684825200"; 
   d="scan'208";a="961878180"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 23 Jun 2023 00:32:01 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCbGy-000859-1v;
	Fri, 23 Jun 2023 07:32:00 +0000
Date: Fri, 23 Jun 2023 15:31:37 +0800
From: kernel test robot <lkp@intel.com>
To: souradeep chakrabarti <schakrabarti@linux.microsoft.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH V2 net] net: mana: Fix MANA VF unload when host is
 unresponsive
Message-ID: <ZJVKWe3QYybrme8x@65525e8f8615>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1687505355-29212-1-git-send-email-schakrabarti@linux.microsoft.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH V2 net] net: mana: Fix MANA VF unload when host is unresponsive
Link: https://lore.kernel.org/stable/1687505355-29212-1-git-send-email-schakrabarti%40linux.microsoft.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



