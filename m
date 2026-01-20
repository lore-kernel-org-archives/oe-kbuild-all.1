Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F121C01
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jan 2026 00:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768867528; cv=none; b=YSx0iFcTIGXoBByXkk6VV+VLDzHuNcSXFIdEg09HeMl3X+Wv514GyCFpBcAfqMWBVq2sVYyE1hr3Amxg9M0zutXr5EoPPsRv4f6HDlm33yjgLtqlSx+UvLRW04ABu/Q2ZROUJX6UbHosPCakTLY7jlTwmoEb4mBaK4j320WZmg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768867528; c=relaxed/simple;
	bh=YSXW1T5mCJcfG6aG1JuhQkHED7jVPkMhQoX9o7DRrP4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=h/4veUD7kXFE3Blsg/w2j14WMkBVP5rEtG0yldMeV1DfK8dKeOAbngutho8DajnzOWE1nU8koenENrAl5/hzpDxx+bQCBd3AQv/chSWExlnSVBBJ+r1WVvcKLCOQ8FXidMOpGCtRXxZOvKe6H3OZWXBM4JjCO73kIi0izwJcypE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WFTG35T5; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WFTG35T5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768867526; x=1800403526;
  h=date:from:to:cc:subject:message-id;
  bh=YSXW1T5mCJcfG6aG1JuhQkHED7jVPkMhQoX9o7DRrP4=;
  b=WFTG35T5Xnh9fXs/cV8oSJovDNjmCCjZ5i5Ez+F6hJ9PSp9z2iGN9gUk
   aH3qXqFNChFCyaQBikF3RKzY0G7NprvTiSQejVyYCcnkPtNjN0KaHKVHV
   j+sUYYvxC70Gnz1nrUGL+4YoPjgbYYOLzb0uXpjFWT2NY9pcSqjD7IyPY
   OUUJ78BVE8qAI7ETzsD9taC+7XDDpWGBynGwJSyRjrZJjZ41UGUW5tUnP
   6n6QYJAHfdwFybHSP7mlxyX82KD2QFkR7uQ5yETYobHkSX58HGa/mD/sH
   QoUE7FzeKMoMd4noaN8i5if56FEwLkn8ExGb3NQ/LO4wxQFHddGVib/Gb
   Q==;
X-CSE-ConnectionGUID: Ai6w5fxjQPGp2CGbpuhbuA==
X-CSE-MsgGUID: MLwnVa/nTaio3DYVxcqgHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="57632624"
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; 
   d="scan'208";a="57632624"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 16:05:26 -0800
X-CSE-ConnectionGUID: g1AXaTgxRVuLj0PFO8tc8g==
X-CSE-MsgGUID: MXsnbPPrR4e/xlO+Z7xZtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; 
   d="scan'208";a="243566364"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Jan 2026 16:05:24 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhzFJ-00000000OOz-3KoS;
	Tue, 20 Jan 2026 00:05:21 +0000
Date: Tue, 20 Jan 2026 08:04:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 196/196]
 kernel/trace/trace_events_synth.c:548 trace_event_raw_event_synth() warn:
 inconsistent indenting
Message-ID: <202601200836.H1qleLbU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   625d1a188a3d8cbd1f0897f44e0984dae1711754
commit: b9453380c1c542fd095a4dbe9251eeba4022bbce [196/196] tracing: Allow synthetic events to pass around stacktraces
config: x86_64-randconfig-161-20260114 (https://download.01.org/0day-ci/archive/20260120/202601200836.H1qleLbU-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601200836.H1qleLbU-lkp@intel.com/

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
