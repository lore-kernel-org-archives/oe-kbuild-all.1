Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD592C878
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Nov 2023 18:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a8LCzUqS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699295049; x=1730831049;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iGlx7of+BqvZT5kCwEYhVAUHVoc2yC09/DNgqviWlfU=;
  b=a8LCzUqS49s366jaFSRHwlQrIWatkNFhBtNVEZQj4raoecv9l52Xnxc2
   IRPHJ11+tK5GprTOOnYJ/h2WMGwFmJKKxsc43qlL0a8ITpmmEOD57xRUl
   wb2QuuCdo/zNg5mPcpjrxdajz8m/sTNbaYAFIYRmprMdQqfmw5RjXZYIy
   aWZ70jkxcIvq3r7gKVzaZU1OrqrWNe6xDTWoooC9U16++SP0aii8t24IK
   ZmwRLMILx1wQoSs8OH+hrEZpw+4GdO5rw8gd8AoOEXupv2VFU20kUjfAD
   eyRAqShzCKiWaktbD2F/6CZS3yJMuxbJRjdzkopUfQv1Ux617spyMtvhl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="455820565"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="455820565"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 10:23:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="766043858"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="766043858"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 10:23:55 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r04GP-0000000Bs69-0rTT;
	Mon, 06 Nov 2023 20:23:53 +0200
Date: Mon, 6 Nov 2023 20:23:52 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: Alexander Potapenko <glider@google.com>,
	Yury Norov <yury.norov@gmail.com>,
	Syed Nayyar Waris <syednwaris@gmail.com>,
	kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [alobakin:pfcp 11/19] include/linux/bitmap.h:642:17: warning:
 array subscript [1, 1024] is outside array bounds of 'long unsigned int[1]'
Message-ID: <ZUkvOCxyiin_77qd@smile.fi.intel.com>
References: <202310170708.fJzLlgDM-lkp@intel.com>
 <bd7fe929-c6fc-42be-9d2f-3f53ec21fd10@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd7fe929-c6fc-42be-9d2f-3f53ec21fd10@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Nov 06, 2023 at 05:31:34PM +0100, Alexander Lobakin wrote:

> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202310170708.fJzLlgDM-lkp@intel.com/

> Not sure how to approach this :z It was also captured on the version you
> sent 2 weeks ago, so this could've been resolved already.

Is it in the repository already? if so, we should revert it.
Otherwise you have time to think and fix.

-- 
With Best Regards,
Andy Shevchenko


