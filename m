Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E8232F77C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Nov 2025 17:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762278692; cv=none; b=Ve9uMCZEbRj8Vkq4u28D7UHQSRq8lu3VJWw2EosRieuN3VD7S0jmZSL5nLLBRsqk3s8TJ0AnAEB31Q2htK7R7vdPMGS0/n9b+Rrx9eroXVXV/97JNihvsu/YvPUUST+42zcdXYLICaejvvDsPUdbIIuYKBJiyiWgpcD3jRcxar0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762278692; c=relaxed/simple;
	bh=Qtrcz5hDa/jUZhOQhclupKnnXoPtKu/zpd5bE7NHQS0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tjh9VKUvZzlV926ciCr5UFTxcM9jiF9eQjSTDFNfyFALNTFFoS2LEpchSJ8silQ+XuFVb+Ww7kFkaVB+9cdbU9RZ6PVayP2d5bIvTZUBiEroFkPYCZa59r9c0HcIj4WaRNp8mTK+G1abQH0XT6BkgrS+/i5GyxOelSYNQdZagPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Gss1gupe; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Gss1gupe"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b3e9d633b78so14407466b.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 04 Nov 2025 09:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1762278688; x=1762883488; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ECnLhPR8GCoIFxiWZs/Z7qt0UeuPLBFqpl/8chixW0=;
        b=Gss1gupeutxEEVmMfeW3QZ3wdRiBJGMYZEPP7NdIofHdOI9n7l+IiA4MR99LNdqkjO
         kGmp4pNGI7tvH/H29MgCU0rPGYN/P4lJNOH0wg5DmfwajkiJvnXvqLXQVomtIe2duU0V
         T3Ata6+44qj8Hi8dCfHmnh7nPULG8symXsibZXZqjPLKixBxUJP+2+TR7Ee6McW6Pw3F
         3RIIr92wJOV6zchDBWeKfh6DZ6VHbL4G+1DUu+ft7zTSOkwSaaNIFE0hUOyqDiNLhLno
         eyA5E4CkqeleSjUGGtY4ucEFJA9eBoShbjMN9PRmmG0k67WQ2lUaephNBSHHbH6OHZEC
         3Uww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762278688; x=1762883488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ECnLhPR8GCoIFxiWZs/Z7qt0UeuPLBFqpl/8chixW0=;
        b=P/jiqAd5QzcUmFSJcXtY6B1SsBV7QRsC1tKfjNLDMAPqivp6nM3ej4SKZMzRTuGxuz
         dMEvTZ/7GraKs2g9y5MACmGCkBpVQ4oUopViiqdLWYjD4y15mAtPqh0012+CltnbzycZ
         doDVA3TZ5Yg8YhPDFXtO10sFphcTiOiUpy3sZAIO+/qaGI7pjlETAVhEJQIEVzJPO1HD
         7onOo2vVLPyuZosmgW5T7wvuicqOIWnfq5XDcN4AdADa6oaIT5x1GN9I7k2DPV8R10zx
         EsTMHMr2KxsmnnqZjCTERf0Iy/OLGFQTYbi49EWl8fwzvitdUBRppgYyBlMWJ0RysJhT
         Wt5g==
X-Forwarded-Encrypted: i=1; AJvYcCUoGofYJoTdNj81VlklPgLm17wtvqVvnjFDArYPHausuq8JFgGQMR00GfQ4+Jg4ntfc3FBnE0EQgzH/vdRV@lists.linux.dev
X-Gm-Message-State: AOJu0YyVo5l4k2dhU7rxYkMLGrb/h+6IQ+2BF9Ll++ZEsDa5h/zumcLL
	GASSVHovFVraATBV4Am/R8kVBueXhieeaTLORDlw/ujS/ET5rbz32mJ66ck46E2al4KPktIzm+T
	XrAG/2yBXjvtZ2m7NaoUYHG7lyDo0RXSBtOelRfHG4g==
