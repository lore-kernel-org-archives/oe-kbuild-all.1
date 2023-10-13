Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCDF13AFF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 11:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GjoD5mqw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697197474; x=1728733474;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TMxr39sBzo3e1rFHRUHGOL5A9L9BWHyms+R3TsIqFVM=;
  b=GjoD5mqwVRydq2OAGd9fyhHyceroy21TwxGZXvff5o3EjnGHMGUKAKMv
   WGEkfm7ExuUdjcIc2WLThlzUzyaYhXczHNPQZvXQi89i4FdY7XnzAiEmL
   IqoY+iOSUHT+o7kVB928LeLFmNaYAoBEuC+13psPB+oBsBbkZ5yzalXjl
   wQ07pvzLvGIokBoEDusTC5f+YfWJerxZ02JvtvTqtpUpgU571QZne55vH
   aRlpDY/1+/Nlxxs7HJhrJpupJ/xvx7Pg5KzkYTMqXfYsTLvkbFAgUp17w
   fj0CxijUwmcn2CS1JQR1aanJmXJDP7OcBCk40JBYYc06Lo2H9YyQMqdXm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="382393007"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="382393007"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 04:44:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="1001920121"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="1001920121"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 13 Oct 2023 04:44:30 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrGai-0004h3-0h;
	Fri, 13 Oct 2023 11:44:28 +0000
Date: Fri, 13 Oct 2023 19:43:51 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] [RFC] wireless: move obsolete drivers to staging
Message-ID: <202310131911.UQDVVSaR-lkp@intel.com>
References: <20231010155444.858483-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231010155444.858483-1-arnd@kernel.org>

