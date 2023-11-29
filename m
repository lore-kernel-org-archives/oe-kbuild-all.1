Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24EF4CB20
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Nov 2023 21:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="iXcX3qVm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 589CDC433C7;
	Wed, 29 Nov 2023 21:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1701294823;
	bh=iakV+cijkspHV/4vv/1mV70eQzSquBPbs8fsfcbwtlU=;
	h=Date:From:To:Subject:In-Reply-To:References:From;
	b=iXcX3qVmP08Zr2gs6N3kKOXcjzfb8xaTdb2lyHCO267rmojWcPz2edjnNBm0tjKwv
	 GaKW1YfnYFcAKmQIPV0mbWsMd/W7KQ6WXGZaLN9lsEvTkyivT2ERIBvfqlhA2oNvw6
	 VztIrEHqHTOoyz+j2lzS/I7kGjrFhoQSfXkVCDe4=
Date: Wed, 29 Nov 2023 13:53:42 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>, Domenico Cerasuolo
 <cerasuolodomenico@gmail.com>, oe-kbuild-all@lists.linux.dev, Linux Memory
 Management List <linux-mm@kvack.org>, Nhat Pham <nphamcs@gmail.com>
Subject: Re: [akpm-mm:mm-unstable 179/192] mm/zswap.c:825:17: error:
 dereferencing pointer to incomplete type 'struct mem_cgroup'
Message-Id: <20231129135342.5697165df1adfff04c749082@linux-foundation.org>
In-Reply-To: <20231129134313.656e76c2e3fec1361007633b@linux-foundation.org>
References: <202311292250.RUfWGNgx-lkp@intel.com>
	<20231129134313.656e76c2e3fec1361007633b@linux-foundation.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 29 Nov 2023 13:43:13 -0800 Andrew Morton <akpm@linux-foundation.org> wrote:

> On Wed, 29 Nov 2023 23:42:11 +0800 kernel test robot <lkp@intel.com> wrote:
> 
> > >> mm/zswap.c:825:17: error: dereferencing pointer to incomplete type 'struct mem_cgroup'
> >       css_get(&memcg->css);
> >                     ^~
> 
> OK, thanks, patchset needs work for CONFIG_MEMCG=n.  I'll drop this version.

Well that's annoying - the "mm: memcg: subtree stats flushing and
thresholds" series had lots of dependencies on this series.

So I'll restore this series with this hack:


 include/linux/memcontrol.h |    5 +++++
 mm/zswap.c                 |    3 +++
 2 files changed, 8 insertions(+)

--- a/include/linux/memcontrol.h~zswap-make-shrinking-memcg-aware-fix
+++ a/include/linux/memcontrol.h
@@ -1165,6 +1165,11 @@ unsigned long mem_cgroup_soft_limit_recl
 
 #define MEM_CGROUP_ID_SHIFT	0
 
+static inline struct mem_cgroup *obj_cgroup_memcg(struct obj_cgroup *objcg)
+{
+	return NULL;
+}
+
 static inline struct mem_cgroup *folio_memcg(struct folio *folio)
 {
 	return NULL;
--- a/mm/zswap.c~zswap-make-shrinking-memcg-aware-fix
+++ a/mm/zswap.c
@@ -32,6 +32,7 @@
 #include <linux/mm_types.h>
 #include <linux/page-flags.h>
 #include <linux/swapops.h>
+#include <linux/memcontrol.h>
 #include <linux/writeback.h>
 #include <linux/pagemap.h>
 #include <linux/workqueue.h>
@@ -822,7 +823,9 @@ static void shrink_worker(struct work_st
 		 * Acquire an extra reference to the iterated memcg in case the
 		 * original reference is dropped by the zswap offlining callback.
 		 */
+#ifdef CONFIG_MEMCG
 		css_get(&memcg->css);
+#endif
 		spin_unlock(&zswap_pools_lock);
 
 		ret = shrink_memcg(memcg);
_

