Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0624B1A3154
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Oct 2025 04:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761193100; cv=none; b=ZSvHVDzAVhGzf/sHQw3niayh/mMTTEKGdcHUP5UZ9sQ6zyOemhYWNkxjN/isrgkVZyJAGQSLnNOW7Su6ydE5kwoZuvS2j1woBTOD8F8HJyVR+n/Kx85Mi3nf6PHP+RKM2ocHr+VsZ7Vce/Qas8W8I1uEX7H4gafw8RZw1202JR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761193100; c=relaxed/simple;
	bh=+wk26XgKtOW7bDWQqwl51H/ka/4j02woRp9MxE5BSjY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nTtJ7OJB72S6dj+zkvBjQq5MmlaI88hEqv+xgHqFu/KmjFAkTetEAQtM2LEUUn48hqD/AtJ/tkoJcz4Wec+DmNakKy6Kg/H9A7o5Od4BS27nSulj4tNKd3I+mAYUh0kHq92SxFZdvFvoLNH1KlFzLc6JxQJRw8EPCP3Arks7dRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WoL7wICh; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WoL7wICh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761193099; x=1792729099;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+wk26XgKtOW7bDWQqwl51H/ka/4j02woRp9MxE5BSjY=;
  b=WoL7wIChCSm5mKdbuCGnhNteNpp42mvUTgv8bM7dkHqHXtB3G7/ThbwC
   +kzISmc10d4Zb5RAv0qRu0g0WGL1W60oYSMxGiF5AAlm+xs2s078Ztvfr
   AG6ufRsDz4E9x94DDV41zZBbzvefTMOmGdC+ZwPv6xQDwUaher1fy8MWF
   ng+wLDqp+peG/PDwOVrtWNkPxXL5SvR0RwF7h0BX4QA/BKm+4SvamE11e
   8BDIOO0TAikV5FP53i+FNNciGupbD72JPyecsXZqQ3R0lo7EhSSdUkIi/
   KRMrBBnqvIxIXk50ubWyAjvBmbEq9DUuDwPvSLnas9b9JbsPaG7NsMqt+
   g==;
X-CSE-ConnectionGUID: R3ivVOnGQV27hMZLX6OW3Q==
X-CSE-MsgGUID: pOyJiw/bRL6EEL6JPVCP/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67217916"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="67217916"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 21:18:18 -0700
X-CSE-ConnectionGUID: 2IHYi8SDRl6XQ+Qe9GIchA==
X-CSE-MsgGUID: ZGe8qcfRR8Kvg29u1A6U8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="189177831"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 22 Oct 2025 21:18:15 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBmkB-000D0l-1J;
	Thu, 23 Oct 2025 04:16:17 +0000
Date: Thu, 23 Oct 2025 12:13:33 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fuse-service-container 74/85] {standard input}:5382:
 Error: unknown opcode 'sub3_s'
Message-ID: <202510231247.WjLoI40o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-service-container
head:   8ae30781e9bea2e46353eafa1d14957bad7be27d
commit: 2cc8d582b7f4bd093ea4a1bcc0e648021cc4bb09 [74/85] fuse: cache iomaps
config: arc-randconfig-002-20251023 (https://download.01.org/0day-ci/archive/20251023/202510231247.WjLoI40o-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510231247.WjLoI40o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510231247.WjLoI40o-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:5382: Error: unknown opcode 'sub3_s'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
