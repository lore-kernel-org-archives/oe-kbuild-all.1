Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5061E484
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Apr 2024 22:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713392821; cv=none; b=geuCv/2S94v3PoCfds7QoyN+Y2OsVuVHJSHTLc0aJ6RzQcxpKHPwFQVACvoMr+Yo2j6jdtL87CmjLfub96MQ/6mGzRumLZvTGSdv80kdKMzvmL0ZmhpKnifeZyTYpSQxFoyyNLGZ9QBjeXUHBw9CsPfTzuOfNH4xCAIdfe17xG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713392821; c=relaxed/simple;
	bh=559bMWkl/AZB9okQzD6rSD7HPJTDmvP8FNuj2gXWgTU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UVHdcIDjErgQGrna+aUV3f7mbRNdZ5jry+oD4r1IOwn5TQE8cqUn/H5ecypA97jCZIBCY2Dnoox/4MOQWMYdoz2W2m4vwJccrnM2DR7b4H7qNHFtLKsA6PHZJ2jTujHvo9/gvxRLQ8Wiqbhir7Rgo+34kiaA+I0YiiOCnmeSdz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DM+mFwNP; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DM+mFwNP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713392819; x=1744928819;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=559bMWkl/AZB9okQzD6rSD7HPJTDmvP8FNuj2gXWgTU=;
  b=DM+mFwNPxtB++tIiSeu9cdbcGXjpElqzR088EWPDFhN9ELci6JBiUFct
   q2L+xtRupSR6RPFfQLXOj+y5K8jePM1h9XPSZYVIeVBCTV642GcLJYcyj
   Z9SiL4CFhgkEjqJlE0MeNj6WbYgLGqfD2OBESqo10NDTcxEkFRcef124R
   qk2OHfbqcQ0DWlHBAF6Wbhv6e56w0N0jHczrEV/Q3n4sJgRk5vEBnM7y2
   kHW2grsLZPg7FaL7ZFb63x4YKr9bsG10bkHHDVNfz+D/FH/m+WQ36e/BE
   wQGmjEtntuHJwv5xQbaVzHSltoPxLOn1zyD1Up9SdVnPVWFJhP1TClLST
   A==;
X-CSE-ConnectionGUID: aqfGQ8HMRKOBpZ0ZtlPcsg==
X-CSE-MsgGUID: bXJCX+YgQwC1n8eTfSgSWg==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9079958"
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; 
   d="scan'208";a="9079958"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 15:26:58 -0700
X-CSE-ConnectionGUID: 9c2jhOIuRN+78AH4/s1QDQ==
X-CSE-MsgGUID: ge/mtFoHSc63Ys+quNUNYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; 
   d="scan'208";a="22772793"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 17 Apr 2024 15:26:57 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxDjz-00072W-07;
	Wed, 17 Apr 2024 22:26:55 +0000
Date: Thu, 18 Apr 2024 06:26:42 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:master 159/163] fs/bcachefs/btree_trans_commit.o: warning:
 objtool: .text: unexpected end of section
Message-ID: <202404180621.5P95Q81N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   e5640e96243c66faa9b6ee6406096620711f1bb5
commit: 58fbd5c6f956bd5d1a2e9f89526426a8961209d5 [159/163] bcachefs: bch2_trans_verify_not_unlocked()
config: x86_64-randconfig-001-20240418 (https://download.01.org/0day-ci/archive/20240418/202404180621.5P95Q81N-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240418/202404180621.5P95Q81N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404180621.5P95Q81N-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/btree_trans_commit.o: warning: objtool: .text: unexpected end of section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
