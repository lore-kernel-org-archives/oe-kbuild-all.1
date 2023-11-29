Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4980D4CB23
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Nov 2023 22:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="fRar90Wn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96634C433C7;
	Wed, 29 Nov 2023 22:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1701296975;
	bh=z9NRJgq2yaBZ8TkODMHF6Q/HOHeioPQsFlj6A/kPJow=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fRar90WnjDqWWJMwz2UoA5/cOISFkx3wPdqyt/RIpnYoC33FT+G31zAVV3BbtpEqI
	 1AON6xVDsn6r4iTYtIBbgERuzZhwzvbkRkAQ2+86S8HOdwD6Nrl1P3xW4ip9xJBVOT
	 2aEdm7hl5CQRQZiaUREB2KCn13lsG9bYI+0eHZ2E=
Date: Wed, 29 Nov 2023 14:29:35 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Yosry Ahmed <yosryahmed@google.com>
Cc: kernel test robot <lkp@intel.com>, Domenico Cerasuolo
 <cerasuolodomenico@gmail.com>, oe-kbuild-all@lists.linux.dev, Linux Memory
 Management List <linux-mm@kvack.org>, Nhat Pham <nphamcs@gmail.com>
Subject: Re: [akpm-mm:mm-unstable 179/192] mm/zswap.c:825:17: error:
 dereferencing pointer to incomplete type 'struct mem_cgroup'
Message-Id: <20231129142935.d9c76a2fe35efd9a4c7b4087@linux-foundation.org>
In-Reply-To: <CAJD7tkaVpM6DU9Dra6VO_rsDB-6sHejTY7jGWTqCX2do0i3HAQ@mail.gmail.com>
References: <202311292250.RUfWGNgx-lkp@intel.com>
	<20231129134313.656e76c2e3fec1361007633b@linux-foundation.org>
	<20231129135342.5697165df1adfff04c749082@linux-foundation.org>
	<CAJD7tkaVpM6DU9Dra6VO_rsDB-6sHejTY7jGWTqCX2do0i3HAQ@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 29 Nov 2023 14:18:15 -0800 Yosry Ahmed <yosryahmed@google.com> wrote:

> On Wed, Nov 29, 2023 at 1:53 PM Andrew Morton <akpm@linux-foundation.org> wrote:
> >
> > On Wed, 29 Nov 2023 13:43:13 -0800 Andrew Morton <akpm@linux-foundation.org> wrote:
> >
> > > On Wed, 29 Nov 2023 23:42:11 +0800 kernel test robot <lkp@intel.com> wrote:
> > >
> > > > >> mm/zswap.c:825:17: error: dereferencing pointer to incomplete type 'struct mem_cgroup'
> > > >       css_get(&memcg->css);
> > > >                     ^~
> > >
> > > OK, thanks, patchset needs work for CONFIG_MEMCG=n.  I'll drop this version.
> >
> > Well that's annoying - the "mm: memcg: subtree stats flushing and
> > thresholds" series had lots of dependencies on this series.
> 
> FWIW, the "mm: memcg: subtree stats flushing and thresholds" series
> has no actual dependency on the zswap series. The conflicts come from
> patch 2, which moves some code in mm/memcontrol.c, which happens to be
> touched by the zswap series. The first 2 patches of the stats series
> are just refactoring with no functional changes, so if those two can
> remain in mm-unstable, independent of the remaining of the series or
> the zswap series, then either Nhat or I could easily rebased our
> patches on top of them, and you can easily move the series in & out of
> mm-unstable without conflicts.
> 
> Another thing is, the only difference between v3 & v4 of the "mm:
> memcg: subtree stats flushing and thresholds" series is the rebase on
> top of the zswap series. So if you want, you can take both series out,
> and add in v3 of the stats series instead of v4. If you need to remove
> the stast series again in the future, you can leave the first two
> patches to avoid conflicts with the zswap series.
> 

Ok, thanks.  I prefer not to make what is in mm.git too different from
what was sent.

I've left everything in place:

list_lru-allows-explicit-memcg-and-numa-node-selection.patch
memcontrol-add-a-new-function-to-traverse-online-only-memcg-hierarchy.patch
zswap-make-shrinking-memcg-aware.patch
zswap-make-shrinking-memcg-aware-fix.patch
mm-memcg-add-per-memcg-zswap-writeback-stat.patch
selftests-cgroup-update-per-memcg-zswap-writeback-selftest.patch
zswap-shrinks-zswap-pool-based-on-memory-pressure.patch
#
...
#
mm-memcg-change-flush_next_time-to-flush_last_time.patch
mm-memcg-move-vmstats-structs-definition-above-flushing-code.patch
mm-memcg-make-stats-flushing-threshold-per-memcg.patch
mm-workingset-move-the-stats-flush-into-workingset_test_recent.patch
mm-memcg-restore-subtree-stats-flushing.patch

in the hope that a new version of the first series ("workload-specific
and memory pressure-driven zswap writeback") can be dropped in place of
the old version.

