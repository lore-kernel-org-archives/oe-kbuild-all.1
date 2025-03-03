Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000991EDA22
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Mar 2025 22:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741040226; cv=none; b=iCYkz7L7cdUu3BKFjsHOPeIRlf8g3kdcy0y68GLS14zdboc6NvZ0+Qeg4PiefgAVwWwCQSBMy65BCnGirkbJCoR8jipqlbwNd3Sg4vxTZtTw1uIDmx+NrEFHMAzOXWXmBUch6bLZre56ql8rY9C0lwwVJWhHj4EQqxoM2acQrVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741040226; c=relaxed/simple;
	bh=Pu+2gPAMyjcIfhSxV1ioycn2jbZK7PVy105ahAQg0Aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TkdqtR1IO4IgqYAiWpgPM4OyvELVUlvida8e+C1j3qkkYwDr2tbhOhOOd0wEB4pAqj+aAJtrztIiA8wddIIiu8gA7sghPdLQL+xnS++PB5/1IQgDBshCYwCejFIiYOvyPgXT3wZ0U3FtsJf6JHN4tWA41CnBssYnIntiZkINohE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zbw3Z71u; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zbw3Z71u"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-223722270b7so20585ad.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 03 Mar 2025 14:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741040224; x=1741645024; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y2g5LjnoCgSVPYj+V0KyZ1ldqlVr5HdI2cHTBekjJ8s=;
        b=zbw3Z71uE+CEr7M3DwIuw3c5BYMPx+sZWiWYcFjf3AhGgc0mVLZT7KLBHm5COJrntf
         uK8bfmR6zsbw2khRxAeeIT0ljATVOOoJjo3n/dSoA0wN0OXmc5YnI7zVIwbqxc9zalb1
         qcOBjPuWU8F6Vbs+6IKgHvZ2mJKS+FOel0ut4HBc24qNcH7MkJhX68+e0nfxo+K2ChdE
         /wIVU8TF/Gg7V0CaGsLAcx0cXx2afVD1viTS4WvqlESlf1QMFqzRhInRNApwyqRIFy6f
         L8NaTdJFNpG2+W9m3nmHBBsW0KoZNWDjtBMyEb6ZR/4+Zsqa+xHUeikQ2xZpmNsxpUVA
         4gnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741040224; x=1741645024;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y2g5LjnoCgSVPYj+V0KyZ1ldqlVr5HdI2cHTBekjJ8s=;
        b=LmbzSh95Wyr/hS08Au25JjDHDaa3rou/qfz6LXryB8SOYX5fO1gbsFxNIIasEkohR7
         ykyYeHTTwbW82BmGvtCrwfXbIYQckn75tw1pGuZn+cknDEnMmLgcEOASP8ZHbVNi+Np9
         z44vbNmTA+fhhsN9ecWclVir1IfUutcXal2qTITJSyCU0s7eBFFNOVrknSeoGgQxUmGP
         PVQF0fp9HLGXSOg+ZtkU7fzA0yWp+f+6SKBom6zoFkrNZPa0vXeab/8pEHDV09t9Pwkj
         RyfC6KM3dRCkWQoiB2dkrGAOGKGcZmm0oubPAgP06a3IXuIY6RyG720APlacSOJ9l5S4
         ESJQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0D1rgI6Jkqtgi0CMrYfVI2+in02keuHtXO0tGSk28mDMs+28QI2KcX1QqY96JlEsueC/3+vU/bOQVV18w@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5tB4qyhci/szUYOJOCeSyJ0A1BrAEe8L94rkBzzNmPOnTtBxz
	rvXOPh+wSjcQkn3fEM1Z9SDsEvXL8aMFeYDTjTARkvlKXHuCzoyZh5mFsd7K6Q==
X-Gm-Gg: ASbGncspQ2bg54y5EAr5yM7dI/0quIgEKy1Nj/sYJ25RRDlP7+gVPR2QR0XFvMEON2U
	woQe7otGMhKFfCDiCBXjkoiLIHsLc5E+p4WWeA0tiHjs+WnQPuO8uouoxTHozfLbBMBGbGI3ki5
	E7lJw+/yKraF/YcFZZqMTPc4nG6tkkBiwmTokhka20LlWLp6LCyHwEPXc2gGDSVFeFP/7KZprcK
	AgOONsUq+Io4ZDsWxGAwL/wKHLfIWcnfU4UBPCoJauL0DtduOQmewTCRXEJIFpASV4DTgjDaMRT
	err7dkoekhb226N/be0O5yxeTYZ9eP6HF4IuPg9ZqI3uyzIg0i5VXgZh8qyWtRDmmlrSXAqPi+h
	SE0wNCKc=
