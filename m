Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3F038D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Nov 2023 04:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LusMLcQc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700887713; x=1732423713;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4sqd5LvE3kR5OGhngd4IEtKzTZVLSznz5Qd7Etq5Uuo=;
  b=LusMLcQcYdDO8rwJOcym5wUzF4DlWih3HqrPpQr87kmjUBs87T9rmVC5
   Tgj6JWWHOn+ZgliVnAiGkxh+H03t5m/0wp60FxrWIiqYtS35X9WMrOKQa
   ljHTuytGeFVq3uG++Jck/7K9ChBU6WTPpfx9pHnGHj/Ic4f4G9npxCd8i
   euMVz18jQIiQlbL/Cx74XFeTtgHk0KdbE+ghWWwZMo8kdVnEiKRo144F3
   nhD+TxJ+Sopjbkyiny3GuAS+MSAHQZyrLO44qiEdv5NsUh4W/LjAXnAye
   AnERSfM2DcRG99lW2gRchqPYFJBFJMNkdaTJudNojc/vQhuATwnaopFpC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="389642185"
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="389642185"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 20:48:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="796735942"
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="796735942"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 24 Nov 2023 20:48:25 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6kac-0003dm-2e;
	Sat, 25 Nov 2023 04:48:22 +0000
Date: Sat, 25 Nov 2023 12:48:07 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:dlink-dwl-8610ap 1/3] kernel/printk/printk.c:2250
 vprintk_store() warn: inconsistent indenting
Message-ID: <202311251030.PYmtml7P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git dlink-dwl-8610ap
head:   7b9d31bec8621d72e1edc0070efcd40af09eb121
commit: 9bcc75fa43a2b2e5fe5208d32e0e60657e8f8734 [1/3] Uglyhack for earlydebug printascii
config: arm-randconfig-r081-20231123 (https://download.01.org/0day-ci/archive/20231125/202311251030.PYmtml7P-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231125/202311251030.PYmtml7P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311251030.PYmtml7P-lkp@intel.com/

smatch warnings:
kernel/printk/printk.c:2250 vprintk_store() warn: inconsistent indenting

vim +2250 kernel/printk/printk.c

  2147	
  2148	__printf(4, 0)
  2149	int vprintk_store(int facility, int level,
  2150			  const struct dev_printk_info *dev_info,
  2151			  const char *fmt, va_list args)
  2152	{
  2153		struct prb_reserved_entry e;
  2154		enum printk_info_flags flags = 0;
  2155		struct printk_record r;
  2156		unsigned long irqflags;
  2157		u16 trunc_msg_len = 0;
  2158		char prefix_buf[8];
  2159		u8 *recursion_ptr;
  2160		u16 reserve_size;
  2161		va_list args2;
  2162		u32 caller_id;
  2163		u16 text_len;
  2164		int ret = 0;
  2165		u64 ts_nsec;
  2166	
  2167		if (!printk_enter_irqsave(recursion_ptr, irqflags))
  2168			return 0;
  2169	
  2170		/*
  2171		 * Since the duration of printk() can vary depending on the message
  2172		 * and state of the ringbuffer, grab the timestamp now so that it is
  2173		 * close to the call of printk(). This provides a more deterministic
  2174		 * timestamp with respect to the caller.
  2175		 */
  2176		ts_nsec = local_clock();
  2177	
  2178		caller_id = printk_caller_id();
  2179	
  2180		/*
  2181		 * The sprintf needs to come first since the syslog prefix might be
  2182		 * passed in as a parameter. An extra byte must be reserved so that
  2183		 * later the vscnprintf() into the reserved buffer has room for the
  2184		 * terminating '\0', which is not counted by vsnprintf().
  2185		 */
  2186		va_copy(args2, args);
  2187		reserve_size = vsnprintf(&prefix_buf[0], sizeof(prefix_buf), fmt, args2) + 1;
  2188		va_end(args2);
  2189	
  2190		if (reserve_size > PRINTKRB_RECORD_MAX)
  2191			reserve_size = PRINTKRB_RECORD_MAX;
  2192	
  2193		/* Extract log level or control flags. */
  2194		if (facility == 0)
  2195			printk_parse_prefix(&prefix_buf[0], &level, &flags);
  2196	
  2197		if (level == LOGLEVEL_DEFAULT)
  2198			level = default_message_loglevel;
  2199	
  2200		if (dev_info)
  2201			flags |= LOG_NEWLINE;
  2202	
  2203		if (flags & LOG_CONT) {
  2204			prb_rec_init_wr(&r, reserve_size);
  2205			if (prb_reserve_in_last(&e, prb, &r, caller_id, PRINTKRB_RECORD_MAX)) {
  2206				text_len = printk_sprint(&r.text_buf[r.info->text_len], reserve_size,
  2207							 facility, &flags, fmt, args);
  2208				r.info->text_len += text_len;
  2209	
  2210				if (flags & LOG_NEWLINE) {
  2211					r.info->flags |= LOG_NEWLINE;
  2212					prb_final_commit(&e);
  2213				} else {
  2214					prb_commit(&e);
  2215				}
  2216	
  2217				ret = text_len;
  2218				goto out;
  2219			}
  2220		}
  2221	
  2222		/*
  2223		 * Explicitly initialize the record before every prb_reserve() call.
  2224		 * prb_reserve_in_last() and prb_reserve() purposely invalidate the
  2225		 * structure when they fail.
  2226		 */
  2227		prb_rec_init_wr(&r, reserve_size);
  2228		if (!prb_reserve(&e, prb, &r)) {
  2229			/* truncate the message if it is too long for empty buffer */
  2230			truncate_msg(&reserve_size, &trunc_msg_len);
  2231	
  2232			prb_rec_init_wr(&r, reserve_size + trunc_msg_len);
  2233			if (!prb_reserve(&e, prb, &r))
  2234				goto out;
  2235		}
  2236	
  2237		/* fill message */
  2238		text_len = printk_sprint(&r.text_buf[0], reserve_size, facility, &flags, fmt, args);
  2239		if (trunc_msg_len)
  2240			memcpy(&r.text_buf[text_len], trunc_msg, trunc_msg_len);
  2241		r.info->text_len = text_len + trunc_msg_len;
  2242		r.info->facility = facility;
  2243		r.info->level = level & 7;
  2244		r.info->flags = flags & 0x1f;
  2245		r.info->ts_nsec = ts_nsec;
  2246		r.info->caller_id = caller_id;
  2247		if (dev_info)
  2248			memcpy(&r.info->dev_info, dev_info, sizeof(r.info->dev_info));
  2249	#if defined(CONFIG_ARM) && defined(CONFIG_DEBUG_LL)
> 2250				{
  2251					static char foo[1024];
  2252					extern void printascii(char *);
  2253					int len;
  2254	
  2255					len = text_len + trunc_msg_len;
  2256					memcpy(foo, &r.text_buf[0], len);
  2257					foo[len] = '\n';
  2258					foo[len+1] = '\0';
  2259					printascii(foo);
  2260				}
  2261	#endif
  2262	
  2263		/* A message without a trailing newline can be continued. */
  2264		if (!(flags & LOG_NEWLINE))
  2265			prb_commit(&e);
  2266		else
  2267			prb_final_commit(&e);
  2268	
  2269		ret = text_len + trunc_msg_len;
  2270	out:
  2271		printk_exit_irqrestore(recursion_ptr, irqflags);
  2272		return ret;
  2273	}
  2274	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
