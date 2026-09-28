Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F1C3264C7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Sep 2026 20:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790626912; cv=none; b=UdaCj6wh1B9wlzNBQm02GBUgkRn38RB7PexW+RTsDXbiHNWEASADbl2ktHP6U2juTlMKQ1FKqRGQcq4KYLiiXliIhuJ6gl4SHtpsY83ZslbIK0oSWY3asTQTz/i7L4IggpmaTZjmqoodEhnH92DNnx/4wCFrK9+0eSDHwWbzHqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790626912; c=relaxed/simple;
	bh=eNH6kQ4ThB6d3cV/rPI7WaEplLrJYbFLzNQ7c80B7jk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UEbW0OJIr1kUl/XSoWzboyrYUMYymZYTcu64ipLU7+zVQOVFFd23LZHs/E99kpClcnqETodaNnIKaz7iXWnIEBs+24Ji5pExEUas9mbZs6G4Z2TOZnD752mXEFopY4+BRrkLIyJv9tVw7y3o7Qv3CagSQvrmHTrfZ+r7MXIdQzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PVnQyq9S; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PVnQyq9S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790626910; x=1822162910;
  h=date:from:to:cc:subject:message-id;
  bh=eNH6kQ4ThB6d3cV/rPI7WaEplLrJYbFLzNQ7c80B7jk=;
  b=PVnQyq9Soy95sP5mWB0zP/htggH2mGk5W15gdbHf/6ym7oe5U78vsFWq
   tAJBILPewdaIC23r80zu201h4qhf46+pobjilEKhiZQX6kBe6msdU+hWp
   rzk1MDB4TRILUCCPV7ezsUtWM8RMrzW2TMaxbUDm+l6tr+qbb5H7vBF5j
   WRWzt8+KUOZCUP+gLSuMAtf7WKcyg1y2MEimEr2fI0wE6dN+sOSBWBO/5
   NiCa/wNj6paJMhqwJuwHaSDIUytmOlwjAmQZuIs93xy7ZQVRG5sIHEg1Y
   rG/bFPY5HZ0aiZwuMY16KZhVvJsk+sXZNEuUQ775ao9aub1uUCmoTJGyO
   g==;
X-CSE-ConnectionGUID: lbiNjfEbQAWh0R34EtmlfA==
X-CSE-MsgGUID: V1VsFKJHT5K6MERagyiYLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="102709433"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="102709433"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 13:21:49 -0700
X-CSE-ConnectionGUID: 40ASyAgRQcaB5Roz2JVa2w==
X-CSE-MsgGUID: ufeKwu5MSvGnTMHZx7/Lcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="279872836"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Sep 2026 13:21:48 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBHr7-00000000OTL-3WM6;
	Mon, 28 Sep 2026 20:21:45 +0000
Date: Tue, 29 Sep 2026 04:21:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:typed-arena 8/17] kernel/bpf/log.c:435:59:
 warning: '%s' directive output may be truncated writing up to 12 bytes into a
 region of size between 3 and 64