X-Google-Smtp-Source: AGHT+IEoTfo4TNw4P4ewmD3fmkA6z28ycidagkXgXZhflGUxyOEfcxd5Zz7ComAIMQ04cJm1JLLsvw==
X-Received: by 2002:a17:902:f7d2:b0:20c:f40e:6ec3 with SMTP id d9443c01a7336-223d9e6616cmr720025ad.22.1741040224035;
        Mon, 03 Mar 2025 14:17:04 -0800 (PST)
Received: from google.com (147.141.16.34.bc.googleusercontent.com. [34.16.141.147])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734d444a9fasm7386454b3a.60.2025.03.03.14.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 14:17:03 -0800 (PST)
Date: Mon, 3 Mar 2025 22:16:57 +0000
From: Peilin Ye <yepeilin@google.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	oe-kbuild-all@lists.linux.dev, bpf@ietf.org,
	Alexei Starovoitov <ast@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Eduard Zingerman <eddyz87@gmail.com>,
	David Vernet <void@manifault.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Quentin Monnet <qmo@kernel.org>,
	Mykola Lysenko <mykolal@fb.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Ihor Solodrai <ihor.solodrai@linux.dev>
Subject: Re: [PATCH bpf-next v4 04/10] bpf: Introduce load-acquire and
 store-release instructions
Message-ID: <Z8YqWQuyArxCQWeD@google.com>
References: <2c82b29f3530b961b41f94a4942e490ab35a31c8.1740978603.git.yepeilin@google.com>
 <202503031631.OeUhVRHz-lkp@intel.com>
 <CAADnVQLLhNRmpjwDYHB0-59TDrGcgXzqSkop+-5eHYsG-Ws08Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAADnVQLLhNRmpjwDYHB0-59TDrGcgXzqSkop+-5eHYsG-Ws08Q@mail.gmail.com>

On Mon, Mar 03, 2025 at 10:43:07AM -0800, Alexei Starovoitov wrote:
> > compiler: arc-elf-gcc (GCC) 13.2.0
> 
> ...
> 
> >    kernel/bpf/core.c:2228:25: note: in expansion of macro 'LOAD_ACQUIRE'
> >     2228 |                         LOAD_ACQUIRE(DW, u64)
> >          |                         ^~~~~~~~~~~~

*facepalm*

> Peilin,
> 
> how do you plan on fixing this?
> So far I could only think of making compilation conditional for CONFIG_64BIT
> and let the verifier reject these insns on 32-bit arches.

Agreed - after searching for "Need native word sized stores/loads for
atomicity." on lore, it appears that we can't have 64-bit
smp_{load_acquire,store_release}() on 32-bit arches.  My draft fix is:

diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index 323af18d7d49..6df1d3e379a4 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -2225,7 +2225,9 @@ static u64 ___bpf_prog_run(u64 *regs, const struct bpf_insn *insn)
                        LOAD_ACQUIRE(B,   u8)
                        LOAD_ACQUIRE(H,  u16)
                        LOAD_ACQUIRE(W,  u32)
+#ifdef CONFIG_64BIT
                        LOAD_ACQUIRE(DW, u64)
+#endif
 #undef LOAD_ACQUIRE
                        default:
                                goto default_label;
@@ -2241,7 +2243,9 @@ static u64 ___bpf_prog_run(u64 *regs, const struct bpf_insn *insn)
                        STORE_RELEASE(B,   u8)
                        STORE_RELEASE(H,  u16)
                        STORE_RELEASE(W,  u32)
+#ifdef CONFIG_64BIT
                        STORE_RELEASE(DW, u64)
+#endif
 #undef STORE_RELEASE
                        default:
                                goto default_label;
diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index dac7af73ac8a..d0e4c6bab37d 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -7814,8 +7814,16 @@ static int check_atomic(struct bpf_verifier_env *env, struct bpf_insn *insn)
        case BPF_CMPXCHG:
                return check_atomic_rmw(env, insn);
        case BPF_LOAD_ACQ:
+               if (BPF_SIZE(insn->code) == BPF_DW && BITS_PER_LONG != 64) {
+                       verbose(env, "64-bit load-acquire is only supported on 64-bit arches\n");
+                       return -ENOTSUPP;
+               }
                return check_atomic_load(env, insn);
        case BPF_STORE_REL:
+               if (BPF_SIZE(insn->code) == BPF_DW && BITS_PER_LONG != 64) {
+                       verbose(env, "64-bit store-release is only supported on 64-bit arches\n");
+                       return -ENOTSUPP;
+               }
                return check_atomic_store(env, insn);
        default:
                verbose(env, "BPF_ATOMIC uses invalid atomic opcode %02x\n",

Thanks,
Peilin Ye

