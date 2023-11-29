Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347712B9A6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Nov 2023 21:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="LX9VsoLx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 660C2C433C8;
	Wed, 29 Nov 2023 21:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1701293672;
	bh=kL0I4MRvgCEdIteyNipWsQFBfblx1ugzGlG1DkHTDmw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LX9VsoLxBIdgK1BYev8DQfent849BcS/GMmf8Z3RlNkoMdZHGxEHrUVrFmy6eNvF7
	 2FA4ZJBgXh8HQqQwyc2c8/u0loEgSrMuWgk5QKbel7Utosdp0lQ7RLtLkN7USzpsNS
	 FLYT4kV+pyfNsQ+WI3nXedP3WhZUNrEdB9FTdsPk=
Date: Wed, 29 Nov 2023 13:34:31 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Domenico Cerasuolo <cerasuolodomenico@gmail.com>,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>, Nhat Pham <nphamcs@gmail.com>
Subject: Re: [akpm-mm:mm-unstable 179/192] mm/zswap.c:298:24: error: call to
 undeclared function 'obj_cgroup_memcg'; ISO C99 and later do not support
 implicit function declarations
Message-Id: <20231129133431.73512e280e870efaa17f9f4d@linux-foundation.org>
In-Reply-To: <202311292305.43bnw55s-lkp@intel.com>
References: <202311292305.43bnw55s-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 29 Nov 2023 23:42:15 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   cb1d236cb1038fa1bbae9913803f1c655b86d931
> commit: 70dd375afcfe1839321ea8a65749404a99f0e773 [179/192] zswap: make shrinking memcg-aware
> config: s390-randconfig-r071-20231129 (https://download.01.org/0day-ci/archive/20231129/202311292305.43bnw55s-lkp@intel.com/config)
> compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231129/202311292305.43bnw55s-lkp@intel.com/reproduce)
> 
> ...
>
> >> mm/zswap.c:298:24: error: call to undeclared function 'obj_cgroup_memcg'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>            return entry->objcg ? obj_cgroup_memcg(entry->objcg) : NULL;
>                                  ^
>    mm/zswap.c:298:24: note: did you mean 'obj_cgroup_put'?
>    include/linux/memcontrol.h:1352:20: note: 'obj_cgroup_put' declared here

Well I'm going to assume it's this:

--- a/mm/zswap.c~zswap-make-shrinking-memcg-aware-fix
+++ a/mm/zswap.c
@@ -29,6 +29,7 @@
 #include <linux/zpool.h>
 #include <crypto/acompress.h>
 #include <linux/zswap.h>
+#include <linux/memcontrol.h>
 #include <linux/mm_types.h>
 #include <linux/page-flags.h>
 #include <linux/swapops.h>
_

Can't test because my gcc plugins have gone stupid yet again.

cc1: error: cannot load plugin ./scripts/gcc-plugins/stackleak_plugin.so: ./scripts/gcc-plugins/stackleak_plugin.so: undefined symbol: _ZNK6frange6acceptERK14vrange_visitor
cc1: error: cannot load plugin ./scripts/gcc-plugins/randomize_layout_plugin.so: ./scripts/gcc-plugins/randomize_layout_plugin.so: undefined symbol: _ZNK6frange6acceptERK14vrange_visitor

help.
