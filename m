Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6773D802
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Apr 2024 00:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712190262; cv=none; b=HI+VEXD+4d/I8I33lpzWXPxIp8b11+Sb25wca8UzcBFQ3anzwmm9oV9hmmSHGPsquDcKqhv8XGQeAjYGfFwjTm6lIY3KwVhEQnM4pcibfK0mRhWqDtOdU7XGseq5oBFc69VkIlfrPwXQgpwjYwWIRnvDxRXzjphZbpGjY5ldU1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712190262; c=relaxed/simple;
	bh=fYmoISkInx/IPHD3cjFR2hn4K/4mhZaSJ9iNOQLhJ8o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a6m2mugjQHM4cvibOLPlkQGJDS6YtlK+SIHOBPGXdze9wEa/HizOXiaXbVAvXMH5gDL1LTtl7V36EYpgAxoDmbUfHGS3ETv2XLalr9FZ78laxF0aQUpU5q9iXpQ1azF0Vmo/+J00Gs5OqC0Qz9kaGR+PxA3zirstcPPTp/I2Y44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kcuNrYHn; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kcuNrYHn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712190260; x=1743726260;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fYmoISkInx/IPHD3cjFR2hn4K/4mhZaSJ9iNOQLhJ8o=;
  b=kcuNrYHnf3nr0LyXaGcEwyNu/puaykJtTiI+csJNlWyy7eI5Jt6wr6TW
   olgu3SPM5QmTuAGijdvkEeDKG4jBqZ9PEWe4kyRE49xSthbBOkYbNMiWV
   Uudn4wtFgMA0Xd3VNUJtexbUEnUrpHOtBfB3Y+GWw5vxPT1NUmN/27JeJ
   pM27+k2TXsA256d3DWLqYegGhMfdAcOF5Kew/rsz3MB4rpAvw0ZNoDJTS
   K6SZEu/VNenl3oQNoLZbRDnH4FI4tIVIoaI07urQ8ovNPrl2n8NNuEH7x
   +aqLgT+KiZwa6qGz17tqEQWL2D7lYVBPXFeqaSTVlOyBJG4XwutkfRY8z
   A==;
X-CSE-ConnectionGUID: ruvamM8CSuaqnQgS5/qxpQ==
X-CSE-MsgGUID: wmDqRsnxSTqyT/1pyXhr9Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="8032805"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="8032805"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 17:24:19 -0700
X-CSE-ConnectionGUID: ULuova7TSLWEObebT5v9lQ==
X-CSE-MsgGUID: /BGI6JjFTL+E0esohEFZUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="56063557"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 03 Apr 2024 17:24:18 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsAts-0000Oc-0o;
	Thu, 04 Apr 2024 00:24:16 +0000
Date: Thu, 4 Apr 2024 08:23:44 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rostedt-trace:trace/ring-buffer-prealloc 13/15]
 kernel/trace/ring_buffer.c:4010:13: warning: conflicting types for
 'dump_buffer_page'
