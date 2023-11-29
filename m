Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39E71C68E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Nov 2023 22:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="KN4ybSOG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33066C433C8;
	Wed, 29 Nov 2023 22:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1701298381;
	bh=TAUJJVD5ScDXco0WQyxMdI6UmM00XiUUIKcfRNMRJco=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KN4ybSOGnHznXdrV40ZOvzdsIvP8Y/tZPYhLbs9HkEmQSEbPctPkvVp+LmLO0fuFy
	 FMKQr5SEoIFn3gduc2KFObPVQnA1ih1OybU456wq8yEB0whRPOXd1pY8LxU/0yZkgj
	 bzsrXB+YfZtLYZQlHHa5BfCzVsTmXp86eKb7kFt4=
Date: Wed, 29 Nov 2023 14:53:00 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Yosry Ahmed <yosryahmed@google.com>
Cc: kernel test robot <lkp@intel.com>, Domenico Cerasuolo
 <cerasuolodomenico@gmail.com>, oe-kbuild-all@lists.linux.dev, Linux Memory
 Management List <linux-mm@kvack.org>, Nhat Pham <nphamcs@gmail.com>
Subject: Re: [akpm-mm:mm-unstable 179/192] mm/zswap.c:825:17: error:
 dereferencing pointer to incomplete type 'struct mem_cgroup'
Message-Id: <20231129145300.9a178d9bb8518f8bec92b350@linux-foundation.org>
In-Reply-To: <CAJD7tkZVRPfR6jN3ymuD3Ae2h4tZ3ga6un2ieFKoKrb7YE2JRg@mail.gmail.com>
References: <202311292250.RUfWGNgx-lkp@intel.com>
	<20231129134313.656e76c2e3fec1361007633b@linux-foundation.org>
	<20231129135342.5697165df1adfff04c749082@linux-foundation.org>
	<CAJD7tkaVpM6DU9Dra6VO_rsDB-6sHejTY7jGWTqCX2do0i3HAQ@mail.gmail.com>
	<20231129142935.d9c76a2fe35efd9a4c7b4087@linux-foundation.org>
	<CAJD7tkZVRPfR6jN3ymuD3Ae2h4tZ3ga6un2ieFKoKrb7YE2JRg@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 29 Nov 2023 14:31:12 -0800 Yosry Ahmed <yosryahmed@google.com> wrote:

> > mm-memcg-change-flush_next_time-to-flush_last_time.patch
> > mm-memcg-move-vmstats-structs-definition-above-flushing-code.patch
> > mm-memcg-make-stats-flushing-threshold-per-memcg.patch
> > mm-workingset-move-the-stats-flush-into-workingset_test_recent.patch
> > mm-memcg-restore-subtree-stats-flushing.patch
> >
> > in the hope that a new version of the first series ("workload-specific
> > and memory pressure-driven zswap writeback") can be dropped in place of
> > the old version.
> >
> 
> I see. So Nhat needs to *not* rebase his patches on top of the current
> mm-unstable, right?

Sure.  Normally basing on current -linus works out.

For best accuracy the base could be the preceding patch in mm-unstable
which in this case is "zram: use kmap_local_page()", but that level of
fiddling is rarely needed.

Alternatively, if the changes are small then sending me a shower of
small fixups against latest mm-unstable works.  I'll figure out how to
arrange things so everything lands nicely.

