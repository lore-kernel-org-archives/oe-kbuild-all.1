Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8C3393DCB;
	Thu, 22 Jan 2026 05:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769061324; cv=none; b=jgBcSrUZbDhuu3yli5TadqYvhR4p++tFc3LesA58XDmGmz4XvZh8GJTNMqhx6lzMAzKPAkq4qKR6ePYTvcsCCDiPed/jZzv0VRVbeZBDVMLDbs4hN4ClZvmjo3UuBBiJyAymKLua6exTKyXaSNbB4GuBBKg7Ff93FWyfDEN0Yzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769061324; c=relaxed/simple;
	bh=FsEJ1i25ofqDLPMurKEIlGqdbxcvgVKLAQsTjORZPc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n+50EKdVwomtlsPTXJv3E90VXqROGxBp36O3LK8Ip6HkrxvsbUMCbSO3+Cb8Tjhfr3gad7OSmi1p0qER9vXNsyXyUNc1ATTxudxH41c+RGvSPqZ2bdaKhsf1esISd5OyBIdLX2sXcj1svmg7UgWS8TSocixH12+T+VquCBeGkVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TcEcwJDX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TcEcwJDX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2E14C116C6;
	Thu, 22 Jan 2026 05:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769061324;
	bh=FsEJ1i25ofqDLPMurKEIlGqdbxcvgVKLAQsTjORZPc0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TcEcwJDXuD62OY3g9lhU7gz5/Zw9IHOEcGPmHAXTJVWb09JQJ7c7xkfD8uuIJuoL4
	 o1/eH1CJVchZ8eWCXIFo2aINCvfIAtlr84MiTtufkyBRP7hWKbMDPIFQtHhAccdjgE
	 5VMx7TwU4ugt9PkrX88BAMmi3GyLh4c0/zHMz32l3ocOWfkYQKzMM55XF0/sSBMtKy
	 N3uZ6l5LJxMjq4pXqMCugY1TMA2Hij+sZCdn+lvzHcA90t1PEtnaXSMpZw7j363ZAN
	 YEHmQvDcFizzvsDoRGrrsE6ADlYSHjmOH4qzAZp2RWBeZyLZYy8AqaTuf+obf9A6tY
	 X5isCwHhTOVGg==
From: SeongJae Park <sj@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: SeongJae Park <sj@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	maple-tree@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Suren Baghdasaryan <surenb@google.com>,
	Matthew Wilcox <willy@infradead.org>,
	Sidhartha Kumar <sidhartha.kumar@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Alice Ryhl <aliceryhl@google.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Kujau <lists@nerdbynature.de>
Subject: Re: [PATCH v2 17/29] maple_tree: Start using maple copy node for destination
Date: Wed, 21 Jan 2026 21:55:15 -0800
Message-ID: <20260122055516.69335-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <202601220811.ac3t5OuP-lkp@intel.com>
References: 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 22 Jan 2026 09:44:37 +0800 kernel test robot <lkp@intel.com> wrote:

> Hi Liam,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on akpm-mm/mm-everything]
> [also build test ERROR on next-20260121]
> [cannot apply to akpm-mm/mm-nonmm-unstable soc/for-next linus/master v6.19-rc6]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Liam-R-Howlett/maple_tree-Fix-mas_dup_alloc-sparse-warning/20260122-023746
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20260121164526.2093265-18-Liam.Howlett%40oracle.com
> patch subject: [PATCH v2 17/29] maple_tree: Start using maple copy node for destination
> config: sparc-randconfig-002-20260122 (https://download.01.org/0day-ci/archive/20260122/202601220811.ac3t5OuP-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601220811.ac3t5OuP-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601220811.ac3t5OuP-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from ./arch/sparc/include/generated/asm/rwonce.h:1,
>                     from include/linux/compiler.h:380,
>                     from include/linux/array_size.h:5,
>                     from include/linux/kernel.h:16,
>                     from include/linux/maple_tree.h:11,
>                     from lib/maple_tree.c:56:
>    lib/maple_tree.c: In function 'cp_dst_to_slots':
> >> include/linux/rcupdate.h:555:36: error: dereferencing pointer to incomplete type 'struct maple_enode'
>     #define RCU_INITIALIZER(v) (typeof(*(v)) __force __rcu *)(v)
>                                        ^~~~
>    include/asm-generic/rwonce.h:55:33: note: in definition of macro '__WRITE_ONCE'
>      *(volatile typeof(x) *)&(x) = (val);    \
>                                     ^~~
>    include/linux/rcupdate.h:1046:3: note: in expansion of macro 'WRITE_ONCE'
>       WRITE_ONCE(p, RCU_INITIALIZER(v)); \
>       ^~~~~~~~~~
>    include/linux/rcupdate.h:1046:17: note: in expansion of macro 'RCU_INITIALIZER'
>       WRITE_ONCE(p, RCU_INITIALIZER(v)); \
>                     ^~~~~~~~~~~~~~~
>    lib/maple_tree.c:3155:3: note: in expansion of macro 'RCU_INIT_POINTER'
>       RCU_INIT_POINTER(cp->slot[d], mt_mk_node(mn, mt));
>       ^~~~~~~~~~~~~~~~

Seems this issue depends on compiler version.  I got similar error on my build
test, which uses gcc 8.1.0.  After increasing the version to 14.2.0, I don't
get the build error.

I also confirmed below simple change fixes the build error on my setup, and
added to my tree as a temporal fix.  I'm not familiar with maple tree code or
clearly understanding exactly what gcc change caused the issue, so I'm unsure
if my fix is a right one.  I'm sharing that only for a reference, as anyway I
have to make it and add to my tree as a temporal fix.


Thanks,
SJ

[...]
=== >8 ===
From 6b0051e419cc5129133f8eb94db7f44afd8170fa Mon Sep 17 00:00:00 2001
From: SeongJae Park <sj@kernel.org>
Date: Wed, 21 Jan 2026 21:24:08 -0800
Subject: [PATCH] temporal build fix

Link: https://lore.kernel.org/202601220811.ac3t5OuP-lkp@intel.com
Signed-off-by: SeongJae Park <sj@kernel.org>
---
 lib/maple_tree.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index 2d840b9a360f8..7aafcec45c6f2 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -3152,7 +3152,7 @@ static inline void cp_dst_to_slots(struct maple_copy *cp, unsigned long min,
 		 * read-side operations that can view them until they are
 		 * inserted into the tree after an rcu_assign_pointer() call.
 		 */
-		RCU_INIT_POINTER(cp->slot[d], mt_mk_node(mn, mt));
+		RCU_INIT_POINTER(cp->slot[d], (void *)mt_mk_node(mn, mt));
 		cp->pivot[d] = slot_max;
 		if (mt_is_alloc(mas->tree)) {
 			if (ma_is_leaf(mt)) {
@@ -3375,7 +3375,8 @@ static bool spanning_ascend(struct maple_copy *cp, struct ma_state *mas,
 			 * the tree after an rcu_assign_pointer() call.
 			 */
 			RCU_INIT_POINTER(cp->slot[0],
-					 mt_mk_node(cp->dst[0].node, mt));
+					 (void *)mt_mk_node(
+						 cp->dst[0].node, mt));
 			cp->height++;
 		}
 		WARN_ON_ONCE(cp->dst[0].node != mte_to_node(
-- 
2.47.3

