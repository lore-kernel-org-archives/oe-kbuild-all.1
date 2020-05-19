Content-Type: multipart/mixed; boundary="===============7178980977330697955=="
MIME-Version: 1.0
From: Mike Rapoport <rppt@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: [hnaz-linux-mm:master 177/523] arch/arc/mm/init.c:80:6: warning: no previous prototype for 'arch_has_descending_max_zone_pfns'
Date: Tue, 19 May 2020 20:45:01 +0300
Message-ID: <20200519174501.GE1118872@kernel.org>
In-Reply-To: <202005191627.50HwKMUW%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7178980977330697955==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2020 at 04:32:29PM +0800, kbuild test robot wrote:
> tree:   https://github.com/hnaz/linux-mm master
> head:   2bbf0589bfeb27800c730b76eacf34528eee5418
> commit: 3ae9a28a04fa372644c181c9419b3312efe55d77 [177/523] mm: free_area_=
init: allow defining max_zone_pfn in descending order
> config: arc-defconfig (attached as .config)
> compiler: arc-elf-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 3ae9a28a04fa372644c181c9419b3312efe55d77
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Darc =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> =

> arch/arc/mm/init.c:39:13: warning: no previous prototype for 'arc_get_mem=
_sz' [-Wmissing-prototypes]
> 39 | long __init arc_get_mem_sz(void)
> |             ^~~~~~~~~~~~~~
> >> arch/arc/mm/init.c:80:6: warning: no previous prototype for 'arch_has_=
descending_max_zone_pfns' [-Wmissing-prototypes]
> 80 | bool arch_has_descending_max_zone_pfns(void)
> |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> arch/arc/mm/init.c:91:13: warning: no previous prototype for 'setup_arch_=
memory' [-Wmissing-prototypes]
> 91 | void __init setup_arch_memory(void)
> |             ^~~~~~~~~~~~~~~~~
> =

> vim +/arch_has_descending_max_zone_pfns +80 arch/arc/mm/init.c
> =

>     79	=

>   > 80	bool arch_has_descending_max_zone_pfns(void)
>     81	{
>     82		return true;
>     83	}
>     84	=

> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

Here is the fix.

>From f1cfbc50f1eee57c6c648e08dccaf5f0eb699578 Mon Sep 17 00:00:00 2001
From: Mike Rapoport <rppt@linux.ibm.com>
Date: Tue, 19 May 2020 20:40:25 +0300
Subject: [PATCH] mm: add forward declaration of arch_has_descending_max_zon=
e_pfns()

to silence gcc warning reported by kbuild test robot:

>> arch/arc/mm/init.c:80:6: warning: no previous prototype for
'arch_has_descending_max_zone_pfns' [-Wmissing-prototypes]
80 | bool arch_has_descending_max_zone_pfns(void)

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 include/linux/mm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index d184c47079da..0c3d8187cff9 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2351,6 +2351,7 @@ static inline unsigned long get_num_physpages(void)
  * sparse_memory_present_with_active_regions() calls memory_present() for
  * each range when SPARSEMEM is enabled.
  */
+bool arch_has_descending_max_zone_pfns(void);
 void free_area_init(unsigned long *max_zone_pfn);
 unsigned long node_map_pfn_alignment(void);
 unsigned long __absent_pages_in_range(int nid, unsigned long start_pfn,
-- =

2.26.2



-- =

Sincerely yours,
Mike.
--===============7178980977330697955==--

