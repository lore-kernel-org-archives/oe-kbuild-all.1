Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDEA6F073
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Jul 2025 01:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752197165; cv=none; b=X1FRd9OrP2T6r4BW8Rx18v4w09yWNERF0nxO39RXFyavO++FBViunZ+RDCZAHcO2HPWGcTlY+2stofODSJT3Tu2YyU1JlPkb/oud4bE1zJBBizAx+jYLQGoabWBKJd9gvMgdzC5JEnJyHeTuhvKBw9sY+Fuu5Ao9wNt+bTAoovw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752197165; c=relaxed/simple;
	bh=LvnJ253gljKw3gyUifBfE+0IRLplq67uVF4Qleh/CSw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oMUzq0v1IvvpLqSkYgJf7rhIKGiOeBdDJilBDBK6PtsJISo2NjBfnbFEKFajcJS9zdGKL/0odWGg0X7LFB/gCK/JiJMWB7YRR78vcmS6pZyoXbzyplDo+SqLPDrv4WyWOogMdcc+rzH2+hlOM+Pkgiz3qtz31gWOr+U9v7XIKuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=auQ5nLMN; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="auQ5nLMN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752197164; x=1783733164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LvnJ253gljKw3gyUifBfE+0IRLplq67uVF4Qleh/CSw=;
  b=auQ5nLMNJQHOylmtRIH0h6EY3VbF11HDG6rnvHYUuxxTgxANYVD0CoPn
   ErN+8knLfNDnaZIt9t1b9EJGPioKR6YvBnwpYfapNsoJfpdA8BY7v31AQ
   yleJZaG89exO5PPG8GkHzWZp0EruEp5e/G6U+S7oBDumMV66SkPUEzzgx
   sI/qODJ8DRmX88dZ+6Tc0mxTVO9H55asJ4pJ8/QwFS/vL/MsPXPaFVr5e
   D0dDjVZXjGzimQ/23acY6IvayVhbecc5oiu7EErLYxrph7LxcePnL/xI9
   y3lmpRtZoKxtoDqDcVbK/W+sq0iws0O+j+wDPlWLg0GrLLJ8xrjeI+Gcq
   g==;
X-CSE-ConnectionGUID: zkk8LqBITdSq7eCr6dFW3g==
X-CSE-MsgGUID: V+oWtEA4R+2QstUUbgE9GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="65075586"
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; 
   d="scan'208";a="65075586"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 18:25:23 -0700
X-CSE-ConnectionGUID: LA0P7tWFQBuIYYBaqDihGw==
X-CSE-MsgGUID: 8g67fRBUTUaCV8PEnZzdKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; 
   d="scan'208";a="155660556"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 10 Jul 2025 18:25:22 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ua2Vr-0005iX-2R;
	Fri, 11 Jul 2025 01:25:19 +0000
Date: Fri, 11 Jul 2025 09:25:08 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 132/133] ERROR: modpost:
 "__udivdi3" [fs/bcachefs/bcachefs.ko] undefined!
Message-ID: <202507110923.XlqQEHek-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   8d200ac1e16c31347f902d01626d846a7640818b
commit: aa480bb5829d459d216a48331e3defaa8611a3c3 [132/133] bcachefs: bch2_read_bio_to_text(): tabstops
config: i386-buildonly-randconfig-005-20250711 (https://download.01.org/0day-ci/archive/20250711/202507110923.XlqQEHek-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250711/202507110923.XlqQEHek-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507110923.XlqQEHek-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__udivdi3" [fs/bcachefs/bcachefs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
