Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67AD1F754F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 15:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735313768; cv=none; b=DaiDKEzkSbAYliR4sYLGifDt+NMl8elY9nKyN4pGrvjdAfWQzii+gsKWYFI6DGTRpXRTa1kq2fWBDb2UHrt403089RxW78lN0s7P6r5VoIHqky0K9McZ9a3BKiiuiDmC5Q6BjFGBZDtw0ODquh9+vVA4NkiSapRKeS00OEfW3ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735313768; c=relaxed/simple;
	bh=azuhA+aBPc3AyWNYAafbkhkWCdIMB12IZ+aXa3SZ7Cg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H1eslN4PlJA9k5cD7HiF/bxpSGlN+HR+HiR9vDOAKoulaRkozEHhJN2V9kEWMyuXE4D8X13gR1KoNpqkKGYU2etJJIs1N5YOm7rWYVKDwmy2nn3IE+RvLBOlbVTctxJF4M3CBAXduWzTgu3WpUFCW24TrAnP/8Mywi+2PKO0ZAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aynhBbFQ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aynhBbFQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735313766; x=1766849766;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=azuhA+aBPc3AyWNYAafbkhkWCdIMB12IZ+aXa3SZ7Cg=;
  b=aynhBbFQmKkC8RvYwyXNi1nwhpF0sMSOKLmyyviGDcifHxOh6qDJQwgR
   bK1TJbkPSRaOYOafNHr9QhngB6mOyZkqShQoiOGCUQg8ZR86SxZdbX+t8
   YmA12H8epX8UqGkF4adcTPET2NNLaR6Lkxyv8+ggSH4os9VhyLDsiULas
   fBplVQtziaYVXKz2cIPm/zu99gYLIANR9ybltwSDGUNlj/RpUoA6vWXJR
   5cQOStzZsIHlPMk3nQmzhjWKm+MZqbF+5JtVz+fMYFcu+5dmMtBupReJc
   w8BMh430ViNHi4vYhlJH9yvgGrgoflqRQuXk0MPga447Pnvf4mvZ482Xa
   g==;
X-CSE-ConnectionGUID: RPneDNz9R4+XRZCwy5+hqA==
X-CSE-MsgGUID: 7p9yh9O4TGCApQkauN3xFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35739932"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="35739932"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 07:36:06 -0800
X-CSE-ConnectionGUID: YSx676ogTLKcKrwsHZc15Q==
X-CSE-MsgGUID: Q6/+1G29TIiRfWDjxYHwRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104250232"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 27 Dec 2024 07:36:04 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRCNe-0003IX-0O;
	Fri, 27 Dec 2024 15:36:02 +0000
Date: Fri, 27 Dec 2024 23:35:28 +0800
From: kernel test robot <lkp@intel.com>
To: Tingwei Zhang <tingwei@codeaurora.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Steven Rostedt (VMware)" <rostedt@goodmis.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Subject: drivers/hwtracing/stm/ftrace.c:38: warning: Function parameter or
 struct member 'export' not described in 'stm_ftrace_write'
Message-ID: <202412280133.JV62su59-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tingwei,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d6ef8b40d075c425f548002d2f35ae3f06e9cf96
commit: 7b9749bd830848bca9179b0a16251ca3c36e82e6 stm class: ftrace: Change dependency to TRACING
date:   4 years, 3 months ago
config: sh-randconfig-001-20241212 (https://download.01.org/0day-ci/archive/20241228/202412280133.JV62su59-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412280133.JV62su59-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412280133.JV62su59-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwtracing/stm/ftrace.c:38: warning: Function parameter or struct member 'export' not described in 'stm_ftrace_write'


vim +38 drivers/hwtracing/stm/ftrace.c

262e1f6e39143c Chunyan Zhang 2016-11-21  30  
262e1f6e39143c Chunyan Zhang 2016-11-21  31  /**
262e1f6e39143c Chunyan Zhang 2016-11-21  32   * stm_ftrace_write() - write data to STM via 'stm_ftrace' source
262e1f6e39143c Chunyan Zhang 2016-11-21  33   * @buf:	buffer containing the data packet
262e1f6e39143c Chunyan Zhang 2016-11-21  34   * @len:	length of the data packet
262e1f6e39143c Chunyan Zhang 2016-11-21  35   */
262e1f6e39143c Chunyan Zhang 2016-11-21  36  static void notrace
a773d419275bf5 Felipe Balbi  2017-06-02  37  stm_ftrace_write(struct trace_export *export, const void *buf, unsigned int len)
262e1f6e39143c Chunyan Zhang 2016-11-21 @38  {
a773d419275bf5 Felipe Balbi  2017-06-02  39  	struct stm_ftrace *stm = container_of(export, struct stm_ftrace, ftrace);
a773d419275bf5 Felipe Balbi  2017-06-02  40  
a773d419275bf5 Felipe Balbi  2017-06-02  41  	stm_source_write(&stm->data, STM_FTRACE_CHAN, buf, len);
262e1f6e39143c Chunyan Zhang 2016-11-21  42  }
262e1f6e39143c Chunyan Zhang 2016-11-21  43  

:::::: The code at line 38 was first introduced by commit
:::::: 262e1f6e39143c2a0f559e2fb4a835069a7693a9 stm class: ftrace: Add ftrace-export-over-stm driver

:::::: TO: Chunyan Zhang <zhang.chunyan@linaro.org>
:::::: CC: Steven Rostedt <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
