Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434E67F8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Mar 2023 08:03:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 41FFD1FE51;
	Sat, 18 Mar 2023 08:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1679126623; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jXvcZJ9gcO/Gy66DNQ9ErC3M6Vf4j6rmw8rucTPwz/k=;
	b=MmHb31MIdModKA5DHpShfuWrNKRWubjzSBPL4LnqH7XqLYdp9x4OScRGSl8yyr82uvLaUg
	i+qrF3WTifnW00av4PpDPAJCbygGp4sU1PhKv3YzSy7GYfAzxX8SbDxgYeNxlydn7hgvfH
	/sQpPcx/cnOp0WeBT7g3/OFckqcyy9Y=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1A94F13A00;
	Sat, 18 Mar 2023 08:03:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id g3xTBV9wFWRqOQAAMHmgww
	(envelope-from <mhocko@suse.com>); Sat, 18 Mar 2023 08:03:43 +0000
Date: Sat, 18 Mar 2023 09:03:42 +0100
From: Michal Hocko <mhocko@suse.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, Leonardo Bras <leobras@redhat.com>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Frederic Weisbecker <fweisbecker@suse.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeelb@google.com>,
	Muchun Song <muchun.song@linux.dev>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] memcg: do not drain charge pcp caches on remote
 isolated cpus
Message-ID: <ZBVwXgaaF2r/v8At@dhcp22.suse.cz>
References: <20230317134448.11082-3-mhocko@kernel.org>
 <202303180617.7E3aIlHf-lkp@intel.com>
 <20230317163229.51431ba28ba82c70eaa55d81@linux-foundation.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230317163229.51431ba28ba82c70eaa55d81@linux-foundation.org>

On Fri 17-03-23 16:32:29, Andrew Morton wrote:
> On Sat, 18 Mar 2023 06:22:40 +0800 kernel test robot <lkp@intel.com> wrote:
> 
> >    mm/memcontrol.c: In function 'drain_all_stock':
> > >> mm/memcontrol.c:2369:35: error: implicit declaration of function 'cpu_is_isolated' [-Werror=implicit-function-declaration]
> >     2369 |                         else if (!cpu_is_isolated(cpu))
> >          |                                   ^~~~~~~~~~~~~~~
> 
> Thanks.
> 
> --- a/mm/memcontrol.c~memcg-do-not-drain-charge-pcp-caches-on-remote-isolated-cpus-fix
> +++ a/mm/memcontrol.c
> @@ -63,6 +63,7 @@
>  #include <linux/resume_user_mode.h>
>  #include <linux/psi.h>
>  #include <linux/seq_buf.h>
> +#include <linux/sched/isolation.h>
>  #include "internal.h"
>  #include <net/sock.h>
>  #include <net/ip.h>

Thanks a lot Andrew!
> _

-- 
Michal Hocko
SUSE Labs
