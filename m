Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBFEDDAF
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Sep 2023 19:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693942822; x=1725478822;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5JMhy340COY43uhOYXZKSj7yW4IYql+k3rOX5Ml5sdk=;
  b=cHI5xbTgB/f9kWaRkL/aZOYOSD3jOpzO0ZuJR7Wqw1kxfUMq0v6Kjj0w
   Ui55ESaq2PYmaI/CpeOcxIuzymLwJZdD8Gu2hiO1Yyd5ChocIU9mcku0f
   YdJBriP88/1FdcXpgIa0iHr3AUAiMYLmpPhpzrZgSIc3KQQGzexULO8Sg
   bl1w+e4QKWeCG+CbU1s1dxq1oAooAjZiDnFZDK0R9DWgl0Vq9pZWgKDTS
   qNUvX8ap2tzQZ6F5YrpahmkBTZaTwhYk8Ln7m+Oyl3ENRtB6AdVPxOpQg
   Jo540GnSdt8KXcxH+Lva6acR6KK4aYFnERp7G0Od7TjLOpc5CsZYUcrtn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="357198507"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; 
   d="scan'208";a="357198507"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 12:40:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="744399856"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; 
   d="scan'208";a="744399856"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 05 Sep 2023 12:40:19 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdbuL-00020h-1M;
	Tue, 05 Sep 2023 19:40:17 +0000
Date: Wed, 6 Sep 2023 03:40:11 +0800
From: kernel test robot <lkp@intel.com>
To: Zheng Yejian <zhengyejian1@huawei.com>, rostedt@goodmis.org,
	mhiramat@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, yeweihua4@huawei.com,
	zhengyejian1@huawei.com
Subject: Re: [PATCH] tracing: Fix unexpected ring buffer expand by instance
Message-ID: <202309060320.psgXz5VD-lkp@intel.com>
References: <20230905121714.3229131-1-zhengyejian1@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230905121714.3229131-1-zhengyejian1@huawei.com>

Hi Zheng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.5 next-20230905]
[cannot apply to rostedt-trace/for-next rostedt-trace/for-next-urgent]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zheng-Yejian/tracing-Fix-unexpected-ring-buffer-expand-by-instance/20230906-014353
base:   linus/master
patch link:    https://lore.kernel.org/r/20230905121714.3229131-1-zhengyejian1%40huawei.com
patch subject: [PATCH] tracing: Fix unexpected ring buffer expand by instance
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230906/202309060320.psgXz5VD-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230906/202309060320.psgXz5VD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309060320.psgXz5VD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/trace.c:6438: warning: Function parameter or member 'tr' not described in 'tracing_update_buffers'


vim +6438 kernel/trace/trace.c

4f271a2a60c748 Vaibhav Nagarnaik 2011-06-13  6425  
ef710e100c1068 KOSAKI Motohiro   2010-07-01  6426  
1852fcce181faa Steven Rostedt    2009-03-11  6427  /**
1852fcce181faa Steven Rostedt    2009-03-11  6428   * tracing_update_buffers - used by tracing facility to expand ring buffers
1852fcce181faa Steven Rostedt    2009-03-11  6429   *
1852fcce181faa Steven Rostedt    2009-03-11  6430   * To save on memory when the tracing is never used on a system with it
1852fcce181faa Steven Rostedt    2009-03-11  6431   * configured in. The ring buffers are set to a minimum size. But once
1852fcce181faa Steven Rostedt    2009-03-11  6432   * a user starts to use the tracing facility, then they need to grow
1852fcce181faa Steven Rostedt    2009-03-11  6433   * to their default size.
1852fcce181faa Steven Rostedt    2009-03-11  6434   *
1852fcce181faa Steven Rostedt    2009-03-11  6435   * This function is to be called when a tracer is about to be used.
1852fcce181faa Steven Rostedt    2009-03-11  6436   */
625c101cac2477 Zheng Yejian      2023-09-05  6437  int tracing_update_buffers(struct trace_array *tr)
1852fcce181faa Steven Rostedt    2009-03-11 @6438  {
1852fcce181faa Steven Rostedt    2009-03-11  6439  	int ret = 0;
1852fcce181faa Steven Rostedt    2009-03-11  6440  
1027fcb206a0fb Steven Rostedt    2009-03-12  6441  	mutex_lock(&trace_types_lock);
625c101cac2477 Zheng Yejian      2023-09-05  6442  	if (!tr->ring_buffer_expanded)
625c101cac2477 Zheng Yejian      2023-09-05  6443  		ret = __tracing_resize_ring_buffer(tr, trace_buf_size,
438ced1720b584 Vaibhav Nagarnaik 2012-02-02  6444  						RING_BUFFER_ALL_CPUS);
1027fcb206a0fb Steven Rostedt    2009-03-12  6445  	mutex_unlock(&trace_types_lock);
1852fcce181faa Steven Rostedt    2009-03-11  6446  
1852fcce181faa Steven Rostedt    2009-03-11  6447  	return ret;
1852fcce181faa Steven Rostedt    2009-03-11  6448  }
1852fcce181faa Steven Rostedt    2009-03-11  6449  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
