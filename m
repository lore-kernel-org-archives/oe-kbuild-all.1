Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9347934AAE0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 16:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761756316; cv=none; b=IkmJc11uV3LE4U45q5X0DnIDMg8Nmg69aB3U/S6oKOl2iWsT5q4W2wzZVEAsYOLmLHhkgeiXvurEiPdsDqpwjnAhCDuiwjiWJD6CcXumK+wlDVMHpri/fK8+0oDvg92WS/Hynq+iruvdodsXVsyfb0vp6ZaWEt72Kk8cIU/Qr/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761756316; c=relaxed/simple;
	bh=oJ1LjAVSVZvQJccpCskO+HMX8H3JXeklWHqwfw+IDu8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DOpJ4FpP9OrM3uXyPcxY/J6Zb453a4QCiACpbbjcJ0w+L+yRVDoGNk8EsK08SVzG6Xxg+Rk4CBsTuiybDQ5j8ojkYvGSPxKq2mi611UHaGDgfxUPaTeD6qcN9V9nxFffB9L8vvX9Hf/bqjl36L+RqvB4cBZYYb8NKaRLkkNaEnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OyTk1fcc; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OyTk1fcc"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-27eeafd4882so3975ad.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 09:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761756314; x=1762361114; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T6Yvq87RjfDGoZfQIQ/jI8uH+Kr9fw3GzxgtR1hYoeM=;
        b=OyTk1fccJvX4o1tmeuTuUhD5W4ycm5BJ/1ZKvb2757JQxOQ7JSM9rOpvTfqnpJY2g+
         fUCp8L3CJShFHFGjC9dzf5+8DupeqFFI8TzZwabp6rvDdVz7pTxvGLL9+E2sFoetm2UF
         0f3cvpY6ESJlybnReH+FZ7OsIdNkgtgrgKAlGp8iv01P16on3l3gXdWOSfYRIDaG/eEG
         culEanMCgpXDA+5QcYIkfvfPGwUAztR9z2eG9ttbQzhNySCP1uu2r4OisHlbVhNRJlpP
         bMbV2vc2hJF2/n/xuE2j6dl7/HnDv68zdMSKcXZNU2k60ydJ17jbzUXbGmo0OLlwd1ZG
         HWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761756314; x=1762361114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T6Yvq87RjfDGoZfQIQ/jI8uH+Kr9fw3GzxgtR1hYoeM=;
        b=djBZmhab3mUK/sCXHlRuRgrg7wzleuaHTNYmp7pLMM5ONBlesgELod9gPLjQzl0Ww8
         BbOKKg3nXLi05L+BRYa8vSs/h3PzOKJzezMxaIUBWdREehAXKZcXLh+03z0E2/DPMUVv
         6U+OZXL4J26+P9CM2dgV542eDOeynFlTWkNCXwAxUOuGsaEx5VFsekSRJIiDWhW+M2Xl
         OnFb+M6VFIqSK7VAFMNGoHwO8anTqhybVyqhkU2ibKyQef1Z8B8HwXI+NnqlC1zFsBer
         KmP2DvKmmOwHjIOrvJc5Z5Bf+MV6adVCjMbquD0NbKrrmN8O+kGvGacv91JR4ErFf40W
         41CA==
X-Forwarded-Encrypted: i=1; AJvYcCXFdT+3zeHaKWAuBjx0q3kMERSQAEBSMWFGthaFQ0iOud+4UGLmeoD2w9yTWCF0T/MIYXcOnIGNyfPwLzPq@lists.linux.dev
X-Gm-Message-State: AOJu0YyXkHJkFqx0ulE2o9cmg+wI8Kof7aVnPlYkLSfSkVkYiQ8Z//Kx
	YKSC4eGUwxorlIMc1JRnHUPqHsXW6JkHvV4GxDWfHOvxS9egR2qgWRQpfbXdB8Pn3+PP5mE8WJ3
	LWSZSEXHdfKfJJOkCsvC6BnydWeHyqoa+Q8vjymaL
X-Gm-Gg: ASbGncvxqI0GKNmdFCk+jf7nZPAdU3nieSq1Tt4QwGO6uiacqHynapD5Ni8keX8891d
	LT/7d0Tg5n/CJNjTz7iNu/jLyupFpNWe6T61bk/be3eFmF7y4q6SdMSVYghvpqLfX39TcIeHT12
	r+OR9m6HuJUL/+8BwCiFbyB/O3eijgt+C/jELwuhUcyqNoDhbSgnTk8IrFrCbcHRlfuA9S/Mkg0
	bVCE+d8cZqMG0Oz5/h99xzQSxruDAoax0Ww0Xe+aQkDgV75ImSy+la5RNrb+1A8ixNCtQsUQdGK
	S8HPkaCSXK87OChIpKr43WCJ/Fcl3NIX8Ns4
X-Google-Smtp-Source: AGHT+IFTjCq5zRFL/pa/pzw2TDfmHdo5gdwYuhafswYIDx3FYGu3l8jDGdotAtWKit2GAAmEvemG4aCssZRCbks+jFg=
X-Received: by 2002:a17:903:22c3:b0:291:6858:ee60 with SMTP id
 d9443c01a7336-294de36e83fmr5604045ad.4.1761756313275; Wed, 29 Oct 2025
 09:45:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251028212528.681081-4-kaleshsingh@google.com> <202510290727.qQ5Z8dYd-lkp@intel.com>
