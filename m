Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03D03976A9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Sep 2026 19:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789413006; cv=pass; b=WfKCMruJEgS+MEyfycn9AG0vS+gmsUXsWOT7tXNbi4xxRvj24bz+biA8W7Q8b435jiVKHGHoNFJDYeJZZm6oXLnKvU43VASCIyjUhi1jsuy6gakJqZ/Sz3mxw0FpGYlo9yPOHqqVFQmBgCPXk+L8gxfj8dkxL8zabyNxCytv1gY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789413006; c=relaxed/simple;
	bh=3/K0TVzDduuB1bC1NRuQyqOKhNXefGdg5h1mmSAwe3w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZM4M7/fNm6J0Bmi3SvBr1EjMsbW8kVh37DZzrqk93I4POb9oMXbwfz8TGWg2RFwTfjpIRPIRRSL8fRnFd23+r3syZsBxquRI8J1OhcgdbJK3qknGvRVdB1TuM4JgBFOoBFOsSeuP5OYkFxMfT5fjboonjOShtYFp0ZwfpxFUnnw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=phqSb/g7; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="phqSb/g7"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530411c7ee1so478761cf.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Sep 2026 12:09:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789412997; cv=none;
        d=google.com; s=arc-20260327;
        b=bYX1N9vhwEGAJb75Wg+yekejGg2rIvgH7+hh+SOVJY4nV4PV7uHPEjAVh+RPqH1/1J
         emsxchptqd93TlGeVD+3kH6pAymHVvOsybIAAJ1d6SgJ9WMlnItVN29G6tHxtJSdok1L
         tJWFhvPWubrsRsFdUPXjJ4t9ed2n4t9gAMYEVe+TSze2i/eNpjVHrqYONUP2/+3Wv8uo
         DMWRuYGDT9Pq+h03GbHTDUabJwn8CusZKyifXg8o7JqXNV5+YzrQHXdFnmEhn8sIfhyN
         Uu4etSCQ2F7AQFWFbXlKp2ddzfmGyEvHL6j0CHOVCrRBnO6Edchgo9LvqT+AonsVESmf
         R5Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B9HHz7xqKOBgQRJBunlMxL3q9HNHJ9DU71Gm8Qozrv4=;
        fh=zlmRssePOcGaapRFkfRHp9KQqClzrF4a2nIDMGJW33s=;
        b=jnELcSMMmdK6SVavteGMNU1nzh8UfQCPdN6aG8r+96D/zDs/LBu0316SxvqI7bMe6e
         rAugAFpW1Agnwac/HkiB/5GLDFz4FdkBB701bzoeSQgp8tuJdCsvtUyT4x14DBNBeqw4
         YHXOAgXebup7Yb6/unerk63PI3dBc+MrITzPz5roetmTgoR3kJOoqxDHyQ3D7v/qLBsV
         H+a+lEEoIpsyfK3r9ve/o8yoU4yWXQXYZw4/XICTspkXvlM0CCY74P1WKmy20MyK3Xbl
         ErD7Kh8NgcjP0HHe5M++LKxOqQDzRnSHW3rSIurvOZuSujd9dbiUrlx0Jt8ypD92YhO4
         C9TQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789412997; x=1790017797; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B9HHz7xqKOBgQRJBunlMxL3q9HNHJ9DU71Gm8Qozrv4=;
        b=phqSb/g7YRBZkXKKh697Nnqu36IJtcC/UbTdrwikM2nYGbUPLd4+9G3LdpgpfHur4v
         OZqgOeia/89g70IQbP7ImR0uZJ7boHCKQ7vIWYtAvuJOUtvq8I3ahEhu5cs43qBIwzgz
         PmOEmIPH82REAHatT8iXl0JC5Ww0TFDEWn3WT8LkTQUb1Fbd9KQnfG0gFz2Q4zuAnj4N
         T+Gtaoop07cg/pNHfwD0VN3wNspvTnRPzDCil8BbU1wgp0sF9Ea45q/N9yHYVeLno1PL
         4drsTtkVUMVOWZSoODyx/yAF2W5JWiEMlvzW9cWJyCCwghQ+KepCf+KRvy0jHqf9NZHq
         KSVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789412997; x=1790017797;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B9HHz7xqKOBgQRJBunlMxL3q9HNHJ9DU71Gm8Qozrv4=;
        b=ZGsS+t7aBdhY2knm8GJcPQPw36/gvulsw4kRoCHVXA3EAw3kz3d+u4ucBweFNjLY4+
         K4KH0C43fkPdmi0zgxY1Lcbj6dRpUgtf+1XP6VQup0+kRJf15iYJJJMU4gIYp7j4ZRNM
         1TgPslD3RoxQCikUGyoxZZz5MwhcjL8N9/ZqyyB2gYe18dyok7IjJQsSSjUpytqoCDmL
         HtJMNTrV18OZogG7ejux6epWbzTT6Euz5gpgOI1l2yNwS+zoDvRAkNtFlZKdn0viFIjB
         vjg27hEVFyyYO3/uYqxequcX1y0uYcmELKCT8hA9xI6UxzfIfWd1Urs/T4QuHCFJS4qe
         mxsg==
