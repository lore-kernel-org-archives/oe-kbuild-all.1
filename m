Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92101BD9C8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Apr 2025 21:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744664879; cv=none; b=uXccYgCXG2lP2ndUapUZeIFaeQ7xaUvuUSJbNABFauuNGRwcYAG6lhcqlo4CxZrObtGNvvcYCCuFmB8I5pHN/yXb4KMNbn1Rygq7+r+TMDE8TLNxUbNqoglGqJ1FK+v04rfRp7c/Iy4tRTSfsoBFMPBPPLgpOzQl+GR4k4aqSoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744664879; c=relaxed/simple;
	bh=4N0c4brUCd24Hnw/Tno2NPoje5W+yRCcjOuXY7eKYhk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N/7uml1/QmF5kQdJtSsDNTJd+qrFyMFGoHpDBfAD1l4r/9WBSOYXlG4z6wpQnKXfpEjSJBIEKg0F6s7oAU9RrPxc1JCK2Pfc5uJr2uU2H/MWfiB9MVOJzriv4uiFyKZZkJDmoC4vzqbsa23ySMPgKA/yzrW5uIyAbCZtDcRQWAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lnv5ePCG; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lnv5ePCG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744664877; x=1776200877;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4N0c4brUCd24Hnw/Tno2NPoje5W+yRCcjOuXY7eKYhk=;
  b=Lnv5ePCG+A+DtgDZ9wqDtLKbNGbOXACd9KgnHxNxtaGIYPbmf1V6DpUx
   fl68Q67fRzpTE5VuunUN06SjTPDV8D7EqTrixsJlp+0xPu+rBrBdTSedB
   7cxvAZ7IwVXNkYW2dosx30JvlKu+pEAGRihJiOgAUcZhsMUf12qaYUTiN
   h+wcbSDzfahcm3Zvxkl5cZ+IUrHXJ1puxP2hJogLVk8/Ly3onT9zke5Kq
   DyyPN9DEYSw5g1CNTXKRHWbB3d4uqt+0WcND21tJINGJ5f0K2AmvmEKKT
   HLN/LoW9eQDM7YnAFCmy2YxIhPoOMmpfWqaPUxNA4PJzh17xfsJWY23t7
   A==;
X-CSE-ConnectionGUID: 3uYxLeASTsOW10RTEA6V4w==
X-CSE-MsgGUID: JnW8iTkVQ3ql7cGD6wEgcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="46282537"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="46282537"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 14:07:56 -0700
X-CSE-ConnectionGUID: wCZiECPPQBSuuKK/DmQe4w==
X-CSE-MsgGUID: mSZPlxAOSACcL039Gqk+6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="135095410"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Apr 2025 14:07:54 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4R20-000Eh0-1F;
	Mon, 14 Apr 2025 21:07:52 +0000
Date: Tue, 15 Apr 2025 05:07:09 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:stream 8/13] kernel/bpf/stream.c:552:39: warning: cast to
 pointer from integer of different size
Message-ID: <202504150517.OoQIPhC4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kkdwivedi/linux stream
head:   a1aa685f70a017d3492be37e89d45d5633fc0203
commit: 01f5456c371ce424598fa6b7e3ac339aa336612c [8/13] bpf: Add dump_stack() analogue to print to BPF stderr
config: arc-randconfig-001-20250415 (https://download.01.org/0day-ci/archive/20250415/202504150517.OoQIPhC4-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250415/202504150517.OoQIPhC4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504150517.OoQIPhC4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/stream.c: In function 'bpf_stream_vprintk':
   kernel/bpf/stream.c:301:9: warning: function 'bpf_stream_vprintk' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     301 |         ret = bstr_printf(data.buf, MAX_BPRINTF_BUF, fmt__str, data.bin_args);
         |         ^~~
   In file included from include/uapi/linux/filter.h:9,
                    from include/linux/bpf.h:8,
                    from kernel/bpf/stream.c:4:
   kernel/bpf/stream.c: In function 'dump_stack_bpf_linfo':
>> kernel/bpf/stream.c:552:39: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     552 |                 if (jited_linfo[i] >= (void *)ip)
         |                                       ^
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   kernel/bpf/stream.c:552:17: note: in expansion of macro 'if'
     552 |                 if (jited_linfo[i] >= (void *)ip)
         |                 ^~
>> kernel/bpf/stream.c:552:39: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     552 |                 if (jited_linfo[i] >= (void *)ip)
         |                                       ^
   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   kernel/bpf/stream.c:552:17: note: in expansion of macro 'if'
     552 |                 if (jited_linfo[i] >= (void *)ip)
         |                 ^~
>> kernel/bpf/stream.c:552:39: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     552 |                 if (jited_linfo[i] >= (void *)ip)
         |                                       ^
   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   kernel/bpf/stream.c:552:17: note: in expansion of macro 'if'
     552 |                 if (jited_linfo[i] >= (void *)ip)
         |                 ^~
   kernel/bpf/stream.c: In function 'dump_stack_cb':
   kernel/bpf/stream.c:577:71: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     577 |                 bpf_prog_stderr_printk(ctxp->prog, " %pS: [%s:%d]\n", (void *)ip, file, num);
         |                                                                       ^
   kernel/bpf/stream.c:581:54: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     581 |         bpf_prog_stderr_printk(ctxp->prog, " %pS\n", (void *)ip);
         |                                                      ^


vim +552 kernel/bpf/stream.c

   528	
   529	static int dump_stack_bpf_linfo(u64 ip, const char **filep)
   530	{
   531		struct bpf_prog *prog = bpf_prog_ksym_find(ip);
   532		int idx = -1, insn_start, insn_end, len;
   533		struct bpf_line_info *linfo;
   534		void **jited_linfo;
   535		struct btf *btf;
   536	
   537		btf = prog->aux->btf;
   538		linfo = prog->aux->linfo;
   539		jited_linfo = prog->aux->jited_linfo;
   540	
   541		if (!btf || !linfo || !prog->aux->jited_linfo)
   542			return -1;
   543		len = prog->aux->func ? prog->aux->func[prog->aux->func_idx]->len : prog->len;
   544	
   545		linfo = &prog->aux->linfo[prog->aux->linfo_idx];
   546		jited_linfo = &prog->aux->jited_linfo[prog->aux->linfo_idx];
   547	
   548		insn_start = linfo[0].insn_off;
   549		insn_end = insn_start + len;
   550	
   551		for (int i = 0; linfo[i].insn_off >= insn_start && linfo[i].insn_off < insn_end; i++) {
 > 552			if (jited_linfo[i] >= (void *)ip)
   553				break;
   554			idx = i;
   555		}
   556	
   557		if (idx == -1)
   558			return -1;
   559	
   560		*filep = btf_name_by_offset(btf, linfo[idx].file_name_off);
   561		*filep = strrchr(*filep, '/') ?: *filep;
   562		*filep += 1;
   563	
   564		return BPF_LINE_INFO_LINE_NUM(linfo[idx].line_col);
   565	}
   566	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
