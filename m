Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1F57488
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Aug 2023 14:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8Xx/uGhewhDUKLUu0qNNW4RCwp2dMJMlG/lDe97O+0M=; b=TVJvGhrE/sFg4H3z4Mdxwl6lrj
	i8GieUxmas2FtfZkYtvOUqUPtIJaeqlZrDZrSr1GAihtSFt1Me+UGehIyZi1GjkJK31ubN6ljvvg7
	yCExRe4G1wkKMAqjbiddbRjhPJnEDRNKBniM34JsPIUqT6ZLYneH1fk3sd51BedjA96UM9O8zabnN
	DgmZHZBYt5nn0PjTroTWpMpW1iqt//tqd7QET0l7bTQdYdMyLyzFyzk2v5uQECToeQoEUPRzOPn8R
	AISK0b8HvhVh3jz05bs9PGMiTN/NGDBT/jgaJ9LGbMLw0q7pFm7z93m0ASNPBN7PjzGluvr4HQLdl
	JjiBbavQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qRCiF-00FzPH-01;
	Wed, 02 Aug 2023 14:20:31 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 65E2430007E;
	Wed,  2 Aug 2023 16:20:30 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 46478201BAAFF; Wed,  2 Aug 2023 16:20:30 +0200 (CEST)
Date: Wed, 2 Aug 2023 16:20:30 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Phil Auld <pauld@redhat.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [peterz-queue:sched/core 6/6] kernel/sched/fair.c:6274:6: error:
 redefinition of 'cfs_task_bw_constrained'
Message-ID: <20230802142030.GB212435@hirez.programming.kicks-ass.net>
References: <202308020619.VgTRqYwU-lkp@intel.com>
 <20230801225727.GE119080@hirez.programming.kicks-ass.net>
 <20230802134900.GA325565@lorien.usersys.redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802134900.GA325565@lorien.usersys.redhat.com>

On Wed, Aug 02, 2023 at 09:49:00AM -0400, Phil Auld wrote:

> I missed the !CGROUP_SCHED case...
> 
> I think the below will fix this.   The kconfig system enforces a dependency
> for the !CGROUP_SCHED case (forcing !CFS_BANDWIDTH) but the actual ideffery
> doesn't.  So with !CGROUP_SCHED we get the !CFS_BANDWIDTH code too and
> so duplicate definitions.
> 
> I could not find a way to get that added static dummy definition to
> help anything w/o causing this duplicate.  It would require not
> compiling fair.c as far as I can tell.
> 
> I'm still running through my now expanded config matrix. It takes a while
> on my 4 core lappie :)

Wait what, you build on a laptop ?!?

Anyway, I've pushed it out to queue.git and the robots will tell us what
they make of it ..
