Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F1C7F0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Jan 2023 04:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672892584; x=1704428584;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=4SV1mI7pC9agZVlhUPmntHCPScQyTWJP2O0ld7Eg0k4=;
  b=T/XFKYg/vOq9KAY1PzQKQ9h/80NHFOXo6h8GIjDCbj9sPp2d82978l5m
   Yps/91bbTOv+f83peo4idYEZDEdzUsM83dZOPqDYpyNj88purgW+b2WbK
   A5K14uQJSBUXlJJADOLilnbwCnnZJ0jAGLGYqkMr7+wtYWpQKthJpiQJK
   vVl9TA2ihWO7ZxL4T5+mGpW94RnzpU0B9Z7CafjcksN+vnpkf2iQtGayq
   2fElF2i+DQ/JeyRj+Rpo/Ha3toAUlL3goO/hgX/mHYd28a6Cu8ixszSan
   ABqZIheaUmuFGQmp4PswTw7OnARPxAiHZBVQELrXY+AQkJTAk0j0Ei9Qp
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="319817516"
X-IronPort-AV: E=Sophos;i="5.96,302,1665471600"; 
   d="scan'208";a="319817516"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2023 20:22:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="633026660"
X-IronPort-AV: E=Sophos;i="5.96,302,1665471600"; 
   d="scan'208";a="633026660"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 04 Jan 2023 20:22:56 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pDHmJ-00016n-0w;
	Thu, 05 Jan 2023 04:22:55 +0000
Date: Thu, 5 Jan 2023 12:22:11 +0800
From: kernel test robot <lkp@intel.com>
To: Linyu Yuan <quic_linyyuan@quicinc.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] usb: ucsi: fix connector partner ucsi work issue
Message-ID: <Y7ZQc313LcVTxEJ9@3aeda0d71eb3>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1672892324-12335-1-git-send-email-quic_linyyuan@quicinc.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH] usb: ucsi: fix connector partner ucsi work issue
Link: https://lore.kernel.org/stable/1672892324-12335-1-git-send-email-quic_linyyuan%40quicinc.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



