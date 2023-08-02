Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BB88BF7
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Aug 2023 14:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690986440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4oEm+XI4wGkYF2sK8c4dDkwMQf559+v1snK5WxuIJx8=;
	b=b/9EGdVttj1my/OX4KmHyBzPmGPGKYUV0C4f3ldn64EKz0dQ3fyTF5SA3GRyNje87iV9AK
	gF1UU909hJlWjSSfpH9y7TYUrkIvPiyrVnVJlyGQHAyyBE9zhJQb8IPhHdNYffXLOfxc0B
	9vexZek4tVpsrJO5rbyE0hLfIDbhcDI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-670-dbNc9ZBYNoG-EvlcKxN3eA-1; Wed, 02 Aug 2023 10:27:18 -0400
X-MC-Unique: dbNc9ZBYNoG-EvlcKxN3eA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D034104D513;
	Wed,  2 Aug 2023 14:27:18 +0000 (UTC)
Received: from lorien.usersys.redhat.com (unknown [10.39.192.77])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D4B51454143;
	Wed,  2 Aug 2023 14:27:16 +0000 (UTC)
Date: Wed, 2 Aug 2023 10:27:14 -0400
From: Phil Auld <pauld@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [peterz-queue:sched/core 6/6] kernel/sched/fair.c:6274:6: error:
 redefinition of 'cfs_task_bw_constrained'
Message-ID: <20230802142714.GC325565@lorien.usersys.redhat.com>
References: <202308020619.VgTRqYwU-lkp@intel.com>
 <20230801225727.GE119080@hirez.programming.kicks-ass.net>
 <20230802134900.GA325565@lorien.usersys.redhat.com>
 <20230802142030.GB212435@hirez.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230802142030.GB212435@hirez.programming.kicks-ass.net>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 02, 2023 at 04:20:30PM +0200 Peter Zijlstra wrote:
> On Wed, Aug 02, 2023 at 09:49:00AM -0400, Phil Auld wrote:
> 
> > I missed the !CGROUP_SCHED case...
> > 
> > I think the below will fix this.   The kconfig system enforces a dependency
> > for the !CGROUP_SCHED case (forcing !CFS_BANDWIDTH) but the actual ideffery
> > doesn't.  So with !CGROUP_SCHED we get the !CFS_BANDWIDTH code too and
> > so duplicate definitions.
> > 
> > I could not find a way to get that added static dummy definition to
> > help anything w/o causing this duplicate.  It would require not
> > compiling fair.c as far as I can tell.
> > 
> > I'm still running through my now expanded config matrix. It takes a while
> > on my 4 core lappie :)
> 
> Wait what, you build on a laptop ?!?
>

Only when I don't have a bigger machine reserved in the lab. I often
get a big 80 cpu thing and sit on it but since I just got back from
PTO I haven't gotten it back yet.  Plus they complain when I sit there
for too long :)


> Anyway, I've pushed it out to queue.git and the robots will tell us what
> they make of it ..
> 

Cool.  I'll try to watch for any bot-complaints.


Cheers,
Phil

-- 