Hi Arnd,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on wireless-next/main]
[also build test WARNING on wireless/main linus/master v6.6-rc5 next-20231013]
[cannot apply to staging/staging-testing staging/staging-next staging/staging-linus]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arnd-Bergmann/wireless-move-obsolete-drivers-to-staging/20231011-000008
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20231010155444.858483-1-arnd%40kernel.org
patch subject: [PATCH] [RFC] wireless: move obsolete drivers to staging
config: powerpc-randconfig-002-20231013 (https://download.01.org/0day-ci/archive/20231013/202310131911.UQDVVSaR-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310131911.UQDVVSaR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310131911.UQDVVSaR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/wireless/hostap/hostap_proc.c:350:36: warning: 'prism2_scan_results_proc_seqops' defined but not used [-Wunused-const-variable=]
     350 | static const struct seq_operations prism2_scan_results_proc_seqops = {
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/wireless/hostap/hostap_proc.c:172:36: warning: 'prism2_bss_list_proc_seqops' defined but not used [-Wunused-const-variable=]
     172 | static const struct seq_operations prism2_bss_list_proc_seqops = {
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/wireless/hostap/hostap_proc.c:117:36: warning: 'prism2_wds_proc_seqops' defined but not used [-Wunused-const-variable=]
     117 | static const struct seq_operations prism2_wds_proc_seqops = {
         |                                    ^~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/staging/wireless/hostap/hostap_ap.c:574:36: warning: 'prism2_ap_proc_seqops' defined but not used [-Wunused-const-variable=]
     574 | static const struct seq_operations prism2_ap_proc_seqops = {
         |                                    ^~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/wireless/hostap/hostap_ap.c:372:36: warning: 'ap_control_proc_seqops' defined but not used [-Wunused-const-variable=]
     372 | static const struct seq_operations ap_control_proc_seqops = {
         |                                    ^~~~~~~~~~~~~~~~~~~~~~


vim +/prism2_scan_results_proc_seqops +350 drivers/staging/wireless/hostap/hostap_proc.c

ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  171  
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10 @172  static const struct seq_operations prism2_bss_list_proc_seqops = {
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  173  	.start	= prism2_bss_list_proc_start,
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  174  	.next	= prism2_bss_list_proc_next,
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  175  	.stop	= prism2_bss_list_proc_stop,
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  176  	.show	= prism2_bss_list_proc_show,
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  177  };
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  178  
6ade689711eeed drivers/net/wireless/intersil/hostap/hostap_proc.c YueHaibing       2018-07-13  179  #ifdef CONFIG_PROC_FS
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  180  static int prism2_crypt_proc_show(struct seq_file *m, void *v)
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  181  {
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  182  	local_info_t *local = m->private;
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  183  	int i;
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  184  
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  185  	seq_printf(m, "tx_keyidx=%d\n", local->crypt_info.tx_keyidx);
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  186  	for (i = 0; i < WEP_KEYS; i++) {
274bfb8dc5ffa1 drivers/net/wireless/hostap/hostap_proc.c          John W. Linville 2008-10-29  187  		if (local->crypt_info.crypt[i] &&
274bfb8dc5ffa1 drivers/net/wireless/hostap/hostap_proc.c          John W. Linville 2008-10-29  188  		    local->crypt_info.crypt[i]->ops &&
274bfb8dc5ffa1 drivers/net/wireless/hostap/hostap_proc.c          John W. Linville 2008-10-29  189  		    local->crypt_info.crypt[i]->ops->print_stats) {
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  190  			local->crypt_info.crypt[i]->ops->print_stats(
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  191  				m, local->crypt_info.crypt[i]->priv);
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  192  		}
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  193  	}
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  194  	return 0;
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  195  }
6ade689711eeed drivers/net/wireless/intersil/hostap/hostap_proc.c YueHaibing       2018-07-13  196  #endif
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  197  
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  198  static ssize_t prism2_pda_proc_read(struct file *file, char __user *buf,
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  199  				    size_t count, loff_t *_pos)
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  200  {
359745d78351c6 drivers/net/wireless/intersil/hostap/hostap_proc.c Muchun Song      2022-01-21  201  	local_info_t *local = pde_data(file_inode(file));
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  202  	size_t off;
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  203  
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  204  	if (local->pda == NULL || *_pos >= PRISM2_PDA_SIZE)
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  205  		return 0;
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  206  
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  207  	off = *_pos;
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  208  	if (count > PRISM2_PDA_SIZE - off)
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  209  		count = PRISM2_PDA_SIZE - off;
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  210  	if (copy_to_user(buf, local->pda + off, count) != 0)
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  211  		return -EFAULT;
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  212  	*_pos += count;
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  213  	return count;
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  214  }
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  215  
97a32539b9568b drivers/net/wireless/intersil/hostap/hostap_proc.c Alexey Dobriyan  2020-02-03  216  static const struct proc_ops prism2_pda_proc_ops = {
97a32539b9568b drivers/net/wireless/intersil/hostap/hostap_proc.c Alexey Dobriyan  2020-02-03  217  	.proc_read	= prism2_pda_proc_read,
97a32539b9568b drivers/net/wireless/intersil/hostap/hostap_proc.c Alexey Dobriyan  2020-02-03  218  	.proc_lseek	= generic_file_llseek,
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  219  };
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  220  
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  221  
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  222  static ssize_t prism2_aux_dump_proc_no_read(struct file *file, char __user *buf,
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  223  					    size_t bufsize, loff_t *_pos)
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  224  {
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  225  	return 0;
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  226  }
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  227  
97a32539b9568b drivers/net/wireless/intersil/hostap/hostap_proc.c Alexey Dobriyan  2020-02-03  228  static const struct proc_ops prism2_aux_dump_proc_ops = {
97a32539b9568b drivers/net/wireless/intersil/hostap/hostap_proc.c Alexey Dobriyan  2020-02-03  229  	.proc_read	= prism2_aux_dump_proc_no_read,
d4455faccd6cbe drivers/net/wireless/intersil/hostap/hostap_proc.c Alexey Dobriyan  2021-05-06  230  	.proc_lseek	= default_llseek,
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  231  };
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  232  
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  233  
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  234  #ifdef PRISM2_IO_DEBUG
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  235  static int prism2_io_debug_proc_read(char *page, char **start, off_t off,
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  236  				     int count, int *eof, void *data)
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  237  {
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  238  	local_info_t *local = (local_info_t *) data;
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  239  	int head = local->io_debug_head;
64827a6ac04993 drivers/net/wireless/intersil/hostap/hostap_proc.c zhong jiang      2019-09-03  240  	int start_bytes, left, copy;
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  241  
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  242  	if (off + count > PRISM2_IO_DEBUG_SIZE * 4) {
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  243  		*eof = 1;
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  244  		if (off >= PRISM2_IO_DEBUG_SIZE * 4)
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  245  			return 0;
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  246  		count = PRISM2_IO_DEBUG_SIZE * 4 - off;
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  247  	}
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  248  
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  249  	start_bytes = (PRISM2_IO_DEBUG_SIZE - head) * 4;
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  250  	left = count;
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  251  
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  252  	if (off < start_bytes) {
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  253  		copy = start_bytes - off;
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  254  		if (copy > count)
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  255  			copy = count;
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  256  		memcpy(page, ((u8 *) &local->io_debug[head]) + off, copy);
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  257  		left -= copy;
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  258  		if (left > 0)
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  259  			memcpy(&page[copy], local->io_debug, left);
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  260  	} else {
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  261  		memcpy(page, ((u8 *) local->io_debug) + (off - start_bytes),
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  262  		       left);
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  263  	}
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  264  
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  265  	*start = page;
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  266  
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  267  	return count;
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  268  }
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  269  #endif /* PRISM2_IO_DEBUG */
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  270  
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  271  
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  272  #ifndef PRISM2_NO_STATION_MODES
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  273  static int prism2_scan_results_proc_show(struct seq_file *m, void *v)
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  274  {
359745d78351c6 drivers/net/wireless/intersil/hostap/hostap_proc.c Muchun Song      2022-01-21  275  	local_info_t *local = pde_data(file_inode(m->file));
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  276  	unsigned long entry;
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  277  	int i, len;
2e4fd068e7e25e drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-07-30  278  	struct hfa384x_hostscan_result *scanres;
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  279  	u8 *p;
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  280  
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  281  	if (v == SEQ_START_TOKEN) {
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  282  		seq_printf(m,
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  283  			   "CHID ANL SL BcnInt Capab Rate BSSID ATIM SupRates SSID\n");
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  284  		return 0;
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  285  	}
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  286  
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  287  	entry = (unsigned long)v - 2;
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  288  	scanres = &local->last_scan_results[entry];
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  289  
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  290  	seq_printf(m, "%d %d %d %d 0x%02x %d %pM %d ",
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  291  		   le16_to_cpu(scanres->chid),
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  292  		   (s16) le16_to_cpu(scanres->anl),
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  293  		   (s16) le16_to_cpu(scanres->sl),
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  294  		   le16_to_cpu(scanres->beacon_interval),
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  295  		   le16_to_cpu(scanres->capability),
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  296  		   le16_to_cpu(scanres->rate),
e174961ca1a0b2 drivers/net/wireless/hostap/hostap_proc.c          Johannes Berg    2008-10-27  297  		   scanres->bssid,
2e4fd068e7e25e drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-07-30  298  		   le16_to_cpu(scanres->atim));
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  299  
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  300  	p = scanres->sup_rates;
2e4fd068e7e25e drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-07-30  301  	for (i = 0; i < sizeof(scanres->sup_rates); i++) {
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  302  		if (p[i] == 0)
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  303  			break;
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  304  		seq_printf(m, "<%02x>", p[i]);
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  305  	}
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  306  	seq_putc(m, ' ');
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  307  
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  308  	p = scanres->ssid;
2e4fd068e7e25e drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-07-30  309  	len = le16_to_cpu(scanres->ssid_len);
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  310  	if (len > 32)
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  311  		len = 32;
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  312  	for (i = 0; i < len; i++) {
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  313  		unsigned char c = p[i];
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  314  		if (c >= 32 && c < 127)
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  315  			seq_putc(m, c);
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  316  		else
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  317  			seq_printf(m, "<%02x>", c);
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  318  	}
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  319  	seq_putc(m, '\n');
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  320  	return 0;
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  321  }
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  322  
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  323  static void *prism2_scan_results_proc_start(struct seq_file *m, loff_t *_pos)
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  324  {
359745d78351c6 drivers/net/wireless/intersil/hostap/hostap_proc.c Muchun Song      2022-01-21  325  	local_info_t *local = pde_data(file_inode(m->file));
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  326  	spin_lock_bh(&local->lock);
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  327  
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  328  	/* We have a header (pos 0) + N results to show (pos 1...N) */
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  329  	if (*_pos > local->last_scan_results_count)
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  330  		return NULL;
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  331  	return (void *)(unsigned long)(*_pos + 1); /* 0 would be EOF */
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  332  }
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  333  
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  334  static void *prism2_scan_results_proc_next(struct seq_file *m, void *v, loff_t *_pos)
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  335  {
359745d78351c6 drivers/net/wireless/intersil/hostap/hostap_proc.c Muchun Song      2022-01-21  336  	local_info_t *local = pde_data(file_inode(m->file));
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  337  
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  338  	++*_pos;
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  339  	if (*_pos > local->last_scan_results_count)
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  340  		return NULL;
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  341  	return (void *)(unsigned long)(*_pos + 1); /* 0 would be EOF */
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  342  }
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  343  
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  344  static void prism2_scan_results_proc_stop(struct seq_file *m, void *v)
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  345  {
359745d78351c6 drivers/net/wireless/intersil/hostap/hostap_proc.c Muchun Song      2022-01-21  346  	local_info_t *local = pde_data(file_inode(m->file));
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  347  	spin_unlock_bh(&local->lock);
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  348  }
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  349  
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10 @350  static const struct seq_operations prism2_scan_results_proc_seqops = {
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  351  	.start	= prism2_scan_results_proc_start,
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  352  	.next	= prism2_scan_results_proc_next,
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  353  	.stop	= prism2_scan_results_proc_stop,
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  354  	.show	= prism2_scan_results_proc_show,
6bbefe86796c07 drivers/net/wireless/hostap/hostap_proc.c          David Howells    2013-04-10  355  };
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  356  #endif /* PRISM2_NO_STATION_MODES */
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  357  
ff1d2767d5a43c drivers/net/wireless/hostap/hostap_proc.c          Jouni Malinen    2005-05-12  358  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
