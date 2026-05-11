Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C8933F589
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 May 2026 19:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778526492; cv=none; b=ESfl1TiBF/gfu4yj3KrfOwD74p8jHFfA5PLuPygYayqvoZzUJ11qlIeM6DFEBEk+f2mSt7I/Fp/TIMzdjNa0PKQ40QkudHzKqRzZBNo95E1VarRqZeRcIXjmNJkBedet8HxwVyEIwb1ZfV49gx2zuY1JLlBJp7/EzzKOxgtVDZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778526492; c=relaxed/simple;
	bh=21kWmmd7v+JE0O/JB5kMRuU7AalW109h5RRBQaw+aRw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Vh+H8F1CJON3CdosuUg5dATdDmPYLfWe2oKflEPpswREWMMa2g7OK0bojMGxNjHzsPjCW6wkA1C8oIecdqpbn5RMJPQ1bkzX/DImRdl4ZGsnUuIt3byr6o/5N2PGaSGTgXAl240/0woemwgw9AadYSALWp6SqAf1jXJLxpdddr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BPHPayMZ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BPHPayMZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778526490; x=1810062490;
  h=date:from:to:cc:subject:message-id;
  bh=21kWmmd7v+JE0O/JB5kMRuU7AalW109h5RRBQaw+aRw=;
  b=BPHPayMZXg6yewtgY2/ZA9hWt8N+PqIGvLyJlDnl7AagXX3lhBcqlHy1
   6ChykLB/+YZjKAcDDDhiLPNYZOfsL6wYCf6fDZXSJ3fsaPjtEeFJIzxTq
   0v/lw1Sa+lS3rizJWVcNT0fR2I+NvOFTkBEEU6dyEE3VcdMEPa94kKbAp
   g4G0Jq6F3jsezqi7XEZibwZBhz+cepBoQAgpt0h2JpgaQaISPS9QvAqu4
   4Rzf/l+X4QQ4fnv+UTZZb70b5/yuIpvf6+T7zaWuz3Wz1ZuCIRbgJ0Tte
   VMnbUq1DWujZSrrDt/3RbP9F4Mh0GydQn5LA+ZRIce7Q7b+2VtaUJjzih
   g==;
X-CSE-ConnectionGUID: 6ZHMwd1GRoeXh+YjSRQPFg==
X-CSE-MsgGUID: SOA7ECkjRJ+S5/xcgbQG4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="83274101"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="83274101"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 12:08:09 -0700
X-CSE-ConnectionGUID: ujKatPD8R8iF1MZKWE6WRQ==
X-CSE-MsgGUID: XtUXWcx0T6Wps41d4Eu9Wg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 May 2026 12:06:54 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMVxs-0000000012r-0p1v;
	Mon, 11 May 2026 19:06:52 +0000
Date: Tue, 12 May 2026 03:06:34 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 1571/1992] Warning:
 fs/bcachefs/journal/journal.c:736 function parameter 'flags' not described in
 'bch2_journal_flush_seq_async'
Message-ID: <202605120305.mbiKFN0C-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kent,

FYI, the error/warning still remains.

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   e3a200ec31f9bf6a78bd4e297fce4c8492bf2a56
commit: a0168a474528cc64bf290cf20399e714161f4538 [1571/1992] bcachefs: Pass BCH_WATERMARK_reclaim when discards require journal flush
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260512/202605120305.mbiKFN0C-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605120305.mbiKFN0C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605120305.mbiKFN0C-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/bcachefs/journal/journal.c:736 function parameter 'flags' not described in 'bch2_journal_flush_seq_async'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
