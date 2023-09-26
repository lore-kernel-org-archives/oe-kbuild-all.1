Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F5E47C8D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Sep 2023 23:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695772187; x=1727308187;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AOaaMEWW9BGs1nrK9oMWG0YqDTJZrtL2NHQfieN11Ho=;
  b=P27kP3kYR65jrUnyaYZGd6YfJOIBj0Xtlm3D7pZNjf3VujLH6oyi7ZEa
   K88jfl4L574/IVAVKEUjoQ6qAfifXid7paEhWVoMuN267vB3uMhFIp0al
   x8Z/Pk1TmFgoCOZ6Nkb3xO8ZCRalFmd7Z0sCqiLzWuCB2LscK1pZYtr+A
   B87gzf3mZIHml965sikacg/9L7QccZ+rE4OOPkjk6A/mAAFX68zxpao5t
   FPmVzIqYXF0ZW6zCX3eWqqhlAKTpM8h/jMzXBhzt6l2JSHkN3gHpZmpVp
   psV/ie0DyaGKx8lcfT17n5eoiVr0gkgIQo3XT3n1vsXgMEUQtXBdr6Enk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="445821924"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="445821924"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 16:49:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="784132102"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="784132102"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 26 Sep 2023 16:49:46 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlHoG-0003Tq-01;
	Tue, 26 Sep 2023 23:49:44 +0000
Date: Wed, 27 Sep 2023 07:49:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/btfid_fix 2/2] {standard input}:26: Error: cannot
 represent `BFD_RELOC_64' relocation in object file
Message-ID: <202309270758.rR1t7IiP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/btfid_fix
head:   b63eff1cec67e54813e52c6ca6975a815cfe9f0e
commit: b63eff1cec67e54813e52c6ca6975a815cfe9f0e [2/2] bpf: Add btf_ids support for new sections
config: csky-randconfig-002-20230927 (https://download.01.org/0day-ci/archive/20230927/202309270758.rR1t7IiP-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230927/202309270758.rR1t7IiP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309270758.rR1t7IiP-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:26: Error: cannot represent `BFD_RELOC_64' relocation in object file
   {standard input}:27: Error: cannot represent `BFD_RELOC_64' relocation in object file
   {standard input}:28: Error: cannot represent `BFD_RELOC_64' relocation in object file
--
   kernel/bpf/btf.c: In function 'btf_seq_show':
   kernel/bpf/btf.c:7094:29: warning: function 'btf_seq_show' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    7094 |         seq_vprintf((struct seq_file *)show->target, fmt, args);
         |                             ^~~~~~~~
   kernel/bpf/btf.c: In function 'btf_snprintf_show':
   kernel/bpf/btf.c:7131:9: warning: function 'btf_snprintf_show' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    7131 |         len = vsnprintf(show->target, ssnprintf->len_left, fmt, args);
         |         ^~~
   {standard input}: Assembler messages:
   {standard input}:24: Error: cannot represent `BFD_RELOC_64' relocation in object file
   {standard input}:25: Error: cannot represent `BFD_RELOC_64' relocation in object file
>> {standard input}:26: Error: cannot represent `BFD_RELOC_64' relocation in object file
   {standard input}:45: Error: cannot represent `BFD_RELOC_64' relocation in object file
   {standard input}:46: Error: cannot represent `BFD_RELOC_64' relocation in object file
   {standard input}:47: Error: cannot represent `BFD_RELOC_64' relocation in object file
   {standard input}:61: Error: cannot represent `BFD_RELOC_64' relocation in object file
   {standard input}:62: Error: cannot represent `BFD_RELOC_64' relocation in object file
   {standard input}:63: Error: cannot represent `BFD_RELOC_64' relocation in object file
   {standard input}:77: Error: cannot represent `BFD_RELOC_64' relocation in object file
   {standard input}:78: Error: cannot represent `BFD_RELOC_64' relocation in object file
   {standard input}:79: Error: cannot represent `BFD_RELOC_64' relocation in object file

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
