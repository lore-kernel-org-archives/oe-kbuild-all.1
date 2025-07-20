Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EF0B661
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Jul 2025 18:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753035292; cv=none; b=lUoPvlVFuEYgNGONomNkag7ZnBP4Jah7NoEcqbcmFxeh/FbafVXind+uBPEFNDqyoXSO54fG9LXPj5GfHEwD7EVNmz53jFDM/GaLYaMY6kdHQJJ+5no8IuofN7+FDJaqrv3rZKk7/zb9IWdBDyJ3WUllBsveRIoEnNR/a3BsqrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753035292; c=relaxed/simple;
	bh=4j59W8Itm9rcumQgArm+6vGk9dokQyPHbbeRFqauc2o=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=XnIW8nyLHjMt0G6/J5gSkTJwNaWJI2IvbqNinMYpz6UGygsoMIrRs5Aaog4SR1RSjyEXBk4bCYsD6h2oJs33mi7XEPzsybf+/tojTHq6wSmxJIC8pF82y+P8XsG78X12dhvZe20vHEfkWtBSP5rxisWDWHobSvJ7GMruSlfdh5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Q0Mjwsfk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Q0Mjwsfk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49E77C4CEE7;
	Sun, 20 Jul 2025 18:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1753035292;
	bh=4j59W8Itm9rcumQgArm+6vGk9dokQyPHbbeRFqauc2o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Q0Mjwsfkt6E2H/udiafb4hIRELIOl18XM4OeiZUPgteXaOykHeNtm7DK1uheEldGN
	 ELrloAZARvAzadG7X58rjz/6XuydQZT+9XtGMPZFkW6aXFEjeu3Tw0Tbx/xfnZUCmu
	 Q02mwkgqtRil80TD4yjnA/ttbR8ZIaVnMm1z1JTM=
Date: Sun, 20 Jul 2025 11:14:50 -0700
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
Message-Id: <20250720111450.71ce91f5354e63c975094452@linux-foundation.org>
In-Reply-To: <3d459085-3b7f-4ba3-8197-832f7931bcc2@lucifer.local>
References: <20250718024134.1304745-1-ye.liu@linux.dev>
	<202507190319.0rqhQw5l-lkp@intel.com>
	<87dff86f-94b8-47aa-b2e1-7560a9f60818@lucifer.local>
	<20250719163807.068d4cb349c6a3395183167b@linux-foundation.org>
	<3d459085-3b7f-4ba3-8197-832f7931bcc2@lucifer.local>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 20 Jul 2025 09:59:55 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:

> > /* Helpers */
> > #define TO_KB(bytes)		((bytes) >> 10)
> > #define TO_MB(bytes)		(TO_KB(bytes) >> 10)
> > #define PAGES_TO_KB(n_pages)	((n_pages) << (PAGE_SHIFT - 10))
> > #define PAGES_TO_MB(n_pages)	(PAGES_TO_KB(n_pages) >> 10)
> >
> > are simply in the wrong place.
> >
> > I was thinking move all four into mm.h (for the lack of a better
> > place).  Then someone can make a career out of hunting down all the code
> > sites which can use them.
> >
> > eg,
> >
> > hp2:/usr/src/linux-6.16-rc5> fgrep -r ">> 10" . | wc -l
> > 886
> 
> Yeah I agree for sure, this is misplaced, but maybe one for a follow up
> patch?
> 
> There's more work to be done here, I already have an idea for a patch to
> fix another similar case...

OK.

I could put a couple of ifndefs in there to make this patch happy, but
this patch is just a little cleanup and it's a very small part of any
kernel-wide overhaul of these conversion operations.

So for now I think I'll retain this patch in mm-new to prevent this
linux-next build error.  I'll do this as a reminder until someone gets
down and addresses all this in a broader fashion.

