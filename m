Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB68A7B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Feb 2023 16:56:53 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id fj20so23312953edb.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Feb 2023 08:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p1cg1DRRz1JaMZzQz5gjyIGRehXA474aTNt2f/uRSJM=;
        b=IF764ANRJyJU6rYoxIAVp600GErFsJFtOfOrweZTY0EZxhCMGg8kYMwmPB79DFXQX6
         9ksZNgzzzHFUpgOhlMX6VtbAf8ro5CIEfRzIfDEzAVWqFAn/SeZm7jGolFrMEKOxLl0t
         bhEqAp0flrWasbRkAgTP7MO+IBu2OSkWo6rmqVKLcMRz2LXBk8tlOEBtUQPLml9amAZA
         ISxnQEY+DIzlJL0DWbbCDV0OoEnZ2h6nXcefvREEzUZILgTsTwRqiwM+thBauoc1oAUM
         dJEhj+DbMefbj/i9Q87hzP6W+Epk31x8vQEenktbihmSrc1bG62OrLCMvC+/vczz2kVT
         ZI8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p1cg1DRRz1JaMZzQz5gjyIGRehXA474aTNt2f/uRSJM=;
        b=QV+s1s1NTR2VRjvfj4hb4OMODXkLpwgKO5CXCm3ttpK1Ijh/ZNH6o9seMlM8oHSGh4
         hoiRQwC8woX02GsJfJimnu4CtmydP2qB1gkFK50P8PIU3PCbzx6OZHxTWwwO8KDRgn8z
         GQhNXT5TYZwIrR3PZav34DAlA4nA3cGOSdxX/AZq9IqiBMz1w+8SeKodOxmEinTK9Znf
         pTb2G1LT9zTmvuzdtsIiM5JmTiNujEBIS99mdRF8edVdoHQO2qYZxfXkoF/41Cbv94HC
         BPHrEsgXKXlh8KxoBEPFTR3PhfsePrh0qvY8o1Li/X7sRjohCbuuobnlk2LVeHpwAuE3
         QeDQ==
X-Gm-Message-State: AO0yUKV61g3u4XRSCK2yRkX5/8SlYZ5K/1crjPpojiQA31BflFlwpNor
	3q2b5kT55BCsuY76YqdW8hrNs9Dp3lv8Xo84US6IyQ==
X-Google-Smtp-Source: AK7set/orVNgERaoDcGFR7X5BTU7TYwffuscXH0ZtL+qYOwGEL8EdaONdtfrxp4hHOSVReHJAO1mKX38bhTMGemL9+M=
X-Received: by 2002:a50:d51a:0:b0:4ac:be68:c0f8 with SMTP id
 u26-20020a50d51a000000b004acbe68c0f8mr1516714edi.5.1676480211799; Wed, 15 Feb
 2023 08:56:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230212092715.1422619-4-davemarchevsky@fb.com>
 <202302121936.t36vlAFG-lkp@intel.com> <d04d33ff-0f8f-2bbd-3a67-9b8b813a799b@meta.com>
 <CAKwvOdketskm5z25aPRY7OsBOZe2kzvXV-i9RDTbwcLpZSAT0A@mail.gmail.com>
 <CAADnVQ+qJMAugDDQXaerRbh0g4QdRygMZ_0UVmXViR2aJ4OLDQ@mail.gmail.com>
 <CABCJKucDXNeGCdD6uT7phYhpm+OgYm19EkfCNMB9AJ66k4NcvQ@mail.gmail.com>
 <Y+tupCQ/X38AlvY0@hirez.programming.kicks-ass.net> <CABCJKuc1iqHjg9ERVXMHO00rOqaNGM=d7xTvB4f6fTM4J4-nTA@mail.gmail.com>
 <CAADnVQJz4uCWwLigFUXi-W=fnW-AencgNz52SwKBuDCkzNNMpQ@mail.gmail.com> <Y+ypV+Ninap11QeX@hirez.programming.kicks-ass.net>
In-Reply-To: <Y+ypV+Ninap11QeX@hirez.programming.kicks-ass.net>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 15 Feb 2023 08:56:15 -0800
Message-ID: <CABCJKufd8fnaLYH+Mujq2ijsA40+6+QjDahfFej0=gkEad+ikQ@mail.gmail.com>
Subject: Re: [PATCH v5 bpf-next 3/9] bpf: Add bpf_rbtree_{add,remove,first} kfuncs
To: Peter Zijlstra <peterz@infradead.org>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Dave Marchevsky <davemarchevsky@meta.com>, 
	kernel test robot <lkp@intel.com>, Dave Marchevsky <davemarchevsky@fb.com>, bpf <bpf@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, oe-kbuild-all@lists.linux.dev, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Kernel Team <kernel-team@fb.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>, 
	Joao Moreira <joao@overdrivepizza.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 15, 2023 at 1:44 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Tue, Feb 14, 2023 at 03:59:57PM -0800, Alexei Starovoitov wrote:
> > How is 'kcfi' 32-bit hash computed?
> > Some kind of hash of type id-s?
>
> Yes. Specifically I think a hash of the C++ name mangled function
> signature. (which is giving pain with eg. Rust because then the C++
> mangling isn't specific enough or somesuch, I'm sure Sami can easily
> find it if you want to know more)

The Rust pain is mostly about type system differences when it comes to
integer types, but we're working on fixing that.

> > Also what to do with the situation when kernel is compiled with GCC
> > while bpf progs are with clang? and the other way around ?
> > gcc-bpf can compile all of selftests/bpf, but not yet run them.
>
> As of yet GCC doesn't support kCFI, so mixing is not possible at
> present. kCFI fundamentally changes the C ABI in incompatible ways.

When it comes to the BPF programs themselves, it shouldn't matter
which compiler you use to compile them as the BPF back-end doesn't
emit CFI instrumentation. I'm also fairly sure that the function type
in the BPF C program doesn't necessarily have to exactly match the
function pointer type used to call the JIT compiled version of that
function in the kernel, and the latter one is what actually matters.

Sami
