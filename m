Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354F71714B4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Oct 2024 10:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729160180; cv=none; b=dvY3CqCTVOR+/g2gaXQDP8YfbUe0RBqlzMrw4EzTtWGRUzgswC3+0vSgrrK+CLLVLr52rrg6I0luAjKCZO8Zu27nrUI62Z9uBDYEq70V4EXbj+oUFEdSDd8CsKTrCEHcFTwikYljGOeb/RNelEJVM9evzLLqZzsJX4RzihvcnSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729160180; c=relaxed/simple;
	bh=Wu0jvkY7uepQDGlnwTBKAH1KlOptttzpuYmv3sUEotE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TbBl6JSiNxmPliYCj8KlBV0jloCVRZh+bhF6STHu7oHR5sSgJGxMFVShXeXpcceO28srObn64rhph6jHf0Mk7QzChWra1LqZ76JQr7U9IrKIcVF4B0CvT6YpG7+4j+VbcOpvTvv2J83FjRJkBR9PpxNk6QtbNQJ/D3AUtUc3dOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MbTokKD4; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MbTokKD4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729160177; x=1760696177;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wu0jvkY7uepQDGlnwTBKAH1KlOptttzpuYmv3sUEotE=;
  b=MbTokKD417hL7RcWyOndNmd7pT5KKGnebIXDLp/Y8jrhuRpyp7qjYIgj
   tZ/sXFhM0REa61h3G94tMkZ5KWXJs6dO1s1seejqK0oAlTJaVwV0xbMil
   OgLXeSDSwMytG0rBqzLuAzQOUq0+KP+Bai1ohNsp1ZYoiIAnSMnjnjL6I
   h+aoYKGC/2hOJLvv20GW4TWDFZTx8U5joVe35kFKgR6TUEn2q0VtlitGk
   CFdXwI24E1ijuwF+49fwCvBNxNMeK+XjrzY4DoHwbp4Tlh+P+mgHIc10m
   OcXNXBElZPSHQrKXHgCDTXCE22QDkeQIahaU63dW+PM06lfv1GS8KJx/p
   A==;
X-CSE-ConnectionGUID: Li8pdH3ZS6CpcnoAULwDeg==
X-CSE-MsgGUID: bk6Qo5wPQN29MOAkF3FMdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11227"; a="28078788"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="28078788"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 03:16:17 -0700
X-CSE-ConnectionGUID: uuV1PmMySW6WIB4VTzYJ6Q==
X-CSE-MsgGUID: 84RL/7PzRGOZEMEwVInmgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="109318621"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 Oct 2024 03:16:15 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1NYD-000MBv-0C;
	Thu, 17 Oct 2024 10:16:13 +0000
Date: Thu, 17 Oct 2024 18:16:02 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/fprobe-on-fgraph 11/16]
 kernel/trace/fprobe.c:268:11: error: call to undeclared function
 'ftrace_regs_get_return_address'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202410171838.r6txy8pW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fprobe-on-fgraph
head:   36aa7422f5b4c5a064a78590cb58482f5bf424c9
commit: 32f999ced5d222fee0e23a34fb9356362d0e1ef7 [11/16] fprobe: Rewrite fprobe on function-graph tracer
config: i386-randconfig-062-20241017 (https://download.01.org/0day-ci/archive/20241017/202410171838.r6txy8pW-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241017/202410171838.r6txy8pW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410171838.r6txy8pW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/fprobe.c:268:11: error: call to undeclared function 'ftrace_regs_get_return_address'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     268 |         ret_ip = ftrace_regs_get_return_address(fregs);
         |                  ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DYNAMIC_FTRACE_WITH_ARGS
   Depends on [n]: FTRACE [=y] && DYNAMIC_FTRACE [=y] && HAVE_DYNAMIC_FTRACE_WITH_ARGS [=n]
   Selected by [y]:
   - FPROBE [=y] && FTRACE [=y] && HAVE_FUNCTION_GRAPH_FREGS [=y] && HAVE_FTRACE_GRAPH_FUNC [=y]


vim +/ftrace_regs_get_return_address +268 kernel/trace/fprobe.c

   216	
   217	static int fprobe_entry(struct ftrace_graph_ent *trace, struct fgraph_ops *gops,
   218				struct ftrace_regs *fregs)
   219	{
   220		struct fprobe_hlist_node *node, *first;
   221		unsigned long *fgraph_data = NULL;
   222		unsigned long func = trace->func;
   223		unsigned long header, ret_ip;
   224		int reserved_words;
   225		struct fprobe *fp;
   226		int used, ret;
   227	
   228		if (WARN_ON_ONCE(!fregs))
   229			return 0;
   230	
   231		first = node = find_first_fprobe_node(func);
   232		if (unlikely(!first))
   233			return 0;
   234	
   235		reserved_words = 0;
   236		hlist_for_each_entry_from_rcu(node, hlist) {
   237			if (node->addr != func)
   238				break;
   239			fp = READ_ONCE(node->fp);
   240			if (!fp || !fp->exit_handler)
   241				continue;
   242			/*
   243			 * Since fprobe can be enabled until the next loop, we ignore the
   244			 * fprobe's disabled flag in this loop.
   245			 */
   246			reserved_words +=
   247				SIZE_IN_LONG(fp->entry_data_size) + 1;
   248		}
   249		node = first;
   250		if (reserved_words) {
   251			fgraph_data = fgraph_reserve_data(gops->idx, reserved_words * sizeof(long));
   252			if (unlikely(!fgraph_data)) {
   253				hlist_for_each_entry_from_rcu(node, hlist) {
   254					if (node->addr != func)
   255						break;
   256					fp = READ_ONCE(node->fp);
   257					if (fp && !fprobe_disabled(fp))
   258						fp->nmissed++;
   259				}
   260				return 0;
   261			}
   262		}
   263	
   264		/*
   265		 * TODO: recursion detection has been done in the fgraph. Thus we need
   266		 * to add a callback to increment missed counter.
   267		 */
 > 268		ret_ip = ftrace_regs_get_return_address(fregs);
   269		used = 0;
   270		hlist_for_each_entry_from_rcu(node, hlist) {
   271			void *data;
   272	
   273			if (node->addr != func)
   274				break;
   275			fp = READ_ONCE(node->fp);
   276			if (!fp || fprobe_disabled(fp))
   277				continue;
   278	
   279			if (fp->entry_data_size && fp->exit_handler)
   280				data = fgraph_data + used + 1;
   281			else
   282				data = NULL;
   283	
   284			if (fprobe_shared_with_kprobes(fp))
   285				ret = __fprobe_kprobe_handler(func, ret_ip, fp, fregs, data);
   286			else
   287				ret = __fprobe_handler(func, ret_ip, fp, fregs, data);
   288			/* If entry_handler returns !0, nmissed is not counted but skips exit_handler. */
   289			if (!ret && fp->exit_handler) {
   290				int size_words = SIZE_IN_LONG(fp->entry_data_size);
   291	
   292				header = encode_fprobe_header(fp, size_words);
   293				if (likely(header)) {
   294					fgraph_data[used] = header;
   295					used += size_words + 1;
   296				}
   297			}
   298		}
   299		if (used < reserved_words)
   300			memset(fgraph_data + used, 0, reserved_words - used);
   301	
   302		/* If any exit_handler is set, data must be used. */
   303		return used != 0;
   304	}
   305	NOKPROBE_SYMBOL(fprobe_entry);
   306	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