Message-ID: <202404040831.Tsr5aF0P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git trace/ring-buffer-prealloc
head:   9d075d4dc5b36849ef23fd132764443511519ede
commit: e6977554ceb7b5fc6330f01ac4e7551a0b0109de [13/15] ring-buffer: Validate boot range memory events
config: i386-buildonly-randconfig-004-20240404 (https://download.01.org/0day-ci/archive/20240404/202404040831.Tsr5aF0P-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240404/202404040831.Tsr5aF0P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404040831.Tsr5aF0P-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/trace/ring_buffer.c: In function 'rb_read_data_buffer':
   kernel/trace/ring_buffer.c:1681:15: error: 'cpu_buffer' undeclared (first use in this function); did you mean 'perf_buffer'?
      atomic_inc(&cpu_buffer->record_disabled);  \
                  ^
   kernel/trace/ring_buffer.c:1718:5: note: in expansion of macro 'buffer_warn_return'
        buffer_warn_return("[CPU: %d]ABSOLUTE TIME WENT BACKWARDS: last ts: %lld absolute ts: %lld\n",
        ^~~~~~~~~~~~~~~~~~
   kernel/trace/ring_buffer.c:1681:15: note: each undeclared identifier is reported only once for each function it appears in
      atomic_inc(&cpu_buffer->record_disabled);  \
                  ^
   kernel/trace/ring_buffer.c:1718:5: note: in expansion of macro 'buffer_warn_return'
        buffer_warn_return("[CPU: %d]ABSOLUTE TIME WENT BACKWARDS: last ts: %lld absolute ts: %lld\n",
        ^~~~~~~~~~~~~~~~~~
   kernel/trace/ring_buffer.c:1683:3: error: implicit declaration of function 'dump_buffer_page'; did you mean 'free_buffer_page'? [-Werror=implicit-function-declaration]
      dump_buffer_page(bpage, info, tail);   \
      ^
   kernel/trace/ring_buffer.c:1718:5: note: in expansion of macro 'buffer_warn_return'
        buffer_warn_return("[CPU: %d]ABSOLUTE TIME WENT BACKWARDS: last ts: %lld absolute ts: %lld\n",
        ^~~~~~~~~~~~~~~~~~
   kernel/trace/ring_buffer.c:1683:20: error: 'bpage' undeclared (first use in this function); did you mean 'dpage'?
      dump_buffer_page(bpage, info, tail);   \
                       ^
   kernel/trace/ring_buffer.c:1718:5: note: in expansion of macro 'buffer_warn_return'
        buffer_warn_return("[CPU: %d]ABSOLUTE TIME WENT BACKWARDS: last ts: %lld absolute ts: %lld\n",
        ^~~~~~~~~~~~~~~~~~
   kernel/trace/ring_buffer.c:1683:27: error: 'info' undeclared (first use in this function); did you mean 'insl'?
      dump_buffer_page(bpage, info, tail);   \
                              ^
   kernel/trace/ring_buffer.c:1718:5: note: in expansion of macro 'buffer_warn_return'
        buffer_warn_return("[CPU: %d]ABSOLUTE TIME WENT BACKWARDS: last ts: %lld absolute ts: %lld\n",
        ^~~~~~~~~~~~~~~~~~
   kernel/trace/ring_buffer.c:1688:4: warning: 'return' with no value, in function returning non-void
       return;      \
       ^
   kernel/trace/ring_buffer.c:1718:5: note: in expansion of macro 'buffer_warn_return'
        buffer_warn_return("[CPU: %d]ABSOLUTE TIME WENT BACKWARDS: last ts: %lld absolute ts: %lld\n",
        ^~~~~~~~~~~~~~~~~~
   kernel/trace/ring_buffer.c:1694:12: note: declared here
    static int rb_read_data_buffer(struct buffer_data_page *dpage, int tail, int cpu,
               ^~~~~~~~~~~~~~~~~~~
   kernel/trace/ring_buffer.c:1718:5: error: label 'out' used but not defined
        buffer_warn_return("[CPU: %d]ABSOLUTE TIME WENT BACKWARDS: last ts: %lld absolute ts: %lld\n",
        ^~~~~~~~~~~~~~~~~~
   kernel/trace/ring_buffer.c: At top level:
>> kernel/trace/ring_buffer.c:4010:13: warning: conflicting types for 'dump_buffer_page'
    static void dump_buffer_page(struct buffer_data_page *bpage,
                ^~~~~~~~~~~~~~~~
   kernel/trace/ring_buffer.c:4010:13: error: static declaration of 'dump_buffer_page' follows non-static declaration
   kernel/trace/ring_buffer.c:1683:3: note: previous implicit declaration of 'dump_buffer_page' was here
      dump_buffer_page(bpage, info, tail);   \
      ^
   kernel/trace/ring_buffer.c:1718:5: note: in expansion of macro 'buffer_warn_return'
        buffer_warn_return("[CPU: %d]ABSOLUTE TIME WENT BACKWARDS: last ts: %lld absolute ts: %lld\n",
        ^~~~~~~~~~~~~~~~~~
   kernel/trace/ring_buffer.c: In function 'check_buffer':
   kernel/trace/ring_buffer.c:4099:2: error: 'ret' undeclared (first use in this function); did you mean 'net'?
     ret = rb_read_data_buffer(bpage, tail, &ts, cpu_buffer->cpu, true);
     ^~~
     net
   kernel/trace/ring_buffer.c:4099:41: warning: passing argument 3 of 'rb_read_data_buffer' makes integer from pointer without a cast [-Wint-conversion]
     ret = rb_read_data_buffer(bpage, tail, &ts, cpu_buffer->cpu, true);
                                            ^
   kernel/trace/ring_buffer.c:1694:12: note: expected 'int' but argument is of type 'u64 * {aka long long unsigned int *}'
    static int rb_read_data_buffer(struct buffer_data_page *dpage, int tail, int cpu,
               ^~~~~~~~~~~~~~~~~~~
   kernel/trace/ring_buffer.c:4099:46: warning: passing argument 4 of 'rb_read_data_buffer' makes pointer from integer without a cast [-Wint-conversion]
     ret = rb_read_data_buffer(bpage, tail, &ts, cpu_buffer->cpu, true);
                                                 ^~~~~~~~~~
   kernel/trace/ring_buffer.c:1694:12: note: expected 'long long unsigned int *' but argument is of type 'int'
    static int rb_read_data_buffer(struct buffer_data_page *dpage, int tail, int cpu,
               ^~~~~~~~~~~~~~~~~~~
   kernel/trace/ring_buffer.c:4073:6: warning: unused variable 'e' [-Wunused-variable]
     int e;
         ^
   kernel/trace/ring_buffer.c:4071:10: warning: unused variable 'delta' [-Wunused-variable]
     u64 ts, delta;
             ^~~~~
   kernel/trace/ring_buffer.c:4069:28: warning: unused variable 'event' [-Wunused-variable]
     struct ring_buffer_event *event;
                               ^~~~~
   cc1: some warnings being treated as errors


vim +/dump_buffer_page +4010 kernel/trace/ring_buffer.c

d40dbb617ae9a8 Steven Rostedt (Google  2023-12-19  4009) 
5b7be9c709e10e Steven Rostedt (VMware  2020-11-30 @4010) static void dump_buffer_page(struct buffer_data_page *bpage,
5b7be9c709e10e Steven Rostedt (VMware  2020-11-30  4011) 			     struct rb_event_info *info,
5b7be9c709e10e Steven Rostedt (VMware  2020-11-30  4012) 			     unsigned long tail)
5b7be9c709e10e Steven Rostedt (VMware  2020-11-30  4013) {
5b7be9c709e10e Steven Rostedt (VMware  2020-11-30  4014) 	struct ring_buffer_event *event;
5b7be9c709e10e Steven Rostedt (VMware  2020-11-30  4015) 	u64 ts, delta;
5b7be9c709e10e Steven Rostedt (VMware  2020-11-30  4016) 	int e;
5b7be9c709e10e Steven Rostedt (VMware  2020-11-30  4017) 
5b7be9c709e10e Steven Rostedt (VMware  2020-11-30  4018) 	ts = bpage->time_stamp;
5b7be9c709e10e Steven Rostedt (VMware  2020-11-30  4019) 	pr_warn("  [%lld] PAGE TIME STAMP\n", ts);
5b7be9c709e10e Steven Rostedt (VMware  2020-11-30  4020) 
5b7be9c709e10e Steven Rostedt (VMware  2020-11-30  4021) 	for (e = 0; e < tail; e += rb_event_length(event)) {
5b7be9c709e10e Steven Rostedt (VMware  2020-11-30  4022) 
5b7be9c709e10e Steven Rostedt (VMware  2020-11-30  4023) 		event = (struct ring_buffer_event *)(bpage->data + e);
5b7be9c709e10e Steven Rostedt (VMware  2020-11-30  4024) 
5b7be9c709e10e Steven Rostedt (VMware  2020-11-30  4025) 		switch (event->type_len) {
5b7be9c709e10e Steven Rostedt (VMware  2020-11-30  4026) 
5b7be9c709e10e Steven Rostedt (VMware  2020-11-30  4027) 		case RINGBUF_TYPE_TIME_EXTEND:
e20044f7e9ae2b Steven Rostedt (VMware  2021-03-16  4028) 			delta = rb_event_time_stamp(event);
5b7be9c709e10e Steven Rostedt (VMware  2020-11-30  4029) 			ts += delta;
0b9036efd83d4a Steven Rostedt (Google  2023-12-11  4030) 			pr_warn(" 0x%x: [%lld] delta:%lld TIME EXTEND\n",
0b9036efd83d4a Steven Rostedt (Google  2023-12-11  4031) 				e, ts, delta);
5b7be9c709e10e Steven Rostedt (VMware  2020-11-30  4032) 			break;
5b7be9c709e10e Steven Rostedt (VMware  2020-11-30  4033) 
5b7be9c709e10e Steven Rostedt (VMware  2020-11-30  4034) 		case RINGBUF_TYPE_TIME_STAMP:
e20044f7e9ae2b Steven Rostedt (VMware  2021-03-16  4035) 			delta = rb_event_time_stamp(event);
6695da58f9445f Steven Rostedt (Google  2022-04-27  4036) 			ts = rb_fix_abs_ts(delta, ts);
0b9036efd83d4a Steven Rostedt (Google  2023-12-11  4037) 			pr_warn(" 0x%x:  [%lld] absolute:%lld TIME STAMP\n",
0b9036efd83d4a Steven Rostedt (Google  2023-12-11  4038) 				e, ts, delta);
5b7be9c709e10e Steven Rostedt (VMware  2020-11-30  4039) 			break;
5b7be9c709e10e Steven Rostedt (VMware  2020-11-30  4040) 
5b7be9c709e10e Steven Rostedt (VMware  2020-11-30  4041) 		case RINGBUF_TYPE_PADDING:
5b7be9c709e10e Steven Rostedt (VMware  2020-11-30  4042) 			ts += event->time_delta;
0b9036efd83d4a Steven Rostedt (Google  2023-12-11  4043) 			pr_warn(" 0x%x:  [%lld] delta:%d PADDING\n",
0b9036efd83d4a Steven Rostedt (Google  2023-12-11  4044) 				e, ts, event->time_delta);
5b7be9c709e10e Steven Rostedt (VMware  2020-11-30  4045) 			break;
5b7be9c709e10e Steven Rostedt (VMware  2020-11-30  4046) 
5b7be9c709e10e Steven Rostedt (VMware  2020-11-30  4047) 		case RINGBUF_TYPE_DATA:
5b7be9c709e10e Steven Rostedt (VMware  2020-11-30  4048) 			ts += event->time_delta;
d40dbb617ae9a8 Steven Rostedt (Google  2023-12-19  4049) 			pr_warn(" 0x%x:  [%lld] delta:%d %s%s\n",
d40dbb617ae9a8 Steven Rostedt (Google  2023-12-19  4050) 				e, ts, event->time_delta,
d40dbb617ae9a8 Steven Rostedt (Google  2023-12-19  4051) 				show_flags(event), show_irq(event));
5b7be9c709e10e Steven Rostedt (VMware  2020-11-30  4052) 			break;
5b7be9c709e10e Steven Rostedt (VMware  2020-11-30  4053) 
5b7be9c709e10e Steven Rostedt (VMware  2020-11-30  4054) 		default:
5b7be9c709e10e Steven Rostedt (VMware  2020-11-30  4055) 			break;
5b7be9c709e10e Steven Rostedt (VMware  2020-11-30  4056) 		}
5b7be9c709e10e Steven Rostedt (VMware  2020-11-30  4057) 	}
0b9036efd83d4a Steven Rostedt (Google  2023-12-11  4058) 	pr_warn("expected end:0x%lx last event actually ended at:0x%x\n", tail, e);
5b7be9c709e10e Steven Rostedt (VMware  2020-11-30  4059) }
5b7be9c709e10e Steven Rostedt (VMware  2020-11-30  4060) 

:::::: The code at line 4010 was first introduced by commit
:::::: 5b7be9c709e10e88531f1f81e1150bbad65be1aa ring-buffer: Add test to validate the time stamp deltas

:::::: TO: Steven Rostedt (VMware) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
