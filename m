Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537483C0C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Jun 2024 01:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719626310; cv=none; b=hkLul0930keLgmVvuWfq11hQKMP34C36B4PD/zlHH7GfaO+9HUGuL0vVc+zTTtXz/ZPUCinzRb9bL4/UwxIES2YYkAq0BJAbe+P8LpYQycX73h/mvciLAmKntepKgM7JANP26pCmrpicbrSUuEw2iTCl+gcNCVI7lg6AN+4v1iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719626310; c=relaxed/simple;
	bh=BdESgxu1NXlpbfVZWs5N00uxGxgo1HJTUzCdMHmExbM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lUe8HRyrjagNvCMcJh8V4LONduzKuIariZQTyMGWW6BEdi944UoY7yeh0n5q3r76ogRPhTW4k26ebrdmDn+1Q9NuKoW3x8IXGFXqEEBYVKWOeLZQuNc2PoTQUZowORPKQG0bUEembH5uM+vDXD8erXIM6QnGH7/RlIllUWApYoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NNFMm9Nw; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NNFMm9Nw"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-57d4ee2aaabso1413120a12.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jun 2024 18:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719626307; x=1720231107; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ydc3XNQcwpNP0o8GCxBD5SHN8+yjhlyUU+Ft+2wncWk=;
        b=NNFMm9NwZdtCjxa17j/759k3ad2nJXv1Dibny9a75nqlx1nHkX/PCfoweFUgMBhjfA
         qfVeXR7C5s7ISu6AyZvcmxIFZ8ajXrpujvvBviadoa/u7obN9KYmxEvOmaus2TZCx71x
         HZhstknE4Bb44wZ0fMWXOrsP4jQ72AsRIRynJhU7GNRJ+XfUgLb9938o0sN+CYVjKo2t
         WK4vYL1jlUKtLjr86BOMqaezbYzEaCit9NpJS/OUVm2nCCCgXS4zH9bRukwpU+XujxIV
         o0Vn6po1qsT/3GpSSgnOTwYs9g3URZ5TfVz0Dr8ZiYRGJOwU1cviQFPTBkRnk0AlanPB
         TzEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719626307; x=1720231107;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ydc3XNQcwpNP0o8GCxBD5SHN8+yjhlyUU+Ft+2wncWk=;
        b=QvMHeW72D306BWjGpM1xg5dvmnlhXzeTRqIlB5oiP8M68sdekJTMp7QXfR3250r4tR
         aNYgifSfQSTOxzWwTeIfLlYrVGTaPO+1RqsUPXTu5krid4DUsima2IdRdxqZzGdlSlMo
         3sEZYoG95dqx4fadoA9LkQ91WShMwCNPVk2hKmuIATvNNaz7O9TKnO/dr3aUg6HRzQZO
         TgAR/gkAUFMv5phjUXVAzCM7bV7EPR8xydYop6tzZEsb/dUg0lTly1spkgGcRlhl69c6
         fHZ3B7wbDQNFDoFZGbQ1K4zs6AMIBRuzgd7nJWrKgHPfsPAUcNNaMYQfNIKeEOGqmlbl
         jgaA==
X-Forwarded-Encrypted: i=1; AJvYcCXCY5iPLKHp+oYhji9R70hx3NLd/bTmUousCQKssgxx5Swgvm4KfFskzaMU1EBtJH2tQimer+OSkgHQLqkKgCpHbfAlYOuhS0Bs/5N2gQ==
X-Gm-Message-State: AOJu0YyNE7C6ibwTf/wXlbT9SlkPVq1OBlu31r5qTk8cvMI0PUSmNHaA
	2R+erw9Tp27Z5r8ivCH4gUZuudBxBio+ZPStcxKusWez15gu1KJ7juTCXP+RKHdZUcsTsyvS75Z
	uNNgPrrWIc37MEM4wI8gEMBoOQS39YQl4