X-Gm-Gg: ASbGncs5dY+l9879CHEpKFiEeSjKB/wctrrQjvEeNIoVzkSK/jfnUPhvwkx54NYSA5V
	Xb412SJM8T8ObAwI52WfNKzkGxdmwaXoCUQeSOYKJ0sNgCxARIJm5IjfGyX8Cyu2BlyZRN9dtbh
	31DXpjb7EP9PRBDtwUdaKfNdoddOzgy5fl1d/wC13qyc85DAMuBDYKQ2YLRJGB48+T5hcUbsNtI
	EYBWGxSJhkO9Ae6ojL8XpWHu7Gi77kEwvaKgBOjPEA8bgVyJaveTPxIjg==
X-Google-Smtp-Source: AGHT+IEAuECOBfJlEHfnlgCL4CsibRKTRNtnk3GFRgThyXrDwaD6V3R0XSyMkbHHy67fCRj/QzdxZGD1hNnwsDEv3Hs=
X-Received: by 2002:a17:907:26c3:b0:b70:83a2:3f5a with SMTP id
 a640c23a62f3a-b72138aaa11mr559213966b.0.1762278688472; Tue, 04 Nov 2025
 09:51:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202511042251.paO6f5BZ-lkp@intel.com> <aQod7jDFBjw9T-u2@kernel.org>
 <CA+CK2bBYF5AndNHgqcb5zDbUOV04nE6xiZ0igcTdYf-GOU4aOQ@mail.gmail.com>
In-Reply-To: <CA+CK2bBYF5AndNHgqcb5zDbUOV04nE6xiZ0igcTdYf-GOU4aOQ@mail.gmail.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 4 Nov 2025 12:50:49 -0500
X-Gm-Features: AWmQ_bmyzYjklRdM4fCy26w5o6ihhFCSE_0V8f3fp0iGGrT9x2BXx4iNlGw-DMU
Message-ID: <CA+CK2bBnorfsTymKtv4rKvqGBHs=y=MjEMMRg_tE-RME6n-zUw@mail.gmail.com>
Subject: Re: [linux-next:master 4972/5926] kernel/kexec_handover_debug.c:16:18:
 error: use of undeclared identifier 'kho_scratch_cnt'
To: Mike Rapoport <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The fix looks like this:
diff --git a/kernel/kexec_handover.c b/kernel/kexec_handover.c
index de4466b47455..2a8c20c238a8 100644
--- a/kernel/kexec_handover.c
+++ b/kernel/kexec_handover.c
@@ -477,8 +477,8 @@ static void __init kho_mem_deserialize(const void *fdt)
  * area for early allocations that happen before page allocator is
  * initialized.
  */
