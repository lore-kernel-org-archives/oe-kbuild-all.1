Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF9B1C8604
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 18:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765650518; cv=none; b=e/Z9BkbY3qTID5cdEc+PoLMs/5ykeUNMFwRiQ37nQjaQooE7NBHJuE2ZVO+imNvceP9uFFuhispFv0NZffLmtT11MFobxyAttF6bcMUISYboOFiMpLta6sEYycdRlTKWC0krjvxeDAYN0ZP2VaqVHBdhuDe/nOX2ZS++mHNpF2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765650518; c=relaxed/simple;
	bh=bvzTUO+pXj/cgD9VJJqlC31GeWjk7za5dURoHJl7IYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YRurWmm+XAQCjDhT4FcyUiOFrndgiEIaMduIwVZCVQlz6O/745EGqudysXYygDk56rga+gQUPQkk+w8ROET/yMnE+0BhDacKmxAUqTadkhKJiPtDG9h/Jf/vrKdK27hFzE+D1fUz65Bes8na+/mlicBBmy+en4l9ASA3Kg+6llM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cfyYA1Ba; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cfyYA1Ba"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765650516; x=1797186516;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bvzTUO+pXj/cgD9VJJqlC31GeWjk7za5dURoHJl7IYQ=;
  b=cfyYA1BaeQ/mlW8Kvm6/9Ul/ucDpyJNG2ds2qIyOvbS2b0Y5TXrVSb2p
   qZ7boi65USQYg4iSMbpPy4S7Ms64Tz3X/9m9hiC5SoHi4Quq5XJTFqx1c
   tdxlndhHyME3G87GyZULKQuz6uPEOzA4tcIQMPoJHs/Lw75ay54/+WfMF
   9zXD8TFrNz1zXYFen/PfboQB3i6rsWdbSZDLH7oeeWZ0VC7iZS0zNMSqP
   kH4CsrcnL61FjRaNscwOa8QAe96mjgXk6dZCnypfrlgjM9Nmv9D+fNKi6
   3ZPgU0yMoJEOb6pdMOLPZ+NdkvuDEKbkWCbgKNRXpsF9glJVEJktkfkq/
   A==;
X-CSE-ConnectionGUID: oJtcK9SNRJ+oMyScST9Cwg==
X-CSE-MsgGUID: mfavlbwUSf+suar5ypMubg==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67775645"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="67775645"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 10:28:36 -0800
X-CSE-ConnectionGUID: dXM0U0YfQtSm1pthclQrtA==
X-CSE-MsgGUID: HKM97xblRtWyabwJ4kbkDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="201767755"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 13 Dec 2025 10:28:34 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUUM4-0000000029A-0Z02;
	Sat, 13 Dec 2025 18:28:32 +0000
Date: Sat, 13 Dec 2025 19:28:21 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 50/50] mm/shrinker.c:698: warning:
 This comment starts with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202512131954.nMFj9JWl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   7c285f40a964b427534f3dab33b104ee9cab6245
commit: 1e63c23f99e1610c8c483368df6922ec9076d95a [50/50] drm/ttm: introduce pool_shrink_rwsem
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251213/202512131954.nMFj9JWl-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131954.nMFj9JWl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131954.nMFj9JWl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/shrinker.c:698: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Keep synchronize_shrinkers() here only to keep KAPI compatibility,


vim +698 mm/shrinker.c

   695	
   696	
   697	/**
 > 698	 * Keep synchronize_shrinkers() here only to keep KAPI compatibility,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