X-Google-Smtp-Source: AGHT+IEibOx3FHKInIg3PRzYy84X+MtDeITML373b/YpBm8Kp1ApgP6GQyw0I6bs3/WH+56PYUSs/VQjUZKGSpiNQO8=
X-Received: by 2002:a50:9358:0:b0:57c:8022:a3db with SMTP id
 4fb4d7f45d1cf-57d4bd5651amr11609512a12.6.1719626306328; Fri, 28 Jun 2024
 18:58:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202406290729.21FzkVlI-lkp@intel.com>
In-Reply-To: <202406290729.21FzkVlI-lkp@intel.com>
From: Yang Shi <shy828301@gmail.com>
Date: Fri, 28 Jun 2024 18:58:14 -0700
Message-ID: <CAHbLzkowMSso-4Nufc9hcMehQsK9PNz3OSu-+eniU-2Mm-xjhA@mail.gmail.com>
Subject: Re: [linux-next:master 9137/9689] mm/gup.c:476:25: error: implicit
 declaration of function 'try_grab_folio_fast'; did you mean 'try_grab_folio'?
To: kernel test robot <lkp@intel.com>
Cc: Yang Shi <yang@os.amperecomputing.com>, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: multipart/mixed; boundary="00000000000022b1e4061bfdb374"

--00000000000022b1e4061bfdb374
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2024 at 5:01=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   1eb586a9782cde8e5091b9de74603e0a8386b09e
> commit: ee3fe497bdf0c7cb6fbec346f36aa1f9b1dfe6dd [9137/9689] mm: gup: do =
not call try_grab_folio() in slow path
> config: powerpc-randconfig-r005-20221108
> compiler: powerpc-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build):
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406290729.21FzkVlI-lkp=
@intel.com/
>
> All error/warnings (new ones prefixed by >>):
>
>    mm/gup.c: In function 'gup_hugepte':
> >> mm/gup.c:476:25: error: implicit declaration of function 'try_grab_fol=
io_fast'; did you mean 'try_grab_folio'? [-Werror=3Dimplicit-function-decla=
ration]

The definition of try_grab_folio_fast() should be protected by
CONFIG_ARCH_HAS_HUGEPD || CONFIG_HAVE_GUP_FAST.

Andrew,

Please apply the attached fix on top of it. The reproducer requires
x86 machine since the cross build tool is on x86, but I don't have a
x86 machine by hand right now. But I think the patch should fix it.

