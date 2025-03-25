Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1980C18C031
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Mar 2025 03:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742871784; cv=none; b=s7frzBfWRKkrEFPSvOCY4/3i424E4qPQqlkZTcIossb9/qaZ78wJq8x/aoFEc4uBXRHAA/H/MGFG936TepnnNlSC7q3e4w7pvAnk5K3I8C1ZGI8CAuxuFiRGzlCsLO9lZfs9I21jtRQ02I5jza8Mp2nAbVX8g3Ook4lKuSnyhJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742871784; c=relaxed/simple;
	bh=V4LxS8HdetxB/bt/yAmPHiDRiJEGAMBbd7nREJ4IdBw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mrthIhjLyztDrsK/G/DIcG5ckAGsDnndakwq/qE+NmpC3wbCIhAM4q/6jMI5tbWUmWofKu057Bb0A0b87TI8HfRMC1Mc0+vttJFJtMIEuL9BGTvW3jha8mGLxeIapF7wT4jkhsCoSikgyeQYz2sKHpw527slFpH33tr4x52tbNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D1XgCsGI; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D1XgCsGI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742871783; x=1774407783;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V4LxS8HdetxB/bt/yAmPHiDRiJEGAMBbd7nREJ4IdBw=;
  b=D1XgCsGI2fe+hUR2cu4InOYm4O87Y8sIkp6p6dRk+TM6HbzJ4ZF9F07A
   OU5lZIo4HgsCXWSEmJTAJpKbRLywwFgqOMiPDr2ZweC0DRpKGMaqmSKRX
   81XzzyR1iCzp9rGcSemFUrVlgFQcNxE48DMe+4OuWcRN28HIq0bDSZK1m
   RIIYL0HeeP8/+W4t2Egc4K9f5OjjxXX2Mr4F2lZcgyXyQ4PL69vg9ysoX
   gtmDuSTLU614ozL+g2un5cA9bBH849KvGIC6j1BCPXyVA0XwKCx6uafSQ
   YD3dHXP8HxeKyW3omIH/E63Gh0/iYvNji9GPVFhSqHvq1bKaNKqQloya2
   Q==;
X-CSE-ConnectionGUID: FLq3xUy3S6WBC1DYn66Tuw==
X-CSE-MsgGUID: Bw6PELTHQGi2XLtYrILFjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="44207367"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="44207367"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 20:03:02 -0700
X-CSE-ConnectionGUID: uweo8eRaT560Xe1tvCMu5w==
X-CSE-MsgGUID: PJ1moqKGQAi1rGV9qnoQ5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="124409120"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 24 Mar 2025 20:03:00 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twuXo-00046M-1R;
	Tue, 25 Mar 2025 03:02:25 +0000
Date: Tue, 25 Mar 2025 10:57:42 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Schnelle <svens@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Subject: [trace:ftrace/for-next 3/9] kernel/trace/trace_output.c:711:
 undefined reference to `btf_find_func_proto'
Message-ID: <202503251037.oDtw5eL5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace ftrace/for-next
head:   391dda1bd7c56de62b96126214f040fe8965561b
commit: 533c20b062d7c25cbcbadb31e3ecb95a08ddb877 [3/9] ftrace: Add print_function_args()
config: i386-buildonly-randconfig-005-20250325 (https://download.01.org/0day-ci/archive/20250325/202503251037.oDtw5eL5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250325/202503251037.oDtw5eL5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503251037.oDtw5eL5-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/trace/trace_output.o: in function `print_function_args':
>> kernel/trace/trace_output.c:711: undefined reference to `btf_find_func_proto'
>> ld: kernel/trace/trace_output.c:715: undefined reference to `btf_get_func_param'


vim +711 kernel/trace/trace_output.c

   689	
   690	#ifdef CONFIG_FUNCTION_TRACE_ARGS
   691	void print_function_args(struct trace_seq *s, unsigned long *args,
   692				 unsigned long func)
   693	{
   694		const struct btf_param *param;
   695		const struct btf_type *t;
   696		const char *param_name;
   697		char name[KSYM_NAME_LEN];
   698		unsigned long arg;
   699		struct btf *btf;
   700		s32 tid, nr = 0;
   701		int a, p, x;
   702	
   703		trace_seq_printf(s, "(");
   704	
   705		if (!args)
   706			goto out;
   707		if (lookup_symbol_name(func, name))
   708			goto out;
   709	
   710		/* TODO: Pass module name here too */
 > 711		t = btf_find_func_proto(name, &btf);
   712		if (IS_ERR_OR_NULL(t))
   713			goto out;
   714	
 > 715		param = btf_get_func_param(t, &nr);
   716		if (!param)
   717			goto out_put;
   718	
   719		for (a = 0, p = 0; p < nr; a++, p++) {
   720			if (p)
   721				trace_seq_puts(s, ", ");
   722	
   723			/* This only prints what the arch allows (6 args by default) */
   724			if (a == FTRACE_REGS_MAX_ARGS) {
   725				trace_seq_puts(s, "...");
   726				break;
   727			}
   728	
   729			arg = args[a];
   730	
   731			param_name = btf_name_by_offset(btf, param[p].name_off);
   732			if (param_name)
   733				trace_seq_printf(s, "%s=", param_name);
   734			t = btf_type_skip_modifiers(btf, param[p].type, &tid);
   735	
   736			switch (t ? BTF_INFO_KIND(t->info) : BTF_KIND_UNKN) {
   737			case BTF_KIND_UNKN:
   738				trace_seq_putc(s, '?');
   739				/* Still print unknown type values */
   740				fallthrough;
   741			case BTF_KIND_PTR:
   742				trace_seq_printf(s, "0x%lx", arg);
   743				break;
   744			case BTF_KIND_INT:
   745				trace_seq_printf(s, "%ld", arg);
   746				break;
   747			case BTF_KIND_ENUM:
   748				trace_seq_printf(s, "%ld", arg);
   749				break;
   750			default:
   751				/* This does not handle complex arguments */
   752				trace_seq_printf(s, "(%s)[0x%lx", btf_type_str(t), arg);
   753				for (x = sizeof(long); x < t->size; x += sizeof(long)) {
   754					trace_seq_putc(s, ':');
   755					if (++a == FTRACE_REGS_MAX_ARGS) {
   756						trace_seq_puts(s, "...]");
   757						goto out_put;
   758					}
   759					trace_seq_printf(s, "0x%lx", args[a]);
   760				}
   761				trace_seq_putc(s, ']');
   762				break;
   763			}
   764		}
   765	out_put:
   766		btf_put(btf);
   767	out:
   768		trace_seq_printf(s, ")");
   769	}
   770	#endif
   771	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
