Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF992E8B64
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Sep 2026 17:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789320624; cv=none; b=FWOisx5W5yWyBa/5ZlcvOEjAStKk5oCGGGQXkAzIBPcxb4mV0Wmrzk4HjhbQff+STCepANr0CH9L6pUjrOIOQPQ6Ju0WLkCtVqSeyCsZ9qe1D/43URkoZm7kapoyocPx3AJFFo1ZKlLQeuL1fdE7PJ9ExHyjwWkaFEWS3P4VGDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789320624; c=relaxed/simple;
	bh=DBEnAjiiXxa7xgjn6I3X1ddZkSUdn7mGJKz2G/Hf+qw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L+ooPF6l5oVJ312yAYlHxvvp4o7uOSk7oPTxI+5lVF71mSjeTl6cCzGFTJG5xCEMQC++G/khDs3zMDE6hdNn9imFA6YfsC4JeFBh7+G0ySquCerq5tUWbASIKMW94NzKRogzloaJQyfUhof5hC23Y/lk0Z/MN8Q6SuCEPelGeSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OSZyg6D5; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OSZyg6D5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789320622; x=1820856622;
  h=date:from:to:cc:subject:message-id;
  bh=DBEnAjiiXxa7xgjn6I3X1ddZkSUdn7mGJKz2G/Hf+qw=;
  b=OSZyg6D57VK/fm3QBxVEtwDzNOxm4VBuGC9/irgjOPpLHcT0g6rDzSu3
   n0+3Qzk/GJLXmWi4SUf6sz0NMVPXl+imVHhFM87A8bchCLEh6669NoWVl
   zSjpaooUG69qeAv/wqxVmlmbxMAhmOtVd5jMXuY1kysMJ1n0gL9CEFvz8
   Hp5CNQ4b3+1kkBp12YXDaFKY++YCRU0VXiq+I7z9gLD/aCbxVnVlOkIhZ
   utDa2UGiuA03lb6ywMqmX7dfGbEQ4DtLcYAHRQq54L8UcCqtxgjAPe1F7
   gpn15Ra3TCJROCZ9ix8YYiqLgLM4DJ3WZFnVakyFlCbLHv3pAHdPlMRu6
   g==;
X-CSE-ConnectionGUID: JLeX/PKZQq2rUGsXPMBuHQ==
X-CSE-MsgGUID: sXkGoneaQqaIc+o+vwrL6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="107068492"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="107068492"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 10:30:21 -0700
X-CSE-ConnectionGUID: y9qs1PQJS0CmIoYIP/h2dg==
X-CSE-MsgGUID: eXjJcGVFTTuZJVSGEpL0ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="276599532"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 13 Sep 2026 10:30:20 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5o1w-000000001fD-1Hcs;
	Sun, 13 Sep 2026 17:30:16 +0000
Date: Sun, 13 Sep 2026 19:29:21 +0200
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 342/405]
 fs/bcachefs/util/util.c:476:1: warning: the frame size of 1052 bytes is
 larger than 1024 bytes
Message-ID: <202609131908.fBdwRJTs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   ca944a61e079450f82be88c91e349638c75cf4b6
commit: 901bbf17808704205ff7ed14810b2a2c602c63af [342/405] bcachefs: Add bch2_time_stats_json_to_text() printbuf wrapper
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260913/202609131908.fBdwRJTs-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260913/202609131908.fBdwRJTs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609131908.fBdwRJTs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/util/util.c: In function 'bch2_time_stats_json_to_text':
>> fs/bcachefs/util/util.c:476:1: warning: the frame size of 1052 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     476 | }
         | ^


vim +476 fs/bcachefs/util/util.c

   466	
   467	void bch2_time_stats_json_to_text(struct printbuf *out, struct bch2_time_stats *stats,
   468					  const char *epoch_name, unsigned int flags)
   469	{
   470		char buf[1024];
   471		struct seq_buf seq;
   472	
   473		seq_buf_init(&seq, buf, sizeof(buf));
   474		bch2_time_stats_to_json(&seq, stats, epoch_name, flags);
   475		prt_bytes(out, buf, seq_buf_used(&seq));
 > 476	}
   477	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
