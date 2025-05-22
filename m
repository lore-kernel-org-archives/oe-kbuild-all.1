Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19B2EC5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 May 2025 02:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747880868; cv=none; b=uH0WMQZLRK6JM0B9lyABo2M+eIYFh3jrim8kgiD38YscqLPPkwuB4efnm/PF2VPOZIiqzJldvXNYOFDWbTy1BDvJSbWeA9c4FfBVfYnfjf1LlRRto+P4YixKUL0PIcFRp7nZSN9jHVxhGpXLqOCRrl5bntwwSnepIQ7V8b5K0XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747880868; c=relaxed/simple;
	bh=gNOwzMp4TRhCI8dh9SGw0oJ5FL1pq/wloofdGnSxPwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NhQam4XhUgat1g2T0bEsWKpfc80W5FT/5Fi7/CGljhj7PkbV0SNq0yIypd77rT2ZNF1J+HWprr/thWd8/hlhARiKGaSY6HbMUxndu5Z0CfCSiO8rmA6DD+p56nFiJT4x7yAVGhJn0JGnr6PDSaRKoBZPVsdHM4w6c+8Wv9IFQMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V5x9kDnF; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V5x9kDnF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747880867; x=1779416867;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gNOwzMp4TRhCI8dh9SGw0oJ5FL1pq/wloofdGnSxPwU=;
  b=V5x9kDnF4oBKTt01RDHk0RnDi56eSSOKrnizIW4lc1caHgrTtnbkQtfv
   Dq+Sp0NlHbUlRrMvk+vy11wWRH+SB02sYgMjlZf/BzWIMh1T/uX1EFKhU
   Ip+1AqlCVYhuuUMP+SzmzSzhSaMEWUbqpJ0LM6FIHpc3pUwdWohjt+yuj
   5LhLIIW2w6gPDeD1PTKHXmJnCH9pg5/AglM32lY8f4vr9lBD5RDpZD0xi
   alJ9yseP3LgpXfgDA89DXtfrLJFf+w4Rm35OCOa+BdY+qjrY+VJceqVE3
   6Eu2JRIC00RKiqBbVQhzr/l8EN1n7RATOajHYjjsporphnoN8am0dF1NE
   w==;
X-CSE-ConnectionGUID: /+X5UYxyRvWbdK71qcjv7Q==
X-CSE-MsgGUID: UVB8mMYiRdOvKvwoajwAOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="60936527"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="60936527"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 19:27:47 -0700
X-CSE-ConnectionGUID: TthujAUYRvq7eWu8oocABw==
X-CSE-MsgGUID: IQY7CRRdQGO2XLchd2L/aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="163627451"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 May 2025 19:27:42 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHvem-000OqG-1S;
	Thu, 22 May 2025 02:27:40 +0000
Date: Thu, 22 May 2025 10:27:31 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Philipp Stanner <phasta@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
	Tvrtko Ursulin <tursulin@igalia.com>,
	Arvind Yadav <arvind.yadav@amd.com>, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 08/10] drm: Get rid of drm_sched_job.id
Message-ID: <202505221031.qXNz9Ikv-lkp@intel.com>
References: <20250521154531.10541-9-pierre-eric.pelloux-prayer@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521154531.10541-9-pierre-eric.pelloux-prayer@amd.com>

