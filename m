Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9EA361DCE
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 19:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772740491; cv=none; b=LeIfjP6SY8z8k3nfC0NQNNyXQc8otez6kQb4nCFbxgctoupubl4xIzs+BI/LMiPiPdY+AwR798fHXLznS1OqwGcpgNFoibRlOtgBP+2PWR09rHLfKoL19aNuqvZ318mtITJTDg6gcb6RCB/+5hlyAOduAbS5b8vLZeNwTHAvRkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772740491; c=relaxed/simple;
	bh=51eBUETdLOmqAIymR8W6BIWo75Pl3joHZo0Z7jfemcY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U1EXuknhKZezcRXBJE0cwYaSUX7xMhS+TBaNtzR2r609kvOY85ucXLqI4LZIg9wezjNihxZhsmwvbsQRyg3Dudlt1ZI1pihdf8JeNVHDlcO9InHo4eYgrRX6+winEirKW5liRSFH8y6nTKxlSi4vSErPgNFYBOYh62FwPA7HUzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T2vTtY3I; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T2vTtY3I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772740490; x=1804276490;
  h=date:from:to:cc:subject:message-id;
  bh=51eBUETdLOmqAIymR8W6BIWo75Pl3joHZo0Z7jfemcY=;
  b=T2vTtY3IpkQeTzifIBPJdEtDY6tC2nDRLYBop0sC94VwxqWbjAaUpRwQ
   Ovyc2ryc+aLqjSFGSB2ehdQzxXj12bGvAjwIxxUTxHaF8y4a9wuoX8Opx
   AofM8rHjTSS2KkTnM9SRVU5ryzMTGSrmU+X8rJR5SJPTeiBbmDD9YOw+2
   l5lHzX+hHRDt1ZcLG2oBqUdRza8Hl0HQpXr7UIcL5xF8uTk8dZOt4w7XI
   Cpo8Ua1p6BQhaNaPH2KoB+SrJQpbwLqazclgD/A6XzTQOmEpBxq4IER1F
   yLe89NOAYlTo+fQzm0FwTqt8wOtO/u5721dE6tAMR/DadJSwaQoBQngzJ
   A==;
X-CSE-ConnectionGUID: SJCotqL5RVChte98l16AAA==
X-CSE-MsgGUID: iSXV2T0kRPqsnGqbf8c/nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73037619"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="73037619"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 11:54:49 -0800
X-CSE-ConnectionGUID: GmBPzXfpShmWkPNVEhgZgQ==
X-CSE-MsgGUID: FvQDM77RRXuHf/nYUMy8+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="223264766"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 05 Mar 2026 11:54:48 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyEmT-00000000245-0kCa;
	Thu, 05 Mar 2026 19:54:45 +0000
Date: Thu, 05 Mar 2026 20:54:13 +0100
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [glemco:staging_rv_bpf_monitors 17/29]
 kernel/trace/rv/rv.c:405:43: warning: 'snprintf' output may be truncated
 before the last format character
Message-ID: <202603052005.VhecvLiM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gmonaco/linux.git staging_rv_bpf_monitors
head:   3a153b8189ae2fb3a1e680f5092df636abbdac56
commit: 5abaeaa22e49b00fbe28df02cf53919b3864eb73 [17/29] rv: Use static arrays for rv_monitor name and description
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260305/202603052005.VhecvLiM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603052005.VhecvLiM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603052005.VhecvLiM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/trace/rv/rv.c: In function 'monitor_desc_read_data':
>> kernel/trace/rv/rv.c:405:43: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
     405 |         snprintf(buff, sizeof(buff), "%s\n", mon->description);
         |                                           ^
   kernel/trace/rv/rv.c:405:9: note: 'snprintf' output between 2 and 129 bytes into a destination of size 128
     405 |         snprintf(buff, sizeof(buff), "%s\n", mon->description);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/snprintf +405 kernel/trace/rv/rv.c

102227b970a152 Daniel Bristot de Oliveira 2022-07-29  393  
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  394  /*
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  395   * Interface to read monitors description.
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  396   */
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  397  static ssize_t monitor_desc_read_data(struct file *filp, char __user *user_buf, size_t count,
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  398  				      loff_t *ppos)
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  399  {
24cbfe18d55a68 Nam Cao                    2025-07-24  400  	struct rv_monitor *mon = filp->private_data;
5abaeaa22e49b0 Gabriele Monaco            2026-03-03  401  	char buff[MAX_RV_DESCRIPTION_SIZE];
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  402  
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  403  	memset(buff, 0, sizeof(buff));
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  404  
24cbfe18d55a68 Nam Cao                    2025-07-24 @405  	snprintf(buff, sizeof(buff), "%s\n", mon->description);
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  406  
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  407  	return simple_read_from_buffer(user_buf, count, ppos, buff, strlen(buff) + 1);
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  408  }
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  409  

:::::: The code at line 405 was first introduced by commit
:::::: 24cbfe18d55a6866bc2e27fda74306f4a1b5cb01 rv: Merge struct rv_monitor_def into struct rv_monitor

:::::: TO: Nam Cao <namcao@linutronix.de>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
