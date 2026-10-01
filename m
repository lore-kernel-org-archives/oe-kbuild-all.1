Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF20A4FDA67
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Oct 2026 14:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790864037; cv=none; b=f1BG+Y3aVYzSOFiNsMQFngdXtWpNrsC6zLlAR2G1X6ur08pouHSwBMQ0si78+FKlEp/tIc3TzAn1zdWS44nNTV+HcvGxARJmcJJweI+MAPAsZ4j4atJdrhginlGigeWx/qM/9v4e58SYfK6AHF/KEneqa2jjhKYaGBz2nE+zHe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790864037; c=relaxed/simple;
	bh=VuMuQbGuLbAigakSIUe3tColkS+TesqqVrfpyCQydso=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PXbN1yT9IuOUALj9pleSaJvNLjfrJlLvO6LTdDvRXdKQikwIuPEdp/IGMHF8GtG3+bS2nCtJq+izhmAra4fvBXKSHS9StFYZaKuhViLNj2dSIWOWiOecZ7qkOvXdiVWccSHzBBu8AUEWHTUpEWnBglgNm0tgP3BWy0MJ7dPGXKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fLgeAZBf; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fLgeAZBf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790864035; x=1822400035;
  h=date:from:to:cc:subject:message-id;
  bh=VuMuQbGuLbAigakSIUe3tColkS+TesqqVrfpyCQydso=;
  b=fLgeAZBfigAw+JrDHiAoXxPDmlRgZSExMgf6WCS34H9MzJYqzr8z5B2A
   So5atwIBj6o0NkuyrHqUb+whC+0iIQ6+TKf9mYjlPCWdPDkHotEuqsLtt
   8Ky51FQ7OH6w+K1jZClW4f2xr8rPaxau5Orq4DnRd5TQ4brdE3xt9bLZB
   h1x1qZvjd5W1PBOL7rupwuIlnf7SpCl0L715cxDr8fJ8Mnh+k+byTkWQj
   jMX23ssS+OMYGZXh0S7Jza3PE47wfOeVnHVnqcWJX5FE/8GP++0xsBVl0
   gGZupv/iSmqDBIlhslaeqIJf9bwd6aDmdbF06zZsHNtYSe3Hz9CVusk/g
   Q==;
X-CSE-ConnectionGUID: XGXbgLrRQ/eD5UB3jjFqYA==
X-CSE-MsgGUID: ADvcZ6ksRROhpOF5c1Sbiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="100955662"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="100955662"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 07:13:55 -0700
X-CSE-ConnectionGUID: u1342L9vQW6fz1gkZJevuw==
X-CSE-MsgGUID: Fn++eLe5TRK9BCIzVZdoyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="274086784"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 01 Oct 2026 07:13:53 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCHXf-0000000007H-2aP0;
	Thu, 01 Oct 2026 14:13:47 +0000
Date: Thu, 01 Oct 2026 16:13:25 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 285/285]
 kernel/trace/trace_events_synth.c:548 trace_event_raw_event_synth() warn:
 inconsistent indenting
Message-ID: <202610011659.WQMYlcVP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   4be4e2c7f84b53df905e192f551928c97b159456
commit: b9453380c1c542fd095a4dbe9251eeba4022bbce [285/285] tracing: Allow synthetic events to pass around stacktraces
config: x86_64-randconfig-2200-20260930 (https://download.01.org/0day-ci/archive/20261001/202610011659.WQMYlcVP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610011659.WQMYlcVP-lkp@intel.com/

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