Message-ID: <202609290429.usknjcji-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux typed-arena
head:   f6fd10fe616e1927b9c398a528edc49c6593c06a
commit: 51aabdea74c4d256db3227960617f361a660436f [8/17] bpf: Trust typed pointer fields of typed arena objects
config: csky-randconfig-1000-20260928 (https://download.01.org/0day-ci/archive/20260929/202609290429.usknjcji-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260929/202609290429.usknjcji-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609290429.usknjcji-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/log.c: In function 'reg_type_str':
>> kernel/bpf/log.c:435:59: warning: '%s' directive output may be truncated writing up to 12 bytes into a region of size between 3 and 64 [-Wformat-truncation=]
     435 |         snprintf(prefix, sizeof(prefix), "%s%s%s%s%s%s%s%s%s",
         |                                                           ^~
   kernel/bpf/log.c:435:9: note: 'snprintf' output between 1 and 74 bytes into a destination of size 64
     435 |         snprintf(prefix, sizeof(prefix), "%s%s%s%s%s%s%s%s%s",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     436 |                  type & MEM_RDONLY ? "rdonly_" : "",
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     437 |                  type & MEM_RINGBUF ? "ringbuf_" : "",
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     438 |                  type & MEM_USER ? "user_" : "",
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     439 |                  type & MEM_PERCPU ? "percpu_" : "",
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     440 |                  type & MEM_RCU ? "rcu_" : "",
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     441 |                  type & PTR_UNTRUSTED ? "untrusted_" : "",
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     442 |                  type & PTR_TRUSTED ? "trusted_" : "",
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     443 |                  type & PTR_UNSANITIZED ? "unsanitized_" : "",
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     444 |                  type & MEM_ARENA ? "typed_arena_" : ""
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     445 |         );
         |         ~


vim +435 kernel/bpf/log.c

   393	
   394	/* string representation of 'enum bpf_reg_type'
   395	 *
   396	 * Note that reg_type_str() can not appear more than once in a single verbose()
   397	 * statement.
   398	 */
   399	const char *reg_type_str(struct bpf_verifier_env *env, enum bpf_reg_type type)
   400	{
   401		char postfix[16] = {0}, prefix[64] = {0};
   402		static const char * const str[] = {
   403			[NOT_INIT]		= "?",
   404			[SCALAR_VALUE]		= "scalar",
   405			[PTR_TO_CTX]		= "ctx",
   406			[CONST_PTR_TO_MAP]	= "map_ptr",
   407			[PTR_TO_MAP_VALUE]	= "map_value",
   408			[PTR_TO_STACK]		= "fp",
   409			[PTR_TO_PACKET]		= "pkt",
   410			[PTR_TO_PACKET_META]	= "pkt_meta",
   411			[PTR_TO_PACKET_END]	= "pkt_end",
   412			[PTR_TO_FLOW_KEYS]	= "flow_keys",
   413			[PTR_TO_SOCKET]		= "sock",
   414			[PTR_TO_SOCK_COMMON]	= "sock_common",
   415			[PTR_TO_TCP_SOCK]	= "tcp_sock",
   416			[PTR_TO_TP_BUFFER]	= "tp_buffer",
   417			[PTR_TO_XDP_SOCK]	= "xdp_sock",
   418			[PTR_TO_BTF_ID]		= "ptr_",
   419			[PTR_TO_MEM]		= "mem",
   420			[PTR_TO_ARENA]		= "arena",
   421			[PTR_TO_BUF]		= "buf",
   422			[PTR_TO_FUNC]		= "func",
   423			[PTR_TO_INSN]		= "insn",
   424			[PTR_TO_MAP_KEY]	= "map_key",
   425			[CONST_PTR_TO_DYNPTR]	= "dynptr_ptr",
   426		};
   427	
   428		if (type & PTR_MAYBE_NULL) {
   429			if (base_type(type) == PTR_TO_BTF_ID)
   430				strscpy(postfix, "or_null_");
   431			else
   432				strscpy(postfix, "_or_null");
   433		}
   434	
 > 435		snprintf(prefix, sizeof(prefix), "%s%s%s%s%s%s%s%s%s",
   436			 type & MEM_RDONLY ? "rdonly_" : "",
   437			 type & MEM_RINGBUF ? "ringbuf_" : "",
   438			 type & MEM_USER ? "user_" : "",
   439			 type & MEM_PERCPU ? "percpu_" : "",
   440			 type & MEM_RCU ? "rcu_" : "",
   441			 type & PTR_UNTRUSTED ? "untrusted_" : "",
   442			 type & PTR_TRUSTED ? "trusted_" : "",
   443			 type & PTR_UNSANITIZED ? "unsanitized_" : "",
   444			 type & MEM_ARENA ? "typed_arena_" : ""
   445		);
   446	
   447		snprintf(env->tmp_str_buf, TMP_STR_BUF_LEN, "%s%s%s",
   448			 prefix, str[base_type(type)], postfix);
   449		return env->tmp_str_buf;
   450	}
   451	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