In-Reply-To: <202510290727.qQ5Z8dYd-lkp@intel.com>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Wed, 29 Oct 2025 09:45:01 -0700
X-Gm-Features: AWmQ_bnZDUr6HVgVQBTnr0uy6QZaBjFW4H73J_Hzyjw5OPDuikG4zf8P3QPPgSg
Message-ID: <CAC_TJveBC_wSAV9JwTsS10ZN7-dg3JBKAsnkF3un=Tj=uGCaAg@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] mm: Introduce max_vma_count() to abstract the max
 map count sysctl
To: kernel test robot <lkp@intel.com>, akpm@linux-foundation.org
Cc: minchan@kernel.org, lorenzo.stoakes@oracle.com, david@redhat.com, 
	Liam.Howlett@oracle.com, rppt@kernel.org, pfalcato@suse.de, 
	oe-kbuild-all@lists.linux.dev, rostedt@goodmis.org, hughd@google.com, 
	kernel-team@android.com, android-mm@google.com, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Kees Cook <kees@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>, 
	Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 28, 2025 at 5:00=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Kalesh,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on b227c04932039bccc21a0a89cd6df50fa57e4716]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Kalesh-Singh/mm-Do=
cument-lenient-map_count-checks/20251029-052713
> base:   b227c04932039bccc21a0a89cd6df50fa57e4716
> patch link:    https://lore.kernel.org/r/20251028212528.681081-4-kaleshsi=
ngh%40google.com
> patch subject: [PATCH v4 3/5] mm: Introduce max_vma_count() to abstract t=
he max map count sysctl
> config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/2025102=
9/202510290727.qQ5Z8dYd-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20251029/202510290727.qQ5Z8dYd-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202510290727.qQ5Z8dYd-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    m68k-linux-ld: mm/nommu.o: in function `split_vma.constprop.0':
> >> nommu.c:(.text+0xc54): undefined reference to `max_vma_count'

Hi Andrew,

Could you squash the following diff to patch 3/5 to fix this build
error please. I needed to move sysctl_max_map_count out of mm/mmap.c
for the nommu case. Let me know if you'd prefer I resend the series
instead.

Thanks,
Kalesh

diff --git a/mm/mmap.c b/mm/mmap.c
index 3ebe9d5f7dfe..6459dcdf19f9 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1507,13 +1507,6 @@ struct vm_area_struct *_install_special_mapping(
  &special_mapping_vmops);
 }

-static int sysctl_max_map_count __read_mostly =3D DEFAULT_MAX_MAP_COUNT;
-
-int max_vma_count(void)
-{
- return READ_ONCE(sysctl_max_map_count);
-}
-
 #ifdef CONFIG_SYSCTL
 #if defined(HAVE_ARCH_PICK_MMAP_LAYOUT) || \
  defined(CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT)
@@ -1521,14 +1514,6 @@ int sysctl_legacy_va_layout;
 #endif

 static const struct ctl_table mmap_table[] =3D {
- {
- .procname       =3D "max_map_count",
- .data           =3D &sysctl_max_map_count,
- .maxlen         =3D sizeof(sysctl_max_map_count),
- .mode           =3D 0644,
- .proc_handler   =3D proc_dointvec_minmax,
- .extra1         =3D SYSCTL_ZERO,
- },
 #if defined(HAVE_ARCH_PICK_MMAP_LAYOUT) || \
  defined(CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT)
  {
diff --git a/mm/util.c b/mm/util.c
index eb1bcfc1d48d..8cd57df70fcf 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -755,6 +755,13 @@ static unsigned long sysctl_overcommit_kbytes
__read_mostly;
 unsigned long sysctl_user_reserve_kbytes __read_mostly =3D 1UL << 17; /* 1=
28MB */
 unsigned long sysctl_admin_reserve_kbytes __read_mostly =3D 1UL << 13; /* =
8MB */

+static int sysctl_max_map_count __read_mostly =3D DEFAULT_MAX_MAP_COUNT;
+
+int max_vma_count(void)
+{
+ return READ_ONCE(sysctl_max_map_count);
+}
+
 #ifdef CONFIG_SYSCTL

 static int overcommit_ratio_handler(const struct ctl_table *table, int wri=
te,
@@ -858,6 +865,14 @@ static const struct ctl_table util_sysctl_table[] =3D =
{
  .mode =3D 0644,
  .proc_handler =3D proc_doulongvec_minmax,
  },
+ {
+ .procname       =3D "max_map_count",
+ .data           =3D &sysctl_max_map_count,
+ .maxlen         =3D sizeof(sysctl_max_map_count),
+ .mode           =3D 0644,
+ .proc_handler   =3D proc_dointvec_minmax,
+ .extra1         =3D SYSCTL_ZERO,
+ },
 };

 static int __init init_vm_util_sysctls(void)
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to kernel-team+unsubscribe@android.com.
>
