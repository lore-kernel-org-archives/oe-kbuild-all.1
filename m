Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A10926ED48
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Nov 2025 18:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764180746; cv=none; b=MdQggU4+7whBsz/Wr9IaSeO0ZzGhDYIqda0T7/qt+eAGOVlvMOXaJz53ke4as8/8lp3HiG2J7t6lim4CCQ+KLH5gYbEozgl6i/T88u4doO0+Ur+HWmjIzNIV40UjysSD+d6nZfHHLfFZeeqSsIN8dWYYEFJnsM/F1BXU1bjoGkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764180746; c=relaxed/simple;
	bh=7wuZeNb8w/wyJaRkL/QbSho/BhSlScXyL2qk+Uj1ZnY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mgS4pSTXpYOjRDTDiGszd2koX9tcfOhnx6uiroGa0CBLco1m0kLFivqL8Wda6boRZX/J6GyOyAN5K3h+rsyv0rC3Na7E+Ip7h36FqRR3AwT2afO1tLkF8PnDcdTJZW5xA5oZSmbdKfBRRALsYsNIdyy0u/ABVs+C2j0A0S0Vh9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cZ4xu9xn; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cZ4xu9xn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764180743; x=1795716743;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7wuZeNb8w/wyJaRkL/QbSho/BhSlScXyL2qk+Uj1ZnY=;
  b=cZ4xu9xnl49F6mPXastX+BiSCBMRgSspqRBErcKjyFUwtnxQvbDIMe1d
   TcCNL07dFfbHsVoKJLWdPOfCJCmVz+n2E+zyPgZlRGkc6sQGcCe50WyUB
   6p51egSwj4z6MXM0aOwI2inxeneC+WUXysAPnLjJEjkuECBAswtV/ZLBx
   3WZVvBYDwESXs0WwCujnlRMLylbSxAFuqiNYxJqnqROs6BHFzCrSGTwEM
   vJzW6jXc/+fi/vT1EPOhtgzZlI9sLIRUn1Hj41Qc5FXWoqTLPe7sPxZwE
   t1TiWagMvw0+mac0BwlrYKktQ9lpXLTmZyIVL5tmDUAZxI8iY/pec+3ka
   A==;
X-CSE-ConnectionGUID: je8FSj3AR7qJr2CKyq/lRA==
X-CSE-MsgGUID: D08L8dyQR7mCQ3e5r/kIBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="76551021"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="76551021"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 10:12:22 -0800
X-CSE-ConnectionGUID: Hsw28dizQ1C60gb4XIxcxA==
X-CSE-MsgGUID: /32RU1tKThuB+w3kpKZFrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="192818390"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 26 Nov 2025 10:12:22 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOK02-000000001Hz-25iw;
	Wed, 26 Nov 2025 18:12:18 +0000
Date: Wed, 26 Nov 2025 19:12:12 +0100
From: kernel test robot <lkp@intel.com>
To: Breno Leitao <leitao@debian.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	Hanjun Guo <guohanjun@huawei.com>, linux-doc@vger.kernel.org
Subject: [linux-next:master 11827/12060] htmldocs:
 Documentation/driver-api/hw-recoverable-errors.rst: WARNING: document isn't
 included in any toctree [toc.not_included]
Message-ID: <202511261943.PGqXohrz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   663d0d1af3faefe673cabf4b6b077149a87ad71f
commit: c03fb5253a0341ef7721ef107a89768a073b945a [11827/12060] vmcoreinfo: track and log recoverable hardware errors
reproduce: (https://download.01.org/0day-ci/archive/20251126/202511261943.PGqXohrz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511261943.PGqXohrz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ERROR: Cannot find file ./include/linux/mutex.h
   ERROR: Cannot find file ./include/linux/mutex.h
   WARNING: No kernel-doc for file ./include/linux/mutex.h
   ERROR: Cannot find file ./include/linux/fwctl.h
   WARNING: No kernel-doc for file ./include/linux/fwctl.h
>> Documentation/driver-api/hw-recoverable-errors.rst: WARNING: document isn't included in any toctree [toc.not_included]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
