Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DDB1852
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Jan 2023 09:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673859833; x=1705395833;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9kRPaAQbv7EsdgFQF6I6rrNj8jbPkWQWv0T7t6u/lyM=;
  b=jM/f2hfm2eVRH20L1xOTIukZyvXQa0fJ+Rydzah9BXTWdoLTbXk13MRH
   F5ze0oWCrtURrKzKAByqZxI/K/3SFCk/ySVW/IeL4yIZKhvGTtFEunS+s
   dzYfn6qu3HZ3f7jZ2KqE9FRVsXo93YUNfeBXFlrpbhT67Ouvv4RKqiK1r
   aQfT/gU0TIDvOW00PVa06OvuRJBDVCBpN5bpggHyx/wyc+18/iCbnq90E
   A2A5W9jGn1lD1G3gBhrLMNSfZZvq4xFbp/nBHtZIjrRzlsImeeeOGY4bp
   kw11ECaHtKqFbomqr+QPUzBg8TMwkA0ux4xDeuyogzM7CucP/FxgLlBTc
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="325682171"
X-IronPort-AV: E=Sophos;i="5.97,220,1669104000"; 
   d="scan'208";a="325682171"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2023 01:03:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="722239613"
X-IronPort-AV: E=Sophos;i="5.97,220,1669104000"; 
   d="scan'208";a="722239613"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 16 Jan 2023 01:03:51 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 15FD8E1; Mon, 16 Jan 2023 11:04:25 +0200 (EET)
Date: Mon, 16 Jan 2023 11:04:25 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	Jakub Kicinski <kuba@kernel.org>
Subject: Re: [ammarfaizi2-block:netdev/net-next/main 3/11]
 drivers/net/thunderbolt/main.c:733:47: sparse: sparse: restricted __le32
 degrades to integer
Message-ID: <Y8UTGejgZ2jZTipT@black.fi.intel.com>
References: <202301152241.Ihj70P79-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202301152241.Ihj70P79-lkp@intel.com>

Hi Test robot!

On Sun, Jan 15, 2023 at 10:29:39PM +0800, kernel test robot wrote:
> Hi Mika,
> 
> First bad commit (maybe != root cause):

Thanks for the report.

Yeah these are the existing sparse warnings that did not come with this
series. I have on my todo list to clean these up as well.
