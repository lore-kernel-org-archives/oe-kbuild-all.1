Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11C12C9D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Mar 2023 23:32:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D01A5C4339C;
	Fri, 17 Mar 2023 23:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1679095950;
	bh=/tCm1L86obOUufk7D56dkllXJJ99oTn/2aNDIJC2fAk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BVCX9tdSMxZS933gOwx+Usv49KMfIh27RkCxsC4GzCVYdqIgdRJliZfliH6R3q95o
	 8yoKLv7cbeX/kZuC+x9wMBSoGGkMhvyxuG8+RRbpJtvyPJRxkpyHiLRp3Y2TVcSna8
	 27GQyhBtNqnHgfkzaT4qDgEgYlsqjooYzX+ZlB34=
Date: Fri, 17 Mar 2023 16:32:29 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Michal Hocko <mhocko@kernel.org>, Leonardo Bras <leobras@redhat.com>,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>, Frederic Weisbecker <fweisbecker@suse.de>, Peter
 Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 Marcelo Tosatti <mtosatti@redhat.com>, Johannes Weiner
 <hannes@cmpxchg.org>, Roman Gushchin <roman.gushchin@linux.dev>, Shakeel
 Butt <shakeelb@google.com>, Muchun Song <muchun.song@linux.dev>, LKML
 <linux-kernel@vger.kernel.org>, Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH 2/2] memcg: do not drain charge pcp caches on remote
 isolated cpus
Message-Id: <20230317163229.51431ba28ba82c70eaa55d81@linux-foundation.org>
In-Reply-To: <202303180617.7E3aIlHf-lkp@intel.com>
References: <20230317134448.11082-3-mhocko@kernel.org>
	<202303180617.7E3aIlHf-lkp@intel.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 18 Mar 2023 06:22:40 +0800 kernel test robot <lkp@intel.com> wrote:

>    mm/memcontrol.c: In function 'drain_all_stock':
> >> mm/memcontrol.c:2369:35: error: implicit declaration of function 'cpu_is_isolated' [-Werror=implicit-function-declaration]
>     2369 |                         else if (!cpu_is_isolated(cpu))
>          |                                   ^~~~~~~~~~~~~~~

Thanks.

--- a/mm/memcontrol.c~memcg-do-not-drain-charge-pcp-caches-on-remote-isolated-cpus-fix
+++ a/mm/memcontrol.c
@@ -63,6 +63,7 @@
 #include <linux/resume_user_mode.h>
 #include <linux/psi.h>
 #include <linux/seq_buf.h>
+#include <linux/sched/isolation.h>
 #include "internal.h"
 #include <net/sock.h>
 #include <net/ip.h>
_