Hi Pierre-Eric,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on next-20250521]
[cannot apply to lwn/docs-next linus/master v6.15-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pierre-Eric-Pelloux-Prayer/drm-debugfs-Output-client_id-in-in-drm_clients_info/20250521-235024
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250521154531.10541-9-pierre-eric.pelloux-prayer%40amd.com
patch subject: [PATCH v10 08/10] drm: Get rid of drm_sched_job.id
config: i386-buildonly-randconfig-002-20250522 (https://download.01.org/0day-ci/archive/20250522/202505221031.qXNz9Ikv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505221031.qXNz9Ikv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505221031.qXNz9Ikv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:119,
                    from drivers/gpu/drm/lima/lima_trace.h:50,
                    from drivers/gpu/drm/lima/lima_trace.c:7:
   include/trace/../../drivers/gpu/drm/lima/lima_trace.h: In function 'do_trace_event_raw_event_lima_task':
>> include/trace/../../drivers/gpu/drm/lima/lima_trace.h:24:46: error: 'struct drm_sched_job' has no member named 'id'
      24 |                 __entry->task_id = task->base.id;
         |                                              ^
   include/trace/trace_events.h:427:11: note: in definition of macro '__DECLARE_EVENT_CLASS'
     427 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/trace_events.h:435:23: note: in expansion of macro 'PARAMS'
     435 |                       PARAMS(assign), PARAMS(print))                    \
         |                       ^~~~~~
   include/trace/../../drivers/gpu/drm/lima/lima_trace.h:13:1: note: in expansion of macro 'DECLARE_EVENT_CLASS'
      13 | DECLARE_EVENT_CLASS(lima_task,
         | ^~~~~~~~~~~~~~~~~~~
   include/trace/../../drivers/gpu/drm/lima/lima_trace.h:23:9: note: in expansion of macro 'TP_fast_assign'
      23 |         TP_fast_assign(
         |         ^~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:120:
   include/trace/../../drivers/gpu/drm/lima/lima_trace.h: In function 'do_perf_trace_lima_task':
>> include/trace/../../drivers/gpu/drm/lima/lima_trace.h:24:46: error: 'struct drm_sched_job' has no member named 'id'
      24 |                 __entry->task_id = task->base.id;
         |                                              ^
   include/trace/perf.h:51:11: note: in definition of macro '__DECLARE_EVENT_CLASS'
      51 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/perf.h:67:23: note: in expansion of macro 'PARAMS'
      67 |                       PARAMS(assign), PARAMS(print))                    \
         |                       ^~~~~~
   include/trace/../../drivers/gpu/drm/lima/lima_trace.h:13:1: note: in expansion of macro 'DECLARE_EVENT_CLASS'
      13 | DECLARE_EVENT_CLASS(lima_task,
         | ^~~~~~~~~~~~~~~~~~~
   include/trace/../../drivers/gpu/drm/lima/lima_trace.h:23:9: note: in expansion of macro 'TP_fast_assign'
      23 |         TP_fast_assign(
         |         ^~~~~~~~~~~~~~


vim +24 include/trace/../../drivers/gpu/drm/lima/lima_trace.h

7f60c4b9d964f6 Qiang Yu                2020-03-07  12  
7f60c4b9d964f6 Qiang Yu                2020-03-07  13  DECLARE_EVENT_CLASS(lima_task,
7f60c4b9d964f6 Qiang Yu                2020-03-07  14  	TP_PROTO(struct lima_sched_task *task),
7f60c4b9d964f6 Qiang Yu                2020-03-07  15  	TP_ARGS(task),
7f60c4b9d964f6 Qiang Yu                2020-03-07  16  	TP_STRUCT__entry(
7f60c4b9d964f6 Qiang Yu                2020-03-07  17  		__field(uint64_t, task_id)
7f60c4b9d964f6 Qiang Yu                2020-03-07  18  		__field(unsigned int, context)
7f60c4b9d964f6 Qiang Yu                2020-03-07  19  		__field(unsigned int, seqno)
7f60c4b9d964f6 Qiang Yu                2020-03-07  20  		__string(pipe, task->base.sched->name)
7f60c4b9d964f6 Qiang Yu                2020-03-07  21  		),
7f60c4b9d964f6 Qiang Yu                2020-03-07  22  
7f60c4b9d964f6 Qiang Yu                2020-03-07  23  	TP_fast_assign(
7f60c4b9d964f6 Qiang Yu                2020-03-07 @24  		__entry->task_id = task->base.id;
7f60c4b9d964f6 Qiang Yu                2020-03-07  25  		__entry->context = task->base.s_fence->finished.context;
7f60c4b9d964f6 Qiang Yu                2020-03-07  26  		__entry->seqno = task->base.s_fence->finished.seqno;
2c92ca849fcc6e Steven Rostedt (Google  2024-05-16  27) 		__assign_str(pipe);
7f60c4b9d964f6 Qiang Yu                2020-03-07  28  		),
7f60c4b9d964f6 Qiang Yu                2020-03-07  29  
7f60c4b9d964f6 Qiang Yu                2020-03-07  30  	TP_printk("task=%llu, context=%u seqno=%u pipe=%s",
7f60c4b9d964f6 Qiang Yu                2020-03-07  31  		  __entry->task_id, __entry->context, __entry->seqno,
7f60c4b9d964f6 Qiang Yu                2020-03-07  32  		  __get_str(pipe))
7f60c4b9d964f6 Qiang Yu                2020-03-07  33  );
7f60c4b9d964f6 Qiang Yu                2020-03-07  34  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
