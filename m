Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068981CD1E4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Jul 2025 23:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752968289; cv=none; b=b7hM22k13kHaxygDdrIId79WlMpNuds+/XP00iSlIC9AzkAc3nqZB5cVj0G41PR7k9K/bhkuZ7RZmWtnbv+BzSoejS+zUIzWAQGcSdaM7TF4OuvJb224V3oF9+9lwzRMsNjIv3XcAKbMTP/9+EkXY3VKvD6PJr4iXkVwnrDxKO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752968289; c=relaxed/simple;
	bh=PaV4HcuG8Z9WXy5NHbKnBdf1/nYAFp4jEzTMozwL6Q4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=UCjSMqQzr8hZzlbTmJ7tgYhj6PkYocOFK7sRpfSUWcZdYSfVcsEKS9OiadBMSedjsMiZEpESsDfHXcXi9iiNF2GxPxgivQcbrT6RISOiN5IhbUUr7ViTVwXnkEvURzleBYVfZ3/VRcSII8s6+MwF4rxU+s4JKfQFyJoZZtaBDkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=rF5ZMXi7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="rF5ZMXi7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AFA9C4CEE3;
	Sat, 19 Jul 2025 23:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1752968288;
	bh=PaV4HcuG8Z9WXy5NHbKnBdf1/nYAFp4jEzTMozwL6Q4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rF5ZMXi7XMfw526opy/XVRlsafUH4J8JA3+dYf50xsqNwtJaLcYSDv/t66z+fpE0S
	 kFOfOrl4zKPlar3UgxBqlS3NHv4SBxUWJnDrxsyXOkAgSasDg3RHXi4BFbTNgRqIj2
	 0IVaEuYIw/PFY2bTk+K3RKGzDztMSv5/O7Er/U5E=
Date: Sat, 19 Jul 2025 16:38:07 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: kernel test robot <lkp@intel.com>, Ye Liu <ye.liu@linux.dev>, David
 Hildenbrand <david@redhat.com>, Davidlohr Bueso <dave@stgolabs.net>,
 "Paul E. McKenney" <paulmck@kernel.org>, Josh Triplett
 <josh@joshtriplett.org>, Frederic Weisbecker <frederic@kernel.org>, Neeraj
 Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes
 <joelagnelf@nvidia.com>, Boqun Feng <boqun.feng@gmail.com>, Uladzislau
 Rezki <urezki@gmail.com>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra
 <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, oe-kbuild-all@lists.linux.dev, Linux Memory
 Management List <linux-mm@kvack.org>, Ye Liu <liuye@kylinos.cn>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan
 <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Steven Rostedt
 <rostedt@goodmis.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall
 <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider
 <vschneid@redhat.com>
Subject: Re: [PATCH] mm: Replace (20 - PAGE_SHIFT) with common macros for
 pages<->MB conversion
Message-Id: <20250719163807.068d4cb349c6a3395183167b@linux-foundation.org>
In-Reply-To: <87dff86f-94b8-47aa-b2e1-7560a9f60818@lucifer.local>
References: <20250718024134.1304745-1-ye.liu@linux.dev>
	<202507190319.0rqhQw5l-lkp@intel.com>
	<87dff86f-94b8-47aa-b2e1-7560a9f60818@lucifer.local>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 19 Jul 2025 07:56:16 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:

> Ah yeah looks like this is already defined for arc only (!) in
> arch/arc/include/asm/arcregs.h.
> 
> Maybe pop in a #ifndef PAGES_TO_MB ? It seems to be equivalent.

Well, those arc helpers

/* Helpers */
#define TO_KB(bytes)		((bytes) >> 10)
#define TO_MB(bytes)		(TO_KB(bytes) >> 10)
#define PAGES_TO_KB(n_pages)	((n_pages) << (PAGE_SHIFT - 10))
#define PAGES_TO_MB(n_pages)	(PAGES_TO_KB(n_pages) >> 10)

are simply in the wrong place.

I was thinking move all four into mm.h (for the lack of a better
place).  Then someone can make a career out of hunting down all the code
sites which can use them.

eg,

hp2:/usr/src/linux-6.16-rc5> fgrep -r ">> 10" . | wc -l
886