>      476 |                 folio =3D try_grab_folio_fast(page, refs, flag=
s);
>          |                         ^~~~~~~~~~~~~~~~~~~
>          |                         try_grab_folio
> >> mm/gup.c:476:23: warning: assignment to 'struct folio *' from 'int' ma=
kes pointer from integer without a cast [-Wint-conversion]
>      476 |                 folio =3D try_grab_folio_fast(page, refs, flag=
s);
>          |                       ^
>    mm/gup.c: At top level:
> >> mm/gup.c:2748:22: error: conflicting types for 'try_grab_folio_fast'; =
have 'struct folio *(struct page *, int,  unsigned int)'
>     2748 | static struct folio *try_grab_folio_fast(struct page *page, in=
t refs,
>          |                      ^~~~~~~~~~~~~~~~~~~
>    mm/gup.c:476:25: note: previous implicit declaration of 'try_grab_foli=
o_fast' with type 'int()'
>      476 |                 folio =3D try_grab_folio_fast(page, refs, flag=
s);
>          |                         ^~~~~~~~~~~~~~~~~~~
>    cc1: some warnings being treated as errors
>
>
> vim +476 mm/gup.c
>
>    441
>    442  /*
>    443   * Returns 1 if succeeded, 0 if failed, -EMLINK if unshare needed=
.
>    444   *
>    445   * NOTE: for the same entry, gup-fast and gup-slow can return dif=
ferent
>    446   * results (0 v.s. -EMLINK) depending on whether vma is available=
.  This is
>    447   * the expected behavior, where we simply want gup-fast to fallba=
ck to
>    448   * gup-slow to take the vma reference first.
>    449   */
>    450  static int gup_hugepte(struct vm_area_struct *vma, pte_t *ptep, u=
nsigned long sz,
>    451                         unsigned long addr, unsigned long end, uns=
igned int flags,
>    452                         struct page **pages, int *nr, bool fast)
>    453  {
>    454          unsigned long pte_end;
>    455          struct page *page;
>    456          struct folio *folio;
>    457          pte_t pte;
>    458          int refs;
>    459
>    460          pte_end =3D (addr + sz) & ~(sz-1);
>    461          if (pte_end < end)
>    462                  end =3D pte_end;
>    463
>    464          pte =3D huge_ptep_get(ptep);
>    465
>    466          if (!pte_access_permitted(pte, flags & FOLL_WRITE))
>    467                  return 0;
>    468
>    469          /* hugepages are never "special" */
>    470          VM_BUG_ON(!pfn_valid(pte_pfn(pte)));
>    471
>    472          page =3D pte_page(pte);
>    473          refs =3D record_subpages(page, sz, addr, end, pages + *nr=
);
>    474
>    475          if (fast) {
>  > 476                  folio =3D try_grab_folio_fast(page, refs, flags);
>    477                  if (!folio)
>    478                          return 0;
>    479          } else {
>    480                  folio =3D page_folio(page);
>    481                  if (try_grab_folio(folio, refs, flags))
>    482                          return 0;
>    483          }
>    484
>    485          if (unlikely(pte_val(pte) !=3D pte_val(ptep_get(ptep)))) =
{
>    486                  gup_put_folio(folio, refs, flags);
>    487                  return 0;
>    488          }
>    489
>    490          if (!pte_write(pte) && gup_must_unshare(vma, flags, &foli=
o->page)) {
>    491                  gup_put_folio(folio, refs, flags);
>    492                  return -EMLINK;
>    493          }
>    494
>    495          *nr +=3D refs;
>    496          folio_set_referenced(folio);
>    497          return 1;
>    498  }
>    499
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

--00000000000022b1e4061bfdb374
Content-Type: application/octet-stream; 
	name="mm-gup-stop-abusing-try_grab_folio-fix.patch"
Content-Disposition: attachment; 
	filename="mm-gup-stop-abusing-try_grab_folio-fix.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lxzgoyt40>
X-Attachment-Id: f_lxzgoyt40

ZGlmZiAtLWdpdCBhL21tL2d1cC5jIGIvbW0vZ3VwLmMKaW5kZXggZTY1NzczY2U0NjIyLi5mZGQz
YjI3MTlmMzMgMTAwNjQ0Ci0tLSBhL21tL2d1cC5jCisrKyBiL21tL2d1cC5jCkBAIC00MjcsNiAr
NDI3LDEwMiBAQCBzdGF0aWMgaW50IHJlY29yZF9zdWJwYWdlcyhzdHJ1Y3QgcGFnZSAqcGFnZSwg
dW5zaWduZWQgbG9uZyBzeiwKIAogCXJldHVybiBucjsKIH0KKworLyoqCisgKiB0cnlfZ3JhYl9m
b2xpb19mYXN0KCkgLSBBdHRlbXB0IHRvIGdldCBvciBwaW4gYSBmb2xpbyBpbiBmYXN0IHBhdGgu
CisgKiBAcGFnZTogIHBvaW50ZXIgdG8gcGFnZSB0byBiZSBncmFiYmVkCisgKiBAcmVmczogIHRo
ZSB2YWx1ZSB0byAoZWZmZWN0aXZlbHkpIGFkZCB0byB0aGUgZm9saW8ncyByZWZjb3VudAorICog
QGZsYWdzOiBndXAgZmxhZ3M6IHRoZXNlIGFyZSB0aGUgRk9MTF8qIGZsYWcgdmFsdWVzLgorICoK
KyAqICJncmFiIiBuYW1lcyBpbiB0aGlzIGZpbGUgbWVhbiwgImxvb2sgYXQgZmxhZ3MgdG8gZGVj
aWRlIHdoZXRoZXIgdG8gdXNlCisgKiBGT0xMX1BJTiBvciBGT0xMX0dFVCBiZWhhdmlvciwgd2hl
biBpbmNyZW1lbnRpbmcgdGhlIGZvbGlvJ3MgcmVmY291bnQuCisgKgorICogRWl0aGVyIEZPTExf
UElOIG9yIEZPTExfR0VUIChvciBuZWl0aGVyKSBtdXN0IGJlIHNldCwgYnV0IG5vdCBib3RoIGF0
IHRoZQorICogc2FtZSB0aW1lLiAoVGhhdCdzIHRydWUgdGhyb3VnaG91dCB0aGUgZ2V0X3VzZXJf
cGFnZXMqKCkgYW5kCisgKiBwaW5fdXNlcl9wYWdlcyooKSBBUElzLikgQ2FzZXM6CisgKgorICog
ICAgRk9MTF9HRVQ6IGZvbGlvJ3MgcmVmY291bnQgd2lsbCBiZSBpbmNyZW1lbnRlZCBieSBAcmVm
cy4KKyAqCisgKiAgICBGT0xMX1BJTiBvbiBsYXJnZSBmb2xpb3M6IGZvbGlvJ3MgcmVmY291bnQg
d2lsbCBiZSBpbmNyZW1lbnRlZCBieQorICogICAgQHJlZnMsIGFuZCBpdHMgcGluY291bnQgd2ls
bCBiZSBpbmNyZW1lbnRlZCBieSBAcmVmcy4KKyAqCisgKiAgICBGT0xMX1BJTiBvbiBzaW5nbGUt
cGFnZSBmb2xpb3M6IGZvbGlvJ3MgcmVmY291bnQgd2lsbCBiZSBpbmNyZW1lbnRlZCBieQorICog
ICAgQHJlZnMgKiBHVVBfUElOX0NPVU5USU5HX0JJQVMuCisgKgorICogUmV0dXJuOiBUaGUgZm9s
aW8gY29udGFpbmluZyBAcGFnZSAod2l0aCByZWZjb3VudCBhcHByb3ByaWF0ZWx5CisgKiBpbmNy
ZW1lbnRlZCkgZm9yIHN1Y2Nlc3MsIG9yIE5VTEwgdXBvbiBmYWlsdXJlLiBJZiBuZWl0aGVyIEZP
TExfR0VUCisgKiBub3IgRk9MTF9QSU4gd2FzIHNldCwgdGhhdCdzIGNvbnNpZGVyZWQgZmFpbHVy
ZSwgYW5kIGZ1cnRoZXJtb3JlLAorICogYSBsaWtlbHkgYnVnIGluIHRoZSBjYWxsZXIsIHNvIGEg
d2FybmluZyBpcyBhbHNvIGVtaXR0ZWQuCisgKgorICogSXQgdXNlcyBhZGQgcmVmIHVubGVzcyB6
ZXJvIHRvIGVsZXZhdGUgdGhlIGZvbGlvIHJlZmNvdW50IGFuZCBtdXN0IGJlIGNhbGxlZAorICog
aW4gZmFzdCBwYXRoIG9ubHkuCisgKi8KK3N0YXRpYyBzdHJ1Y3QgZm9saW8gKnRyeV9ncmFiX2Zv
bGlvX2Zhc3Qoc3RydWN0IHBhZ2UgKnBhZ2UsIGludCByZWZzLAorCQkJCQkgdW5zaWduZWQgaW50
IGZsYWdzKQoreworCXN0cnVjdCBmb2xpbyAqZm9saW87CisKKwkvKiBSYWlzZSB3YXJuIGlmIGl0
IGlzIG5vdCBjYWxsZWQgaW4gZmFzdCBHVVAgKi8KKwlWTV9XQVJOX09OX09OQ0UoIWlycXNfZGlz
YWJsZWQoKSk7CisKKwlpZiAoV0FSTl9PTl9PTkNFKChmbGFncyAmIChGT0xMX0dFVCB8IEZPTExf
UElOKSkgPT0gMCkpCisJCXJldHVybiBOVUxMOworCisJaWYgKHVubGlrZWx5KCEoZmxhZ3MgJiBG
T0xMX1BDSV9QMlBETUEpICYmIGlzX3BjaV9wMnBkbWFfcGFnZShwYWdlKSkpCisJCXJldHVybiBO
VUxMOworCisJaWYgKGZsYWdzICYgRk9MTF9HRVQpCisJCXJldHVybiB0cnlfZ2V0X2ZvbGlvKHBh
Z2UsIHJlZnMpOworCisJLyogRk9MTF9QSU4gaXMgc2V0ICovCisKKwkvKgorCSAqIERvbid0IHRh
a2UgYSBwaW4gb24gdGhlIHplcm8gcGFnZSAtIGl0J3Mgbm90IGdvaW5nIGFueXdoZXJlCisJICog
YW5kIGl0IGlzIHVzZWQgaW4gYSAqbG90KiBvZiBwbGFjZXMuCisJICovCisJaWYgKGlzX3plcm9f
cGFnZShwYWdlKSkKKwkJcmV0dXJuIHBhZ2VfZm9saW8ocGFnZSk7CisKKwlmb2xpbyA9IHRyeV9n
ZXRfZm9saW8ocGFnZSwgcmVmcyk7CisJaWYgKCFmb2xpbykKKwkJcmV0dXJuIE5VTEw7CisKKwkv
KgorCSAqIENhbid0IGRvIEZPTExfTE9OR1RFUk0gKyBGT0xMX1BJTiBndXAgZmFzdCBwYXRoIGlm
IG5vdCBpbiBhCisJICogcmlnaHQgem9uZSwgc28gZmFpbCBhbmQgbGV0IHRoZSBjYWxsZXIgZmFs
bCBiYWNrIHRvIHRoZSBzbG93CisJICogcGF0aC4KKwkgKi8KKwlpZiAodW5saWtlbHkoKGZsYWdz
ICYgRk9MTF9MT05HVEVSTSkgJiYKKwkJICAgICAhZm9saW9faXNfbG9uZ3Rlcm1fcGlubmFibGUo
Zm9saW8pKSkgeworCQlpZiAoIXB1dF9kZXZtYXBfbWFuYWdlZF9mb2xpb19yZWZzKGZvbGlvLCBy
ZWZzKSkKKwkJCWZvbGlvX3B1dF9yZWZzKGZvbGlvLCByZWZzKTsKKwkJcmV0dXJuIE5VTEw7CisJ
fQorCisJLyoKKwkgKiBXaGVuIHBpbm5pbmcgYSBsYXJnZSBmb2xpbywgdXNlIGFuIGV4YWN0IGNv
dW50IHRvIHRyYWNrIGl0LgorCSAqCisJICogSG93ZXZlciwgYmUgc3VyZSB0byAqYWxzbyogaW5j
cmVtZW50IHRoZSBub3JtYWwgZm9saW8KKwkgKiByZWZjb3VudCBmaWVsZCBhdCBsZWFzdCBvbmNl
LCBzbyB0aGF0IHRoZSBmb2xpbyByZWFsbHkKKwkgKiBpcyBwaW5uZWQuICBUaGF0J3Mgd2h5IHRo
ZSByZWZjb3VudCBmcm9tIHRoZSBlYXJsaWVyCisJICogdHJ5X2dldF9mb2xpbygpIGlzIGxlZnQg
aW50YWN0LgorCSAqLworCWlmIChmb2xpb190ZXN0X2xhcmdlKGZvbGlvKSkKKwkJYXRvbWljX2Fk
ZChyZWZzLCAmZm9saW8tPl9waW5jb3VudCk7CisJZWxzZQorCQlmb2xpb19yZWZfYWRkKGZvbGlv
LAorCQkJCXJlZnMgKiAoR1VQX1BJTl9DT1VOVElOR19CSUFTIC0gMSkpOworCS8qCisJICogQWRq
dXN0IHRoZSBwaW5jb3VudCBiZWZvcmUgcmUtY2hlY2tpbmcgdGhlIFBURSBmb3IgY2hhbmdlcy4K
KwkgKiBUaGlzIGlzIGVzc2VudGlhbGx5IGEgc21wX21iKCkgYW5kIGlzIHBhaXJlZCB3aXRoIGEg
bWVtb3J5CisJICogYmFycmllciBpbiBmb2xpb190cnlfc2hhcmVfYW5vbl9ybWFwXyooKS4KKwkg
Ki8KKwlzbXBfbWJfX2FmdGVyX2F0b21pYygpOworCisJbm9kZV9zdGF0X21vZF9mb2xpbyhmb2xp
bywgTlJfRk9MTF9QSU5fQUNRVUlSRUQsIHJlZnMpOworCisJcmV0dXJuIGZvbGlvOworfQogI2Vu
ZGlmCS8qIENPTkZJR19BUkNIX0hBU19IVUdFUEQgfHwgQ09ORklHX0hBVkVfR1VQX0ZBU1QgKi8K
IAogI2lmZGVmIENPTkZJR19BUkNIX0hBU19IVUdFUEQKQEAgLTI3MTUsMTAyICsyODExLDYgQEAg
RVhQT1JUX1NZTUJPTChnZXRfdXNlcl9wYWdlc191bmxvY2tlZCk7CiAgKiBUaGlzIGNvZGUgaXMg
YmFzZWQgaGVhdmlseSBvbiB0aGUgUG93ZXJQQyBpbXBsZW1lbnRhdGlvbiBieSBOaWNrIFBpZ2dp
bi4KICAqLwogI2lmZGVmIENPTkZJR19IQVZFX0dVUF9GQVNUCi0vKioKLSAqIHRyeV9ncmFiX2Zv
bGlvX2Zhc3QoKSAtIEF0dGVtcHQgdG8gZ2V0IG9yIHBpbiBhIGZvbGlvIGluIGZhc3QgcGF0aC4K
LSAqIEBwYWdlOiAgcG9pbnRlciB0byBwYWdlIHRvIGJlIGdyYWJiZWQKLSAqIEByZWZzOiAgdGhl
IHZhbHVlIHRvIChlZmZlY3RpdmVseSkgYWRkIHRvIHRoZSBmb2xpbydzIHJlZmNvdW50Ci0gKiBA
ZmxhZ3M6IGd1cCBmbGFnczogdGhlc2UgYXJlIHRoZSBGT0xMXyogZmxhZyB2YWx1ZXMuCi0gKgot
ICogImdyYWIiIG5hbWVzIGluIHRoaXMgZmlsZSBtZWFuLCAibG9vayBhdCBmbGFncyB0byBkZWNp
ZGUgd2hldGhlciB0byB1c2UKLSAqIEZPTExfUElOIG9yIEZPTExfR0VUIGJlaGF2aW9yLCB3aGVu
IGluY3JlbWVudGluZyB0aGUgZm9saW8ncyByZWZjb3VudC4KLSAqCi0gKiBFaXRoZXIgRk9MTF9Q
SU4gb3IgRk9MTF9HRVQgKG9yIG5laXRoZXIpIG11c3QgYmUgc2V0LCBidXQgbm90IGJvdGggYXQg
dGhlCi0gKiBzYW1lIHRpbWUuIChUaGF0J3MgdHJ1ZSB0aHJvdWdob3V0IHRoZSBnZXRfdXNlcl9w
YWdlcyooKSBhbmQKLSAqIHBpbl91c2VyX3BhZ2VzKigpIEFQSXMuKSBDYXNlczoKLSAqCi0gKiAg
ICBGT0xMX0dFVDogZm9saW8ncyByZWZjb3VudCB3aWxsIGJlIGluY3JlbWVudGVkIGJ5IEByZWZz
LgotICoKLSAqICAgIEZPTExfUElOIG9uIGxhcmdlIGZvbGlvczogZm9saW8ncyByZWZjb3VudCB3
aWxsIGJlIGluY3JlbWVudGVkIGJ5Ci0gKiAgICBAcmVmcywgYW5kIGl0cyBwaW5jb3VudCB3aWxs
IGJlIGluY3JlbWVudGVkIGJ5IEByZWZzLgotICoKLSAqICAgIEZPTExfUElOIG9uIHNpbmdsZS1w
YWdlIGZvbGlvczogZm9saW8ncyByZWZjb3VudCB3aWxsIGJlIGluY3JlbWVudGVkIGJ5Ci0gKiAg
ICBAcmVmcyAqIEdVUF9QSU5fQ09VTlRJTkdfQklBUy4KLSAqCi0gKiBSZXR1cm46IFRoZSBmb2xp
byBjb250YWluaW5nIEBwYWdlICh3aXRoIHJlZmNvdW50IGFwcHJvcHJpYXRlbHkKLSAqIGluY3Jl
bWVudGVkKSBmb3Igc3VjY2Vzcywgb3IgTlVMTCB1cG9uIGZhaWx1cmUuIElmIG5laXRoZXIgRk9M
TF9HRVQKLSAqIG5vciBGT0xMX1BJTiB3YXMgc2V0LCB0aGF0J3MgY29uc2lkZXJlZCBmYWlsdXJl
LCBhbmQgZnVydGhlcm1vcmUsCi0gKiBhIGxpa2VseSBidWcgaW4gdGhlIGNhbGxlciwgc28gYSB3
YXJuaW5nIGlzIGFsc28gZW1pdHRlZC4KLSAqCi0gKiBJdCB1c2VzIGFkZCByZWYgdW5sZXNzIHpl
cm8gdG8gZWxldmF0ZSB0aGUgZm9saW8gcmVmY291bnQgYW5kIG11c3QgYmUgY2FsbGVkCi0gKiBp
biBmYXN0IHBhdGggb25seS4KLSAqLwotc3RhdGljIHN0cnVjdCBmb2xpbyAqdHJ5X2dyYWJfZm9s
aW9fZmFzdChzdHJ1Y3QgcGFnZSAqcGFnZSwgaW50IHJlZnMsCi0JCQkJCSB1bnNpZ25lZCBpbnQg
ZmxhZ3MpCi17Ci0Jc3RydWN0IGZvbGlvICpmb2xpbzsKLQotCS8qIFJhaXNlIHdhcm4gaWYgaXQg
aXMgbm90IGNhbGxlZCBpbiBmYXN0IEdVUCAqLwotCVZNX1dBUk5fT05fT05DRSghaXJxc19kaXNh
YmxlZCgpKTsKLQotCWlmIChXQVJOX09OX09OQ0UoKGZsYWdzICYgKEZPTExfR0VUIHwgRk9MTF9Q
SU4pKSA9PSAwKSkKLQkJcmV0dXJuIE5VTEw7Ci0KLQlpZiAodW5saWtlbHkoIShmbGFncyAmIEZP
TExfUENJX1AyUERNQSkgJiYgaXNfcGNpX3AycGRtYV9wYWdlKHBhZ2UpKSkKLQkJcmV0dXJuIE5V
TEw7Ci0KLQlpZiAoZmxhZ3MgJiBGT0xMX0dFVCkKLQkJcmV0dXJuIHRyeV9nZXRfZm9saW8ocGFn
ZSwgcmVmcyk7Ci0KLQkvKiBGT0xMX1BJTiBpcyBzZXQgKi8KLQotCS8qCi0JICogRG9uJ3QgdGFr
ZSBhIHBpbiBvbiB0aGUgemVybyBwYWdlIC0gaXQncyBub3QgZ29pbmcgYW55d2hlcmUKLQkgKiBh
bmQgaXQgaXMgdXNlZCBpbiBhICpsb3QqIG9mIHBsYWNlcy4KLQkgKi8KLQlpZiAoaXNfemVyb19w
YWdlKHBhZ2UpKQotCQlyZXR1cm4gcGFnZV9mb2xpbyhwYWdlKTsKLQotCWZvbGlvID0gdHJ5X2dl
dF9mb2xpbyhwYWdlLCByZWZzKTsKLQlpZiAoIWZvbGlvKQotCQlyZXR1cm4gTlVMTDsKLQotCS8q
Ci0JICogQ2FuJ3QgZG8gRk9MTF9MT05HVEVSTSArIEZPTExfUElOIGd1cCBmYXN0IHBhdGggaWYg
bm90IGluIGEKLQkgKiByaWdodCB6b25lLCBzbyBmYWlsIGFuZCBsZXQgdGhlIGNhbGxlciBmYWxs
IGJhY2sgdG8gdGhlIHNsb3cKLQkgKiBwYXRoLgotCSAqLwotCWlmICh1bmxpa2VseSgoZmxhZ3Mg
JiBGT0xMX0xPTkdURVJNKSAmJgotCQkgICAgICFmb2xpb19pc19sb25ndGVybV9waW5uYWJsZShm
b2xpbykpKSB7Ci0JCWlmICghcHV0X2Rldm1hcF9tYW5hZ2VkX2ZvbGlvX3JlZnMoZm9saW8sIHJl
ZnMpKQotCQkJZm9saW9fcHV0X3JlZnMoZm9saW8sIHJlZnMpOwotCQlyZXR1cm4gTlVMTDsKLQl9
Ci0KLQkvKgotCSAqIFdoZW4gcGlubmluZyBhIGxhcmdlIGZvbGlvLCB1c2UgYW4gZXhhY3QgY291
bnQgdG8gdHJhY2sgaXQuCi0JICoKLQkgKiBIb3dldmVyLCBiZSBzdXJlIHRvICphbHNvKiBpbmNy
ZW1lbnQgdGhlIG5vcm1hbCBmb2xpbwotCSAqIHJlZmNvdW50IGZpZWxkIGF0IGxlYXN0IG9uY2Us
IHNvIHRoYXQgdGhlIGZvbGlvIHJlYWxseQotCSAqIGlzIHBpbm5lZC4gIFRoYXQncyB3aHkgdGhl
IHJlZmNvdW50IGZyb20gdGhlIGVhcmxpZXIKLQkgKiB0cnlfZ2V0X2ZvbGlvKCkgaXMgbGVmdCBp
bnRhY3QuCi0JICovCi0JaWYgKGZvbGlvX3Rlc3RfbGFyZ2UoZm9saW8pKQotCQlhdG9taWNfYWRk
KHJlZnMsICZmb2xpby0+X3BpbmNvdW50KTsKLQllbHNlCi0JCWZvbGlvX3JlZl9hZGQoZm9saW8s
Ci0JCQkJcmVmcyAqIChHVVBfUElOX0NPVU5USU5HX0JJQVMgLSAxKSk7Ci0JLyoKLQkgKiBBZGp1
c3QgdGhlIHBpbmNvdW50IGJlZm9yZSByZS1jaGVja2luZyB0aGUgUFRFIGZvciBjaGFuZ2VzLgot
CSAqIFRoaXMgaXMgZXNzZW50aWFsbHkgYSBzbXBfbWIoKSBhbmQgaXMgcGFpcmVkIHdpdGggYSBt
ZW1vcnkKLQkgKiBiYXJyaWVyIGluIGZvbGlvX3RyeV9zaGFyZV9hbm9uX3JtYXBfKigpLgotCSAq
LwotCXNtcF9tYl9fYWZ0ZXJfYXRvbWljKCk7Ci0KLQlub2RlX3N0YXRfbW9kX2ZvbGlvKGZvbGlv
LCBOUl9GT0xMX1BJTl9BQ1FVSVJFRCwgcmVmcyk7Ci0KLQlyZXR1cm4gZm9saW87Ci19Ci0KIC8q
CiAgKiBVc2VkIGluIHRoZSBHVVAtZmFzdCBwYXRoIHRvIGRldGVybWluZSB3aGV0aGVyIEdVUCBp
cyBwZXJtaXR0ZWQgdG8gd29yayBvbgogICogYSBzcGVjaWZpYyBmb2xpby4K
--00000000000022b1e4061bfdb374--
