Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3F035FC2D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Aug 2025 11:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756294835; cv=none; b=HiL6vfjiR0gYCscNQSKCZEcuZcqIYziDZB7w3rOzqj6QzZHk4CBNoTNm1tcJ0TASMpxzdbFvhNL8W2RYOcXSX6/loB/u7t47Nrz2Lcsz+xnO72zQpSJ2NJZOustuvQiJDoDgGwmrXjsJ7tOLT1ESFF+/LxyD64CSUkB6b2U5h+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756294835; c=relaxed/simple;
	bh=Fk6GDvLmkCDGrIsjIvWcI3MTNYRmrykY6dKZ5Wy6aO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sbTRdR3OOX2O3n8npT+RiDwayMhRe5ka4LpP7M/rZT5MDD6hJYDRmwXycVgHyCs6TdF8jeFEk3a8Qzwhke0grlgflM0CvT6ZeHJV+OQfAhw2W0tM+FYx81e0hyf7/eig0Ow3VhmhMkf+5G4XAoJ+9SEFn9q9s9stjoQWXiUXn9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NPuE+n6t; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NPuE+n6t"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4b297962b9cso66258661cf.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Aug 2025 04:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756294832; x=1756899632; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XeoM2pRAda8SuuPICRFUFFSQ54mI0ws6ytKPaFfrQVE=;
        b=NPuE+n6tNG2j5e8XuyoMBNjrKZToY8i7AVN1EPKtf8UM/I9kx/z+qHLXtHCzkN4Ddz
         6WhrNHDmahkH6m26YFZzOSwtxwIzemXQvoEN0HtXInILZTIfCN+AVwNTlWwPrQK+28ii
         OkFzZvXC1GHof5KKH9EIzTW5Xr2XIf13qSoYENm8oerEFRpOj3o7Ah1gFR0uKBjF4wm7
         2oAvMaTZH4wJn7lNZ2tlZ4GgykBs8a9EcLs6AuArsnC10YbjGZLDUvPsontt9MbxHFy/
         3WrbzPhhtAsPuwykOHol0xPspqtzUfxgj/mykqiu9q0j24iVWHsAJem5nZXwtFFij7nj
         bL3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756294832; x=1756899632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XeoM2pRAda8SuuPICRFUFFSQ54mI0ws6ytKPaFfrQVE=;
        b=Jz9sgjTE/F9yWjg4AKYpCVQ6HnRHxmW2xCjsxt/VGpA4gQWESQLDZQ/D0UYYqcSeyX
         DtN2IBa6yG9LPu/DL2fSf+YPUIFsmw8SHQM8JaNneiaY56jZL3Wg3KY1KLi7zJFjuXz+
         R4Tzxw0lLv0Jicf+Q+xe+JOcRHQR6XxinxtCRSOuyqUgSmFSUB27YSwYSdO2zIgqiGft
         AIYlEm14n1pHrhh/quwlx7mmXZ/oISVciwdbwlYl+3bHiwmTurLWNwxplSb+PJwTT0Dw
         ernbNbvZFstsZOH/vf7m5AEqbjlvFU6T5vGOViTIxcTv+1or1BKbFaMJP5fBfvHeqoig
         nm4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXIU1578VhvY49J0gdCjsz1Uw0MM5my679iVYREX6v1Z7uil9MN0H7sSNck7wmV8FFSZXc/PSuvbIF4LaV6@lists.linux.dev
X-Gm-Message-State: AOJu0YwfcaeJdz4rMRAL4Oyu7MZSmlTZIlKroqWCz3L8sQkFSKbyLUNx
	92Vd6pmCCMIQv8AR0X111hX0sX/OjU9FlT69Bob00xCkefmHnyBpPsxkdBmoUc3ok85b/UY0CI9
	8wuLy6JFinR9KjAsxG6id6gpPl36vCRE=
X-Gm-Gg: ASbGncv9dyS2lGae0v/KAHN+3vutAKDzhIe5MLFAt9/jLRXcVHeaMymS1vrjwS8l3EX
	5gDyZLNTnG8d83IoSQ6Pr0Cdxs9qQiA8vACqGP+tFWsqRExyUoe5gT9+a+JoRhYhu003pO5l1Kg
	he67XJCVZq/SxV6xOakDyZtz2uaxf2/lkdaoeeqMKAuCAnEh7r9nJvNiwSmDh/D5SQF2AYfahDO
	QrJgsaTsVUFIP/AFgdYFDkkroz6CknO0JquO9aDLOc/mxP1eTY=
