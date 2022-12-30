Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBB6539F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Dec 2022 22:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672437719; x=1703973719;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=dNNPFaYd08nXf1xSCk5cKNJc4YHMA/PaibmSIDYQYpI=;
  b=Qgh0QBrXnOILTUXwb/8AL+RYwjeYkeLgyCZfww/3KE4sjXwQZO4QZ9B+
   4EeplkmL6JY4uPyiVkJNqEO/Lavcm5uR0FFEJo6mn6M2QePpd8TLbKBbW
   dUQa0tPHBmXHIqlTLDP0UygTQoqLcmuTWQbH4zDmDi4JiVd9Q07/tJqkS
   Wy+b0wcf4XwPAhfj26oU5icBV09g2e609rzeJV9kIe3zUO0ckDs0yn12U
   inrwQA+FNOJOrOxqrpsrOrbtv5DASTsQ4B9C32xi6+u6FA7HzsZM5gV74
   AOw2C56ocVUZo2JrsXGqBIYJiA6+zP6tPIza4/QK7iS21mqX9nsBr4NcN
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10576"; a="318958084"
X-IronPort-AV: E=Sophos;i="5.96,288,1665471600"; 
   d="scan'208";a="318958084"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2022 14:01:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10576"; a="778042389"
X-IronPort-AV: E=Sophos;i="5.96,288,1665471600"; 
   d="scan'208";a="778042389"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 30 Dec 2022 14:01:57 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pBNRs-000ISP-2A;
	Fri, 30 Dec 2022 22:01:56 +0000
Date: Sat, 31 Dec 2022 06:01:43 +0800
From: kernel test robot <lkp@intel.com>
To: Maciej =?utf-8?Q?=C5=BBenczykowski?= <zenczykowski@gmail.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] usb: storage: de-quirk Seagate Expansion Portable Drive
 SRD00F1 [0bc2:2320]
Message-ID: <Y69fx1KpwWivqLp0@181616e551cc>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221230215942.3241955-1-zenczykowski@gmail.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH] usb: storage: de-quirk Seagate Expansion Portable Drive SRD00F1 [0bc2:2320]
Link: https://lore.kernel.org/stable/20221230215942.3241955-1-zenczykowski%40gmail.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



