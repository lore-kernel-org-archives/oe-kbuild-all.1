Content-Type: multipart/mixed; boundary="===============0769715626595181878=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v6 02/11] mm/gup: Use functions to track lockless pgtbl walks on gup_pgd_range
Date: Fri, 07 Feb 2020 09:19:40 +0800
Message-ID: <202002070928.0W7YYLih%lkp@intel.com>
In-Reply-To: <20200206030900.147032-3-leonardo@linux.ibm.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0769715626595181878==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Leonardo,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on paulus-powerpc/kvm-ppc-next linus/master v5.5 nex=
t-20200206]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Leonardo-Bras/Introduces-n=
ew-functions-for-tracking-lockless-pagetable-walks/20200207-071035
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git n=
ext
config: i386-tinyconfig (attached as .config)
compiler: gcc-7 (Debian 7.5.0-3) 7.5.0
reproduce:
        # save the attached .config to linux build tree
        make ARCH=3Di386 =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   mm/gup.c: In function 'get_user_pages_fast':
>> mm/gup.c:2435:27: error: 'IRQS_ENABLED' undeclared (first use in this fu=
nction); did you mean 'IS_ENABLED'?
      end_lockless_pgtbl_walk(IRQS_ENABLED);
                              ^~~~~~~~~~~~
                              IS_ENABLED
   mm/gup.c:2435:27: note: each undeclared identifier is reported only once=
 for each function it appears in

vim +2435 mm/gup.c

  2395	=

  2396	/**
  2397	 * get_user_pages_fast() - pin user pages in memory
  2398	 * @start:	starting user address
  2399	 * @nr_pages:	number of pages from start to pin
  2400	 * @gup_flags:	flags modifying pin behaviour
  2401	 * @pages:	array that receives pointers to the pages pinned.
  2402	 *		Should be at least nr_pages long.
  2403	 *
  2404	 * Attempt to pin user pages in memory without taking mm->mmap_sem.
  2405	 * If not successful, it will fall back to taking the lock and
  2406	 * calling get_user_pages().
  2407	 *
  2408	 * Returns number of pages pinned. This may be fewer than the number
  2409	 * requested. If nr_pages is 0 or negative, returns 0. If no pages
  2410	 * were pinned, returns -errno.
  2411	 */
  2412	int get_user_pages_fast(unsigned long start, int nr_pages,
  2413				unsigned int gup_flags, struct page **pages)
  2414	{
  2415		unsigned long addr, len, end;
  2416		int nr =3D 0, ret =3D 0;
  2417	=

  2418		if (WARN_ON_ONCE(gup_flags & ~(FOLL_WRITE | FOLL_LONGTERM)))
  2419			return -EINVAL;
  2420	=

  2421		start =3D untagged_addr(start) & PAGE_MASK;
  2422		addr =3D start;
  2423		len =3D (unsigned long) nr_pages << PAGE_SHIFT;
  2424		end =3D start + len;
  2425	=

  2426		if (end <=3D start)
  2427			return 0;
  2428		if (unlikely(!access_ok((void __user *)start, len)))
  2429			return -EFAULT;
  2430	=

  2431		if (IS_ENABLED(CONFIG_HAVE_FAST_GUP) &&
  2432		    gup_fast_permitted(start, end)) {
  2433			begin_lockless_pgtbl_walk();
  2434			gup_pgd_range(addr, end, gup_flags, pages, &nr);
> 2435			end_lockless_pgtbl_walk(IRQS_ENABLED);

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0769715626595181878==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
7YCjVAzdo589OAU2Z0M/AExU287UZwAA
--===============0769715626595181878==--

