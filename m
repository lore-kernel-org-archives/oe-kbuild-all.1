Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656911EA87
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 08:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cuZCJqTl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701333789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6duvYTCIHLWyO61x9wBLByulbCENKWZUW2PQV7NcSHw=;
	b=cuZCJqTlabsZkU4xkpJ9ERmKDxPK5MZOfdDwxnkrgriP+mGhwWjKOn1b0zDOS3zgLssmXm
	Oi47kGVE7rlgOpnuUrngOz+21LACEYLDgWI9kDzGnPtSJWQ3kcKDOuyZqswwOahPqAakeO
	8/ktla6pqbweb+Sd6TS6ug69eq8PATY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-ItSKwKmdNPafA0h_-dQ4pA-1; Thu, 30 Nov 2023 03:43:05 -0500
X-MC-Unique: ItSKwKmdNPafA0h_-dQ4pA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBB2B185A78E;
	Thu, 30 Nov 2023 08:43:04 +0000 (UTC)
Received: from localhost (unknown [10.72.113.121])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A79D2166B26;
	Thu, 30 Nov 2023 08:43:03 +0000 (UTC)
Date: Thu, 30 Nov 2023 16:43:00 +0800
From: Baoquan He <bhe@redhat.com>
To: kernel test robot <lkp@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Eric DeVolder <eric_devolder@yahoo.com>
Subject: Re: [akpm-mm:mm-unstable 25/192] loongarch64-linux-ld:
 kexec_core.c:undefined reference to `machine_kexec'
Message-ID: <ZWhLFDC6vHsxNCpY@MiWiFi-R3L-srv>
References: <202311300946.kHE9Iu71-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202311300946.kHE9Iu71-lkp@intel.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 11/30/23 at 12:02pm, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-un=
stable
> head:   cb1d236cb1038fa1bbae9913803f1c655b86d931
> commit: f8ff23429c625c2b2a134d87f490a89a98c544ce [25/192] kernel/Kconfig.=
kexec: drop select of KEXEC for CRASH_DUMP
> config: loongarch-randconfig-r122-20231130 (https://download.01.org/0day-=
ci/archive/20231130/202311300946.kHE9Iu71-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 13.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20231130/202311300946=
.kHE9Iu71-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202311300946.kHE9Iu71-lkp=
@intel.com/
>=20
> All errors (new ones prefixed by >>):
>=20
>    loongarch64-linux-ld: kernel/kexec_core.o: in function `.L209':
> >> kexec_core.c:(.text+0x1660): undefined reference to `machine_kexec_cle=
anup'
>    loongarch64-linux-ld: kernel/kexec_core.o: in function `.L287':
> >> kexec_core.c:(.text+0x1c5c): undefined reference to `machine_crash_shu=
tdown'
> >> loongarch64-linux-ld: kexec_core.c:(.text+0x1c64): undefined reference=
 to `machine_kexec'
>    loongarch64-linux-ld: kernel/kexec_core.o: in function `.L2=025':
> >> kexec_core.c:(.text+0x2090): undefined reference to `machine_shutdown'
>    loongarch64-linux-ld: kexec_core.c:(.text+0x20a0): undefined reference=
 to `machine_kexec'

Thanks for report, below patch can fix it.

Hi Andrew,

There are several places in m68k, mips, sh architecture which have the
similar issue. Would you prefer one patch to contain them all or
separate patches for each architecture's fix?

From 0549728ffab3c2e75f71b4696fa6f9709a85b946 Mon Sep 17 00:00:00 2001
From: Baoquan He <bhe@redhat.com>
Date: Thu, 30 Nov 2023 16:22:46 +0800
Subject: [PATCH] LoongArch: change dependency of object files
Content-type: text/plain

Currently, in arch/loongarch/kernel/Makefile, building machine_kexec.o
relocate_kernel.o depends on CONFIG_KEXEC.

Whereas, since we will drop the select of KEXEC for CRASH_DUMP in
kernel/Kconfig.kexec, compiling error will be triggered if below config
items are set:

=3D=3D=3D
CONFIG_CRASH_CORE=3Dy
CONFIG_KEXEC_CORE=3Dy
CONFIG_CRASH_DUMP=3Dy
=3D=3D=3D

---------------------------------------------------------------
loongarch64-linux-ld: kernel/kexec_core.o: in function `.L209':
>> kexec_core.c:(.text+0x1660): undefined reference to `machine_kexec_clean=
up'
   loongarch64-linux-ld: kernel/kexec_core.o: in function `.L287':
>> kexec_core.c:(.text+0x1c5c): undefined reference to `machine_crash_shutd=
own'
>> loongarch64-linux-ld: kexec_core.c:(.text+0x1c64): undefined reference t=
o `machine_kexec'
   loongarch64-linux-ld: kernel/kexec_core.o: in function `.L2^B5':
>> kexec_core.c:(.text+0x2090): undefined reference to `machine_shutdown'
   loongarch64-linux-ld: kexec_core.c:(.text+0x20a0): undefined reference t=
o `machine_kexec'
---------------------------------------------------------------

Here, changing the dependency of machine_kexec.o relocate_kernel.o to
CONFIG_KEXEC_CORE can fix above building error.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202311300946.kHE9Iu71-lkp@int=
el.com/
Signed-off-by: Baoquan He <bhe@redhat.com>
---
 arch/loongarch/kernel/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/Makefile b/arch/loongarch/kernel/Makefil=
e
index 4fcc168f0732..3c808c680370 100644
--- a/arch/loongarch/kernel/Makefile
+++ b/arch/loongarch/kernel/Makefile
@@ -57,7 +57,7 @@ obj-$(CONFIG_MAGIC_SYSRQ)=09+=3D sysrq.o
=20
 obj-$(CONFIG_RELOCATABLE)=09+=3D relocate.o
=20
-obj-$(CONFIG_KEXEC)=09=09+=3D machine_kexec.o relocate_kernel.o
+obj-$(CONFIG_KEXEC_CORE)=09+=3D machine_kexec.o relocate_kernel.o
 obj-$(CONFIG_CRASH_DUMP)=09+=3D crash_dump.o
=20
 obj-$(CONFIG_UNWINDER_GUESS)=09+=3D unwind_guess.o
--=20
2.41.0

