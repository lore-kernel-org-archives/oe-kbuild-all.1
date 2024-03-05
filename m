Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC805102B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 14:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709647868; cv=none; b=tiPBloiwuIXlc4EswwBR+EHpCepbSpsKmCQR236VPHV45x0v2CDHStChh4yukfufuKtD6oh0TGrXmzjkuOfrNjVPO2qu44ClEZG0i+VaLZvSuCicavpeDRcjR+WmYBNKWyGgceaRv0kSyj8CHFmu7YUK6NXyagZ2QeAOHH+H3TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709647868; c=relaxed/simple;
	bh=bJI1V1e0bqUXbRtIdFLLnydswyPoAtPGpwioWe4X9BA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xm7jm3SdX0s0NgughGDhtGHXzqJ0qUezEDyYVrkxi5GSKraiBWYg6NlNbSupcbqu5hQ9f1l971RMgNMjPGHZbE+60Nyc1u3f7GTHCpwMWKaci/O+B1GS+XUABjNPOrXCYn+VUaAsEBCXA8fcjwdrCDXsK+VylRGh29SRD2dp0mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j5Me3Ubt; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j5Me3Ubt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709647864; x=1741183864;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bJI1V1e0bqUXbRtIdFLLnydswyPoAtPGpwioWe4X9BA=;
  b=j5Me3UbtDRUaOd/BFYAtwaSApGkuVUdKGoP3pzsF1V3BEHfG8hrTqEEq
   fSjX6Q9EKXrSW3ft+mkZ3R0BQwxCyWoJD3rMU6Oud+JHJzVElOhBPm8En
   kEp8+WXeatm/tpRzjzzdhcWK+Sw8qwKtw0dMb6mpA5nSoutoCm3p6XhtO
   +9NhlVzk93k03Ni9U6trBjX2QzPWYH/WvC+KGJwHVYDrtBYHEieu1I2nB
   bGsRfTUgsDZO8oHIdRKbgE8y1vR4So7r+yu0beCeGz1TOe9vcA5PZ1N6R
   0mgvEHHngS5DP7jPhvrmypHXN+mB+qvfM8ikQ5FcNTy7HngLfh2QsBuX2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="8018098"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="8018098"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 06:10:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="14076324"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 Mar 2024 06:10:45 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhVVC-0003M5-2H;
	Tue, 05 Mar 2024 14:10:42 +0000
Date: Tue, 5 Mar 2024 22:10:20 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.phytium 1/41]
 kernel/tkernel/irqlatency/irqlatency.c:298:37: warning: unused variable
 'enable_fops'
Message-ID: <202403052211.cX4oGWRl-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-002-20240305 (https://download.01.org/0day-ci/archive/20240305/202403052211.cX4oGWRl-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403052211.cX4oGWRl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403052211.cX4oGWRl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/tkernel/irqlatency/irqlatency.c:298:37: warning: unused variable 'enable_fops' [-Wunused-const-variable]
     298 | static const struct file_operations enable_fops = {
         |                                     ^~~~~~~~~~~
>> kernel/tkernel/irqlatency/irqlatency.c:345:37: warning: unused variable 'freq_fops' [-Wunused-const-variable]
     345 | static const struct file_operations freq_fops = {
         |                                     ^~~~~~~~~
>> kernel/tkernel/irqlatency/irqlatency.c:392:37: warning: unused variable 'lat_fops' [-Wunused-const-variable]
     392 | static const struct file_operations lat_fops = {
         |                                     ^~~~~~~~
>> kernel/tkernel/irqlatency/irqlatency.c:488:37: warning: unused variable 'trace_stack_fops' [-Wunused-const-variable]
     488 | static const struct file_operations trace_stack_fops = {
         |                                     ^~~~~~~~~~~~~~~~
>> kernel/tkernel/irqlatency/irqlatency.c:581:37: warning: unused variable 'trace_dist_fops' [-Wunused-const-variable]
     581 | static const struct file_operations trace_dist_fops = {
         |                                     ^~~~~~~~~~~~~~~
   5 warnings generated.


vim +/enable_fops +298 kernel/tkernel/irqlatency/irqlatency.c

   297	
 > 298	static const struct file_operations enable_fops = {
   299		.open		= enable_open,
   300		.read		= seq_read,
   301		.write		= enable_write,
   302		.llseek		= seq_lseek,
   303		.release	= single_release,
   304	};
   305	
   306	static int freq_show(struct seq_file *m, void *ptr)
   307	{
   308		seq_printf(m, "%llu\n", freq_ms);
   309	
   310		return 0;
   311	}
   312	
   313	static int freq_open(struct inode *inode, struct file *file)
   314	{
   315		return single_open(file, freq_show, inode->i_private);
   316	}
   317	
   318	static ssize_t freq_write(struct file *file, const char __user *buf,
   319					     size_t count, loff_t *ppos)
   320	{
   321		unsigned long freq;
   322	
   323		if (check_enable)
   324			return -EINVAL;
   325	
   326		if (kstrtoul_from_user(buf, count, 0, &freq))
   327			return -EINVAL;
   328	
   329		if (freq == freq_ms)
   330			return count;
   331	
   332		if (freq < MIN_FREQ_MS)
   333			freq = MIN_FREQ_MS;
   334		else if (freq > MAX_FREQ_MS)
   335			freq = MAX_FREQ_MS;
   336	
   337		if (freq > (irq_latency_ms >> 1))
   338			freq = irq_latency_ms >> 1;
   339	
   340		freq_ms = freq;
   341	
   342		return count;
   343	}
   344	
 > 345	static const struct file_operations freq_fops = {
   346		.open		= freq_open,
   347		.read		= seq_read,
   348		.write		= freq_write,
   349		.llseek		= seq_lseek,
   350		.release	= single_release,
   351	};
   352	
   353	static int lat_show(struct seq_file *m, void *ptr)
   354	{
   355		seq_printf(m, "%llu\n", irq_latency_ms);
   356	
   357		return 0;
   358	}
   359	
   360	static int lat_open(struct inode *inode, struct file *file)
   361	{
   362		return single_open(file, lat_show, inode->i_private);
   363	}
   364	
   365	static ssize_t lat_write(struct file *file, const char __user *buf,
   366					     size_t count, loff_t *ppos)
   367	{
   368		unsigned long lat_ms;
   369	
   370		if (check_enable)
   371			return -EINVAL;
   372	
   373		if (kstrtoul_from_user(buf, count, 0, &lat_ms))
   374			return -EINVAL;
   375	
   376		if (lat_ms == irq_latency_ms)
   377			return count;
   378	
   379		if (lat_ms < (MIN_FREQ_MS >> 1))
   380			lat_ms = MIN_FREQ_MS >> 1;
   381		else if (lat_ms > (MAX_FREQ_MS >> 1))
   382			lat_ms = MAX_FREQ_MS >> 1;
   383	
   384		if (lat_ms < (freq_ms << 1))
   385			lat_ms = freq_ms << 1;
   386	
   387		irq_latency_ms = lat_ms;
   388	
   389		return count;
   390	}
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
