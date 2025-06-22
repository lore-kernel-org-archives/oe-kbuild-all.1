Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083F3E555
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Jun 2025 18:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750618798; cv=none; b=CWi/0nH0QMezw6L88vdSk+9LWWygPRIYr3YodYBCsKt6xhybplOwAg5dYmGP8QcASuib5T4OD2VDtC1xuHgNomQoJjugimkK7HdhlYby+eZUWDYD95MjI8UZR/GYEQM4f4uJ6+dD8SWBIVchW/w0AnHGDcleVEvvJsrCznl4sZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750618798; c=relaxed/simple;
	bh=m0pZ8uAaTgnsQwnixwd5/bXPPLvhonJD8aJcNIqH8DU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=rHzz8TfsXGYcdfLDZV/rMYQEQUqMY4r5Y4n2Vp5maYEF5x1FknF0mAgnKyPK521AMNYnmKZke6VT3BaQbbc4TMBVBv03YwiN1c2XFdUYtjMLrTaHpoRtCKwY2XCAWs0sHZvrSdblqaBVvAoAGHPudRPOumfYqp/WZrqjiraiunU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=s/GDhjOn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="s/GDhjOn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51B7BC4CEE3;
	Sun, 22 Jun 2025 18:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1750618797;
	bh=m0pZ8uAaTgnsQwnixwd5/bXPPLvhonJD8aJcNIqH8DU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=s/GDhjOn9o3zQiSA/csm8EIMYbWKN8I9xaje30oel3v3jO/RkTfRiQZiY8SuHxobb
	 Q8h5un0mhUB8TEwXb0MvZS1Ekcj/duQZS0gZMQXEgAiLYfkTISVcIv2TOxid+MbRUk
	 ysmZ8TYKDGJ4+ybtPAO6NOyy7wRwoINgvMklO7to=
Date: Sun, 22 Jun 2025 11:59:56 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Oscar Salvador <osalvador@suse.de>, oe-kbuild-all@lists.linux.dev, Linux
 Memory Management List <linux-mm@kvack.org>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Harry Yoo <harry.yoo@oracle.com>, Vlastimil
 Babka <vbabka@suse.cz>
Subject: Re: [akpm-mm:mm-new 59/87] mm/slub.c:6168:23: error: invalid use of
 undefined type 'struct node_notify'
Message-Id: <20250622115956.850bc91112e34f2bf4413b3e@linux-foundation.org>
In-Reply-To: <202506202144.dGkFxasv-lkp@intel.com>
References: <202506202144.dGkFxasv-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 20 Jun 2025 21:20:11 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
> head:   647b5532fd070b0a20f01c5bad726fac7f490a53
> commit: d0b0b62aa0d6d93098331467596c34b252bfad11 [59/87] mm,slub: use node-notifier instead of memory-notifier
> config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20250620/202506202144.dGkFxasv-lkp@intel.com/config)
> compiler: mips-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506202144.dGkFxasv-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506202144.dGkFxasv-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    mm/slub.c: In function 'slab_mem_going_online_callback':
> >> mm/slub.c:6168:23: error: invalid use of undefined type 'struct node_notify'
>     6168 |         int nid = narg->nid;
>          |                       ^~
>    mm/slub.c: In function 'slab_memory_callback':

I can't reproduce this.  Same compiler, same config.  Oh well, I added
the obvious:

--- a/mm/slub.c~mmslub-use-node-notifier-instead-of-memory-notifier-fix
+++ a/mm/slub.c
@@ -23,6 +23,7 @@
 #include <linux/proc_fs.h>
 #include <linux/seq_file.h>
 #include <linux/kasan.h>
+#include <linux/node.h>
 #include <linux/kmsan.h>
 #include <linux/cpu.h>
 #include <linux/cpuset.h>
_