-static struct kho_scratch *kho_scratch;
-static unsigned int kho_scratch_cnt;
+struct kho_scratch *kho_scratch;
+unsigned int kho_scratch_cnt;

 /*
  * The scratch areas are scaled by default as percent of memory allocated =
from
diff --git a/kernel/kexec_handover_internal.h b/kernel/kexec_handover_inter=
nal.h
index 05e9720ba7b9..3c3c7148ceed 100644
--- a/kernel/kexec_handover_internal.h
+++ b/kernel/kexec_handover_internal.h
@@ -2,8 +2,12 @@
 #ifndef LINUX_KEXEC_HANDOVER_INTERNAL_H
 #define LINUX_KEXEC_HANDOVER_INTERNAL_H

+#include <linux/kexec_handover.h>
 #include <linux/types.h>

+extern struct kho_scratch *kho_scratch;
+extern unsigned int kho_scratch_cnt;
+
 #ifdef CONFIG_KEXEC_HANDOVER_DEBUG
 bool kho_scratch_overlap(phys_addr_t phys, size_t size);
 #else

Andrew, Mike, do you want me to resend the "[PATCH v3 0/3] KHO: kfence
+ KHO memory corruption fix" series with the fix included?

On Tue, Nov 4, 2025 at 12:32=E2=80=AFPM Pasha Tatashin
<pasha.tatashin@soleen.com> wrote:
>
> Eh, "kho: make debugfs interface optional" makes this variable external.
>
> Let me see how to fix this quickly.
>
> On Tue, Nov 4, 2025 at 10:38=E2=80=AFAM Mike Rapoport <rppt@kernel.org> w=
rote:
> >
> > (adding Pasha)
> >
> > On Tue, Nov 04, 2025 at 10:48:31PM +0800, kernel test robot wrote:
> > > Hi Mike,
> > >
> > > First bad commit (maybe !=3D root cause):
> > >
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-ne=
xt.git master
> > > head:   17490bd0527f59d841168457b245581f314b5fa0
> > > commit: 8c211175c3abcebb8bffce8095d78d193e482105 [4972/5926] liveupda=
te-kho-warn-and-fail-on-metadata-or-preserved-memory-in-scratch-area-fix
> > > config: x86_64-randconfig-071-20251104 (https://download.01.org/0day-=
ci/archive/20251104/202511042251.paO6f5BZ-lkp@intel.com/config)
> > > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project =
87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/a=
rchive/20251104/202511042251.paO6f5BZ-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202511042251.paO6f5BZ=
-lkp@intel.com/
> > >
> > > All errors (new ones prefixed by >>):
> > >
> > > >> kernel/kexec_handover_debug.c:16:18: error: use of undeclared iden=
tifier 'kho_scratch_cnt'
> > >       16 |         for (i =3D 0; i < kho_scratch_cnt; i++) {
> > >          |                         ^
> > > >> kernel/kexec_handover_debug.c:17:19: error: use of undeclared iden=
tifier 'kho_scratch'
> > >       17 |                 scratch_start =3D kho_scratch[i].addr;
> > >          |                                 ^
> > >    kernel/kexec_handover_debug.c:18:17: error: use of undeclared iden=
tifier 'kho_scratch'
> > >       18 |                 scratch_end =3D kho_scratch[i].addr + kho_=
scratch[i].size;
> > >          |                               ^
> > >    kernel/kexec_handover_debug.c:18:39: error: use of undeclared iden=
tifier 'kho_scratch'
> > >       18 |                 scratch_end =3D kho_scratch[i].addr + kho_=
scratch[i].size;
> > >          |                                                     ^
> > >    4 errors generated.
> > >
> > >
> > > vim +/kho_scratch_cnt +16 kernel/kexec_handover_debug.c
> > >
> > > 4039a00022d42a Pasha Tatashin 2025-10-20  10
> > > 4039a00022d42a Pasha Tatashin 2025-10-20  11  bool kho_scratch_overla=
p(phys_addr_t phys, size_t size)
> > > 4039a00022d42a Pasha Tatashin 2025-10-20  12  {
> > > 4039a00022d42a Pasha Tatashin 2025-10-20  13          phys_addr_t scr=
atch_start, scratch_end;
> > > 4039a00022d42a Pasha Tatashin 2025-10-20  14          unsigned int i;
> > > 4039a00022d42a Pasha Tatashin 2025-10-20  15
> > > 4039a00022d42a Pasha Tatashin 2025-10-20 @16          for (i =3D 0; i=
 < kho_scratch_cnt; i++) {
> > > 4039a00022d42a Pasha Tatashin 2025-10-20 @17                  scratch=
_start =3D kho_scratch[i].addr;
> > >
> > > :::::: The code at line 16 was first introduced by commit
> > > :::::: 4039a00022d42ac3d68b2eea63066bc9f7ef89ce kho: warn and fail on=
 metadata or preserved memory in scratch area
> > >
> > > :::::: TO: Pasha Tatashin <pasha.tatashin@soleen.com>
> > > :::::: CC: Andrew Morton <akpm@linux-foundation.org>
> > >
> > > --
> > > 0-DAY CI Kernel Test Service
> > > https://github.com/intel/lkp-tests/wiki
> >
> > --
> > Sincerely yours,
> > Mike.
