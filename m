Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361BF7762B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jan 2024 16:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C1KZbnY4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705078383; x=1736614383;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=4v0LWSaW4bFNlu/bfz3MHgIMseSCQKFUgxuEjZVhkQw=;
  b=C1KZbnY4DL0SUIl9L2COjUPgTtHRTwWsfvFYrVV6zgQRKNY+P1x7JK6r
   e+iwqVJG44KmAyqWDN/1TTn55j7kjWDw7oLwIuMEvQ/6VNLOa6/3M1Q9z
   W3En7K9EMv+wGRmqZLMxYuzcnW1d2Y2zEMmKWdpYjiZARRMBkfhL/RV+r
   3wG7DkeHzYRINUqAOuIMNRHiY0d0E9AXGrXe6WNqV5fAyq9uZUJDI9B56
   tILkYP7CAr6yqCKvlEqUbcxml0j1QefbuC8WvI+wCC95mNomRTaeU1nuE
   +dXMeMKdFe5qcnzZY7zzQ5vcB0xbjnAO7IRUzZ31653k50gLdTnu/KGBi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="463502494"
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; 
   d="scan'208";a="463502494"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 08:53:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="902021105"
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; 
   d="scan'208";a="902021105"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 12 Jan 2024 08:53:00 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOKlt-0009gO-2f;
	Fri, 12 Jan 2024 16:52:49 +0000
Date: Sat, 13 Jan 2024 00:52:15 +0800
From: kernel test robot <lkp@intel.com>
To: Mikhail Ukhin <mish.uxin2012@yandex.ru>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 5.10/5.15] jfs: add check if log->bdev is NULL in
 lbmStartIO()
Message-ID: <ZaFuP5LqBBIVktg7@c3f7b2283334>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240112165007.4764-1-mish.uxin2012@yandex.ru>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-3

Rule: The upstream commit ID must be specified with a separate line above the commit text.
Subject: [PATCH 5.10/5.15] jfs: add check if log->bdev is NULL in lbmStartIO()
Link: https://lore.kernel.org/stable/20240112165007.4764-1-mish.uxin2012%40yandex.ru

Please ignore this mail if the patch is not relevant for upstream.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