X-Google-Smtp-Source: AGHT+IELLrqV3R85XBc6agU/7DzAWxsj82fvVPd+3fVYozs8/RRKK8VEk3bA7WWCc4E5Pk4l/H0YX2Fkq99QBUTmqQk=
X-Received: by 2002:ad4:5cab:0:b0:708:1296:c5ab with SMTP id
 6a1803df08f44-70d971e4042mr226760146d6.34.1756294832315; Wed, 27 Aug 2025
 04:40:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250826071948.2618-2-laoar.shao@gmail.com> <202508271009.5neOZ0OG-lkp@intel.com>
In-Reply-To: <202508271009.5neOZ0OG-lkp@intel.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Wed, 27 Aug 2025 19:39:55 +0800
X-Gm-Features: Ac12FXwZr66D7NPE9H9ynH6vKXzl7w2VfiSW67LSXeqGM2TeN__rIRX4dJec3k8
Message-ID: <CALOAHbCtE-Sjeja3gzGwooWcikGWetPj8k6wqk52_c0hEo5ZKQ@mail.gmail.com>
Subject: Re: [PATCH v6 mm-new 01/10] mm: thp: add support for BPF based THP
 order selection
To: kernel test robot <lkp@intel.com>
Cc: akpm@linux-foundation.org, david@redhat.com, ziy@nvidia.com, 
	baolin.wang@linux.alibaba.com, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com, 
	dev.jain@arm.com, hannes@cmpxchg.org, usamaarif642@gmail.com, 
	gutierrez.asier@huawei-partners.com, willy@infradead.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, ameryhung@gmail.com, 
	rientjes@google.com, corbet@lwn.net, oe-kbuild-all@lists.linux.dev, 
	bpf@vger.kernel.org, linux-mm@kvack.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 27, 2025 at 10:58=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
>
> Hi Yafang,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on akpm-mm/mm-everything]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Yafang-Shao/mm-thp=
-add-support-for-BPF-based-THP-order-selection/20250826-152415
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-ev=
erything
> patch link:    https://lore.kernel.org/r/20250826071948.2618-2-laoar.shao=
%40gmail.com
> patch subject: [PATCH v6 mm-new 01/10] mm: thp: add support for BPF based=
 THP order selection
