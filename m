Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A517F7D7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Feb 2024 16:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708533465; cv=none; b=FPtolt8eZtOqoFQNq5wbdZTaaFfkHdGZC++pSFyFwTP4Yade1P50mju++yPFXMpJsxJ3I1xwfQ/FtmoP5jIRyWsk5E2q5s64XBJR9EcgZMGOR7wQYkbOKHvD4gOkjShKBAN2O8k0waDncJfzRqlHua7AXiZW4aLTbcof9IVSRvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708533465; c=relaxed/simple;
	bh=qUOL/thfirSjSWHLre+ES+0B8zbckJIAUeKFkG6lsXs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qkN7Ra6UNdjUZkNLQerHnbgSIT+nHSKRLydKHy3y2yuA7OUXrr5G6qXVdyRXvKodnUS+jhFvLb3rlWpO0QXnx2P4MuYGyt6N/KwqXj5OY2zyUPafFqLEgz1dxNmGJMDlNb49pKbkzlJKYw7RhMirVnppBjtCRkrtCdjznzNRlhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UC1iV5TJ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UC1iV5TJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708533463; x=1740069463;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qUOL/thfirSjSWHLre+ES+0B8zbckJIAUeKFkG6lsXs=;
  b=UC1iV5TJfiWl/eABLawJGRItcyCK8fPGWd1Pzcy2DIoknwRY+B/bVgcD
   NzE/vwYt31BcKCNJ/cTlS6AKhTF/AedN+/BWQRlKzmkB57+nwJW0vA6hA
   F+B0KwyrYDRIhUHsCrEoEmAOj4imneA8xdlO0romJ7CEtBgcGzO7FIcT2
   2P01a4od1hu5jz8VS7zP9m0AkVpV6RpepVMX1Vd+idWAkIPccbsh+Y9Af
   ZYpWd+io2kcCbMlXya2vAxHwvqtoCf45fUIpvzOUtMk9QLrH+AP4bLjz2
   IlPzWH9x1hKQ6b07DliDzhWV7/YluKCJUEIZ+KEgm8fGDboj9zA2Pl0xv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="13832777"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="13832777"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 08:37:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="28320282"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 21 Feb 2024 08:37:39 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcpbE-0005V8-31;
	Wed, 21 Feb 2024 16:37:36 +0000
Date: Thu, 22 Feb 2024 00:35:55 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.phytium 1/41]
 kernel/tkernel/irqlatency/irqlatency.c:581:37: warning: 'trace_dist_fops'
 defined but not used
