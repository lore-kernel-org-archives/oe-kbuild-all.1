Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B387AD52
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 20:49:10 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id n2so8949362pgb.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 12:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/YkLIE4XGQUjdqUPXuJDlWxY/2OtliIXtuTo197q9Q=;
        b=DfzWbn2QBe0qf/GJjnMcVYSARoRBt+wzlYGrxaDsKG277aSdaQxFXKPSfm6LMeLR27
         9KyU+s8uzxpukNqROKBigdrxPLUTZuaeAZXkxC4naxeVzao2cEMZu40wdaNEI38LV4c4
         cnAZuHUtGUXCwHuCaEtG+CP6CgstHL0WvJnK9ne2uWN3pLe7OmAmBomD0PiXix34gKkZ
         O3xU6k33K8F4LagJf/SzWdP+IIoX6WiVQyRQLzLnQtgSGipcAv2znLvA2KTBf7vSsg67
         yw+PYwXgqeDtlhDDoO7klIiDSCko2nPiQHx/OM2BaJA4jjj0Gai7zweQl+3u401jUFH6
         GdCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9/YkLIE4XGQUjdqUPXuJDlWxY/2OtliIXtuTo197q9Q=;
        b=6R2LhtQASFSrdhZL6oeOwV3PQb32Ai1OEEwiZsqBy1lIadZnYBSp9DYf71u1acn6Nx
         yJRzT1HMGIG9E75zT5VGWI7WZu4pDxtLlR7mpBQB+rK0osf7Qd7L8GfCHRUzGEWxh6Fc
         P0N7Qkr3u4omtIh8RWrnqpg1oALzMRfXZhHX+SIb2ZV2RTmybDzuF6tRnW+f//OY7+Rw
         jUes1SAzo5MhuihBiG6eF8G9cJbNOr2DSng3HGLDV3SEj4+KQVDcQL4uZy7EG+eCxJ+g
         mlh/igWJwJ0UmkgscJPwkJ6j1uNhbEZcN1LfCwXqzs/ubi4KmnoNhUXiP/AG6SScz/7i
         ZDvA==
X-Gm-Message-State: AO0yUKXsnad1s6xiqg649xmyTCjPxqaYEZrTrpM0lSQh8qSc072SYo/j
	gKTsYGxhGWgYIY94qUA60lGUxKm8S6AcBvS0DcMEww==
X-Google-Smtp-Source: AK7set+k5Bx/2yqbeHlo4rmmM63L4TxtGLphsL9pPw8AuG0rl7BxUz9zgLDZ/UgLz6kcY9paa/f1o8Rj/R97+MLb3/U=
X-Received: by 2002:a62:154c:0:b0:5a8:925b:f68e with SMTP id
 73-20020a62154c000000b005a8925bf68emr1442644pfv.28.1676321349183; Mon, 13 Feb
 2023 12:49:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230212092715.1422619-4-davemarchevsky@fb.com>
 <202302121936.t36vlAFG-lkp@intel.com> <d04d33ff-0f8f-2bbd-3a67-9b8b813a799b@meta.com>
In-Reply-To: <d04d33ff-0f8f-2bbd-3a67-9b8b813a799b@meta.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 13 Feb 2023 12:48:57 -0800
Message-ID: <CAKwvOdketskm5z25aPRY7OsBOZe2kzvXV-i9RDTbwcLpZSAT0A@mail.gmail.com>
Subject: Re: [PATCH v5 bpf-next 3/9] bpf: Add bpf_rbtree_{add,remove,first} kfuncs
To: Dave Marchevsky <davemarchevsky@meta.com>
Cc: kernel test robot <lkp@intel.com>, Dave Marchevsky <davemarchevsky@fb.com>, bpf@vger.kernel.org, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Kernel Team <kernel-team@fb.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Tejun Heo <tj@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 13, 2023 at 12:45 PM Dave Marchevsky
<davemarchevsky@meta.com> wrote:
>
> On 2/12/23 6:21 AM, kernel test robot wrote:
> > Hi Dave,
> >
> >>> kernel/bpf/helpers.c:1901:9: warning: cast from 'bool (*)(struct bpf_=
rb_node *, const struct bpf_rb_node *)' (aka '_Bool (*)(struct bpf_rb_node =
*, const struct bpf_rb_node *)') to 'bool (*)(struct rb_node *, const struc=
t rb_node *)' (aka '_Bool (*)(struct rb_node *, const struct rb_node *)') c=
onverts to incompatible function type [-Wcast-function-type-strict]
> >                          (bool (*)(struct rb_node *, const struct rb_no=
de *))less);
> >                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
>
> This is the only new warning introduced by this series. A previous versio=
n had
> the same complaint by kernel test robot.
>
> struct bpf_rb_node is an opaque struct with the same size as struct rb_no=
de.
> It's not intended to be manipulated directly by any BPF program or bpf-rb=
tree
> kernel code, but rather to be used as a struct rb_node by rbtree library
> helpers.
>
> Here, the compiler complains that the less() callback taken by bpf_rbtree=
_add
> is typed
>
> bool (*)(struct bpf_rb_node *, const struct bpf_rb_node *)
>
> while the actual rbtree lib helper rb_add's less() is typed
>
> bool (*)(struct rb_node *, const struct rb_node *)
>
> I'm not a C standard expert, but based on my googling, for C99 it's not v=
alid
> to cast a function pointer to anything aside from void* and its original =
type.
> Furthermore, since struct bpf_rb_node an opaque bitfield and struct rb_no=
de
> has actual members, C99 standard 6.2.7 paragraph 1 states that they're no=
t
> compatible:
>
>   Moreover, two structure,
>   union, or enumerated types declared in separate translation units are c=
ompatible if their
>   tags and members satisfy the following requirements: If one is declared=
 with a tag, the
>   other shall be declared with the same tag. If both are complete types, =
then the following
>   additional requirements apply: there shall be a one-to-one corresponden=
ce between their
>   members such that each pair of corresponding members are declared with =
compatible
>   types, and such that if one member of a corresponding pair is declared =
with a name, the
>   other member is declared with the same name. For two structures, corres=
ponding
>   members shall be declared in the same order
>
> I'm not sure how to proceed here. We could change bpf_rbtree_add's less()=
 cb to

I haven't looked at the series in question, but note that this compile
time warning is meant to help us catch Control Flow Integrity runtime
violations, which may result in a panic.

> take two rb_node *'s, but then each such cb implementation would have to =
cast
> its parameters before doing anything useful with them. Furthermore this w=
ould
> require introducing non-opaque rb_node type into BPF programs. Other idea=
s seem
> similarly hacky.
>
> Note that this flag was only recently introduced [0] and discussion in th=
at
> linked thread notes that ~1500 other places in the kernel raise same warn=
ing.
>
>
>   [0]: https://reviews.llvm.org/D134831
>
>
>
> >    7 warnings generated.
> >
> >
> > vim +1901 kernel/bpf/helpers.c
> >
> >   1896
> >   1897        void bpf_rbtree_add(struct bpf_rb_root *root, struct bpf_=
rb_node *node,
> >   1898                            bool (less)(struct bpf_rb_node *a, co=
nst struct bpf_rb_node *b))
> >   1899        {
> >   1900                rb_add_cached((struct rb_node *)node, (struct rb_=
root_cached *)root,
> >> 1901                       (bool (*)(struct rb_node *, const struct rb=
_node *))less);
> >   1902        }
> >   1903
> >
>


--=20
Thanks,
~Nick Desaulniers
