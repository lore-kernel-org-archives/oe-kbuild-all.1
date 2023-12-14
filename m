Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E366108
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 03:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TKVaIiXB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702524815; x=1734060815;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LvBI3Q0nsje9+cEb4qETVMWnt5ainOgvJfJLW1mNkfI=;
  b=TKVaIiXBQ2eGWhsjwVv6/93XsNWJoC2LJFuyRZFaMAmBiWduTKPPr2lt
   Qa5g9YnuY13GjnVlZpkD8vwpAGpZFSughzfcSe5fxKmR6vnmHJPFAAwb0
   tzRiuYySRSKqk+T33EupMiydXzSl2Tv0rb8l/bn5c5IQrnsVhOovDXnVl
   hv9/FKV33/SLG0FGX1zbst8d67tSnTyjygRobVi0/9x1IH8XeOFfy+RuW
   33zLYBK9fvA9O43iX0nQ8gnWoktz4inar4dC1rJbh578BjMRkhtupj9p8
   PCZnFaRLHXGzFe1xtDNXpgo51/2jc9nhUGfR0N6ovYTeAlTT/pGFIIyo6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="398900978"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="398900978"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 19:33:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="947419478"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="947419478"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 13 Dec 2023 19:33:34 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDcTb-000LU3-2W;
	Thu, 14 Dec 2023 03:33:31 +0000
Date: Thu, 14 Dec 2023 11:32:41 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] tracing: Have trace_marker break up by lines by size of
 trace_seq
Message-ID: <202312141156.aly2oFcx-lkp@intel.com>
References: <20231212190422.1eaf224f@gandalf.local.home>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212190422.1eaf224f@gandalf.local.home>

Hi Steven,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.7-rc5 next-20231213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steven-Rostedt/tracing-Have-trace_marker-break-up-by-lines-by-size-of-trace_seq/20231213-080530
base:   linus/master
patch link:    https://lore.kernel.org/r/20231212190422.1eaf224f%40gandalf.local.home
patch subject: [PATCH] tracing: Have trace_marker break up by lines by size of trace_seq
config: arc-defconfig (https://download.01.org/0day-ci/archive/20231214/202312141156.aly2oFcx-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231214/202312141156.aly2oFcx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312141156.aly2oFcx-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/trace/trace.c: In function 'tracing_mark_write':
   kernel/trace/trace.c:7296:20: error: 'TRACE_SEQ_BUFFER_SIZE' undeclared (first use in this function); did you mean 'TRACE_BUF_SIZE'?
    7296 |         if (size > TRACE_SEQ_BUFFER_SIZE) {
         |                    ^~~~~~~~~~~~~~~~~~~~~
         |                    TRACE_BUF_SIZE
   kernel/trace/trace.c:7296:20: note: each undeclared identifier is reported only once for each function it appears in
>> kernel/trace/trace.c:7298:17: error: label 'again' used but not defined
    7298 |                 goto again;
         |                 ^~~~


vim +/again +7298 kernel/trace/trace.c

  7278	
  7279		if (tracing_disabled)
  7280			return -EINVAL;
  7281	
  7282		if (!(tr->trace_flags & TRACE_ITER_MARKERS))
  7283			return -EINVAL;
  7284	
  7285		if (cnt > TRACE_BUF_SIZE)
  7286			cnt = TRACE_BUF_SIZE;
  7287	
  7288		BUILD_BUG_ON(TRACE_BUF_SIZE >= PAGE_SIZE);
  7289	
  7290		size = sizeof(*entry) + cnt + 2; /* add '\0' and possible '\n' */
  7291	
  7292		/* If less than "<faulted>", then make sure we can still add that */
  7293		if (cnt < FAULTED_SIZE)
  7294			size += FAULTED_SIZE - cnt;
  7295	
  7296		if (size > TRACE_SEQ_BUFFER_SIZE) {
  7297			cnt -= size - TRACE_SEQ_BUFFER_SIZE;
> 7298			goto again;
  7299		}
  7300	
  7301		buffer = tr->array_buffer.buffer;
  7302		event = __trace_buffer_lock_reserve(buffer, TRACE_PRINT, size,
  7303						    tracing_gen_ctx());
  7304		if (unlikely(!event))
  7305			/* Ring buffer disabled, return as if not open for write */
  7306			return -EBADF;
  7307	
  7308		entry = ring_buffer_event_data(event);
  7309		entry->ip = _THIS_IP_;
  7310	
  7311		len = __copy_from_user_inatomic(&entry->buf, ubuf, cnt);
  7312		if (len) {
  7313			memcpy(&entry->buf, FAULTED_STR, FAULTED_SIZE);
  7314			cnt = FAULTED_SIZE;
  7315			written = -EFAULT;
  7316		} else
  7317			written = cnt;
  7318	
  7319		if (tr->trace_marker_file && !list_empty(&tr->trace_marker_file->triggers)) {
  7320			/* do not add \n before testing triggers, but add \0 */
  7321			entry->buf[cnt] = '\0';
  7322			tt = event_triggers_call(tr->trace_marker_file, buffer, entry, event);
  7323		}
  7324	
  7325		if (entry->buf[cnt - 1] != '\n') {
  7326			entry->buf[cnt] = '\n';
  7327			entry->buf[cnt + 1] = '\0';
  7328		} else
  7329			entry->buf[cnt] = '\0';
  7330	
  7331		if (static_branch_unlikely(&trace_marker_exports_enabled))
  7332			ftrace_exports(event, TRACE_EXPORT_MARKER);
  7333		__buffer_unlock_commit(buffer, event);
  7334	
  7335		if (tt)
  7336			event_triggers_post_call(tr->trace_marker_file, tt);
  7337	
  7338		return written;
  7339	}
  7340	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
