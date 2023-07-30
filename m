Received: from mgamail.intel.com (unknown [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595231FA4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Jul 2023 23:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690759908; x=1722295908;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lqqCWrmLjW0caVgUzWGqLFgfLfnudwkVILFx4puIRgs=;
  b=JRneyBnZ/nt2j0Cafe1qtZzQpejvXihBI5KTF5HW+S0+/MKSO/Z6yT+5
   SuSoG5aSWxQS54Omt1XXNcJqy8ujR0p9dMmh0swslaN6rWceRUcUywjd5
   LaVVn23Y8661D16skmRsJYSchsdurTrZPCYj+uCTXl0ogY+KHJ4y4jRmC
   62K1EzmFlbHxiASdoYrJlciV16mdbzpfFt6AXHMjKr+s/6J7rIMrupb1l
   IiRaCyZS54+nwAXGlDSMQzGZ+tMJcEIoHnbQCod4VVK7yN4D+x3Q+rB/9
   3fHARAWFrXtLaxWFDAHFjIIilUTG8dQkMU2GgBovajeo67EkaAqsh/rDC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="432693626"
X-IronPort-AV: E=Sophos;i="6.01,243,1684825200"; 
   d="scan'208";a="432693626"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2023 16:31:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="871434935"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 30 Jul 2023 16:31:48 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQFt3-0004pB-2y;
	Sun, 30 Jul 2023 23:31:45 +0000
Date: Mon, 31 Jul 2023 07:30:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:uprobe_get_func_ip_1 1/3]
 kernel/trace/bpf_trace.c:1064:54: error: 'struct task_struct' has no member
 named 'utask'
Message-ID: <202307310711.Xvatx7AA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git uprobe_get_func_ip_1
head:   0f00edcf26c98bcfeb900601b3cf1a933c6e07ef
commit: e0de0f496891911209ee30374b41c48c7e186e33 [1/3] bpf: Add support for bpf_get_func_ip helper for uprobes
config: i386-randconfig-i061-20230730 (https://download.01.org/0day-ci/archive/20230731/202307310711.Xvatx7AA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230731/202307310711.Xvatx7AA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307310711.Xvatx7AA-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/trace/bpf_trace.c: In function 'bpf_get_func_ip_uprobe':
>> kernel/trace/bpf_trace.c:1064:54: error: 'struct task_struct' has no member named 'utask'
    1064 |         udd = (struct uprobe_dispatch_data *) current->utask->vaddr;
         |                                                      ^~


vim +1064 kernel/trace/bpf_trace.c

  1059	
  1060	static unsigned long bpf_get_func_ip_uprobe(struct pt_regs *regs)
  1061	{
  1062		struct uprobe_dispatch_data *udd;
  1063	
> 1064		udd = (struct uprobe_dispatch_data *) current->utask->vaddr;
  1065		return udd->bp_addr;
  1066	}
  1067	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