Message-ID: <202402220001.3HMSerZ1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.phytium
head:   974a90e098c75ef0e62d4bbbde4535368a61f98b
commit: f1c44669cde7e48456dd9f6276cdb4ab848c598e [1/41] irqlatency: add irq latency monitor support
config: x86_64-buildonly-randconfig-001-20240221 (https://download.01.org/0day-ci/archive/20240222/202402220001.3HMSerZ1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240222/202402220001.3HMSerZ1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402220001.3HMSerZ1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/tkernel/irqlatency/irqlatency.c:581:37: warning: 'trace_dist_fops' defined but not used [-Wunused-const-variable=]
     581 | static const struct file_operations trace_dist_fops = {
         |                                     ^~~~~~~~~~~~~~~
>> kernel/tkernel/irqlatency/irqlatency.c:488:37: warning: 'trace_stack_fops' defined but not used [-Wunused-const-variable=]
     488 | static const struct file_operations trace_stack_fops = {
         |                                     ^~~~~~~~~~~~~~~~
>> kernel/tkernel/irqlatency/irqlatency.c:392:37: warning: 'lat_fops' defined but not used [-Wunused-const-variable=]
     392 | static const struct file_operations lat_fops = {
         |                                     ^~~~~~~~
>> kernel/tkernel/irqlatency/irqlatency.c:345:37: warning: 'freq_fops' defined but not used [-Wunused-const-variable=]
     345 | static const struct file_operations freq_fops = {
         |                                     ^~~~~~~~~
>> kernel/tkernel/irqlatency/irqlatency.c:298:37: warning: 'enable_fops' defined but not used [-Wunused-const-variable=]
     298 | static const struct file_operations enable_fops = {
         |                                     ^~~~~~~~~~~


vim +/trace_dist_fops +581 kernel/tkernel/irqlatency/irqlatency.c

   391	
 > 392	static const struct file_operations lat_fops = {
   393		.open		= lat_open,
   394		.read		= seq_read,
   395		.write		= lat_write,
   396		.llseek		= seq_lseek,
   397		.release	= single_release,
   398	};
   399	
   400	static ssize_t trace_stack_write(struct file *file, const char __user *buf,
   401					   size_t count, loff_t *ppos)
   402	{
   403		unsigned long lat;
   404	
   405		if (kstrtoul_from_user(buf, count, 0, &lat))
   406			return -EINVAL;
   407	
   408		if (!lat) {
   409			int cpu;
   410	
   411			for_each_online_cpu(cpu)
   412				smp_call_function_single(cpu, reset_latency_trace,
   413					per_cpu_ptr(detect_data, cpu), true);
   414			return count;
   415		}
   416	
   417		return -EINVAL;
   418	}
   419	
   420	static void trace_stack_print(struct seq_file *m, struct per_stack *stack)
   421	{
   422		int i;
   423	
   424		if (WARN_ON(!stack->perstack))
   425			return;
   426	
   427		for (i = 0; i < stack->nr_entries; i++)
   428			seq_printf(m, "%*c%pS\n", 5, ' ', (void *)stack->perstack[i]);
   429	}
   430	
   431	static void trace_stack_irq_show(struct seq_file *m, void *v, u32 isirq)
   432	{
   433		int cpu;
   434	
   435		for_each_online_cpu(cpu) {
   436			int i;
   437			u64 stack_index;
   438			struct latency_data *lat_data;
   439	
   440			lat_data = isirq ? per_cpu_ptr(&detect_data->irq_data, cpu) :
   441				per_cpu_ptr(&detect_data->softirq_data, cpu);
   442	
   443			/* *
   444			 * Paired with smp_store_release() in the save_trace().
   445			 */
   446			stack_index = smp_load_acquire(&lat_data->stack_index);
   447			if (!stack_index)
   448				continue;
   449	
   450			seq_printf(m, " cpu: %d\n", cpu);
   451	
   452			for (i = 0; i < stack_index; i++) {
   453				u64 msecs, plus;
   454	
   455				msecs = lat_data->latency[i].msecs;
   456				plus = lat_data->latency[i].plus;
   457				seq_printf(m, "%*cCOMMAND: %s PID: %d LATENCY: %llu%s\n",
   458					5, ' ', lat_data->comms[i], lat_data->pids[i],
   459					msecs, plus ? "+ms" : "ms");
   460				trace_stack_print(m, lat_data->stacks + i);
   461				seq_putc(m, '\n');
   462	
   463				cond_resched();
   464			}
   465		}
   466	}
   467	
   468	static int trace_stack_show(struct seq_file *m, void *v)
   469	{
   470		seq_printf(m, "irq_latency_ms: %llu\n\n", irq_latency_ms);
   471	
   472		seq_puts(m, " irq:\n");
   473		trace_stack_irq_show(m, v, true);
   474	
   475		seq_putc(m, '\n');
   476	
   477		seq_puts(m, " softirq:\n");
   478		trace_stack_irq_show(m, v, false);
   479	
   480		return 0;
   481	}
   482	
   483	static int trace_stack_open(struct inode *inode, struct file *file)
   484	{
   485		return single_open(file, trace_stack_show, inode->i_private);
   486	}
   487	
 > 488	static const struct file_operations trace_stack_fops = {
   489		.owner		= THIS_MODULE,
   490		.open		= trace_stack_open,
   491		.read		= seq_read,
   492		.write		= trace_stack_write,
   493		.llseek		= seq_lseek,
   494		.release	= single_release,
   495	};
   496	
   497	#define NUMBER_CHARACTER	40
   498	
   499	static bool trace_histogram_show(struct seq_file *m, const char *header,
   500				   const unsigned long *hist, unsigned long size,
   501				   unsigned int factor)
   502	{
   503		int i, zero_index = 0;
   504		unsigned long count_max = 0;
   505	
   506		for (i = 0; i < size; i++) {
   507			unsigned long count = hist[i];
   508	
   509			if (count > count_max)
   510				count_max = count;
   511	
   512			if (count)
   513				zero_index = i + 1;
   514		}
   515		if (count_max == 0)
   516			return false;
   517	
   518		/* print header */
   519		if (header)
   520			seq_printf(m, "%s\n", header);
   521		seq_printf(m, "%*c%s%*c : %-9s %s\n", 9, ' ', "msecs", 10, ' ', "count",
   522			   "latency distribution");
   523	
   524		for (i = 0; i < zero_index; i++) {
   525			int num;
   526			int scale_min, scale_max;
   527			char str[NUMBER_CHARACTER + 1];
   528	
   529			scale_max = 2 << i;
   530			scale_min = unlikely(i == 0) ? 1 : scale_max / 2;
   531	
   532			num = hist[i] * NUMBER_CHARACTER / count_max;
   533			memset(str, '*', num);
   534			memset(str + num, ' ', NUMBER_CHARACTER - num);
   535			str[NUMBER_CHARACTER] = '\0';
   536	
   537			seq_printf(m, "%10d -> %-10d : %-8lu |%s|\n",
   538				   scale_min * factor, scale_max * factor - 1,
   539				   hist[i], str);
   540		}
   541	
   542		return true;
   543	}
   544	
   545	static void trace_dist_show_irq(struct seq_file *m, void *v, u32 isirq)
   546	{
   547		int cpu;
   548		unsigned long latency_count[MAX_LATENCY_RECORD] = { 0 };
   549	
   550		for_each_online_cpu(cpu) {
   551			int i;
   552			unsigned long *count;
   553	
   554			count = isirq ?
   555				per_cpu_ptr(detect_data->irq_data.latency_count, cpu) :
   556				per_cpu_ptr(detect_data->softirq_data.latency_count,
   557					    cpu);
   558	
   559			for (i = 0; i < MAX_LATENCY_RECORD; i++)
   560				latency_count[i] += count[i];
   561		}
   562	
   563		trace_histogram_show(m, isirq ? "irq-disable:" : "softirq-disable:",
   564			       latency_count, MAX_LATENCY_RECORD, freq_ms);
   565	}
   566	
   567	static int trace_dist_show(struct seq_file *m, void *v)
   568	{
   569		trace_dist_show_irq(m, v, 1);
   570		trace_dist_show_irq(m, v, 0);
   571	
   572		return 0;
   573	}
   574	
   575	
   576	static int trace_dist_open(struct inode *inode, struct file *file)
   577	{
   578		return single_open(file, trace_dist_show, inode->i_private);
   579	}
   580	
 > 581	static const struct file_operations trace_dist_fops = {
   582		.owner		= THIS_MODULE,
   583		.open		= trace_dist_open,
   584		.read		= seq_read,
   585		.llseek		= seq_lseek,
   586		.release	= single_release,
   587	};
   588	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