> config: loongarch-randconfig-r113-20250827 (https://download.01.org/0day-=
ci/archive/20250827/202508271009.5neOZ0OG-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b=
5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> reproduce: (https://download.01.org/0day-ci/archive/20250827/202508271009=
.5neOZ0OG-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202508271009.5neOZ0OG-lkp=
@intel.com/

Thanks for the report .
It seems this sparse warning can be fixed with the below additional
change, would you please test it again?

diff --git a/mm/bpf_thp.c b/mm/bpf_thp.c
index 46b3bc96359e..b2f97f9e930d 100644
--- a/mm/bpf_thp.c
+++ b/mm/bpf_thp.c
@@ -5,27 +5,32 @@
 #include <linux/huge_mm.h>
 #include <linux/khugepaged.h>

+/**
+ * @get_suggested_order: Get the suggested THP orders for allocation
+ * @mm: mm_struct associated with the THP allocation
+ * @vma__nullable: vm_area_struct associated with the THP allocation
(may be NULL)
+ *                 When NULL, the decision should be based on @mm (i.e., w=
hen
+ *                 triggered from an mm-scope hook rather than a VMA-speci=
fic
+ *                 context).
+ *                 Must belong to @mm (guaranteed by the caller).
+ * @vma_flags: use these vm_flags instead of @vma->vm_flags (0 if @vma is =
NULL)
+ * @tva_flags: TVA flags for current @vma (-1 if @vma is NULL)
+ * @orders: Bitmask of requested THP orders for this allocation
+ *          - PMD-mapped allocation if PMD_ORDER is set
+ *          - mTHP allocation otherwise
+ *
+ * Rerurn: Bitmask of suggested THP orders for allocation. The highest
+ *         suggested order will not exceed the highest requested order
+ *         in @orders.
+ */
+typedef int suggested_order_fn_t(struct mm_struct *mm,
+                                struct vm_area_struct *vma__nullable,
+                                u64 vma_flags,
+                                enum tva_type tva_flags,
+                                int orders);
+
 struct bpf_thp_ops {
-       /**
-        * @get_suggested_order: Get the suggested THP orders for allocatio=
n
-        * @mm: mm_struct associated with the THP allocation
-        * @vma__nullable: vm_area_struct associated with the THP
allocation (may be NULL)
-        *                 When NULL, the decision should be based on
@mm (i.e., when
-        *                 triggered from an mm-scope hook rather than
a VMA-specific
-        *                 context).
-        *                 Must belong to @mm (guaranteed by the caller).
-        * @vma_flags: use these vm_flags instead of @vma->vm_flags (0
if @vma is NULL)
-        * @tva_flags: TVA flags for current @vma (-1 if @vma is NULL)
-        * @orders: Bitmask of requested THP orders for this allocation
-        *          - PMD-mapped allocation if PMD_ORDER is set
-        *          - mTHP allocation otherwise
-        *
-        * Rerurn: Bitmask of suggested THP orders for allocation. The high=
est
-        *         suggested order will not exceed the highest requested or=
der
-        *         in @orders.
-        */
-       int (*get_suggested_order)(struct mm_struct *mm, struct
vm_area_struct *vma__nullable,
-                                  u64 vma_flags, enum tva_type
tva_flags, int orders) __rcu;
+       suggested_order_fn_t __rcu *get_suggested_order;
 };

 static struct bpf_thp_ops bpf_thp;
@@ -34,8 +39,7 @@ static DEFINE_SPINLOCK(thp_ops_lock);
 int get_suggested_order(struct mm_struct *mm, struct vm_area_struct
*vma__nullable,
                        u64 vma_flags, enum tva_type tva_flags, int orders)
 {
-       int (*bpf_suggested_order)(struct mm_struct *mm, struct
vm_area_struct *vma__nullable,
-                                  u64 vma_flags, enum tva_type
tva_flags, int orders);
+       suggested_order_fn_t *bpf_suggested_order;
        int suggested_orders =3D orders;

        /* No BPF program is attached */
@@ -106,10 +110,12 @@ static int bpf_thp_reg(void *kdata, struct bpf_link *=
link)

 static void bpf_thp_unreg(void *kdata, struct bpf_link *link)
 {
+       suggested_order_fn_t *old_fn;
+
        spin_lock(&thp_ops_lock);
        clear_bit(TRANSPARENT_HUGEPAGE_BPF_ATTACHED,
&transparent_hugepage_flags);
-       WARN_ON_ONCE(!rcu_access_pointer(bpf_thp.get_suggested_order));
-       rcu_replace_pointer(bpf_thp.get_suggested_order, NULL,
lockdep_is_held(&thp_ops_lock));
+       old_fn =3D rcu_replace_pointer(bpf_thp.get_suggested_order,
NULL, lockdep_is_held(&thp_ops_lock));
+       WARN_ON_ONCE(!old_fn);
        spin_unlock(&thp_ops_lock);

        synchronize_rcu();
@@ -117,8 +123,9 @@ static void bpf_thp_unreg(void *kdata, struct
bpf_link *link)

 static int bpf_thp_update(void *kdata, void *old_kdata, struct bpf_link *l=
ink)
 {
-       struct bpf_thp_ops *ops =3D kdata;
+       suggested_order_fn_t *old_fn, *new_fn;
        struct bpf_thp_ops *old =3D old_kdata;
+       struct bpf_thp_ops *ops =3D kdata;
        int ret =3D 0;

        if (!ops || !old)
@@ -130,9 +137,10 @@ static int bpf_thp_update(void *kdata, void
*old_kdata, struct bpf_link *link)
                ret =3D -ENOENT;
                goto out;
        }
-       WARN_ON_ONCE(!rcu_access_pointer(bpf_thp.get_suggested_order));
-       rcu_replace_pointer(bpf_thp.get_suggested_order,
ops->get_suggested_order,
-                           lockdep_is_held(&thp_ops_lock));
+
+       new_fn =3D rcu_dereference(ops->get_suggested_order);
+       old_fn =3D rcu_replace_pointer(bpf_thp.get_suggested_order,
new_fn, lockdep_is_held(&thp_ops_lock));
+       WARN_ON_ONCE(!old_fn || !new_fn);

 out:
        spin_unlock(&thp_ops_lock);
@@ -159,7 +167,7 @@ static int suggested_order(struct mm_struct *mm,
struct vm_area_struct *vma__nul
 }

 static struct bpf_thp_ops __bpf_thp_ops =3D {
-       .get_suggested_order =3D suggested_order,
+       .get_suggested_order =3D (suggested_order_fn_t __rcu *)suggested_or=
der,
 };

 static struct bpf_struct_ops bpf_bpf_thp_ops =3D {


--
Regards

Yafang
