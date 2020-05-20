Content-Type: multipart/mixed; boundary="===============3558588528175326729=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: kbuild-all@lists.01.org
Subject: Re: [hnaz-linux-mm:master 177/523] arch/arc/mm/init.c:80:6: warning: no previous prototype for 'arch_has_descending_max_zone_pfns'
Date: Tue, 19 May 2020 19:09:24 -0700
Message-ID: <20200519190924.c1563453508f8929667f1529@linux-foundation.org>
In-Reply-To: <20200519174501.GE1118872@kernel.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3558588528175326729==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 19 May 2020 20:45:01 +0300 Mike Rapoport <rppt@kernel.org> wrote:

> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2351,6 +2351,7 @@ static inline unsigned long get_num_physpages(void)
>   * sparse_memory_present_with_active_regions() calls memory_present() for
>   * each range when SPARSEMEM is enabled.
>   */
> +bool arch_has_descending_max_zone_pfns(void);
>  void free_area_init(unsigned long *max_zone_pfn);
>  unsigned long node_map_pfn_alignment(void);
>  unsigned long __absent_pages_in_range(int nid, unsigned long start_pfn,

I kinda preferred my patch ;) There's a section of mm.h just for
page_alloc.c.


--===============3558588528175326729==--

