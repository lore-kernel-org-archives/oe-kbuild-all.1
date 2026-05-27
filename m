Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8B1311973
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 May 2026 19:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779911746; cv=none; b=qfn+kBCQKNd02hu13KldFIifYVnBGWl+c0daqQUThHYmZAm40FtKhBgVUUnvtH2Z9ntrCib24FfX4LliO4OR9T/IQSkh6KSpyONC9kcxyYbgSUBs2k/rjr9CuJ1KsHV0t84FptbCm37wxe73J908Ru08GoZl6pj+iFgImzELJhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779911746; c=relaxed/simple;
	bh=P/7YVUOMBXi6/spHPUnxxgjLgXcv8RIL2bakt8G1rd8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JzgnkLXyVy8TzrJLSRsJtRI3e5YarxKLNyZtbFv9G5YvwiKfG6ryDXrS0v6w120APqwRHa44YAsEOeOgZg13D0YQQQk5zPWkKaJM+y9zdFMlp2OiTZYE5du5h28iDxDhGOu17aI+KYP5yloSbX2xaXlS92Rlz/1/qr37HxRlAz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qhe+t32K; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qhe+t32K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779911745; x=1811447745;
  h=date:from:to:cc:subject:message-id;
  bh=P/7YVUOMBXi6/spHPUnxxgjLgXcv8RIL2bakt8G1rd8=;
  b=Qhe+t32KJYBwWiopnXNbnyXDMPCOLyOSH5dj6lcBnoyrf4fztJ/1AzDk
   7B75zQc5EaHigSBKrxSIqjZQBjSD4M3wEkHxt1+BDfWh8/P1+6bvJnDtM
   9gCcmOKsElYC2w3QUFvCatsi+ghD+MgJCpr5gIOPyajDczFl3HUMFkKh2
   ehNc+TqFawuTPDiJyXSBjNv83tI11EPKaJGp/0dtd8PTrT2yATTx2ZASm
   JHs+wWDtOC+9gvzUOOjlI3aqYc18mKM2niHBl8UuJZOyGiwuESy0yHQ3C
   jGotckIxBVWIBUZWzhAnDolEANNMR/Xe28zWbqPGW2TRO4gM3O3VTo3dB
   A==;
X-CSE-ConnectionGUID: NEEWidi4RBiBDLAMjOkC2A==
X-CSE-MsgGUID: ARODUu8KQoeB2sRJfw/zfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="91060780"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="91060780"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 12:55:44 -0700
X-CSE-ConnectionGUID: 96l1QPggT/a+B39iW3Bfwg==
X-CSE-MsgGUID: aj3+J4awQhyXcPtaVtA+4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="239753877"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 27 May 2026 12:55:43 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSKLs-000000004Ok-2pcq;
	Wed, 27 May 2026 19:55:40 +0000
Date: Thu, 28 May 2026 03:55:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 236/236]
 kernel/trace/trace_events_synth.c:548 trace_event_raw_event_synth() warn:
 inconsistent indenting
Message-ID: <202605280319.sbXBYYIP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   699e15bcf547a7d68dda803fa0f49872de5be052
commit: b9453380c1c542fd095a4dbe9251eeba4022bbce [236/236] tracing: Allow synthetic events to pass around stacktraces
config: x86_64-randconfig-161-20260527 (https://download.01.org/0day-ci/archive/20260528/202605280319.sbXBYYIP-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605280319.sbXBYYIP-lkp@intel.com/

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
