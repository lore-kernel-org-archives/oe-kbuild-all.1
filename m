Received: from mgamail.intel.com (unknown [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A8023B8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jul 2023 22:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690581873; x=1722117873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0G3z8/9pVQQQb/0FQFhENu825xJEDHBWCRKRVG/7SxQ=;
  b=biuec5hZ5bjDVE1GrtPnoc5FhsIk/0KeoRTGwO7aNMSVjb4Ub4enz50y
   ecAHMP+M28jmfFhMj6bevEJwcbLuf6tj0mYpsr893zxSyoxJ9So5c9sOd
   einD875YZWnmrpLMcmJOXfCNXyDPDkNu5z+gxEd51+MSWnCZ/A/tVBHll
   YIvWDN4e2CTK2QT9YLfHwGruGzrn3ohQc3ArHXlxk7fKzaISo9Q4ml9vq
   GCiqnBbGOOZvCtVriH9BzfBipOjZ5N1KJgqiAXB6RmqEB503oJ7JqRM6z
   AnmwKReU7bepYebzE+5Y5rF/DSp6e8OL0anRggiHVbsoQCX8SkNoD4TsM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="367575959"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="367575959"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 15:04:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="762720476"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="762720476"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 28 Jul 2023 15:04:31 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPVZW-0003c3-0b;
	Fri, 28 Jul 2023 22:04:30 +0000
Date: Sat, 29 Jul 2023 06:03:51 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 61/98] drivers/tty/tty_buffer.c:325:28: sparse:
 sparse: incompatible types in comparison expression (different type sizes):
Message-ID: <202307290552.htfsP9es-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   2400f7abb9deab7a2207b19d1fad47d9910077a9
commit: 58dea2bfdf65b65a29a79d6227bff708ea95dc7c [61/98] tty: tty_buffer: use min() instead of min_t()
config: nios2-randconfig-r091-20230728 (https://download.01.org/0day-ci/archive/20230729/202307290552.htfsP9es-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307290552.htfsP9es-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307290552.htfsP9es-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/tty/tty_buffer.c:325:28: sparse: sparse: incompatible types in comparison expression (different type sizes):
>> drivers/tty/tty_buffer.c:325:28: sparse:    unsigned int *
>> drivers/tty/tty_buffer.c:325:28: sparse:    unsigned long *
   drivers/tty/tty_buffer.c:363:28: sparse: sparse: incompatible types in comparison expression (different type sizes):
   drivers/tty/tty_buffer.c:363:28: sparse:    unsigned int *
   drivers/tty/tty_buffer.c:363:28: sparse:    unsigned long *

vim +325 drivers/tty/tty_buffer.c

   305	
   306	/**
   307	 * tty_insert_flip_string_fixed_flag - add characters to the tty buffer
   308	 * @port: tty port
   309	 * @chars: characters
   310	 * @flag: flag value for each character
   311	 * @size: size
   312	 *
   313	 * Queue a series of bytes to the tty buffering. All the characters passed are
   314	 * marked with the supplied flag.
   315	 *
   316	 * Returns: the number added.
   317	 */
   318	int tty_insert_flip_string_fixed_flag(struct tty_port *port, const u8 *chars,
   319					      u8 flag, size_t size)
   320	{
   321		int copied = 0;
   322		bool flags = flag != TTY_NORMAL;
   323	
   324		do {
 > 325			int goal = min(size - copied, TTY_BUFFER_PAGE);
   326			int space = __tty_buffer_request_room(port, goal, flags);
   327			struct tty_buffer *tb = port->buf.tail;
   328	
   329			if (unlikely(space == 0))
   330				break;
   331			memcpy(char_buf_ptr(tb, tb->used), chars, space);
   332			if (tb->flags)
   333				memset(flag_buf_ptr(tb, tb->used), flag, space);
   334			tb->used += space;
   335			copied += space;
   336			chars += space;
   337			/* There is a small chance that we need to split the data over
   338			 * several buffers. If this is the case we must loop.
   339			 */
   340		} while (unlikely(size > copied));
   341		return copied;
   342	}
   343	EXPORT_SYMBOL(tty_insert_flip_string_fixed_flag);
   344	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
