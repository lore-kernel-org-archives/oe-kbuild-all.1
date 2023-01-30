Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E5E290F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jan 2023 13:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675086847; x=1706622847;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zr0JAo9B6pRHlxfCWkz/hXhGUbZSBfbIIIRxct32Zg4=;
  b=Gaw2Tyz6VfaopcilXeWyQbEm4UplvYHvxGOLz21xViFAL/b0L+5D0BCI
   7AxoE7XorVLCGv8OHduTb58qSMkmuRZdZgUEhxJZsf2LQXKtkiwezqJUK
   YBwrReiFaiCj69bX5NpQTi+j4Bsp0ykwfoafH6U+9TVxxM/dUUugz6vnT
   uBjDuidau/G71Sp0TZJ7FjfOwK52ePnGZe9Qy3XS+6NcvDE02ohlu8Ujz
   uWLja3JCpn6qZLdoUIhanRGVLpgnlzu8BfUSp876CVjD7VmSlrqIt6mJf
   6q2JwbcBOD1NfvH7mItaWf4MME/7M6PuYrpbqRBmW00XZRGPe5o4d53gg
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="328835243"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="328835243"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 05:54:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="664093307"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="664093307"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 30 Jan 2023 05:54:04 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMUbj-0003ec-2Q;
	Mon, 30 Jan 2023 13:54:03 +0000
Date: Mon, 30 Jan 2023 21:53:54 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 7031/9183] kernel/trace/trace_events_synth.c:567
 trace_event_raw_event_synth() warn: inconsistent indenting
Message-ID: <202301302110.mEtNwkBD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ae0c77e1bc6963c67c6c09e8c72959fcb1ed8d5f
commit: 00cf3d672a9dd409418647e9f98784c339c3ff63 [7031/9183] tracing: Allow synthetic events to pass around stacktraces
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230130/202301302110.mEtNwkBD-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

smatch warnings:
kernel/trace/trace_events_synth.c:567 trace_event_raw_event_synth() warn: inconsistent indenting

vim +567 kernel/trace/trace_events_synth.c

   514	
   515	static notrace void trace_event_raw_event_synth(void *__data,
   516							u64 *var_ref_vals,
   517							unsigned int *var_ref_idx)
   518	{
   519		unsigned int i, n_u64, val_idx, len, data_size = 0;
   520		struct trace_event_file *trace_file = __data;
   521		struct synth_trace_event *entry;
   522		struct trace_event_buffer fbuffer;
   523		struct trace_buffer *buffer;
   524		struct synth_event *event;
   525		int fields_size = 0;
   526	
   527		event = trace_file->event_call->data;
   528	
   529		if (trace_trigger_soft_disabled(trace_file))
   530			return;
   531	
   532		fields_size = event->n_u64 * sizeof(u64);
   533	
   534		for (i = 0; i < event->n_dynamic_fields; i++) {
   535			unsigned int field_pos = event->dynamic_fields[i]->field_pos;
   536			char *str_val;
   537	
   538			val_idx = var_ref_idx[field_pos];
   539			str_val = (char *)(long)var_ref_vals[val_idx];
   540	
   541			len = kern_fetch_store_strlen((unsigned long)str_val);
   542	
   543			fields_size += len;
   544		}
   545	
   546		/*
   547		 * Avoid ring buffer recursion detection, as this event
   548		 * is being performed within another event.
   549		 */
   550		buffer = trace_file->tr->array_buffer.buffer;
   551		ring_buffer_nest_start(buffer);
   552	
   553		entry = trace_event_buffer_reserve(&fbuffer, trace_file,
   554						   sizeof(*entry) + fields_size);
   555		if (!entry)
   556			goto out;
   557	
   558		for (i = 0, n_u64 = 0; i < event->n_fields; i++) {
   559			val_idx = var_ref_idx[i];
   560			if (event->fields[i]->is_string) {
   561				char *str_val = (char *)(long)var_ref_vals[val_idx];
   562	
   563				len = trace_string(entry, event, str_val,
   564						   event->fields[i]->is_dynamic,
   565						   data_size, &n_u64);
   566				data_size += len; /* only dynamic string increments */
 > 567			} if (event->fields[i]->is_stack) {
   568			        long *stack = (long *)(long)var_ref_vals[val_idx];
   569	
   570				len = trace_stack(entry, event, stack,
   571						   data_size, &n_u64);
   572				data_size += len;
   573			} else {
   574				struct synth_field *field = event->fields[i];
   575				u64 val = var_ref_vals[val_idx];
   576	
   577				switch (field->size) {
   578				case 1:
   579					*(u8 *)&entry->fields[n_u64] = (u8)val;
   580					break;
   581	
   582				case 2:
   583					*(u16 *)&entry->fields[n_u64] = (u16)val;
   584					break;
   585	
   586				case 4:
   587					*(u32 *)&entry->fields[n_u64] = (u32)val;
   588					break;
   589	
   590				default:
   591					entry->fields[n_u64] = val;
   592					break;
   593				}
   594				n_u64++;
   595			}
   596		}
   597	
   598		trace_event_buffer_commit(&fbuffer);
   599	out:
   600		ring_buffer_nest_end(buffer);
   601	}
   602	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