X-Gm-Message-State: AFuF++lbm5PtqrrxjKlrUB3uKjxdxFUIz4vmQXznCiT90wOiG4sMDcjl
	g4hj5UBGNXoDekkUrtAryHCB4AVbTXDPR97glxr7hlxI1f6JkZopOyxgZMd333nRLbdLB+ZhNlJ
	WB8DOSSO5ZwpE43od4RuIQtDFp582UmUt0QVTH3jr
X-Gm-Gg: AYBFou358E5T3ipsJR04FEv7+H00bCpaH6pb876JLUpqNMUWOiISMIB1NKtgP6VI6An
	oMVe0YCqNBlTNxfrnJMY3oNkQX3w0jDKfR1vQKniKgvlAElJEhninum2dCPTqKJVYQLv7KshdZ9
	uOG3DfiockyQX96Bqa+YLEOz+MDq5s72RDqEidMRN71b85vRpNN+4EhjUry1tBujFvzZRCB9TsX
	8aObodcAT9ogyMJ4gBknwWLjJg3cjCCH5nAndn3pW2XzwXbnEDfWPQJrAiuXLZtnjC+RCAAPeNU
	rb9ymrauw2lGHpQ/7HdVHhc/gYDWIoLEdr+pGuwWcYCIUYAha1rXAhQhl99pmwv3NdWrMuBTB6O
	QnnMYeDtHKw==
X-Received: by 2002:a05:622a:5809:b0:530:3f93:9023 with SMTP id
 d75a77b69052e-5311a5c4ddamr3464331cf.4.1789412996591; Mon, 14 Sep 2026
 12:09:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202609121422.hkKWuy7K-lkp@intel.com>
In-Reply-To: <202609121422.hkKWuy7K-lkp@intel.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 14 Sep 2026 12:09:45 -0700
X-Gm-Features: AcwNN1V0cr3-51H8jG05tRliUGeoBV1UMLQnVvmfkEsxoTHflVeOK11wY4wInNQ
Message-ID: <CAJuCfpEzfP8nWnD2v6Wfb73h7ejD4NHNqz=TnXa18pvZgWz6ug@mail.gmail.com>
Subject: Re: [akpm-mm:mm-new 439/459] fs/proc/task_mmu.c:205:13: warning:
 'reacquire_rcu' defined but not used
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, mm-commits@vger.kernel.org, 
	"Liam R. Howlett (Oracle)" <liam@infradead.org>, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 5:41=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-ne=
w
> head:   383fc05d4650b021f3c17e36a145106dcc61a294
> commit: 2a61a4b80dc01581dc9f6935eedefbd596e77409 [439/459] proc/task_mmu:=
 remove unnecessary inlines in function definitions
> config: openrisc-randconfig-r053-20260912 (https://download.01.org/0day-c=
i/archive/20260912/202609121422.hkKWuy7K-lkp@intel.com/config)
> compiler: or1k-linux-gcc (GCC) 16.1.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260912/202609121422.hkKWuy7K-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202609121422.hkKWuy7K-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> fs/proc/task_mmu.c:205:13: warning: 'reacquire_rcu' defined but not us=
ed [-Wunused-function]
>      205 | static void reacquire_rcu(struct proc_maps_private *priv)
>          |             ^~~~~~~~~~~~~
> >> fs/proc/task_mmu.c:197:13: warning: 'drop_rcu' defined but not used [-=
Wunused-function]
>      197 | static void drop_rcu(struct proc_maps_private *priv)
>          |             ^~~~~~~~
>    fs/proc/task_mmu.c:133:12: warning: 'lock_ctx_mm' defined but not used=
 [-Wunused-function]
>      133 | static int lock_ctx_mm(struct proc_maps_locking_ctx *lock_ctx)
>          |            ^~~~~~~~~~~
>

Fixup is posted at
https://lore.kernel.org/all/20260914190631.3167420-1-surenb@google.com/

>
> vim +/reacquire_rcu +205 fs/proc/task_mmu.c
>
>    196
>  > 197  static void drop_rcu(struct proc_maps_private *priv)
>    198  {
>    199          if (priv->lock_ctx.mmap_locked)
>    200                  return;
>    201
>    202          rcu_read_unlock();
>    203  }
>    204
>  > 205  static void reacquire_rcu(struct proc_maps_private *priv)
>    206  {
>    207          if (priv->lock_ctx.mmap_locked)
>    208                  return;
>    209
>    210          rcu_read_lock();
>    211          /* Reinitialize the iterator. */
>    212          vma_iter_set(&priv->iter, priv->lock_ctx.locked_vma->vm_e=
nd);
>    213  }
>    214
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
