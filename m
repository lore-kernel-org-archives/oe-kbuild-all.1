Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66972D8391
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jan 2026 23:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767740887; cv=none; b=jUdpAkrSlxst/xqP4lQyci7n094pbYMxWMy9KekrZstrR75pJg9tRiI6krYn75ssJbtV+NRsiGyomwxpk29lTjfF0BHrKiUIRKnP0tq5JaxWjMUJ1fczW26xkifnz2IOcxQX6EpfsjeVt3UOrNybEnsc3I80ZNfIpOqJ/JFAwJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767740887; c=relaxed/simple;
	bh=UpFaUM4jGABoMXMwHeRvt6GlU/2g9tCAjLCANS36qrc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=cIwIBBisGk6Eu8qwJaSuXirLeA+fD3bSsQerP9/L5Z8Rcoj0rmNP8HmN5CFqGToabMB/IxY76mHhjLy8ET5qzAEsCfYwyrRCy4UNxdKCY30/PjMft+NqSJqdm749YA++qsoqHSiWJgbc/HlJVTI1J2ap4OL5iXDryl25hsY388o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=FQ/27CFu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="FQ/27CFu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38C41C116C6;
	Tue,  6 Jan 2026 23:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1767740886;
	bh=UpFaUM4jGABoMXMwHeRvt6GlU/2g9tCAjLCANS36qrc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FQ/27CFu+SxaZlQPUTTaeH2uud12AM2F4tYnwm7yOF/x/uwf1b/tNG7FBlGvJIfH8
	 YgDKn4uZHAKFXmaqulu01Xy+t6+Y4CYFdXKOJZHKrb/SCXw3b5XDgb4BpMJKhRTfWM
	 +E0ZdFGmQPGI+rdlIZufrhh1VK7X/i/lrrGVVaR4=
Date: Tue, 6 Jan 2026 15:08:05 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Sid Kumar <sidhartha.kumar@oracle.com>
Cc: kernel test robot <lkp@intel.com>, Thomas Ballasi
 <tballasi@linux.microsoft.com>, oe-kbuild-all@lists.linux.dev, David
 Hildenbrand <david@kernel.org>, Linux Memory Management List
 <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-new 224/226] include/trace/events/vmscan.h:238:68:
 error: invalid use of undefined type 'struct mem_cgroup'
Message-Id: <20260106150805.e85104680973b055f936b0fb@linux-foundation.org>
In-Reply-To: <5e7c57c3-f08a-4411-bd5f-588a4c548cdc@oracle.com>
References: <202601070540.h0lMglk1-lkp@intel.com>
	<5e7c57c3-f08a-4411-bd5f-588a4c548cdc@oracle.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 6 Jan 2026 15:52:09 -0600 Sid Kumar <sidhartha.kumar@oracle.com> wrote:

> On 1/6/26 3:41 PM, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
> > head:   d51d3f6765d29ab5cdc6a59ad832017e660d5add
> > commit: b84bca52c8e661aa7da507a03cc3f6831fef2edf [224/226] mm: vmscan: add cgroup IDs to vmscan tracepoints
> > config: i386-randconfig-011-20260107 (https://download.01.org/0day-ci/archive/20260107/202601070540.h0lMglk1-lkp@intel.com/config)
> > compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260107/202601070540.h0lMglk1-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202601070540.h0lMglk1-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >     In file included from include/trace/define_trace.h:132,
> >                      from include/trace/events/vmscan.h:554,
> >                      from mm/vmscan.c:73:
> >     include/trace/events/vmscan.h: In function 'do_trace_event_raw_event_mm_shrink_slab_start':
> >>> include/trace/events/vmscan.h:238:68: error: invalid use of undefined type 'struct mem_cgroup'
> >       238 |                 __entry->memcg_id = sc->memcg ? cgroup_id(sc->memcg->css.cgroup) : 0;
> 
> 
> I ran into the same issue when trying to build mm-new with # 
> CONFIG_MEMCG is not set
> 
> The below diff allowed me to build, but not sure if the correct fix:

Thanks.  The series seems to have a few issues so I'll drop it for now.

tracing-add-__event_in_irq-helpers.patch
mm-vmscan-add-cgroup-ids-to-vmscan-tracepoints.patch
mm-vmscan-add-pids-to-vmscan-tracepoints.patch

