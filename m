Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C572BE7A7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Jul 2025 12:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753358422; cv=none; b=juQj69nkrk6HWwVShqjNH9cNwjvjo8/h3rygd/P5a+SaxB/Fv1vYJFW1GHmD4VwSAkfPUI/xIH8zY9l9KBFRMsZHX7rCsayhJ0I08C4wujgWNcrgIkVw4A+D3bSM4sqrejvHiedoNPfjGna+/mAjQKmRKMOv1olop+WTuVcho2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753358422; c=relaxed/simple;
	bh=Q+YZ5sKhaY2aiC87UZgh86SxOF5kvU31o97BJotFwTU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k+MNVSbmbvuq90RV08xHlkmhbRo/JVxDlvxhUAFwXjMOeagQ4Xkg8HGGZNyLsOjlrG7coVVuJmNBpzlmIIAGHjCTUC2uuvbN8UKJm0Nq+F/1v40TiTRpbpFWnj9ppuRelizoOF7wX2kbJjNmzxVlo1KYSJg1HOfQduD1+sJJNf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hhGf2BMH; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hhGf2BMH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753358419; x=1784894419;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q+YZ5sKhaY2aiC87UZgh86SxOF5kvU31o97BJotFwTU=;
  b=hhGf2BMHo9tXS71hY49K9PgVrAb2pOUvQ3x1O6N/D2vD6MRrrQ0rmrUx
   6Hk9pmRX9hKXa5qwPlKhwAtkPQZ+tcoOXFHmG0S66CI2I2FgejwZiSzzH
   jBpcaL1vaklvMoF8T3NzPMFh+kFG5xhuWT3q8ZEUqiITREQ516eWgTR5m
   fHnrh+y1B4Tcw8YR0mRuzNB57EW1xa71T/DK0Rh3pNl+v+ePje4pNLx4O
   Leitm2plmRY6mhQCJ3cWLzFUR7mv8nqLXO7zbVTMX8xFZ8eivOy+a4Jo9
   ZYq782LSNVsPVtcs1P60nw2VUsfflvJwO5OViWmFLfLiIFSNVqghkFvql
   Q==;
X-CSE-ConnectionGUID: O41qp0goRNevYfTYdK0mQQ==
X-CSE-MsgGUID: tE6mQtfWTYGQxh4Fph+mAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55635924"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; 
   d="scan'208";a="55635924"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2025 05:00:19 -0700
X-CSE-ConnectionGUID: Ry/gtYwLQHOv+OThwEo8ig==
X-CSE-MsgGUID: X+2mygjDT/eL2kb37zeP4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; 
   d="scan'208";a="165734120"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 Jul 2025 05:00:19 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueucS-000KPB-0C;
	Thu, 24 Jul 2025 12:00:16 +0000
Date: Thu, 24 Jul 2025 20:00:00 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vbabka:slub-percpu-sheaves-v5-benchmarking 4/18]
 slub_kunit.c:undefined reference to `__udivmoddi4'
Message-ID: <202507241918.GscbzhhE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git slub-percpu-sheaves-v5-benchmarking
head:   48110dabe236d9bcd71448dc4ef1cf7091b0ac1a
commit: 9cf588249e9d08717e9d9c78815474e8ea767849 [4/18] HACK: SLUB_HAS_SHEAVES
config: i386-buildonly-randconfig-001-20250724 (https://download.01.org/0day-ci/archive/20250724/202507241918.GscbzhhE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250724/202507241918.GscbzhhE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507241918.GscbzhhE-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: lib/tests/slub_kunit.o: in function `print_improvement':
>> slub_kunit.c:(.text+0x81): undefined reference to `__udivmoddi4'
   ld: lib/tests/slub_kunit.o: in function `do_bench.constprop.0':
   slub_kunit.c:(.text+0x305): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
