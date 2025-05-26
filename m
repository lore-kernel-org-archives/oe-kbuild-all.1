Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9441C4A2D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 May 2025 19:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748286092; cv=none; b=relsvMb3HsJfUVdLgCZS1GkJcQxLvHWutNXjqJ0IrAxi0hYR2hzAeClhrhWALZN87afG72GGDrY13catavwn7LPPAAFHOpKHYwa3TqG1Hd9OVbZIWLwydXJ7N0cHDg3sYmRzXqAPPV7XkO+FWw45KPerP4Xc30kJk92xmHEEaaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748286092; c=relaxed/simple;
	bh=5w0DSrY2D24OT8qzFn0cGNnnmRmT5Jwf8OT0KHC5glM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y8FmepxwV7o60UblFA8pMtPsnIelmgGwQEyZxKtt6BgpcPFfjUJQpb0C9dhaxtg1uNDn3cH0+SvXt6wIF+yZFHVSXaNZVY/Vq06E4t4UegjYg9X1XAHCFvXIuLla4Fbh/VGzBYTRv2QXE0RCV3Oz3Nb2LeNLAfDzBR36QEwidKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FhIjgSzm; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FhIjgSzm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748286090; x=1779822090;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5w0DSrY2D24OT8qzFn0cGNnnmRmT5Jwf8OT0KHC5glM=;
  b=FhIjgSzmNIIMOdepGTUiMj3LlKNj4qFh/2CZr05GTuuhrnDjmP/FgSkc
   3cQvhlYoE60h4HRzcj8TtT/qw29p5kR9xt5jAx7xpfX8NQj4mchra6v5p
   xIMrRzKPGoi6zT4DPMUgUAbUsszyqycW8PQV2Bn6HPDO2GnOpq6qffR+N
   4wqu2FsEeVo45e56H8zub/DErKhzxpo7uvLpTijc+WOo2P89fbcVZOzjX
   JTYojzK6o0IBSQybOBSgSkf6TNrqA6Ieucf4QcSLnDFJ6M8HxWF52O3E1
   /X3liXP5/64HBP3wf/YZzaaymubKZHnANzV2u9ls6Tch4ahgkBlyJ5IM+
   A==;
X-CSE-ConnectionGUID: AA63mj6VRLCn0+RKcN4JMg==
X-CSE-MsgGUID: UsDRjsIFSwKpwAIc8pWepQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="54059419"
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; 
   d="scan'208";a="54059419"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 12:01:29 -0700
X-CSE-ConnectionGUID: Fq/T5ZE9R4+Sse0iOCP4XQ==
X-CSE-MsgGUID: xezfgDgCTHSe/8RLFUkpPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; 
   d="scan'208";a="142942777"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 26 May 2025 12:01:28 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJd4f-000SfM-2w;
	Mon, 26 May 2025 19:01:25 +0000
Date: Tue, 27 May 2025 03:00:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 1/1]
 kernel/trace/trace_events_synth.c:548 trace_event_raw_event_synth() warn:
 inconsistent indenting
Message-ID: <202505270200.PqVibtQ0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   d53a0611237f141d4127494d9bbd39f05ea540ba
commit: b9453380c1c542fd095a4dbe9251eeba4022bbce [1/1] tracing: Allow synthetic events to pass around stacktraces
config: i386-randconfig-141-20250526 (https://download.01.org/0day-ci/archive/20250527/202505270200.PqVibtQ0-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505270200.PqVibtQ0-lkp@intel.com/

smatch warnings:
kernel/trace/trace_events_synth.c:548 trace_event_raw_event_synth() warn: inconsistent indenting

vim +548 kernel/trace/trace_events_synth.c

   495	
   496	static notrace void trace_event_raw_event_synth(void *__data,
   497							u64 *var_ref_vals,
   498							unsigned int *var_ref_idx)
   499	{
   500		unsigned int i, n_u64, val_idx, len, data_size = 0;
   501		struct trace_event_file *trace_file = __data;
   502		struct synth_trace_event *entry;
   503		struct trace_event_buffer fbuffer;
   504		struct trace_buffer *buffer;
   505		struct synth_event *event;
   506		int fields_size = 0;
   507	
   508		event = trace_file->event_call->data;
   509	
   510		if (trace_trigger_soft_disabled(trace_file))
   511			return;
   512	
   513		fields_size = event->n_u64 * sizeof(u64);
   514	
   515		for (i = 0; i < event->n_dynamic_fields; i++) {
   516			unsigned int field_pos = event->dynamic_fields[i]->field_pos;
   517			char *str_val;
   518	
   519			val_idx = var_ref_idx[field_pos];
   520			str_val = (char *)(long)var_ref_vals[val_idx];
   521	
   522			len = strlen(str_val) + 1;
   523	
   524			fields_size += len;
   525		}
   526	
   527		/*
   528		 * Avoid ring buffer recursion detection, as this event
   529		 * is being performed within another event.
   530		 */
   531		buffer = trace_file->tr->array_buffer.buffer;
   532		ring_buffer_nest_start(buffer);
   533	
   534		entry = trace_event_buffer_reserve(&fbuffer, trace_file,
   535						   sizeof(*entry) + fields_size);
   536		if (!entry)
   537			goto out;
   538	
   539		for (i = 0, n_u64 = 0; i < event->n_fields; i++) {
   540			val_idx = var_ref_idx[i];
   541			if (event->fields[i]->is_string) {
   542				char *str_val = (char *)(long)var_ref_vals[val_idx];
   543	
   544				len = trace_string(entry, event, str_val,
   545						   event->fields[i]->is_dynamic,
   546						   data_size, &n_u64);
   547				data_size += len; /* only dynamic string increments */
 > 548			} if (event->fields[i]->is_stack) {
   549			        long *stack = (long *)(long)var_ref_vals[val_idx];
   550	
   551				len = trace_stack(entry, event, stack,
   552						   data_size, &n_u64);
   553				data_size += len;
   554			} else {
   555				struct synth_field *field = event->fields[i];
   556				u64 val = var_ref_vals[val_idx];
   557	
   558				switch (field->size) {
   559				case 1:
   560					*(u8 *)&entry->fields[n_u64] = (u8)val;
   561					break;
   562	
   563				case 2:
   564					*(u16 *)&entry->fields[n_u64] = (u16)val;
   565					break;
   566	
   567				case 4:
   568					*(u32 *)&entry->fields[n_u64] = (u32)val;
   569					break;
   570	
   571				default:
   572					entry->fields[n_u64] = val;
   573					break;
   574				}
   575				n_u64++;
   576			}
   577		}
   578	
   579		trace_event_buffer_commit(&fbuffer);
   580	out:
   581		ring_buffer_nest_end(buffer);
   582	}
   583	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
